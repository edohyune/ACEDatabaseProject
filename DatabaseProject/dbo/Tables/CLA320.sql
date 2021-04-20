﻿CREATE TABLE [dbo].[CLA320] (
    [company]          VARCHAR (2)     NOT NULL,
    [yymm]             VARCHAR (10)    NOT NULL,
    [kbn]              VARCHAR (10)    NOT NULL,
    [flock]            VARCHAR (20)    NOT NULL,
    [hh]               VARCHAR (10)    NOT NULL,
    [hr]               VARCHAR (10)    NOT NULL,
    [goods]            VARCHAR (10)    NOT NULL,
    [account]          VARCHAR (10)    NOT NULL,
    [wip_type]         VARCHAR (20)    NOT NULL,
    [qty_bg]           DECIMAL (22, 3) NULL,
    [amt_bg]           DECIMAL (22, 3) NULL,
    [qty_use]          DECIMAL (22, 3) NULL,
    [amt_use]          DECIMAL (22, 3) NULL,
    [qty_tot]          DECIMAL (22, 3) NULL,
    [amt_tot]          DECIMAL (22, 3) NULL,
    [qty_prd]          DECIMAL (22, 3) NULL,
    [amt_prd]          DECIMAL (22, 3) NULL,
    [qty_ed]           DECIMAL (22, 3) NULL,
    [amt_ed]           DECIMAL (22, 3) NULL,
    [amt_use_amo]      DECIMAL (22, 3) NULL,
    [amt_use_laying]   DECIMAL (22, 3) NULL,
    [amt_use_hatching] DECIMAL (22, 3) NULL,
    [amt_use_bp_farm]  DECIMAL (22, 3) NULL,
    [amt_use_bp_htc]   DECIMAL (22, 3) NULL,
    [qty_use_bp_farm]  DECIMAL (22, 3) NULL,
    [qty_use_bp_htc]   DECIMAL (22, 3) NULL,
    [amt_use_rcv]      DECIMAL (22, 3) NULL
);

