CREATE TABLE [dbo].[PPA200] (
    [company]  VARCHAR (2)     NOT NULL,
    [keyno]    VARCHAR (16)    NOT NULL,
    [seq]      VARCHAR (3)     NOT NULL,
    [ymd]      DATE            NULL,
    [memo]     VARCHAR (200)   NULL,
    [flock]    VARCHAR (20)    NOT NULL,
    [hh]       VARCHAR (10)    NOT NULL,
    [hr]       VARCHAR (10)    NOT NULL,
    [to_flock] VARCHAR (10)    NOT NULL,
    [to_hh]    VARCHAR (10)    NOT NULL,
    [to_hr]    VARCHAR (10)    NOT NULL,
    [qty]      DECIMAL (15, 3) NULL,
    [cid]      INT             NULL,
    [cdt]      DATETIME        NULL,
    [mid]      INT             NULL,
    [mdt]      DATETIME        NULL
);

