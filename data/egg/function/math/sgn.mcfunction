#:function ja
#@in score x x
#@return sgn x
#@text
#> 符号を取得します。
#@code mcfunction
#> # -3 の符号を取得
#> scoreboard players set #egg:math/sgn|<<x -- -3
#> execute store result score #sgn -- run function egg:math/sgn
#> tellraw @a ["sgn -3 = ",{score:{name:"#sgn",objective:"--"}}]
#:

## sgn x.
execute if score #egg:math/sgn|<<x -- matches 0 run return 0
execute if score #egg:math/sgn|<<x -- matches 1.. run return 1
return -1