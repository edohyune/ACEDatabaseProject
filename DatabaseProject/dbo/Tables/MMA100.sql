CREATE TABLE [dbo].[MMA100] (
    [company]        VARCHAR (2)     NOT NULL,
    [por_no]         VARCHAR (20)    NOT NULL,
    [por_date]       DATE            NULL,
    [req_id]         VARCHAR (20)    NOT NULL,
    [seq]            VARCHAR (3)     NOT NULL,
    [matl]           VARCHAR (12)    NOT NULL,
    [qty]            NUMERIC (15, 3) NULL,
    [qty_box]        NUMERIC (15, 3) NULL,
    [plant]          VARCHAR (4)     NOT NULL,
    [delivery_place] VARCHAR (200)   NULL,
    [delivery_time]  VARCHAR (80)    NULL,
    [delivery_date]  DATE            NULL,
    [memo]           VARCHAR (200)   NULL,
    [status]         VARCHAR (1)     NULL,
    [po_no]          VARCHAR (50)    NULL,
    [cid]            VARCHAR (50)    NULL,
    [cdt]            DATETIME        NULL,
    [mid]            VARCHAR (50)    NULL,
    [mdt]            DATETIME        NULL
);

