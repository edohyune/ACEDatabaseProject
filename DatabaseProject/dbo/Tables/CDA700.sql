CREATE TABLE [dbo].[CDA700] (
    [pid]        BIGINT          IDENTITY (1, 1) NOT NULL,
    [bank_acc]   NVARCHAR (50)   NOT NULL,
    [bank]       VARCHAR (10)    NOT NULL,
    [bank_class] VARCHAR (10)    NULL,
    [depositor]  NVARCHAR (50)   NULL,
    [curr]       VARCHAR (10)    NULL,
    [cntrDate]   DATE            NULL,
    [cntrPeriod] INT             NULL,
    [closeDate]  DATE            NULL,
    [closed]     CHAR (1)        NULL,
    [baseAcc]    CHAR (1)        NULL,
    [expAcc]     CHAR (1)        NULL,
    [cntrAmt]    NUMERIC (22, 3) NULL,
    [intRate]    NUMERIC (22, 3) NULL,
    [intMonth]   NUMERIC (22, 3) NULL,
    [intTot]     NUMERIC (22, 3) NULL,
    [getTotal]   NUMERIC (22, 3) NULL,
    [pay]        NUMERIC (22, 3) NULL,
    [payTot]     NUMERIC (22, 3) NULL,
    [payTerm]    VARCHAR (10)    NULL,
    [payDay]     VARCHAR (10)    NULL,
    [payCnt]     NUMERIC (22, 3) NULL,
    [acc]        VARCHAR (20)    NULL,
    [accInt]     VARCHAR (20)    NULL,
    [accExp]     VARCHAR (20)    NULL,
    [remark]     NVARCHAR (200)  NULL,
    [cid]        VARCHAR (20)    NULL,
    [cdt]        DATETIME        NULL,
    [mid]        VARCHAR (20)    NULL,
    [mdt]        DATETIME        NULL,
    [plant]      VARCHAR (20)    NULL,
    CONSTRAINT [PK_CDA700] PRIMARY KEY CLUSTERED ([bank_acc] ASC, [bank] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CDA700_ix1]
    ON [dbo].[CDA700]([pid] ASC);

