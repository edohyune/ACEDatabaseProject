CREATE TABLE [dbo].[AFA140] (
    [pid]         BIGINT          NOT NULL,
    [aid]         BIGINT          NOT NULL,
    [sq]          INT             NOT NULL,
    [slip_no]     VARCHAR (40)    NULL,
    [slip_date]   DATE            NULL,
    [amt]         NUMERIC (22, 3) NULL,
    [wic_slip_no] VARCHAR (40)    NULL,
    [wic_accDR]   VARCHAR (20)    NULL,
    [wic_accCR]   VARCHAR (20)    NULL,
    [cust]        VARCHAR (20)    NULL,
    [rmks]        NVARCHAR (2000) NULL,
    [cid]         INT             NULL,
    [cdt]         DATETIME        NULL,
    [mid]         INT             NULL,
    [mdt]         DATETIME        NULL
);

