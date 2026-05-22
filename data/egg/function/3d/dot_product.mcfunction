#:function ja
#@in storage a-3d~double `[double, double, double]` データ
#@in storage b-3d~double `[double, double, double]` データ
#@out storage scalar~double 内積のスカラー値
#@return 処理の成否
#@text
#> **この関数は精度に難があります**
#>
#> 内積を計算します。
#> 内部的に ~fixed (1/64 精度) の固定小数点で演算されるため精度が落ちます。
#@code mcfunction
#> # 2つのエンティティの Motion を内積で計算
#> data modify storage egg:3d/dot_product <<a-3d~double set from entity @e[tag=a,limit=1] Motion
#> data modify storage egg:3d/dot_product <<b-3d~double set from entity @e[tag=b,limit=1] Motion
#> function egg:3d/dot_product
#> tellraw @a ["A . B = ",{storage:"egg:3d/dot_product",nbt:">>scalar~double"}]
#:

## Cleanup.
data remove storage egg:3d/dot_product >>scalar~double

## Verify.
execute unless data storage egg:3d/dot_product <<a-3d~double run return fail
execute unless data storage egg:3d/dot_product <<b-3d~double run return fail
## Get data.
execute store result score #egg:3d/dot_product|a(x)~fixed -- run data get storage egg:3d/dot_product <<a-3d~double[0] 64
execute store result score #egg:3d/dot_product|a(y)~fixed -- run data get storage egg:3d/dot_product <<a-3d~double[1] 64
execute store result score #egg:3d/dot_product|a(z)~fixed -- run data get storage egg:3d/dot_product <<a-3d~double[2] 64
execute store result score #egg:3d/dot_product|b(x)~fixed -- run data get storage egg:3d/dot_product <<b-3d~double[0] 64
execute store result score #egg:3d/dot_product|b(y)~fixed -- run data get storage egg:3d/dot_product <<b-3d~double[1] 64
execute store result score #egg:3d/dot_product|b(z)~fixed -- run data get storage egg:3d/dot_product <<b-3d~double[2] 64
scoreboard players operation #egg:3d/dot_product|result(x)~fixed -- = #egg:3d/dot_product|a(x)~fixed --
scoreboard players operation #egg:3d/dot_product|result(y)~fixed -- = #egg:3d/dot_product|a(y)~fixed --
scoreboard players operation #egg:3d/dot_product|result(z)~fixed -- = #egg:3d/dot_product|a(z)~fixed --
scoreboard players operation #egg:3d/dot_product|result(x)~fixed -- *= #egg:3d/dot_product|b(x)~fixed --
scoreboard players operation #egg:3d/dot_product|result(y)~fixed -- *= #egg:3d/dot_product|b(y)~fixed --
scoreboard players operation #egg:3d/dot_product|result(z)~fixed -- *= #egg:3d/dot_product|b(z)~fixed --
scoreboard players operation #egg:3d/dot_product|result(x)~fixed -- /= #egg|unit~fixed --
scoreboard players operation #egg:3d/dot_product|result(y)~fixed -- /= #egg|unit~fixed --
scoreboard players operation #egg:3d/dot_product|result(z)~fixed -- /= #egg|unit~fixed --
scoreboard players operation #egg:3d/dot_product|result~fixed -- = #egg:3d/dot_product|result(x)~fixed --
scoreboard players operation #egg:3d/dot_product|result~fixed -- += #egg:3d/dot_product|result(y)~fixed --
scoreboard players operation #egg:3d/dot_product|result~fixed -- += #egg:3d/dot_product|result(z)~fixed --
## Return data.
execute store result storage egg:3d/dot_product >>scalar~double double 0.015625 run scoreboard players get #egg:3d/dot_product|result~fixed --

## Success.
return 1