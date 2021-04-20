CREATE TABLE [dbo].[CDA600] (
    [pid]           BIGINT        IDENTITY (1, 1) NOT NULL,
    [cust]          VARCHAR (15)  NOT NULL,
    [cust_name]     VARCHAR (100) NULL,
    [full_name]     VARCHAR (100) NULL,
    [local_name]    VARCHAR (100) NULL,
    [cust_kind]     VARCHAR (10)  NULL,
    [cust_class]    VARCHAR (10)  NULL,
    [goods]         VARCHAR (10)  NULL,
    [biz_no]        VARCHAR (40)  NULL,
    [tax_no]        VARCHAR (20)  NULL,
    [country]       VARCHAR (10)  NULL,
    [province]      VARCHAR (10)  NULL,
    [district]      VARCHAR (10)  NULL,
    [zip]           VARCHAR (10)  NULL,
    [address1]      VARCHAR (200) NULL,
    [address2]      VARCHAR (200) NULL,
    [chief_id]      VARCHAR (20)  NULL,
    [chief_name]    VARCHAR (40)  NULL,
    [tel]           VARCHAR (40)  NULL,
    [mobile]        VARCHAR (40)  NULL,
    [fax]           VARCHAR (40)  NULL,
    [date_create]   DATE          NULL,
    [date_start]    DATE          NULL,
    [date_end]      DATE          NULL,
    [status]        VARCHAR (2)   NULL,
    [charge_emp]    VARCHAR (10)  NULL,
    [cust_group]    VARCHAR (10)  NULL,
    [cust_remain]   VARCHAR (10)  NULL,
    [cust_upper]    VARCHAR (10)  NULL,
    [cust_invoice]  VARCHAR (10)  NULL,
    [ship_to]       VARCHAR (10)  NULL,
    [basic_curr]    VARCHAR (3)   NULL,
    [bank]          VARCHAR (10)  NULL,
    [bank_account]  VARCHAR (40)  NULL,
    [Photo1]        IMAGE         NULL,
    [Photo2]        IMAGE         NULL,
    [Photo3]        IMAGE         NULL,
    [Photo4]        IMAGE         NULL,
    [Photo5]        IMAGE         NULL,
    [credit_days]   INT           NULL,
    [credit_amount] DECIMAL (38)  NULL,
    [old_cust]      VARCHAR (10)  NULL,
    [deleted]       VARCHAR (1)   NULL,
    [cid]           VARCHAR (20)  NULL,
    [cdt]           DATETIME      NULL,
    [mid]           VARCHAR (20)  NULL,
    [mdt]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([pid] ASC) WITH (FILLFACTOR = 100)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CDA600_ix1]
    ON [dbo].[CDA600]([pid] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CDA600_ux1]
    ON [dbo].[CDA600]([cust] ASC);

