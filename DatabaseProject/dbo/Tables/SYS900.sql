CREATE TABLE [dbo].[SYS900] (
    [pid]      BIGINT         IDENTITY (1, 1) NOT NULL,
    [frm]      VARCHAR (40)   NULL,
    [reqUser]  VARCHAR (40)   NULL,
    [title]    VARCHAR (2000) NULL,
    [contents] TEXT           NULL,
    [status]   VARCHAR (20)   NULL,
    [memo]     TEXT           NULL,
    [reqDate]  DATE           NULL,
    [dlvDate]  DATE           NULL,
    [cfmDate]  DATE           NULL,
    [prcDate]  DATE           NULL,
    [tstDate]  DATE           NULL,
    [finDate]  DATE           NULL,
    [img]      IMAGE          NULL,
    [cid]      VARCHAR (10)   NULL,
    [cdt]      DATETIME       NULL,
    [mid]      VARCHAR (10)   NULL,
    [mdt]      DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([pid] ASC)
);


GO
CREATE NONCLUSTERED INDEX [sys900_ix1]
    ON [dbo].[SYS900]([frm] ASC);

