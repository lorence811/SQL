/*
店コード'0001'の売上から、売上日付が'20130401'から'20130425'の1日毎の売上件数が20件以上の売上日を取得しよう。
ただし売上が存在しない日付を取得する必要はありません。

取得項目は以下とする
 URIAGE_YMD		売上.売上日付
 URIAGE_COUNT	集約関数COUNTを用いて求める

以下の項目でソートすること
 URIAGE_YMD		売上.売上日付
*/
select
TR_URIAGE.URIAGE_YMD,
count(*)

from
TR_URIAGE

where 1=1
and TR_URIAGE.MISE_CD = '0001'
and TR_URIAGE.URIAGE_YMD between '20130401' and '20130425'

group by
TR_URIAGE.URIAGE_YMD

having
count(*) >= 20

order by
TR_URIAGE.URIAGE_YMD