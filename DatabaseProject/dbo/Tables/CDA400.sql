CREATE TABLE [dbo].[CDA400] (
    [pid]          INT             IDENTITY (1, 1) NOT NULL,
    [matl]         VARCHAR (20)    NOT NULL,
    [matl_name]    NVARCHAR (200)  NOT NULL,
    [matl_class]   VARCHAR (254)   NULL,
    [matl_grade]   VARCHAR (254)   NULL,
    [matl_spec]    VARCHAR (254)   NULL,
    [unit]         VARCHAR (10)    NULL,
    [box_qty]      INT             DEFAULT ((1)) NULL,
    [price]        DECIMAL (12, 3) DEFAULT ((0)) NULL,
    [spare_part]   VARCHAR (1)     NULL,
    [last_takein]  DATE            NULL,
    [memo]         NVARCHAR (254)  NULL,
    [deleted]      VARCHAR (1)     NULL,
    [trading_item] VARCHAR (20)    NULL,
    PRIMARY KEY CLUSTERED ([pid] ASC) WITH (FILLFACTOR = 100)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CDA400_ix1]
    ON [dbo].[CDA400]([matl] ASC) WITH (FILLFACTOR = 100);


GO
EXECUTE sp_addextendedproperty @name = N'ms_description', @value = N'Matl', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'CDA400';

