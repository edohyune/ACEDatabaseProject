CREATE TABLE [dbo].[SYS700] (
    [pid]         BIGINT         IDENTITY (1, 1) NOT NULL,
    [INFO_NO]     BIGINT         NOT NULL,
    [SEQ]         INT            NOT NULL,
    [INFO_TITLE]  VARCHAR (200)  NOT NULL,
    [INFO_TEXT]   VARCHAR (4000) NOT NULL,
    [EXPIRE_DATE] DATE           NULL,
    [READ_CNT]    INT            DEFAULT ((0)) NOT NULL,
    [FILENAME]    VARCHAR (200)  NULL,
    [PATHNAME]    VARCHAR (400)  NULL,
    [FLAG]        VARCHAR (1)    NULL,
    [cid]         VARCHAR (10)   NULL,
    [cdt]         DATETIME       NULL,
    [mid]         VARCHAR (10)   NULL,
    [mdt]         DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([pid] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'ms_description', @value = N'Bulletin', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'SYS700';

