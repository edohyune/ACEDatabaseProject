CREATE TABLE [dbo].[ACA300] (
    [company]    VARCHAR (2)     NOT NULL,
    [plant]      VARCHAR (4)     NOT NULL,
    [slip_no]    VARCHAR (20)    NOT NULL,
    [slip_seq]   VARCHAR (10)    NOT NULL,
    [offset]     VARCHAR (20)    NOT NULL,
    [offset_seq] VARCHAR (10)    NOT NULL,
    [vendor]     VARCHAR (20)    NULL,
    [acc]        VARCHAR (20)    NULL,
    [idate]      DATE            NULL,
    [ddate]      DATE            NULL,
    [iamt]       NUMERIC (22, 3) NULL,
    [oamt]       NUMERIC (22, 3) NULL,
    [invoice]    VARCHAR (MAX)   NULL,
    [rmks]       VARCHAR (200)   NULL,
    [closed]     VARCHAR (1)     NULL,
    [bgflag]     VARCHAR (1)     NULL
);

