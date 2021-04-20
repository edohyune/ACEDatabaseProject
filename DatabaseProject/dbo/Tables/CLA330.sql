CREATE TABLE [dbo].[CLA330] (
    [company]      VARCHAR (2)     NOT NULL,
    [yymm]         VARCHAR (10)    NOT NULL,
    [kbn]          VARCHAR (10)    NOT NULL,
    [flock]        VARCHAR (20)    NOT NULL,
    [hh]           VARCHAR (10)    NOT NULL,
    [hr]           VARCHAR (10)    NOT NULL,
    [goods]        VARCHAR (10)    NOT NULL,
    [account]      VARCHAR (10)    NOT NULL,
    [amt_dir]      DECIMAL (22, 3) NULL,
    [amt_indir]    DECIMAL (22, 3) NULL,
    [amt_growing]  DECIMAL (22, 3) NULL,
    [amt_laying]   DECIMAL (22, 3) NULL,
    [amt_etc]      DECIMAL (22, 3) NULL,
    [amt_hatching] DECIMAL (22, 3) NULL,
    [qty_doc]      DECIMAL (22, 3) NULL,
    [qty_ps]       DECIMAL (22, 3) NULL,
    [qty_ep]       DECIMAL (22, 3) NULL,
    [qty_ave]      DECIMAL (22, 3) NULL,
    [stat]         VARCHAR (1)     NULL,
    [qty_he]       DECIMAL (22, 3) NULL
);

