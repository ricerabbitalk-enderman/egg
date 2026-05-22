#:function ja
#@return キー入力が継続されたティック数
#@text
#> キー入力が終了したかどうかを取得します。
#> 入力終了まで押し続けられていたティック数が戻り値になります。
#:

## Verify.
execute unless entity @s[type=minecraft:player] run return fail
execute unless entity @s[tag=egg.key.forward] run return fail

## Released.
execute if score @s egg.key.forward._previous matches 0.. if score @s egg.key.forward._current matches ..0 run return run scoreboard players get @s egg.key.forward._previous
## not Released.
return 0