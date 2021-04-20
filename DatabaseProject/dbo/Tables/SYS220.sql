CREATE TABLE [dbo].[SYS220] (
    [pid]    INT           IDENTITY (1, 1) NOT NULL,
    [sys]    VARCHAR (10)  DEFAULT ('10') NULL,
    [frm]    VARCHAR (40)  NULL,
    [sqlid]  VARCHAR (40)  NULL,
    [sqltxt] VARCHAR (MAX) NULL,
    [memo]   VARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([pid] ASC)
);

