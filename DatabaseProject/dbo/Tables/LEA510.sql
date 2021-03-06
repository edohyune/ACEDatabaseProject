CREATE TABLE [dbo].[LEA510] (
    [company]      VARCHAR (2)     NOT NULL,
    [yymm]         VARCHAR (8)     NOT NULL,
    [flock]        VARCHAR (20)    NOT NULL,
    [hh]           VARCHAR (10)    NOT NULL,
    [hr]           VARCHAR (10)    NOT NULL,
    [he_bg]        DECIMAL (22, 3) NULL,
    [he_rcv]       DECIMAL (22, 3) NULL,
    [he_loss]      DECIMAL (22, 3) NULL,
    [he_miss]      DECIMAL (22, 3) NULL,
    [he_spot]      DECIMAL (22, 3) NULL,
    [he_thin]      DECIMAL (22, 3) NULL,
    [he_crack]     DECIMAL (22, 3) NULL,
    [he_damage]    DECIMAL (22, 3) NULL,
    [he_dirty]     DECIMAL (22, 3) NULL,
    [he_small]     DECIMAL (22, 3) NULL,
    [he_jumbo]     DECIMAL (15, 3) NULL,
    [he_aborsi]    DECIMAL (15, 3) NULL,
    [he_setting]   DECIMAL (22, 3) NULL,
    [he_in]        DECIMAL (22, 3) NULL,
    [he_out]       DECIMAL (22, 3) NULL,
    [he_ed]        DECIMAL (24, 3) NULL,
    [st_bg]        DECIMAL (22, 3) NULL,
    [st_setting]   DECIMAL (15, 3) NULL,
    [st_aborsi]    DECIMAL (22, 3) NULL,
    [st_ed]        INT             NOT NULL,
    [hr_bg]        DECIMAL (22, 3) NULL,
    [hr_infertile] DECIMAL (15, 3) NULL,
    [hr_loss]      DECIMAL (15, 3) NULL,
    [hr_explode]   DECIMAL (15, 3) NULL,
    [hr_fertile]   DECIMAL (15, 3) NULL,
    [hr_dis]       DECIMAL (22, 3) NULL,
    [hr_hatch]     DECIMAL (15, 3) NULL,
    [hr_ompal]     DECIMAL (22, 3) NULL,
    [hr_bloat]     DECIMAL (22, 3) NULL,
    [hr_def]       DECIMAL (22, 3) NULL,
    [hr_weak]      DECIMAL (22, 3) NULL,
    [hr_dead]      DECIMAL (22, 3) NULL,
    [hr_nipple]    DECIMAL (22, 3) NULL,
    [hr_aborsi]    DECIMAL (15, 3) NULL,
    [hr_a]         DECIMAL (22, 3) NULL,
    [hr_b]         DECIMAL (22, 3) NULL,
    [hr_c]         DECIMAL (22, 3) NULL,
    [hr_ed]        INT             NOT NULL,
    [hr_a2]        DECIMAL (22, 3) NULL,
    [hr_a3]        DECIMAL (22, 3) NULL
);

