CREATE TABLE [prodcopystg].[str_Opportunity]
(
[createdby] [uniqueidentifier] NULL,
[createdbyname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[createdbyyominame] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[createdon] [datetime] NULL,
[createdonbehalfby] [uniqueidentifier] NULL,
[createdonbehalfbyname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[createdonbehalfbyyominame] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[exchangerate] [decimal] (28, 0) NULL,
[importsequencenumber] [int] NULL,
[modifiedby] [uniqueidentifier] NULL,
[modifiedbyname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[modifiedbyyominame] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[modifiedon] [datetime] NULL,
[modifiedonbehalfby] [uniqueidentifier] NULL,
[modifiedonbehalfbyname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[modifiedonbehalfbyyominame] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[overriddencreatedon] [datetime] NULL,
[ownerid] [uniqueidentifier] NULL,
[owneridname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[owneridtype] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[owneridyominame] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[owningbusinessunit] [uniqueidentifier] NULL,
[owningteam] [uniqueidentifier] NULL,
[owninguser] [uniqueidentifier] NULL,
[statecode] [int] NULL,
[statecodename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[statuscode] [int] NULL,
[statuscodename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[str_actualclosedate] [datetime] NULL,
[str_actualvalue] [money] NULL,
[str_actualvalue_base] [money] NULL,
[str_category] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[str_closeprobability] [int] NULL,
[str_comments] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[str_customerid] [uniqueidentifier] NULL,
[str_customeridname] [nvarchar] (160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[str_customeridyominame] [nvarchar] (160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[str_description] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[str_estimatedclosedate] [datetime] NULL,
[str_estimatedvalue] [money] NULL,
[str_estimatedvalue_base] [money] NULL,
[str_id] [int] NULL,
[str_name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[str_opportunityid] [uniqueidentifier] NOT NULL,
[str_pricelevelid] [uniqueidentifier] NULL,
[str_pricelevelidname] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[str_servicepersonid] [uniqueidentifier] NULL,
[str_servicepersonidname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[str_servicepersonidyominame] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[str_source] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[str_status] [int] NULL,
[str_statusname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[timezoneruleversionnumber] [int] NULL,
[transactioncurrencyid] [uniqueidentifier] NULL,
[transactioncurrencyidname] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[utcconversiontimezonecode] [int] NULL,
[versionnumber] [bigint] NULL,
[copyloaddate] [datetime] NULL CONSTRAINT [DF__str_Oppor__copyl__6754599E] DEFAULT (getdate())
)
GO
ALTER TABLE [prodcopystg].[str_Opportunity] ADD CONSTRAINT [PK__str_Oppo__0ACAF85A55D0A5B9] PRIMARY KEY CLUSTERED  ([str_opportunityid])
GO
