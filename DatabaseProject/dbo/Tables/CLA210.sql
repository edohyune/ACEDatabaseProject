CREATE TABLE [dbo].[CLA210] (
    [company]    VARCHAR (2)     NOT NULL,
    [yymm]       VARCHAR (10)    NOT NULL,
    [flock]      VARCHAR (20)    NOT NULL,
    [hh]         VARCHAR (10)    NOT NULL,
    [hr]         VARCHAR (10)    NOT NULL,
    [matl]       VARCHAR (20)    NOT NULL,
    [account]    VARCHAR (10)    NOT NULL,
    [account_ps] VARCHAR (10)    NOT NULL,
    [goods]      VARCHAR (10)    NOT NULL,
    [qty]        DECIMAL (22, 3) NULL,
    [amt]        DECIMAL (22, 3) NULL,
    [memo]       VARCHAR (50)    NULL
);

