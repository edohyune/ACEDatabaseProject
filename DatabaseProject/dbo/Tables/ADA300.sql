CREATE TABLE [dbo].[ADA300] (
    [pno]              INT             NOT NULL,
    [yymm]             VARCHAR (7)     NOT NULL,
    [install_date]     DATE            NULL,
    [install_qty]      NUMERIC (15, 3) NULL,
    [install_amount]   NUMERIC (15, 3) NULL,
    [adding_amount]    NUMERIC (15, 3) NULL,
    [disposal_amount]  NUMERIC (15, 3) NULL,
    [target_amount]    NUMERIC (15, 3) NULL,
    [elasped_months]   NUMERIC (5)     NULL,
    [remain_months]    NUMERIC (5)     NULL,
    [depreciation]     NUMERIC (22, 3) NULL,
    [depreciation_sum] NUMERIC (15, 3) NULL,
    [book_value]       NUMERIC (15, 3) NULL
);

