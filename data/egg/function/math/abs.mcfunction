#:module ja
#@text
#> 数学関連の機能を提供します。
#:

#:function ja
#@in score x x
#@return |x|
#@text
#> 絶対値を取得します。
#@code mcfunction
#> # -3 の絶対値を取得
#> scoreboard players set #egg:math/abs|<<x -- -3
#> execute store result score #abs -- run function egg:math/abs
#> tellraw @a ["|-3| = ",{score:{name:"#abs",objective:"--"}}]
#:

## Raw value.
execute if score #egg:math/abs|<<x -- matches 0.. run return run scoreboard players get #egg:math/abs|<<x --

## Inverse.
scoreboard players operation #egg:math/abs|x -- = #egg:math/abs|<<x --
scoreboard players operation #egg:math/abs|x -- *= #egg|-1 --
## Return.
return run scoreboard players get #egg:math/abs|x --