#:function ja
#@in storage degree~double 角度 (度数法)
#@out storage sin~double sin 値
#@return 処理の成否（外部座標ディメンションが利用できない場合は失敗する）
#@text
#> sin を取得します。
#> 外部座標ディメンション `egg:_coord` を使った技術のため、ワールド生成直後から利用可能になるまでラグがあります。
#> 読み込み直後から利用する際は関数の成否を必ず確認するようにしてください。
#@code mcfunction
#> # ランダムな角度（度数法）の sin を取得
#> execute store result storage egg:math/sin <<degree~double double 0.015625 run random value -11520..11520
#> execute unless function egg:math/sin run return fail
#> tellraw @a ["degree",":",{storage:"egg:math/sin",nbt:"<<degree~double"},",","sin",":",{storage:"egg:math/sin",nbt:">>sin~double"}]
#:

## Cleanup.
data remove storage egg:math/sin >>sin~double

## Verify.
execute unless function egg:_coord/loaded run return fail

## Get.
execute in egg:_coord positioned 0.0 0.0 0.0 rotated 0.0 0.0 run return run function egg:math/-/sin