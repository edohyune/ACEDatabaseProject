CREATE TABLE [dbo].[LEA400] (
    [company]     VARCHAR (2)     NOT NULL,
    [ymd]         DATE            NOT NULL,
    [flock]       VARCHAR (20)    NOT NULL,
    [hh]          VARCHAR (10)    NOT NULL,
    [hr]          VARCHAR (10)    NOT NULL,
    [pd_good]     DECIMAL (15, 3) NULL,
    [pd_crack]    DECIMAL (15, 3) NULL,
    [pd_jumbo]    DECIMAL (15, 3) NULL,
    [pd_small]    DECIMAL (15, 3) NULL,
    [pd_dirty]    DECIMAL (15, 3) NULL,
    [pd_damage]   DECIMAL (15, 3) NULL,
    [pd_floor]    DECIMAL (15, 3) NULL,
    [pd_in]       DECIMAL (15, 3) NULL,
    [pd_out]      DECIMAL (15, 3) NULL,
    [pd_transfer] DECIMAL (15, 3) NULL
);

