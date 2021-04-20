CREATE TABLE [dbo].[CDA810] (
    [pdate]     DATE           NOT NULL,
    [company]   VARCHAR (10)   NOT NULL,
    [dept]      VARCHAR (10)   NOT NULL,
    [dept_name] NVARCHAR (400) NOT NULL,
    [dept_type] VARCHAR (10)   NULL,
    [inDept]    VARCHAR (10)   NULL,
    [memo]      NVARCHAR (MAX) NULL,
    [dept_head] VARCHAR (10)   NULL,
    [ynUse]     CHAR (1)       NULL,
    [plant]     VARCHAR (10)   NULL,
    [goods]     VARCHAR (50)   NULL,
    [cid]       INT            NULL,
    [cdt]       DATETIME       NULL,
    [mid]       INT            NULL,
    [mdt]       DATETIME       NULL
);

