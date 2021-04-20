CREATE TABLE [dbo].[LEA410] (
    [company]     VARCHAR (2)     NOT NULL,
    [yymm]        VARCHAR (8)     NOT NULL,
    [flock]       VARCHAR (20)    NOT NULL,
    [hh]          VARCHAR (10)    NOT NULL,
    [hr]          VARCHAR (10)    NOT NULL,
    [pd_bg]       DECIMAL (22, 3) NULL,
    [pd_good]     DECIMAL (22, 3) NULL,
    [pd_crack]    DECIMAL (22, 3) NULL,
    [pd_jumbo]    DECIMAL (22, 3) NULL,
    [pd_small]    DECIMAL (22, 3) NULL,
    [pd_dirty]    DECIMAL (22, 3) NULL,
    [pd_damage]   DECIMAL (22, 3) NULL,
    [pd_floor]    DECIMAL (22, 3) NULL,
    [pd_in]       DECIMAL (22, 3) NULL,
    [pd_out]      DECIMAL (22, 3) NULL,
    [pd_transfer] DECIMAL (28, 3) NULL,
    [pd_ed]       DECIMAL (30, 3) NULL
);

