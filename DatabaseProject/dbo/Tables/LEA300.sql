CREATE TABLE [dbo].[LEA300] (
    [company]    VARCHAR (2)     NOT NULL,
    [plant]      VARCHAR (4)     NOT NULL,
    [ymd]        DATE            NOT NULL,
    [io]         VARCHAR (2)     NOT NULL,
    [flock]      VARCHAR (20)    NOT NULL,
    [hh]         VARCHAR (12)    NOT NULL,
    [qty_female] DECIMAL (15, 3) NULL,
    [qty_male]   DECIMAL (15, 3) NULL
);

