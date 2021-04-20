CREATE TABLE [dbo].[ADA200] (
    [pid]          INT             NOT NULL,
    [pno]          BIGINT          NULL,
    [issue_date]   DATE            NULL,
    [issue_class]  VARCHAR (2)     NOT NULL,
    [issue_qty]    NUMERIC (15, 3) NULL,
    [issue_amount] NUMERIC (15, 3) NULL,
    [vendor]       VARCHAR (20)    NULL,
    [remark]       VARCHAR (500)   NULL,
    [slip_no]      VARCHAR (14)    NULL,
    [account]      VARCHAR (8)     NULL,
    [bank]         VARCHAR (12)    NULL,
    [bank_account] VARCHAR (20)    NULL,
    [cdt]          VARCHAR (8)     NULL,
    [cid]          VARCHAR (6)     NULL,
    [mdt]          VARCHAR (8)     NULL,
    [mid]          VARCHAR (6)     NULL
);

