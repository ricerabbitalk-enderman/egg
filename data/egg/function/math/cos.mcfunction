#:function ja
#@in storage degree~double 角度 (度数法)
#@out storage cos~double cos 値
#@return 処理の成否（外部座標ディメンションが利用できない場合は失敗する）
#@text
#> cos を取得します。
#> 外部座標ディメンション egg:_coord を使った技術のため、ワールド生成直後から利用可能になるまでラグがあります。
#> 読み込み直後から利用する際は関数の成否を必ず確認するようにしてください。
#@code mcfunction
#> # ランダムな角度（度数法）の cos を取得
#> execute store result storage egg:math/cos <<degree~double double 0.015625 run random value -11520..11520
#> execute unless function egg:math/cos run return fail
#> tellraw @a ["degree",":",{storage:"egg:math/cos",nbt:"<<degree~double"},",","cos",":",{storage:"egg:math/cos",nbt:">>cos~double"}]
#:

## Cleanup.
data remove storage egg:math/cos >>cos~double

## Verify.
execute unless function egg:_coord/loaded run return fail

## Get.
execute in egg:_coord positioned 0.0 0.0 0.0 rotated 0.0 0.0 run return run function egg:math/-/cos