#:function ja
#@return キー未入力のティック数
#@text
#> キー入力の瞬間を検知します。
#> キー入力まで未入力だったティック数が戻り値になります。
#:

## Verify.
execute unless entity @s[type=minecraft:player] run return fail
execute unless entity @s[tag=egg.key.right] run return fail

## Triggered.
execute if score @s egg.key.right._previous matches ..0 if score @s egg.key.right._current matches 0.. \
  run return run scoreboard players operation @s egg.key.right._previous *= #egg|-1 --
## not Triggered.
return 0