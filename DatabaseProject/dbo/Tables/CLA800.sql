CREATE TABLE [dbo].[CLA800] (
    [company]      VARCHAR (10)    NOT NULL,
    [yymm]         VARCHAR (10)    NOT NULL,
    [flock]        VARCHAR (20)    NOT NULL,
    [hh]           VARCHAR (20)    NOT NULL,
    [qty_ep]       DECIMAL (38, 3) NULL,
    [qty_he]       DECIMAL (38, 3) NULL,
    [qty_htc]      DECIMAL (38, 3) NULL,
    [qty_matlFarm] DECIMAL (38, 3) NULL,
    [qty_matlHTC]  DECIMAL (38, 3) NULL,
    [qtyPs5p]      DECIMAL (15, 3) NOT NULL,
    [rate5p]       DECIMAL (15, 3) NOT NULL,
    [date_closed]  DATE            NULL,
    [stat]         VARCHAR (1)     NOT NULL,
    [err]          VARCHAR (42)    NOT NULL
);

