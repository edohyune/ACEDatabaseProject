CREATE TABLE [dbo].[AFA100] (
    [pid]        BIGINT         NOT NULL,
    [company]    VARCHAR (10)   NULL,
    [prj]        VARCHAR (50)   NULL,
    [prj_name]   NVARCHAR (100) NULL,
    [prj_bc]     VARCHAR (10)   NULL,
    [date_start] DATE           NULL,
    [date_end]   DATE           NULL,
    [status]     VARCHAR (10)   NULL,
    [rmks]       NVARCHAR (MAX) NULL,
    [cid]        INT            NULL,
    [cdt]        DATETIME       NULL,
    [mid]        INT            NULL,
    [mdt]        DATETIME       NULL,
    [manager]    VARCHAR (20)   NULL
);

