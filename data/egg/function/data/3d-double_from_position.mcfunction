#:function ja
#@out storage 3d~double Pos から得られた安全な `[double, double, double]` データ
#@return 処理の成否 (常に 1)
#@text
#> コマンド実行者 `@s` の Pos (3D Double) データを取得します。
#@code mcfunction
#> # 0.0d 問題のある取得方法
#> data modify storage xxx:temp position set from entity @e[tag=target,limit=1] Pos
#>
#> # 0.0d 問題を回避する取得方法
#> execute as @e[tag=target,limit=1] run function egg:data/3d-double_from_position
#> data modify storage xxx:temp position set from storage egg:data/3d-double_from_position >>3d~double
#:

## Get data.
data modify storage egg:data/3d-double_from_position 3d~double set from entity @s Pos
## Initialize fixed.
scoreboard players set #egg:data/3d-double_from_position|x~check -- 0
scoreboard players set #egg:data/3d-double_from_position|y~check -- 0
scoreboard players set #egg:data/3d-double_from_position|z~check -- 0
## Get fixed.
execute store result score #egg:data/3d-double_from_position|x~check -- run data get storage egg:data/3d-double_from_position 3d~double[0] 64
execute store result score #egg:data/3d-double_from_position|y~check -- run data get storage egg:data/3d-double_from_position 3d~double[1] 64
execute store result score #egg:data/3d-double_from_position|z~check -- run data get storage egg:data/3d-double_from_position 3d~double[2] 64
## Get high fixed.
execute if score #egg:data/3d-double_from_position|x~check -- matches 0 store result score #egg:data/3d-double_from_position|x~check -- \
  run data get storage egg:data/3d-double_from_position 3d~double[0] 1073741824
execute if score #egg:data/3d-double_from_position|y~check -- matches 0 store result score #egg:data/3d-double_from_position|y~check -- \
  run data get storage egg:data/3d-double_from_position 3d~double[1] 1073741824
execute if score #egg:data/3d-double_from_position|z~check -- matches 0 store result score #egg:data/3d-double_from_position|z~check -- \
  run data get storage egg:data/3d-double_from_position 3d~double[2] 1073741824
## Initialize data.
data modify storage egg:data/3d-double_from_position >>3d~double set value [1.0e-307d,1.0e-307d,1.0e-307d]
## Set data.
execute unless score #egg:data/3d-double_from_position|x~check -- matches 0 \
  run data modify storage egg:data/3d-double_from_position >>3d~double[0] set from storage egg:data/3d-double_from_position 3d~double[0]
execute unless score #egg:data/3d-double_from_position|y~check -- matches 0 \
  run data modify storage egg:data/3d-double_from_position >>3d~double[1] set from storage egg:data/3d-double_from_position 3d~double[1]
execute unless score #egg:data/3d-double_from_position|z~check -- matches 0 \
  run data modify storage egg:data/3d-double_from_position >>3d~double[2] set from storage egg:data/3d-double_from_position 3d~double[2]
## Success.
return 1