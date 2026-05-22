#:function ja
#@in storage x~double x (-1 <= x <= 1)
#@out storage asin~double asin 値（度数法）
#@out storage acos~double acos 値（度数法）
#@return 処理の成否
#@text
#> asin, acos を取得します。
#> 内部的に ~fixed (1/64 精度) の固定小数点で演算されるため精度が落ちます。
#> 許容範囲外の x はエラーにならず範囲内に丸められます。
#@code mcfunction
#> # ランダムな x の asin, acos を取得
#> execute store result storage egg:math/asin_acos <<x~double double 0.015625 run random value -64..64
#> function egg:math/asin_acos
#> tellraw @a [ \
#>   "x",":",{storage:"egg:math/asin_acos",nbt:"<<x~double"},",", \
#>   "asin",":",{storage:"egg:math/asin_acos",nbt:">>asin~double"},",", \
#>   "acos",":",{storage:"egg:math/asin_acos",nbt:">>acos~double"} \
#> ]
#:

## Cleanup.
data remove storage egg:math/asin_acos >>asin~double
data remove storage egg:math/asin_acos >>acos~double

## Verify.
execute unless data storage egg:math/asin_acos <<x~double run return fail

## Set point.
function egg:math/-/reset

## Get asin.
execute store result score #egg:math/-/loop_to_asin|x_target~fixed -- run data get storage egg:math/asin_acos <<x~double 64
execute if score #egg:math/-/loop_to_asin|x_target~fixed -- < #egg|-1~fixed -- run scoreboard players operation #egg:math/-/loop_to_asin|x_target~fixed -- = #egg|-1~fixed --
execute if score #egg|1~fixed -- < #egg:math/-/loop_to_asin|x_target~fixed -- run scoreboard players operation #egg:math/-/loop_to_asin|x_target~fixed -- = #egg|1~fixed --
scoreboard players set #egg:math/-/loop_to_asin|x~fixed -- 0
scoreboard players set #egg:math/-/loop_to_asin|degree~fixed -- 0
scoreboard players operation #egg:math/-/loop_to_asin|step~fixed -- = #egg|90~fixed --
execute in egg:_coord store result score #egg:math/asin_acos|asin_degree~fixed -- run function egg:math/-/loop_to_asin
## Get asin.
scoreboard players operation #egg:math/asin_acos|asin_degree~fixed -- *= #egg|-1 --
## Get acos.
scoreboard players operation #egg:math/asin_acos|acos_degree~fixed -- = #egg|90~fixed --
scoreboard players operation #egg:math/asin_acos|acos_degree~fixed -- -= #egg:math/asin_acos|asin_degree~fixed --

## To radian.
execute store result storage egg:math/asin_acos >>asin~double double 0.015625 run scoreboard players get #egg:math/asin_acos|asin_degree~fixed --
execute store result storage egg:math/asin_acos >>acos~double double 0.015625 run scoreboard players get #egg:math/asin_acos|acos_degree~fixed --

## Success.
return 1