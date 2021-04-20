CREATE TABLE [dbo].[PPA310] (
    [company] VARCHAR (2)     NOT NULL,
    [keyno]   VARCHAR (20)    NULL,
    [ymd]     DATE            NOT NULL,
    [plant]   VARCHAR (10)    NOT NULL,
    [hr]      VARCHAR (20)    NOT NULL,
    [flock]   VARCHAR (20)    NOT NULL,
    [hh]      VARCHAR (20)    NOT NULL,
    [matl]    VARCHAR (20)    NOT NULL,
    [qty]     DECIMAL (15, 3) NULL,
    [pids]    BIGINT          NULL
);

