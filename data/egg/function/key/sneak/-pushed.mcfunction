#:module ja
#@text
#> プレイヤーのスニークキー入力関連の機能を提供します。
#:

#:function ja
#@return キー入力のティック数
#@text
#> キーが押されているかどうかを取得します。
#> 押し続けられているティック数が戻り値になります。
#:

## Verify.
execute unless entity @s[type=minecraft:player] run return fail
execute unless entity @s[tag=egg.key.sneak] run return fail

## Pushed.
execute if score @s egg.key.sneak._current matches 0.. run return run scoreboard players get @s egg.key.sneak._current
## Not pushed.
return 0