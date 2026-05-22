#:function ja
#@in storage degree~double 角度 (度数法)
#@out storage tan~double tan 値
#@return 処理の成否（外部座標ディメンションが利用できない場合は失敗する）
#@text
#> **この関数は精度に難があります**
#>
#> tan を取得します。
#> 外部座標ディメンション `egg:_coord` を使った技術のため、ワールド生成直後から利用可能になるまでラグがあります。
#> 読み込み直後から利用する際は関数の成否を必ず確認するようにしてください。
#@code mcfunction
#> # ランダムな角度（度数法）の tan を取得
#> execute store result storage egg:math/tan <<degree~double double 0.015625 run random value -11520..11520
#> execute unless function egg:math/tan run return fail
#> tellraw @a ["degree",":",{storage:"egg:math/tan",nbt:"<<degree~double"},",","tan",":",{storage:"egg:math/tan",nbt:">>tan~double"}]
#:

## Cleanup.
data remove storage egg:math/tan >>tan~double

## tan.
data modify storage egg:math/sin <<degree~double set from storage egg:math/tan <<degree~double
execute unless function egg:math/sin run return fail
## cos.
data modify storage egg:math/cos <<degree~double set from storage egg:math/tan <<degree~double
execute unless function egg:math/cos run return fail

## tan.
execute store result score #egg:math/tan|sin~fixed -- run data get storage egg:math/sin >>sin~double 64
execute store result score #egg:math/tan|cos~fixed -- run data get storage egg:math/cos >>cos~double 64
## Check cos = 0.
execute if score #egg:math/tan|cos~fixed -- matches 0 run return run data modify storage egg:math/tan >>tan~double set value 64.0

## 1/cos.
scoreboard players operation #egg:math/tan|1/cos~fixed -- = #egg|double~fixed --
scoreboard players operation #egg:math/tan|1/cos~fixed -- /= #egg:math/tan|cos~fixed --
## Check limit.
execute if score #egg|MAX~fixed -- < #egg:math/tan|1/cos~fixed -- run scoreboard players operation #egg:math/tan|1/cos~fixed -- = #egg|MAX~fixed --
execute if score #egg:math/tan|1/cos~fixed -- < #egg|MIN~fixed -- run scoreboard players operation #egg:math/tan|1/cos~fixed -- = #egg|MIN~fixed --

## Set data.
scoreboard players operation #egg:math/tan|tan~fixed -- = #egg:math/tan|sin~fixed --
execute store result storage egg:math/tan >>tan~double double 0.00024414062 run scoreboard players operation #egg:math/tan|tan~fixed -- *= #egg:math/tan|1/cos~fixed --

## Success.
return 1