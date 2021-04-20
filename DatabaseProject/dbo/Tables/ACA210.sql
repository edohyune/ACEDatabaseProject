CREATE TABLE [dbo].[ACA210] (
    [company] VARCHAR (2)     NOT NULL,
    [plant]   VARCHAR (4)     NOT NULL,
    [yy]      VARCHAR (7)     NOT NULL,
    [acc]     VARCHAR (20)    NOT NULL,
    [bankacc] VARCHAR (40)    NULL,
    [dr]      NUMERIC (22, 3) NULL,
    [cr]      NUMERIC (22, 3) NULL
);

