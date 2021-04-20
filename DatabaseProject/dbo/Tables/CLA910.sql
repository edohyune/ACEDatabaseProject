CREATE TABLE [dbo].[CLA910] (
    [company]    VARCHAR (2)     NOT NULL,
    [plant]      VARCHAR (20)    NOT NULL,
    [yymm]       VARCHAR (10)    NOT NULL,
    [goods]      VARCHAR (10)    NOT NULL,
    [account]    VARCHAR (10)    NOT NULL,
    [kbn]        VARCHAR (1)     NOT NULL,
    [amt]        DECIMAL (22, 3) NULL,
    [to_account] VARCHAR (10)    NOT NULL,
    [to_goods]   VARCHAR (10)    NOT NULL,
    [to_flock]   VARCHAR (20)    NOT NULL,
    [to_hh]      VARCHAR (10)    NOT NULL,
    [to_hr]      VARCHAR (10)    NOT NULL,
    [to_amt]     DECIMAL (22, 3) NOT NULL,
    [qty_sales]  DECIMAL (22, 3) NULL
);

