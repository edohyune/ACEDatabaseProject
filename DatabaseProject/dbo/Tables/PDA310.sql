CREATE TABLE [dbo].[PDA310] (
    [pid]        BIGINT          IDENTITY (1, 1) NOT NULL,
    [company]    VARCHAR (2)     NOT NULL,
    [keyno]      VARCHAR (20)    NOT NULL,
    [plant]      VARCHAR (10)    NOT NULL,
    [flock]      VARCHAR (20)    NOT NULL,
    [io_date]    DATE            NOT NULL,
    [matl]       VARCHAR (20)    NOT NULL,
    [hh]         VARCHAR (20)    NOT NULL,
    [qty_female] DECIMAL (15, 3) NULL,
    [qty_male]   DECIMAL (15, 3) NULL,
    [cid]        INT             NULL,
    [cdt]        DATETIME        NULL,
    [mid]        INT             NULL,
    [mdt]        DATETIME        NULL
);

