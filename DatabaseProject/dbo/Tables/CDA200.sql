CREATE TABLE [dbo].[CDA200] (
    [pid]            INT            IDENTITY (1, 1) NOT NULL,
    [id]             NVARCHAR (50)  NOT NULL,
    [pwd]            NVARCHAR (256) NOT NULL,
    [pwd_yn]         VARCHAR (1)    NULL,
    [pwd_date]       DATE           NULL,
    [user_name]      NVARCHAR (200) NULL,
    [user_type]      VARCHAR (10)   NULL,
    [staff]          VARCHAR (20)   NULL,
    [language]       VARCHAR (10)   NULL,
    [company]        VARCHAR (10)   NULL,
    [plant]          VARCHAR (10)   NULL,
    [dept]           VARCHAR (10)   NULL,
    [sys]            VARCHAR (20)   NULL,
    [deleted]        VARCHAR (1)    DEFAULT ('0') NULL,
    [expire_date]    DATE           NULL,
    [memo]           NVARCHAR (300) NULL,
    [cid]            VARCHAR (20)   NULL,
    [cdt]            DATETIME       NULL,
    [mid]            VARCHAR (20)   NULL,
    [mdt]            DATETIME       NULL,
    [bulletin_edate] DATE           NULL,
    [frm_init]       VARCHAR (20)   NULL,
    [skin]           VARCHAR (80)   NULL,
    CONSTRAINT [PK_CDA200] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [SYS200_ux1]
    ON [dbo].[CDA200]([id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CDA200_ix1]
    ON [dbo].[CDA200]([pid] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'CDA200';

