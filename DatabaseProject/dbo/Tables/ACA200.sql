CREATE TABLE [dbo].[ACA200] (
    [company] VARCHAR (2)     NOT NULL,
    [plant]   VARCHAR (4)     NOT NULL,
    [ymd]     DATE            NOT NULL,
    [acc]     VARCHAR (20)    NOT NULL,
    [bankacc] VARCHAR (40)    NOT NULL,
    [dr]      NUMERIC (22, 3) NULL,
    [cr]      NUMERIC (22, 3) NULL
);

