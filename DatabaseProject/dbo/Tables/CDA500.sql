CREATE TABLE [dbo].[CDA500] (
    [pid]            BIGINT          IDENTITY (1, 1) NOT NULL,
    [prod]           VARCHAR (10)    NOT NULL,
    [prod_name]      VARCHAR (80)    NULL,
    [goods]          VARCHAR (2)     NULL,
    [goods_type]     VARCHAR (10)    NULL,
    [sex]            VARCHAR (2)     NULL,
    [grade]          VARCHAR (2)     NULL,
    [unit]           VARCHAR (4)     NULL,
    [cl_price]       VARCHAR (10)    NULL,
    [unit_price]     NUMERIC (15, 3) NULL,
    [inout_weight]   NUMERIC (15, 3) NULL,
    [packing_unit]   VARCHAR (3)     NULL,
    [packing_qty]    NUMERIC (15, 3) NULL,
    [packing_weight] NUMERIC (15, 3) NULL,
    [cl_goods]       VARCHAR (20)    NULL,
    [deleted]        VARCHAR (1)     NULL,
    [cost]           VARCHAR (20)    NULL,
    [accDR]          VARCHAR (20)    NULL,
    [accCR]          VARCHAR (20)    NULL,
    [accVat]         VARCHAR (20)    NULL,
    [cid]            VARCHAR (20)    NULL,
    [cdt]            DATETIME        NULL,
    [mid]            VARCHAR (20)    NULL,
    [mdt]            DATETIME        NULL,
    [memo]           VARCHAR (200)   NULL,
    PRIMARY KEY CLUSTERED ([pid] ASC) WITH (FILLFACTOR = 100)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CDA500_ux1]
    ON [dbo].[CDA500]([prod] ASC);

