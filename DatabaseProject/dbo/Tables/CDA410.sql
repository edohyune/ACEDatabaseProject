CREATE TABLE [dbo].[CDA410] (
    [pid]        INT             IDENTITY (1, 1) NOT NULL,
    [matl]       VARCHAR (20)    NOT NULL,
    [supp]       VARCHAR (20)    NULL,
    [unit]       VARCHAR (10)    NULL,
    [moq]        DECIMAL (12, 3) NULL,
    [curr]       VARCHAR (20)    NULL,
    [price]      DECIMAL (12, 3) NULL,
    [date_start] DATE            NULL,
    [date_end]   DATE            NULL,
    [memo]       NVARCHAR (254)  NULL,
    [deleted]    VARCHAR (1)     NULL,
    [cid]        VARCHAR (20)    NULL,
    [cdt]        DATETIME        NULL,
    [mid]        VARCHAR (20)    NULL,
    [mdt]        DATETIME        NULL
);

