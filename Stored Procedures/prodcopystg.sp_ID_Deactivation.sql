SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create PROCEDURE [prodcopystg].[sp_ID_Deactivation]
     @Target VARCHAR(256),
	 @Target_Object VARCHAR(256),
     @Target_Key VARCHAR(256)

AS

--DECLARE @target VARCHAR(256) SET @Target = 'prodcopy.contact'
--DECLARE @target_object VARCHAR(256) SET @Target_object = 'contact'
--DECLARE @target_key VARCHAR(256) SET @Target_key = 'contactid'
--Job Steps:
--1. TRUNCATE ContactIDs TABLE (done by SSIS Package)
--2. Pull ALL Contactids FROM client's CRM (done by SSIS Package)
--3. Throw the ContactIDs that are in Prodcopy but not in the ContactID table into a deactivatedlog table (Sproc Below)
--4. Update prodcopy to statecode = 1 (deactivated) and the copyloaddate (to ensure this gets picked up in next masterload) for those records that are no longer found in the client's CRM (Sproc Below)
--5. Update the deactivated log for those records that were processed. (Sproc Below)
--Assumptions: 
--1. The view for the masterload is not the vw_contact, so that it contains deactivated records. 
--2. Isdeleted in masterload view = statecode
--3. Client doesn't also want them hard-deleted from prodcopy
--4. Remember that some clients are throwing things straight to Azure
--5. The table has a statecode field -- Bears Annotation I added statecode to the table artificailly and mapped in a default for statecode in the derived columns
--6. The statecode is active/inactive. This is not the case for Activities, Phone Calls, Emails, etc. The system can not handle these entities.
DECLARE @SQL VARCHAR(MAX) =
'CREATE TABLE #tempdeactivate ([ID] [NVARCHAR](50) NULL,[Entity] [NVARCHAR](100) NULL,[DeactivatedDate] [DATETIME] NULL,[Completed] [BIT] NULL)
--Those to be deactivated
INSERT INTO #tempdeactivate
SELECT pc.' + @Target_Key + ' AS ID, ''' + @Target_Object + ''' AS Entity, NULL AS deactivateddate, 0 AS Completed--, pc.statecode, c.statecode, c.id
FROM '+ @Target + ' pc
left JOIN prodcopystg.IDs c ON CAST(pc.'+ @Target_Key + ' AS NVARCHAR(36)) = c.iD AND c.Entity = ''' + @Target_Object + '''
WHERE (pc.statecode = 0 AND c.statecode = 1)
or c.ID IS NULL
MERGE INTO prodcopystg.IDs_DeactivatedLogs AS target
USING #tempdeactivate as source
ON source.ID = target.ID AND source.Entity = target.Entity
WHEN MATCHED THEN 
UPDATE SET target.deactivateddate = NULL, target.Completed = 0
WHEN NOT MATCHED BY TARGET THEN
INSERT (id, Entity, DeactivatedDate, Completed) VALUES (source.ID, source.Entity, source.deactivateddate, source.Completed);
--Act of Deactivating
UPDATE pc
SET statecode = 1, copyloaddate = (SELECT MAX(copyloaddate) FROM prodcopy.contact)
FROM ' + @Target + ' pc
INNER JOIN prodcopystg.IDs_DeactivatedLogs dl
ON CAST(pc.' + @Target_Key + ' AS NVARCHAR(36)) = dl.ID AND dl.Completed = 0 AND dl.Entity = ''' + @Target_Object + '''
--Logging the deactivation
UPDATE prodcopystg.IDs_DeactivatedLogs
SET Completed = 1, DeactivatedDate = GETDATE()
FROM  prodcopystg.IDs_DeactivatedLogs dl
INNER JOIN ' + @Target + ' pc
ON CAST(pc.' + @Target_Key + ' AS NVARCHAR(36)) = dl.ID AND dl.Entity = ''' + @Target_Object + '''
WHERE dl.Completed = 0
AND pc.statecode = 1'

SELECT (@sql) --updateme to exec when ready to deploy



GO
