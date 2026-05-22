#:module ja
#@text
#> プレイヤー関連の機能を提供します。
#> 全てのプレイヤーは自動でこの機能が有効化されます。
#:

#:function ja
#@out storage position 目線の位置 `[double, double, double]` データ
#@return 処理の成否
#@text
#> プレイヤーの目線の位置を取得します。
#@code mcfunction
#> # 目線の位置をレイキャストの開始位置に設定
#> function egg:player/-eyes
#> data modify storage egg:ray/cast <<.position set from storage egg:player/-eyes >>position
#:

## Verify.
execute unless entity @s[type=minecraft:player] run return fail
execute unless entity @s[tag=egg.player] run return fail

## Get position.
function egg:data/3d-double_from_position
## Get y.
scoreboard players set #egg:player/-eyes|y~fixed -- 0
execute store result score #egg:player/-eyes|y~fixed -- run data get storage egg:data/3d-double_from_position >>3d~double[1] 64

## Sneaking.
execute if predicate egg:player/is_sneaking run scoreboard players add #egg:player/-eyes|y~fixed -- 81
## Flying.
execute if predicate egg:entity/is_fall_flying run scoreboard players add #egg:player/-eyes|y~fixed -- 27
## Swimming.
execute if predicate egg:player/is_swimming run scoreboard players add #egg:player/-eyes|y~fixed -- 26
## Standing.
execute \
  unless predicate egg:player/is_sneaking \
  unless predicate egg:entity/is_fall_flying \
  unless predicate egg:player/is_swimming \
    run scoreboard players add #egg:player/-eyes|y~fixed -- 104

## Correct position.
data modify storage egg:data/3d-double_from_position >>3d~double[1] set value 1.0e-307d
execute \
  unless score #egg:player/-eyes|y~fixed -- matches 0 \
  store result storage egg:data/3d-double_from_position >>3d~double[1] double 0.015625 \
    run scoreboard players get #egg:player/-eyes|y~fixed --

data modify storage egg:player/-eyes >>position set from storage egg:data/3d-double_from_position >>3d~double
## Success.
return 1