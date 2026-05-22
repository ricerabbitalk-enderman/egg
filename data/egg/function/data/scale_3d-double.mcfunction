#:function ja
#@in storage 3d~double `[double, double, double]` データ
#@in storage scale~double 倍率
#@out storage 3d~double 倍率がかかった安全な `[double, double, double]` データ
#@return 処理の成否
#@text
#> 3D Double データに倍率をかけます。
#> 内部的に `~fixed` (1/64 精度) の固定小数点で演算されるため精度が落ちます。
#> 出力される 3D Double データは自動で安全なデータに変換されます。
#@code mcfunction
#> # Motion を 1.5 する
#> data modify storage egg:data/scale_3d-double <<3d~double set from entity @s Motion
#> data modify storage egg:data/scale_3d-double <<scale~double set value 1.5
#> function egg:data/scale_3d-double
#> data modify storage xxx:temp motion set from storage egg:data/scale_3d-double >>3d~double
#:

## Cleanup.
data remove storage egg:data/scale_3d-double >>3d~double

## Verify.
execute unless data storage egg:data/scale_3d-double <<3d~double run return fail
execute unless data storage egg:data/scale_3d-double <<scale~double run return fail

## Initialize fixed.
scoreboard players set #egg:data/scale_3d-double|x~fixed -- 0
scoreboard players set #egg:data/scale_3d-double|y~fixed -- 0
scoreboard players set #egg:data/scale_3d-double|z~fixed -- 0

## Get data.
execute store result score #egg:data/scale_3d-double|x~fixed -- run data get storage egg:data/scale_3d-double <<3d~double[0] 64
execute store result score #egg:data/scale_3d-double|y~fixed -- run data get storage egg:data/scale_3d-double <<3d~double[1] 64
execute store result score #egg:data/scale_3d-double|z~fixed -- run data get storage egg:data/scale_3d-double <<3d~double[2] 64
execute store result score #egg:data/scale_3d-double|scale~fixed -- run data get storage egg:data/scale_3d-double <<scale~double 64
## Correct data.
execute if score #egg|MAX~fixed -- < #egg:data/scale_3d-double|x~fixed -- run scoreboard players operation #egg:data/scale_3d-double|x~fixed -- = #egg|MAX~fixed --
execute if score #egg:data/scale_3d-double|x~fixed -- < #egg|MIN~fixed -- run scoreboard players operation #egg:data/scale_3d-double|x~fixed -- = #egg|MIN~fixed --
execute if score #egg|MAX~fixed -- < #egg:data/scale_3d-double|y~fixed -- run scoreboard players operation #egg:data/scale_3d-double|y~fixed -- = #egg|MAX~fixed --
execute if score #egg:data/scale_3d-double|y~fixed -- < #egg|MIN~fixed -- run scoreboard players operation #egg:data/scale_3d-double|y~fixed -- = #egg|MIN~fixed --
execute if score #egg|MAX~fixed -- < #egg:data/scale_3d-double|z~fixed -- run scoreboard players operation #egg:data/scale_3d-double|z~fixed -- = #egg|MAX~fixed --
execute if score #egg:data/scale_3d-double|z~fixed -- < #egg|MIN~fixed -- run scoreboard players operation #egg:data/scale_3d-double|z~fixed -- = #egg|MIN~fixed --
execute if score #egg|MAX~fixed -- < #egg:data/scale_3d-double|scale~fixed -- run scoreboard players operation #egg:data/scale_3d-double|scale~fixed -- = #egg|MAX~fixed --
execute if score #egg:data/scale_3d-double|scale~fixed -- < #egg|MIN~fixed -- run scoreboard players operation #egg:data/scale_3d-double|scale~fixed -- = #egg|MIN~fixed --
## Scale.
scoreboard players operation #egg:data/scale_3d-double|x~fixed -- *= #egg:data/scale_3d-double|scale~fixed --
scoreboard players operation #egg:data/scale_3d-double|y~fixed -- *= #egg:data/scale_3d-double|scale~fixed --
scoreboard players operation #egg:data/scale_3d-double|z~fixed -- *= #egg:data/scale_3d-double|scale~fixed --
## Initialize.
data modify storage egg:data/scale_3d-double >>3d~double set value [1.0e-307d,1.0e-307d,1.0e-307d]
## Set data.
execute unless score #egg:data/scale_3d-double|x~fixed -- matches 0 store result storage egg:data/scale_3d-double >>3d~double[0] double 0.00024414062 \
  run scoreboard players get #egg:data/scale_3d-double|x~fixed --
execute unless score #egg:data/scale_3d-double|y~fixed -- matches 0 store result storage egg:data/scale_3d-double >>3d~double[1] double 0.00024414062 \
  run scoreboard players get #egg:data/scale_3d-double|y~fixed --
execute unless score #egg:data/scale_3d-double|z~fixed -- matches 0 store result storage egg:data/scale_3d-double >>3d~double[2] double 0.00024414062 \
  run scoreboard players get #egg:data/scale_3d-double|z~fixed --

## Success.
return 1