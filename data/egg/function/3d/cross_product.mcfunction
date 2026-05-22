#:module ja
#@text
#> 3D 関連の機能を提供します。
#:

#:function ja
#@in storage a-3d~double `[double, double, double]` データ
#@in storage b-3d~double `[double, double, double]` データ
#@out storage 3d~double 外積の `[double, double, double]` データ
#@return 処理の成否
#@text
#> **この関数は精度に難があります**
#>
#> 外積を計算します。
#> 内部的に ~fixed (1/64 精度) の固定小数点で演算されるため精度が落ちます。
#> 出力される 3D Double データは自動で安全なデータに変換されます。
#@code mcfunction
#> # 2つのエンティティの Motion を外積で計算
#> data modify storage egg:3d/cross_product <<a-3d~double set from entity @e[tag=a,limit=1] Motion
#> data modify storage egg:3d/cross_product <<b-3d~double set from entity @e[tag=b,limit=1] Motion
#> function egg:3d/cross_product
#> tellraw @a ["A x B = ",{storage:"egg:3d/cross_product",nbt:">>3d~double"}]
#:

## Cleanup.
data remove storage egg:3d/cross_product >>3d~double

## Verify.
execute unless data storage egg:3d/cross_product <<a-3d~double run return fail
execute unless data storage egg:3d/cross_product <<b-3d~double run return fail

## Initialize scores.
scoreboard players set #egg:3d/cross_product|a(x)~fixed -- 0
scoreboard players set #egg:3d/cross_product|a(y)~fixed -- 0
scoreboard players set #egg:3d/cross_product|a(z)~fixed -- 0
scoreboard players set #egg:3d/cross_product|b(x)~fixed -- 0
scoreboard players set #egg:3d/cross_product|b(y)~fixed -- 0
scoreboard players set #egg:3d/cross_product|b(z)~fixed -- 0
## Get data.
execute store result score #egg:3d/cross_product|a(x)~fixed -- run data get storage egg:3d/cross_product <<a-3d~double[0] 64
execute store result score #egg:3d/cross_product|a(y)~fixed -- run data get storage egg:3d/cross_product <<a-3d~double[1] 64
execute store result score #egg:3d/cross_product|a(z)~fixed -- run data get storage egg:3d/cross_product <<a-3d~double[2] 64
execute store result score #egg:3d/cross_product|b(x)~fixed -- run data get storage egg:3d/cross_product <<b-3d~double[0] 64
execute store result score #egg:3d/cross_product|b(y)~fixed -- run data get storage egg:3d/cross_product <<b-3d~double[1] 64
execute store result score #egg:3d/cross_product|b(z)~fixed -- run data get storage egg:3d/cross_product <<b-3d~double[2] 64
scoreboard players operation #egg:3d/cross_product|a(y)b(z)~fixed -- = #egg:3d/cross_product|a(y)~fixed --
scoreboard players operation #egg:3d/cross_product|a(y)b(z)~fixed -- *= #egg:3d/cross_product|b(z)~fixed --
scoreboard players operation #egg:3d/cross_product|a(z)b(y)~fixed -- = #egg:3d/cross_product|a(z)~fixed --
scoreboard players operation #egg:3d/cross_product|a(z)b(y)~fixed -- *= #egg:3d/cross_product|b(y)~fixed --
scoreboard players operation #egg:3d/cross_product|a(z)b(x)~fixed -- = #egg:3d/cross_product|a(z)~fixed --
scoreboard players operation #egg:3d/cross_product|a(z)b(x)~fixed -- *= #egg:3d/cross_product|b(x)~fixed --
scoreboard players operation #egg:3d/cross_product|a(x)b(z)~fixed -- = #egg:3d/cross_product|a(x)~fixed --
scoreboard players operation #egg:3d/cross_product|a(x)b(z)~fixed -- *= #egg:3d/cross_product|b(z)~fixed --
scoreboard players operation #egg:3d/cross_product|a(x)b(y)~fixed -- = #egg:3d/cross_product|a(x)~fixed --
scoreboard players operation #egg:3d/cross_product|a(x)b(y)~fixed -- *= #egg:3d/cross_product|b(y)~fixed --
scoreboard players operation #egg:3d/cross_product|a(y)b(x)~fixed -- = #egg:3d/cross_product|a(y)~fixed --
scoreboard players operation #egg:3d/cross_product|a(y)b(x)~fixed -- *= #egg:3d/cross_product|b(x)~fixed --

scoreboard players operation #egg:3d/cross_product|result(x)~fixed -- = #egg:3d/cross_product|a(y)b(z)~fixed --
scoreboard players operation #egg:3d/cross_product|result(x)~fixed -- -= #egg:3d/cross_product|a(z)b(y)~fixed --
scoreboard players operation #egg:3d/cross_product|result(y)~fixed -- = #egg:3d/cross_product|a(z)b(x)~fixed --
scoreboard players operation #egg:3d/cross_product|result(y)~fixed -- -= #egg:3d/cross_product|a(x)b(z)~fixed --
scoreboard players operation #egg:3d/cross_product|result(z)~fixed -- = #egg:3d/cross_product|a(x)b(y)~fixed --
scoreboard players operation #egg:3d/cross_product|result(z)~fixed -- -= #egg:3d/cross_product|a(y)b(x)~fixed --

## Initialize.
data modify storage egg:3d/cross_product >>3d~double set value [1.0e-307d,1.0e-307d,1.0e-307d]
## Set data.
execute \
  unless score #egg:3d/cross_product|result(x)~fixed -- matches 0 \
  store result storage egg:3d/cross_product >>3d~double[0] double 0.00024414062 \
    run scoreboard players get #egg:3d/cross_product|result(x)~fixed --
execute \
  unless score #egg:3d/cross_product|result(y)~fixed -- matches 0 \
  store result storage egg:3d/cross_product >>3d~double[1] double 0.00024414062 \
    run scoreboard players get #egg:3d/cross_product|result(y)~fixed --
execute \
  unless score #egg:3d/cross_product|result(z)~fixed -- matches 0 \
  store result storage egg:3d/cross_product >>3d~double[2] double 0.00024414062 \
    run scoreboard players get #egg:3d/cross_product|result(z)~fixed --
## in fixed range.
execute \
  if score #egg|MIN~fixed -- <= #egg:3d/cross_product|result(x)~fixed -- if score #egg:3d/cross_product|result(x)~fixed -- <= #egg|MAX~fixed -- \
  if score #egg|MIN~fixed -- <= #egg:3d/cross_product|result(y)~fixed -- if score #egg:3d/cross_product|result(y)~fixed -- <= #egg|MAX~fixed -- \
  if score #egg|MIN~fixed -- <= #egg:3d/cross_product|result(z)~fixed -- if score #egg:3d/cross_product|result(z)~fixed -- <= #egg|MAX~fixed -- \
    run return 1
## out of fixed range.
return 0