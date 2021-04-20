CREATE TABLE [dbo].[SYS230] (
    [pid]    INT           IDENTITY (1, 1) NOT NULL,
    [sys]    VARCHAR (10)  NULL,
    [frm]    VARCHAR (20)  NULL,
    [wkset]  VARCHAR (20)  NOT NULL,
    [sqltxt] VARCHAR (MAX) NULL,
    [memo]   VARCHAR (MAX) NULL
);

