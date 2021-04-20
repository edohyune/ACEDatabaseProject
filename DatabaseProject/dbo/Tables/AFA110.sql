CREATE TABLE [dbo].[AFA110] (
    [pid]        BIGINT         NOT NULL,
    [sq]         INT            NOT NULL,
    [empno]      VARCHAR (40)   NULL,
    [job_desc]   NVARCHAR (100) NULL,
    [date_start] DATE           NULL,
    [date_end]   DATE           NULL,
    [rmks]       NVARCHAR (50)  NULL,
    [cid]        INT            NULL,
    [cdt]        DATETIME       NULL,
    [mid]        INT            NULL,
    [mdt]        DATETIME       NULL
);

