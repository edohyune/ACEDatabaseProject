CREATE TABLE [dbo].[CDC100] (
    [pid]           BIGINT        IDENTITY (1, 1) NOT NULL,
    [acc]           VARCHAR (20)  NOT NULL,
    [accEname]      VARCHAR (100) NOT NULL,
    [accKname]      VARCHAR (100) NOT NULL,
    [accXname]      VARCHAR (100) NOT NULL,
    [yn_dc]         VARCHAR (1)   NULL,
    [yn_keyin]      VARCHAR (1)   NULL,
    [yn_budget]     VARCHAR (1)   NULL,
    [yn_dept]       VARCHAR (1)   NULL,
    [yn_vendor]     VARCHAR (1)   NULL,
    [yn_staff]      VARCHAR (1)   NULL,
    [yn_bank]       VARCHAR (1)   NULL,
    [yn_costCenter] VARCHAR (1)   NULL,
    [yn_balance]    VARCHAR (1)   NULL,
    [yn_curr]       VARCHAR (1)   NULL,
    [yn_date1]      VARCHAR (1)   NULL,
    [yn_date2]      VARCHAR (1)   NULL,
    [yn_qty]        VARCHAR (1)   NULL,
    [yn_rate]       VARCHAR (1)   NULL,
    [yn_amt]        VARCHAR (1)   NULL,
    [yn_keyno]      VARCHAR (1)   NULL,
    [lvl]           VARCHAR (2)   NOT NULL,
    [memo]          VARCHAR (100) NULL,
    [bs1]           VARCHAR (100) NULL,
    [bs2]           VARCHAR (100) NULL,
    [accType]       VARCHAR (40)  NULL,
    [moc1]          VARCHAR (100) NULL,
    [moc2]          VARCHAR (100) NULL,
    [deleted]       VARCHAR (1)   NULL,
    [cid]           VARCHAR (20)  NULL,
    [cdt]           DATETIME      NULL,
    [mid]           VARCHAR (20)  NULL,
    [mdt]           DATETIME      NULL,
    [chkAcc]        VARCHAR (20)  NULL,
    CONSTRAINT [PK_CDC100] PRIMARY KEY CLUSTERED ([acc] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CDC100_ix1]
    ON [dbo].[CDC100]([pid] ASC);

