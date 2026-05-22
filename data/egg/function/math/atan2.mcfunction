#:function ja
#@in storage 2d~double [double, double] データ
#@out storage atan~double atan 値 (度数法)
#@return 処理の成否（外部座標ディメンションが利用できない場合は失敗する）
#@text
#> 360度対応の atan を取得します。
#> 外部座標ディメンション egg:_coord を使った技術のため、ワールド生成直後から利用可能になるまでラグがあります。
#> 読み込み直後から利用する際は関数の成否を必ず確認するようにしてください。
#@code mcfunction
#> # ランダムな x, z の atan を取得
#> data modify storage egg:math/atan2 <<2d~double set value [1.0e-307d,1.0e-307d]
#> execute store result storage egg:math/atan2 <<2d~double[0] double 0.015625 run random value -1024..1024
#> execute store result storage egg:math/atan2 <<2d~double[1] double 0.015625 run random value -1024..1024
#> execute unless function egg:math/atan2 run return fail
#> tellraw @a ["2d",":",{storage:"egg:math/atan2",nbt:"<<2d~double"},",","atan",":",{storage:"egg:math/atan2",nbt:">>atan~double"}]
#:

## Cleanup.
data remove storage egg:math/atan2 >>atan~double

## Verify.
execute unless function egg:_coord/loaded run return fail

## Get.
execute in egg:_coord positioned 0.0 0.0 0.0 rotated 0.0 0.0 run return run function egg:math/-/atan2