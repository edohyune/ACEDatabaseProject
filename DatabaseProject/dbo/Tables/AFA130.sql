CREATE TABLE [dbo].[AFA130] (
    [pid]       BIGINT          NOT NULL,
    [sq]        INT             NOT NULL,
    [slip_no]   VARCHAR (40)    NULL,
    [slip_date] DATE            NULL,
    [exp]       VARCHAR (10)    NULL,
    [amt]       NUMERIC (22, 3) NULL,
    [cust]      VARCHAR (20)    NULL,
    [accDR]     VARCHAR (20)    NULL,
    [accCR]     VARCHAR (20)    NULL,
    [contno]    VARCHAR (200)   NULL,
    [subject]   VARCHAR (MAX)   NULL,
    [work_desc] VARCHAR (MAX)   NULL,
    [rmks]      NVARCHAR (MAX)  NULL,
    [enclosed]  NVARCHAR (MAX)  NULL,
    [cid]       INT             NULL,
    [cdt]       DATETIME        NULL,
    [mid]       INT             NULL,
    [mdt]       DATETIME        NULL
);

