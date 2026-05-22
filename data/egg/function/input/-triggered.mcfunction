#:function ja
#@return 右クリック未入力のティック数
#@text
#> 右クリック入力の瞬間を検知します。
#> 右クリック入力まで未入力だったティック数が戻り値になります。
#:

## Verify.
execute unless entity @s[type=minecraft:player] run return fail
execute unless entity @s[tag=egg.input] run return fail

## Triggered.
execute if score @s egg.input._previous matches ..0 if score @s egg.input._current matches 0.. \
  run return run scoreboard players operation @s egg.input._previous *= #egg|-1 --
## not Triggered.
return 0