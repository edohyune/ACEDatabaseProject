CREATE TABLE [dbo].[ACB100] (
    [rno]             INT             NOT NULL,
    [slip_no]         VARCHAR (20)    NOT NULL,
    [slip_date]       DATE            NULL,
    [supp]            VARCHAR (15)    NOT NULL,
    [pay_type]        VARCHAR (10)    NULL,
    [bank]            VARCHAR (10)    NULL,
    [bank_account_no] VARCHAR (20)    NULL,
    [staff]           VARCHAR (10)    NULL,
    [cost]            VARCHAR (20)    NULL,
    [seq]             VARCHAR (10)    NOT NULL,
    [expense]         VARCHAR (10)    NULL,
    [amount]          NUMERIC (15, 3) NULL,
    [memo]            VARCHAR (500)   NULL,
    [cfm]             VARCHAR (1)     NULL,
    [cid]             VARCHAR (50)    NULL,
    [cdt]             DATETIME        NULL,
    [mid]             VARCHAR (50)    NULL,
    [mdt]             DATETIME        NULL
);

