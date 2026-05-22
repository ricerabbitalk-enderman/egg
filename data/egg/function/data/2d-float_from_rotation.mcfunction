#:module ja
#@text
#> ストレージデータを安全に扱う機能を提供します。
#>
#> `Pos`, `Motion`, `Rotation` のような実数配列データはストレージに記録される時点で最適化され `0.0f`, `0.0d` が削除されます。
#> 穴の開いた実数配列ストレージデータは再度エンティティの `Pos`, `Motion`, `Rotation` にコピーする際に問題になります。
#> ストレージに安全にこれらのデータを保存するために `egg:data` は全ての `0.0f`, `0.0d` を最適化されない十分小さい値
#> `1.0e-37f`, `1.0e-307d` に差し替えて問題を回避を試みています。
#:

#:function ja
#@out storage 2d~float Rotation から得られた安全な `[float, float]` データ
#@return 処理の成否 (常に 1)
#@text
#> コマンド実行者 `@s` の Rotation (2D Float) データを取得します。
#@code mcfunction
#> # 0.0f 問題のある取得方法
#> data modify storage xxx:temp rotation set from entity @e[tag=target,limit=1] Rotation
#>
#> # 0.0f 問題を回避する取得方法
#> execute as @e[tag=target,limit=1] run function egg:data/2d-float_from_rotation
#> data modify storage xxx:temp rotation set from storage egg:data/2d-float_from_rotation >>2d~float
#:

## Get data.
data modify storage egg:data/2d-float_from_rotation 2d~float set from entity @s Rotation

## Initialize fixed.
scoreboard players set #egg:data/2d-float_from_rotation|x~check -- 0
scoreboard players set #egg:data/2d-float_from_rotation|y~check -- 0
## Get fixed.
execute store result score #egg:data/2d-float_from_rotation|x~check -- run data get storage egg:data/2d-float_from_rotation 2d~float[0] 64
execute store result score #egg:data/2d-float_from_rotation|y~check -- run data get storage egg:data/2d-float_from_rotation 2d~float[1] 64
## Get high fixed.
execute if score #egg:data/2d-float_from_rotation|x~check -- matches 0 store result score #egg:data/2d-float_from_rotation|x~check -- \
  run data get storage egg:data/2d-float_from_rotation 2d~float[0] 1073741824
execute if score #egg:data/2d-float_from_rotation|y~check -- matches 0 store result score #egg:data/2d-float_from_rotation|y~check -- \
  run data get storage egg:data/2d-float_from_rotation 2d~float[1] 1073741824
## Initialize data.
data modify storage egg:data/2d-float_from_rotation >>2d~float set value [1.0e-37f,1.0e-37f]
## Set data.
execute unless score #egg:data/2d-float_from_rotation|x~check -- matches 0 \
  run data modify storage egg:data/2d-float_from_rotation >>2d~float[0] set from storage egg:data/2d-float_from_rotation 2d~float[0]
execute unless score #egg:data/2d-float_from_rotation|y~check -- matches 0 \
  run data modify storage egg:data/2d-float_from_rotation >>2d~float[1] set from storage egg:data/2d-float_from_rotation 2d~float[1]
## Success.
return 1