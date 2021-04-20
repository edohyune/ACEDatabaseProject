CREATE TABLE [dbo].[PDA400] (
    [pid]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [company]   VARCHAR (2)     NOT NULL,
    [keyno]     VARCHAR (20)    NOT NULL,
    [flock]     VARCHAR (20)    NOT NULL,
    [hh]        VARCHAR (10)    NOT NULL,
    [ymd]       DATE            NOT NULL,
    [pd_good]   DECIMAL (15, 3) NULL,
    [pd_crack]  DECIMAL (15, 3) NULL,
    [pd_jumbo]  DECIMAL (15, 3) NULL,
    [pd_small]  DECIMAL (15, 3) NULL,
    [pd_dirty]  DECIMAL (15, 3) NULL,
    [pd_damage] DECIMAL (15, 3) NULL,
    [pd_floor]  DECIMAL (15, 3) NULL,
    [pd_in]     DECIMAL (15, 3) NULL,
    [pd_out]    DECIMAL (15, 3) NULL,
    [wt_egg]    DECIMAL (15, 3) NULL,
    [plant]     VARCHAR (20)    NULL,
    [cid]       INT             NULL,
    [cdt]       DATETIME        NULL,
    [mid]       INT             NULL,
    [mdt]       DATETIME        NULL
);

