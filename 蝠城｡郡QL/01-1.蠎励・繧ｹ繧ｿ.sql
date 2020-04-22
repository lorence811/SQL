/*
店の一覧を表示しよう

取得項目は以下とする
 MISE_CD	店マスタ.店CD
 MISE_NAME	店マスタ.店名
 TEL		店マスタ.電話番号

以下の項目でソートすること
 MISE_CD	店マスタ.店CD

*/

SELECT MS_MISE.MISE_CD, MS_MISE.MISE_NAME, MS_MISE.TEL FROM MS_MISE