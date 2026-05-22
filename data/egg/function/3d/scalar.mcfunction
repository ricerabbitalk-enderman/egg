#:function ja
#@in storage 3d~double `[double, double, double]` データ
#@out storage scalar~double ベクトルのスカラー値
#@return 処理の成否（外部座標ディメンションが利用できない場合は失敗する）
#@text
#> **この関数は精度に難があります**
#>
#> ベクトルからスカラーを取得します。
#> 内部的に `~fixed` (1/64 精度) の固定小数点で演算されるため精度が落ちます。
#> 外部座標ディメンション `egg:_coord` を使った技術のため、ワールド生成直後から利用可能になるまでラグがあります。
#> 読み込み直後から利用する際は関数の成否を必ず確認するようにしてください。
#@code mcfunction
#> # コマンド実行者 `@s`の Motion の大きさを取得
#> data modify storage egg:3d/scalar <<3d~double set from entity @s Motion
#> execute unless function egg:3d/scalar run return fail
#> tellraw @a ["|vector| = ",{storage:"egg:3d/scalar",nbt:">>scalar~double"}]
#:

## Cleanup.
data remove storage egg:3d/scalar >>scalar~double

## Verify.
execute unless function egg:_coord/loaded run return fail

## Calculate.
execute in egg:_coord positioned 0.0 0.0 0.0 rotated 0.0 0.0 run return run function egg:3d/-/scalar