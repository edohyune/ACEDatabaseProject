CREATE TABLE [dbo].[CDA800] (
    [pid]       BIGINT         IDENTITY (1, 1) NOT NULL,
    [dept]      VARCHAR (10)   NOT NULL,
    [dept_name] NVARCHAR (400) NOT NULL,
    [dept_type] VARCHAR (10)   NULL,
    [inDept]    VARCHAR (10)   NULL,
    [memo]      NVARCHAR (MAX) NULL,
    [dept_head] VARCHAR (10)   NULL,
    [deleted]   VARCHAR (1)    NULL,
    [plant]     VARCHAR (10)   NULL,
    [goods]     VARCHAR (50)   NULL,
    [lvl]       VARCHAR (10)   NULL,
    [cid]       VARCHAR (50)   NULL,
    [cdt]       DATETIME       NULL,
    [mid]       VARCHAR (50)   NULL,
    [mdt]       DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([dept] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CDA800_ix1]
    ON [dbo].[CDA800]([pid] ASC);

