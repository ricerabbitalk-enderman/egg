#:function ja
#@in storage begin-3d~double 始点の `[double, double, double]` データ
#@in storage end-3d~double 終点の `[double, double, double]` データ
#@out storage 3d~double 終点ー始点の差分 `[double, double, double]` データ
#@return 処理の成否
#@text
#> 3D Double データ同士の差分（終点ー始点）を取ります。
#> 内部的に `~fixed` (1/64 精度) の固定小数点で演算されるため精度が落ちます。
#> 出力される 3D Double データは自動で安全なデータに変換されます。
#@code mcfunction
#> # 2つのエンティティの座標差分を取る
#> data modify storage egg:data/difference_3d-double <<begin-3d~double set from entity @e[tag=a,limit=1] Pos
#> data modify storage egg:data/difference_3d-double <<end-3d~double set from entity @e[tag=b,limit=1] Pos
#> function egg:data/difference_3d-double
#> data modify storage xxx:temp difference set from storage egg:data/difference_3d-double >>3d~double
#:

## Cleanup.
data remove storage egg:data/difference_3d-double >>3d~double

## Verify.
execute unless data storage egg:data/difference_3d-double <<begin-3d~double run return fail
execute unless data storage egg:data/difference_3d-double <<end-3d~double run return fail

## Get data.
execute store result score #egg:data/difference_3d-double|begin(x)~fixed -- run data get storage egg:data/difference_3d-double <<begin-3d~double[0] 64
execute store result score #egg:data/difference_3d-double|begin(y)~fixed -- run data get storage egg:data/difference_3d-double <<begin-3d~double[1] 64
execute store result score #egg:data/difference_3d-double|begin(z)~fixed -- run data get storage egg:data/difference_3d-double <<begin-3d~double[2] 64
execute store result score #egg:data/difference_3d-double|result(x)~fixed -- run data get storage egg:data/difference_3d-double <<end-3d~double[0] 64
execute store result score #egg:data/difference_3d-double|result(y)~fixed -- run data get storage egg:data/difference_3d-double <<end-3d~double[1] 64
execute store result score #egg:data/difference_3d-double|result(z)~fixed -- run data get storage egg:data/difference_3d-double <<end-3d~double[2] 64
scoreboard players operation #egg:data/difference_3d-double|result(x)~fixed -- -= #egg:data/difference_3d-double|begin(x)~fixed --
scoreboard players operation #egg:data/difference_3d-double|result(y)~fixed -- -= #egg:data/difference_3d-double|begin(y)~fixed --
scoreboard players operation #egg:data/difference_3d-double|result(z)~fixed -- -= #egg:data/difference_3d-double|begin(z)~fixed --
## Initialize.
data modify storage egg:data/difference_3d-double >>3d~double set value [1.0e-307d,1.0e-307d,1.0e-307d]
## Set data.
execute unless score #egg:data/difference_3d-double|result(x)~fixed -- matches 0 store result storage egg:data/difference_3d-double >>3d~double[0] double 0.015625 \
  run scoreboard players get #egg:data/difference_3d-double|result(x)~fixed --
execute unless score #egg:data/difference_3d-double|result(y)~fixed -- matches 0 store result storage egg:data/difference_3d-double >>3d~double[1] double 0.015625 \
  run scoreboard players get #egg:data/difference_3d-double|result(y)~fixed --
execute unless score #egg:data/difference_3d-double|result(z)~fixed -- matches 0 store result storage egg:data/difference_3d-double >>3d~double[2] double 0.015625 \
  run scoreboard players get #egg:data/difference_3d-double|result(z)~fixed --

## Success.
return 1