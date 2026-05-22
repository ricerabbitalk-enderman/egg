#:function ja
#@in storage 3d~double `[double, double, double]` データ
#@out storage 3d~double 単位ベクトルの `[double, double, double]` データ
#@return 処理の成否（外部座標ディメンションが利用できない場合は失敗する）
#@text
#> 単位ベクトルを取得します。
#> 外部座標ディメンション `egg:_coord` を使った技術のため、ワールド生成直後から利用可能になるまでラグがあります。
#> 読み込み直後から利用する際は関数の成否を必ず確認するようにしてください。
#@code mcfunction
#> # コマンド実行者 `@s`の Motion の単位ベクトルを取得
#> data modify storage egg:3d/unit_vector <<3d~double set from entity @s Motion
#> execute unless function egg:3d/unit_vector run return fail
#> tellraw @a ["e = ",{storage:"egg:3d/unit_vector",nbt:">>3d~double"}]
#:

## Cleanup.
data remove storage egg:3d/unit_vector >>3d~double

## Verify.
execute unless function egg:_coord/loaded run return fail

## Calculate.
execute in egg:_coord positioned 0.0 0.0 0.0 rotated 0.0 0.0 run return run function egg:3d/-/unit_vector