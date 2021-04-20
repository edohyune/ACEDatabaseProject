CREATE TABLE [dbo].[CLA340] (
    [company]        VARCHAR (2)     NOT NULL,
    [yymm]           VARCHAR (10)    NOT NULL,
    [kbn]            VARCHAR (2)     NOT NULL,
    [flock]          VARCHAR (20)    NOT NULL,
    [hh]             VARCHAR (20)    NOT NULL,
    [goods]          VARCHAR (20)    NULL,
    [account]        VARCHAR (20)    NOT NULL,
    [amt_bg]         DECIMAL (22, 3) NULL,
    [amt_growing]    DECIMAL (22, 3) NULL,
    [amt_amo]        DECIMAL (22, 3) NULL,
    [amt_bp_afkir]   DECIMAL (22, 3) NULL,
    [amt_bp_seleksi] DECIMAL (22, 3) NULL,
    [amt_ed]         DECIMAL (22, 3) NULL,
    [qty_ps]         DECIMAL (22, 3) NULL,
    [qty_ep]         DECIMAL (22, 3) NULL,
    [qty_ave]        DECIMAL (22, 3) NULL,
    [qty_ps_afkir]   DECIMAL (22, 3) NULL,
    [qty_ps_seleksi] DECIMAL (22, 3) NULL,
    [acc_ps]         DECIMAL (22, 3) NULL,
    [amt_tgc]        DECIMAL (22, 3) NULL
);

