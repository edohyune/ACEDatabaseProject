CREATE TABLE [dbo].[CDA100] (
    [pid]       INT           IDENTITY (1, 1) NOT NULL,
    [sys]       VARCHAR (10)  NOT NULL,
    [menu]      VARCHAR (20)  NOT NULL,
    [menu_name] VARCHAR (250) NULL,
    [frm]       VARCHAR (20)  NULL,
    [wid]       VARCHAR (20)  NULL,
    [yn_hide]   VARCHAR (1)   CONSTRAINT [DF_SCD100_yn_hide] DEFAULT ('0') NULL,
    [yn_use]    VARCHAR (1)   CONSTRAINT [DF_SCD100_yn_use] DEFAULT ('1') NULL,
    [yn_delete] VARCHAR (1)   CONSTRAINT [DF_SCD100_yn_delete] DEFAULT ('0') NULL,
    [memo]      VARCHAR (250) NULL,
    [cid]       VARCHAR (20)  NULL,
    [cdt]       DATETIME      NULL,
    [mid]       VARCHAR (20)  NULL,
    [mdt]       DATETIME      NULL,
    [yn_sys]    VARCHAR (1)   CONSTRAINT [DF_SCD100_yn_sys] DEFAULT ('0') NULL,
    CONSTRAINT [PK_CDA100] PRIMARY KEY CLUSTERED ([pid] ASC) WITH (FILLFACTOR = 100)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CDA100_ux1]
    ON [dbo].[CDA100]([sys] ASC, [menu] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Menu', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'CDA100';

