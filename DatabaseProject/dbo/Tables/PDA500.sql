CREATE TABLE [dbo].[PDA500] (
    [pid]      BIGINT          IDENTITY (1, 1) NOT NULL,
    [company]  VARCHAR (2)     NOT NULL,
    [keyno]    VARCHAR (20)    NOT NULL,
    [flock]    VARCHAR (20)    NOT NULL,
    [hh]       VARCHAR (10)    NOT NULL,
    [hr]       VARCHAR (10)    NOT NULL,
    [ymd]      DATE            NOT NULL,
    [tr_good]  DECIMAL (15, 3) NULL,
    [plant]    VARCHAR (10)    NULL,
    [plant_hr] VARCHAR (10)    NULL,
    [cid]      INT             NULL,
    [cdt]      DATETIME        NULL,
    [mid]      INT             NULL,
    [mdt]      DATETIME        NULL
);

