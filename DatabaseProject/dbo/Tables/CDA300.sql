CREATE TABLE [dbo].[CDA300] (
    [pid]       INT            IDENTITY (1, 1) NOT NULL,
    [gcode]     NVARCHAR (50)  NOT NULL,
    [code]      NVARCHAR (40)  NOT NULL,
    [code_name] NVARCHAR (400) NULL,
    [ds01]      NVARCHAR (200) NULL,
    [ds02]      NVARCHAR (200) NULL,
    [ds03]      NVARCHAR (200) NULL,
    [ds04]      NVARCHAR (200) NULL,
    [ds05]      NVARCHAR (200) NULL,
    [ds06]      NVARCHAR (200) NULL,
    [ds07]      NVARCHAR (200) NULL,
    [ds08]      NVARCHAR (200) NULL,
    [ds09]      NVARCHAR (200) NULL,
    [ds10]      NVARCHAR (200) NULL,
    [deleted]   VARCHAR (1)    DEFAULT ('0') NULL,
    [memo]      NVARCHAR (300) NULL,
    [cid]       VARCHAR (20)   NULL,
    [cdt]       DATETIME       NULL,
    [mid]       VARCHAR (20)   NULL,
    [mdt]       DATETIME       NULL,
    [bcode]     VARCHAR (20)   NULL,
    PRIMARY KEY CLUSTERED ([pid] ASC) WITH (FILLFACTOR = 100)
);


GO
CREATE NONCLUSTERED INDEX [sys300_ix1]
    ON [dbo].[CDA300]([bcode] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CDA300_ux1]
    ON [dbo].[CDA300]([gcode] ASC, [code] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'CDA300';

