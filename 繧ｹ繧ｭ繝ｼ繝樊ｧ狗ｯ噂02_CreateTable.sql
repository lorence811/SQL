/* 売上 */
CREATE TABLE sql_test.TR_URIAGE(
	 URIAGE_NO                       NUMERIC(8)        /* 売上番号 */
	,MISE_CD                         CHAR(4)       /* 店CD */
	,URIAGE_YMD                      CHAR(8)       /* 売上日付 */
	,URIAGE_HM                       CHAR(4)       /* 売上時刻 */
	,YOBI_KBN                        CHAR(2)       /* 曜日区分 */
	,SHOKEI_KOSU                     NUMERIC(4)        /* 小計個数 */
	,GENKEI_KINGAKU                  NUMERIC(7)        /* 現計金額 */
	,AZUKARI_KINGAKU                 NUMERIC(7)        /* 預かり金額 */
	,UCHIZEI_TAISHO_KINGAKU          NUMERIC(7)        /* 内税対象 */
	,SHOHIZEI_KINGAKU                NUMERIC(7)        /* 消費税金額 */
	,KAIIN_ID                        NUMERIC(12)       /* 会員ID */
	,RUISEKI_POINT                   NUMERIC(7)        /* 累積ポイント（前回までポイント） */
	,TSUJO_POINT                     NUMERIC(7)        /* 通常ポイント */
	,SERVICEDAY_POINT                NUMERIC(7)        /* サービスデーポイント */
	,TANPIN_POINT_SUM                NUMERIC(7)        /* 単品ポイント合計 */
	,CACHER_ID                       NUMERIC(12)       /* キャッシャーID*/
	,REGISTER_CD                     CHAR(5)       /* レジコード */
	,TOROKU_DATE                     DATE               /* システム項目 登録日 */
	,TOROKU_PROGRAM                  VARCHAR(64)  /* システム項目 登録プログラム */
	,KOSHIN_DATE                     DATE               /* システム項目 更新日 */
	,KOSHIN_PROGRAM                  VARCHAR(64)  /* システム項目 更新プログラム */
)
;

ALTER TABLE sql_test.TR_URIAGE ADD CONSTRAINT PK_TR_URIAGE PRIMARY KEY(URIAGE_NO);



/* 売上明細 */
CREATE TABLE sql_test.TR_URIAGE_MEISAI(
	 URIAGE_NO                NUMERIC(12)       /* 売上番号 */
	,URIAGE_MEISAI_REC        NUMERIC(4)        /* 売上明細行番号 */
	,URIAGE_YMD                      CHAR(8)/* 売上日付 */
	,MISE_CD                         CHAR(4)/* 店CD */
	,HAMBAI_CD                CHAR(7)       /* 販売CD */
	,HAMBAI_TANKA             NUMERIC(7)        /* 販売単価 */
	,HAMBAI_KOSU              NUMERIC(4)        /* 販売個数 */
	,NEBIKI_KBN               CHAR(2)       /* 値引表示区分 */
	,NEBIKI_KINGAKU           NUMERIC(7)        /* 値引金額 */
	,TANPIN_POINT             NUMERIC(7)        /* 単品ポイント */
	,TOROKU_DATE              DATE               /* システム項目 登録日 */
	,TOROKU_PROGRAM           VARCHAR(64)  /* システム項目 登録プログラム */
	,KOSHIN_DATE              DATE               /* システム項目 更新日 */
	,KOSHIN_PROGRAM           VARCHAR(64)  /* システム項目 更新プログラム */
)
;
ALTER TABLE sql_test.TR_URIAGE_MEISAI ADD CONSTRAINT PK_TR_URIAGE_MEISAI PRIMARY KEY(URIAGE_NO,URIAGE_MEISAI_REC)
;


/* 商品マスタ（販売）*/
CREATE TABLE sql_test.MS_SHOHIN_HAMBAI(
	 HAMBAI_CD                CHAR(7)       /* 販売コード */
	,SHOHIN_NAME              VARCHAR(96)  /* 商品名 */
	,SHOHIN_HYOJI_NAME        VARCHAR(96)  /* 商品表示名 */
	,MISE_CD                  CHAR(4)       /* 店CD */
	,HAMBAI_TANKA             NUMERIC(7)        /* 販売単価 */
	,TOROKU_DATE              DATE               /* システム項目 登録日 */
	,TOROKU_PROGRAM           VARCHAR(64)  /* システム項目 登録プログラム */
	,KOSHIN_DATE              DATE               /* システム項目 更新日 */
	,KOSHIN_PROGRAM           VARCHAR(64)  /* システム項目 更新プログラム */
)
;
ALTER TABLE sql_test.MS_SHOHIN_HAMBAI ADD CONSTRAINT PK_MS_SHOHIN_HAMBAI PRIMARY KEY(HAMBAI_CD)
;

/* 販促管理マスタ */
CREATE TABLE sql_test.MS_HANSOKU_KNR(
	 HAMBAI_CD                CHAR(7)       /* 販売コード */
	,TEKIYO_KAISHI_YMD        CHAR(8)       /* 適用終了日付 */
	,TEKIYO_SYURYO_YMD        CHAR(8)       /* 適用終了日付 */
	,TANPIN_POINT             NUMERIC(7)        /* 単品ポイント */
	,MISE_CD                  CHAR(4)       /* 店CD */
	,TOROKU_DATE              DATE               /* システム項目 登録日 */
	,TOROKU_PROGRAM           VARCHAR(64)  /* システム項目 登録プログラム */
	,KOSHIN_DATE              DATE               /* システム項目 更新日 */
	,KOSHIN_PROGRAM           VARCHAR(64)  /* システム項目 更新プログラム */
)
;
ALTER TABLE sql_test.MS_HANSOKU_KNR ADD CONSTRAINT PK_MS_HANSOKU_KANRI PRIMARY KEY(HAMBAI_CD,TEKIYO_KAISHI_YMD)
;

/* サービスデイ管理マスタ */
CREATE TABLE sql_test.MS_SERVICEDAY_KNR(
	 YOBI_KBN               CHAR(2)         /* 曜日区分 */
	,POINT_KEISU            NUMERIC(2)          /* ポイント係数 */
	,TOROKU_DATE              DATE               /* システム項目 登録日 */
	,TOROKU_PROGRAM           VARCHAR(64)  /* システム項目 登録プログラム */
	,KOSHIN_DATE              DATE               /* システム項目 更新日 */
	,KOSHIN_PROGRAM           VARCHAR(64)  /* システム項目 更新プログラム */
)
;
ALTER TABLE sql_test.MS_SERVICEDAY_KNR ADD CONSTRAINT
	PK_MS_SERVICEDAY_KNR PRIMARY KEY(YOBI_KBN)
;


/* 区分マスタ */
CREATE TABLE sql_test.MS_KBN(
	 KBN_CD                  CHAR(5)       /* 区分コード */
	,KBN                     CHAR(2)       /* 区分 */
	,KBN_VALUE               VARCHAR(64)  /* 区分値 */
	,HYOJI_REC               NUMERIC(2)        /* 表示レコード番号 */
	,TOROKU_DATE             DATE               /* システム項目 登録日 */
	,TOROKU_PROGRAM          VARCHAR(64)  /* システム項目 登録プログラム */
	,KOSHIN_DATE             DATE               /* システム項目 更新日 */
	,KOSHIN_PROGRAM          VARCHAR(64)  /* システム項目 更新プログラム */
)
;
ALTER TABLE sql_test.MS_KBN ADD CONSTRAINT PK_MS_KBNCHI PRIMARY KEY(KBN_CD,KBN)
;


/* レジマスタ */
CREATE TABLE sql_test.MS_REGISTER(
	 REGISTER_CD             CHAR(5)       /* レジコード */
	,REGISTER_NAME           VARCHAR(32)  /* レジ名 */
	,MISE_CD                 CHAR(4)       /* 店CD */
	,HANNYU_YMD              CHAR(8)       /* 搬入日 */
	,TOROKU_DATE             DATE               /* システム項目 登録日 */
	,TOROKU_PROGRAM          VARCHAR(64)  /* システム項目 登録プログラム */
	,KOSHIN_DATE             DATE               /* システム項目 更新日 */
	,KOSHIN_PROGRAM          VARCHAR(64)  /* システム項目 更新プログラム */
)
;

ALTER TABLE sql_test.MS_REGISTER ADD CONSTRAINT PK_MS_REGISTER PRIMARY KEY(REGISTER_CD)
;


/* 社員マスタ */
CREATE TABLE sql_test.MS_SHAIN(
	 SHAIN_ID                 NUMERIC(12)       /* 社員ID */
	,SHAIN_NAME               VARCHAR(64)  /* 社員名 */
	,MISE_CD                  CHAR(4)       /* 店CD */
	,EXCLCNT                  NUMERIC(12)       /* 排他制御カウンタ */
	,TOROKU_DATE              DATE               /* システム項目 登録日 */
	,TOROKU_PROGRAM           VARCHAR(64)  /* システム項目 登録プログラム */
	,KOSHIN_DATE              DATE               /* システム項目 更新日 */
	,KOSHIN_PROGRAM           VARCHAR(64)  /* システム項目 更新プログラム */
)
;
ALTER TABLE sql_test.MS_SHAIN ADD CONSTRAINT PK_MS_SHAIN PRIMARY KEY(SHAIN_ID)
;

/* 会員マスタ */
CREATE TABLE sql_test.MS_KAIIN(
	 KAIIN_ID                        NUMERIC(12)       /* 会員ID */
	,RUISEKI_POINT                   NUMERIC(7)        /* 累積ポイント（前回までポイント） */
	,MISE_CD                         CHAR(4)       /* 店CD */
	,TOROKU_DATE                     DATE               /* システム項目 登録日 */
	,TOROKU_PROGRAM                  VARCHAR(64)  /* システム項目 登録プログラム */
	,KOSHIN_DATE                     DATE               /* システム項目 更新日 */
	,KOSHIN_PROGRAM                  VARCHAR(64)  /* システム項目 更新プログラム */
)
;
ALTER TABLE sql_test.MS_KAIIN ADD CONSTRAINT PK_MS_KAIIN PRIMARY KEY(KAIIN_ID)
;



/* カレンダーマスタ */
CREATE TABLE sql_test.MS_CALENDAR(
	 YMD                                       CHAR(8)
	,YOBI_KBN                                  CHAR(2)
	,TOROKU_DATE                               DATE
	,TOROKU_PROGRAM                            VARCHAR(64)
	,KOSHIN_DATE                               DATE
	,KOSHIN_PROGRAM                            VARCHAR(64)
)
;
ALTER TABLE sql_test.MS_CALENDAR ADD CONSTRAINT PK_MS_CALENDAR PRIMARY KEY(YMD)
;

CREATE TABLE sql_test.MS_AREA (
	 AREA_CD                        CHAR(4)       /* エリアCD */
	,AREA_NAME                      VARCHAR(64)  /* エリア名 */
	,TOROKU_DATE                    DATE
	,TOROKU_PROGRAM                 VARCHAR(64)
	,KOSHIN_DATE                    DATE
	,KOSHIN_PROGRAM                 VARCHAR(64)
)
;
ALTER TABLE sql_test.MS_AREA ADD CONSTRAINT PK_MS_AREA PRIMARY KEY(AREA_CD)
;


CREATE TABLE sql_test.MS_AREA_MISE_IDX (
	 AREA_CD                        CHAR(4)
	,MISE_CD                        CHAR(4)
	,TOROKU_DATE                    DATE
	,TOROKU_PROGRAM                 VARCHAR(64)
	,KOSHIN_DATE                    DATE
	,KOSHIN_PROGRAM                 VARCHAR(64)
)
;
ALTER TABLE sql_test.MS_AREA_MISE_IDX ADD CONSTRAINT PK_MS_AREA_MISE_IDX PRIMARY KEY(AREA_CD, MISE_CD)
;


CREATE TABLE sql_test.MS_MISE (
	 MISE_CD                        CHAR(4)
	,MISE_NAME                      VARCHAR(64)
	,TEL                            VARCHAR(12)
	,TOROKU_DATE                    DATE
	,TOROKU_PROGRAM                 VARCHAR(64)
	,KOSHIN_DATE                    DATE
	,KOSHIN_PROGRAM                 VARCHAR(64)
)
;

ALTER TABLE sql_test.MS_MISE ADD CONSTRAINT PK_MS_MISE PRIMARY KEY(MISE_CD)
;

COMMENT	ON	TABLE	sql_test.TR_URIAGE								IS	'売上';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE.URIAGE_NO						IS	'売上番号';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE.MISE_CD						IS	'店CD';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE.URIAGE_YMD					IS	'売上日付';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE.URIAGE_HM						IS	'売上時刻';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE.YOBI_KBN						IS	'曜日区分';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE.SHOKEI_KOSU					IS	'小計個数';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE.GENKEI_KINGAKU				IS	'現計金額';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE.AZUKARI_KINGAKU				IS	'預かり金額';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE.UCHIZEI_TAISHO_KINGAKU		IS	'内税対象';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE.SHOHIZEI_KINGAKU				IS	'消費税金額';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE.KAIIN_ID						IS	'会員ID';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE.RUISEKI_POINT					IS	'累積ポイント（前回までポイント）';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE.TSUJO_POINT					IS	'通常ポイント';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE.SERVICEDAY_POINT				IS	'サービスデーポイント';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE.TANPIN_POINT_SUM				IS	'単品ポイント合計';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE.CACHER_ID						IS	'キャッシャーI';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE.REGISTER_CD					IS	'レジコード';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE.TOROKU_DATE					IS	'システム項目 登録日';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE.TOROKU_PROGRAM				IS	'システム項目 登録プログラム';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE.KOSHIN_DATE					IS	'システム項目 更新日';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE.KOSHIN_PROGRAM				IS	'システム項目 更新プログラム';
COMMENT	ON	TABLE	sql_test.TR_URIAGE_MEISAI						IS	'売上明細';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE_MEISAI.URIAGE_NO				IS	'売上番号';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE_MEISAI.URIAGE_MEISAI_REC		IS	'売上明細行番号';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE_MEISAI.URIAGE_YMD				IS	'売上日付';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE_MEISAI.MISE_CD				IS	'店CD';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE_MEISAI.HAMBAI_CD				IS	'販売CD';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE_MEISAI.HAMBAI_TANKA			IS	'販売単価';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE_MEISAI.HAMBAI_KOSU			IS	'販売個数';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE_MEISAI.NEBIKI_KBN				IS	'値引表示区分';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE_MEISAI.NEBIKI_KINGAKU			IS	'値引金額';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE_MEISAI.TANPIN_POINT			IS	'単品ポイント';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE_MEISAI.TOROKU_DATE			IS	'システム項目 登録日';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE_MEISAI.TOROKU_PROGRAM			IS	'システム項目 登録プログラム';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE_MEISAI.KOSHIN_DATE			IS	'システム項目 更新日';
COMMENT	ON	COLUMN	sql_test.TR_URIAGE_MEISAI.KOSHIN_PROGRAM			IS	'システム項目 更新プログラム';
COMMENT	ON	TABLE	sql_test.MS_SHOHIN_HAMBAI						IS	'商品マスタ（販売）';
COMMENT	ON	COLUMN	sql_test.MS_SHOHIN_HAMBAI.HAMBAI_CD				IS	'販売コード';
COMMENT	ON	COLUMN	sql_test.MS_SHOHIN_HAMBAI.SHOHIN_NAME			IS	'商品名';
COMMENT	ON	COLUMN	sql_test.MS_SHOHIN_HAMBAI.SHOHIN_HYOJI_NAME		IS	'商品表示名';
COMMENT	ON	COLUMN	sql_test.MS_SHOHIN_HAMBAI.MISE_CD				IS	'店CD';
COMMENT	ON	COLUMN	sql_test.MS_SHOHIN_HAMBAI.HAMBAI_TANKA			IS	'販売単価';
COMMENT	ON	COLUMN	sql_test.MS_SHOHIN_HAMBAI.TOROKU_DATE			IS	'システム項目 登録日';
COMMENT	ON	COLUMN	sql_test.MS_SHOHIN_HAMBAI.TOROKU_PROGRAM			IS	'システム項目 登録プログラム';
COMMENT	ON	COLUMN	sql_test.MS_SHOHIN_HAMBAI.KOSHIN_DATE			IS	'システム項目 更新日';
COMMENT	ON	COLUMN	sql_test.MS_SHOHIN_HAMBAI.KOSHIN_PROGRAM			IS	'システム項目 更新プログラム';
COMMENT	ON	TABLE	sql_test.MS_HANSOKU_KNR							IS	'販促管理マスタ	';
COMMENT	ON	COLUMN	sql_test.MS_HANSOKU_KNR.HAMBAI_CD				IS	'販売コード';
COMMENT	ON	COLUMN	sql_test.MS_HANSOKU_KNR.TEKIYO_KAISHI_YMD		IS	'適用終了日付';
COMMENT	ON	COLUMN	sql_test.MS_HANSOKU_KNR.TEKIYO_SYURYO_YMD		IS	'適用終了日付';
COMMENT	ON	COLUMN	sql_test.MS_HANSOKU_KNR.TANPIN_POINT				IS	'単品ポイント';
COMMENT	ON	COLUMN	sql_test.MS_HANSOKU_KNR.MISE_CD					IS	'店CD';
COMMENT	ON	COLUMN	sql_test.MS_HANSOKU_KNR.TOROKU_DATE				IS	'システム項目 登録日';
COMMENT	ON	COLUMN	sql_test.MS_HANSOKU_KNR.TOROKU_PROGRAM			IS	'システム項目 登録プログラム';
COMMENT	ON	COLUMN	sql_test.MS_HANSOKU_KNR.KOSHIN_DATE				IS	'システム項目 更新日';
COMMENT	ON	COLUMN	sql_test.MS_HANSOKU_KNR.KOSHIN_PROGRAM			IS	'システム項目 更新プログラム';
COMMENT	ON	TABLE	sql_test.MS_SERVICEDAY_KNR						IS	'サービスデイ管理マスタ';
COMMENT	ON	COLUMN	sql_test.MS_SERVICEDAY_KNR.YOBI_KBN				IS	'曜日区分';
COMMENT	ON	COLUMN	sql_test.MS_SERVICEDAY_KNR.POINT_KEISU			IS	'ポイント係数';
COMMENT	ON	COLUMN	sql_test.MS_SERVICEDAY_KNR.TOROKU_DATE			IS	'システム項目 登録日';
COMMENT	ON	COLUMN	sql_test.MS_SERVICEDAY_KNR.TOROKU_PROGRAM		IS	'システム項目 登録プログラム';
COMMENT	ON	COLUMN	sql_test.MS_SERVICEDAY_KNR.KOSHIN_DATE			IS	'システム項目 更新日';
COMMENT	ON	COLUMN	sql_test.MS_SERVICEDAY_KNR.KOSHIN_PROGRAM		IS	'システム項目 更新プログラム';
COMMENT	ON	TABLE	sql_test.MS_KBN									IS	'区分マスタ';
COMMENT	ON	COLUMN	sql_test.MS_KBN.KBN_CD							IS	'区分コード';
COMMENT	ON	COLUMN	sql_test.MS_KBN.KBN								IS	'区分';
COMMENT	ON	COLUMN	sql_test.MS_KBN.KBN_VALUE						IS	'区分値';
COMMENT	ON	COLUMN	sql_test.MS_KBN.HYOJI_REC						IS	'表示レコード番号';
COMMENT	ON	COLUMN	sql_test.MS_KBN.TOROKU_DATE						IS	'システム項目 登録日';
COMMENT	ON	COLUMN	sql_test.MS_KBN.TOROKU_PROGRAM					IS	'システム項目 登録プログラム';
COMMENT	ON	COLUMN	sql_test.MS_KBN.KOSHIN_DATE						IS	'システム項目 更新日';
COMMENT	ON	COLUMN	sql_test.MS_KBN.KOSHIN_PROGRAM					IS	'システム項目 更新プログラム';
COMMENT	ON	TABLE	sql_test.MS_REGISTER								IS	'レジマスタ';
COMMENT	ON	COLUMN	sql_test.MS_REGISTER.REGISTER_CD					IS	'レジコード';
COMMENT	ON	COLUMN	sql_test.MS_REGISTER.REGISTER_NAME				IS	'レジ名';
COMMENT	ON	COLUMN	sql_test.MS_REGISTER.MISE_CD						IS	'店CD';
COMMENT	ON	COLUMN	sql_test.MS_REGISTER.HANNYU_YMD					IS	'搬入日';
COMMENT	ON	COLUMN	sql_test.MS_REGISTER.TOROKU_DATE					IS	'システム項目 登録日';
COMMENT	ON	COLUMN	sql_test.MS_REGISTER.TOROKU_PROGRAM				IS	'システム項目 登録プログラム';
COMMENT	ON	COLUMN	sql_test.MS_REGISTER.KOSHIN_DATE					IS	'システム項目 更新日';
COMMENT	ON	COLUMN	sql_test.MS_REGISTER.KOSHIN_PROGRAM				IS	'システム項目 更新プログラム';
COMMENT	ON	TABLE	sql_test.MS_SHAIN								IS	'社員マスタ';
COMMENT	ON	COLUMN	sql_test.MS_SHAIN.SHAIN_ID						IS	'社員ID';
COMMENT	ON	COLUMN	sql_test.MS_SHAIN.SHAIN_NAME						IS	'社員名';
COMMENT	ON	COLUMN	sql_test.MS_SHAIN.MISE_CD						IS	'店CD';
COMMENT	ON	COLUMN	sql_test.MS_SHAIN.EXCLCNT						IS	'排他制御カウンタ';
COMMENT	ON	COLUMN	sql_test.MS_SHAIN.TOROKU_DATE					IS	'システム項目 登録日';
COMMENT	ON	COLUMN	sql_test.MS_SHAIN.TOROKU_PROGRAM					IS	'システム項目 登録プログラム';
COMMENT	ON	COLUMN	sql_test.MS_SHAIN.KOSHIN_DATE					IS	'システム項目 更新日';
COMMENT	ON	COLUMN	sql_test.MS_SHAIN.KOSHIN_PROGRAM					IS	'システム項目 更新プログラム';
COMMENT	ON	TABLE	sql_test.MS_KAIIN								IS	'会員マスタ';
COMMENT	ON	COLUMN	sql_test.MS_KAIIN.KAIIN_ID						IS	'会員ID';
COMMENT	ON	COLUMN	sql_test.MS_KAIIN.RUISEKI_POINT					IS	'累積ポイント（前回までポイント）';
COMMENT	ON	COLUMN	sql_test.MS_KAIIN.MISE_CD						IS	'店CD';
COMMENT	ON	COLUMN	sql_test.MS_KAIIN.TOROKU_DATE					IS	'システム項目 登録日';
COMMENT	ON	COLUMN	sql_test.MS_KAIIN.TOROKU_PROGRAM					IS	'システム項目 登録プログラム';
COMMENT	ON	COLUMN	sql_test.MS_KAIIN.KOSHIN_DATE					IS	'システム項目 更新日';
COMMENT	ON	COLUMN	sql_test.MS_KAIIN.KOSHIN_PROGRAM					IS	'システム項目 更新プログラム';
COMMENT	ON	TABLE	sql_test.MS_CALENDAR								IS	'カレンダーマスタ';
COMMENT	ON	COLUMN	sql_test.MS_CALENDAR.YMD							IS	'日付';
COMMENT	ON	COLUMN	sql_test.MS_CALENDAR.YOBI_KBN					IS	'曜日区分';
COMMENT	ON	COLUMN	sql_test.MS_CALENDAR.TOROKU_DATE					IS	'システム項目 登録日';
COMMENT	ON	COLUMN	sql_test.MS_CALENDAR.TOROKU_PROGRAM				IS	'システム項目 登録プログラム';
COMMENT	ON	COLUMN	sql_test.MS_CALENDAR.KOSHIN_DATE					IS	'システム項目 更新日';
COMMENT	ON	COLUMN	sql_test.MS_CALENDAR.KOSHIN_PROGRAM				IS	'システム項目 更新プログラム';
COMMENT	ON	TABLE	sql_test.MS_AREA									IS	'エリアマスタ';
COMMENT	ON	COLUMN	sql_test.MS_AREA.AREA_CD							IS	'エリアCD';
COMMENT	ON	COLUMN	sql_test.MS_AREA.AREA_NAME						IS	'エリア名';
COMMENT	ON	COLUMN	sql_test.MS_AREA.TOROKU_DATE						IS	'システム項目 登録日';
COMMENT	ON	COLUMN	sql_test.MS_AREA.TOROKU_PROGRAM					IS	'システム項目 登録プログラム';
COMMENT	ON	COLUMN	sql_test.MS_AREA.KOSHIN_DATE						IS	'システム項目 更新日';
COMMENT	ON	COLUMN	sql_test.MS_AREA.KOSHIN_PROGRAM					IS	'システム項目 更新プログラム';
COMMENT	ON	TABLE	sql_test.MS_AREA_MISE_IDX						IS	'エリア店インデックスマスタ';
COMMENT	ON	COLUMN	sql_test.MS_AREA_MISE_IDX.AREA_CD				IS	'エリアCD';
COMMENT	ON	COLUMN	sql_test.MS_AREA_MISE_IDX.MISE_CD				IS	'店CD';
COMMENT	ON	COLUMN	sql_test.MS_AREA_MISE_IDX.TOROKU_DATE			IS	'システム項目 登録日';
COMMENT	ON	COLUMN	sql_test.MS_AREA_MISE_IDX.TOROKU_PROGRAM			IS	'システム項目 登録プログラム';
COMMENT	ON	COLUMN	sql_test.MS_AREA_MISE_IDX.KOSHIN_DATE			IS	'システム項目 更新日';
COMMENT	ON	COLUMN	sql_test.MS_AREA_MISE_IDX.KOSHIN_PROGRAM			IS	'システム項目 更新プログラム';
COMMENT	ON	TABLE	sql_test.MS_MISE									IS	'店マスタ';
COMMENT	ON	COLUMN	sql_test.MS_MISE.MISE_CD							IS	'店CD';
COMMENT	ON	COLUMN	sql_test.MS_MISE.MISE_NAME						IS	'店名';
COMMENT	ON	COLUMN	sql_test.MS_MISE.TEL								IS	'電話番号';
COMMENT	ON	COLUMN	sql_test.MS_MISE.TOROKU_DATE						IS	'システム項目 登録日';
COMMENT	ON	COLUMN	sql_test.MS_MISE.TOROKU_PROGRAM					IS	'システム項目 登録プログラム';
COMMENT	ON	COLUMN	sql_test.MS_MISE.KOSHIN_DATE						IS	'システム項目 更新日';
COMMENT	ON	COLUMN	sql_test.MS_MISE.KOSHIN_PROGRAM					IS	'システム項目 更新プログラム';
