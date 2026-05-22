#:function ja
#@return コマンド実行者 `@s` への騎乗者の数
#@text
#> 騎乗者の数を取得します。
#:

## Count Passengers.
scoreboard players set #egg:nog/passengers|count -- 0
execute on passengers run scoreboard players add #egg:nog/passengers|count -- 1
## Return.
return run scoreboard players get #egg:nog/passengers|count --