#:function ja
#@in storage rotateion Rotation データ
#@out storage motion Motion データ
#@return 処理の成否（外部座標ディメンションが利用できない場合は失敗する）
#@text
#> `Rotation` （角度）から `Motion` （単位ベクトル）を取得します。
#> 外部座標ディメンション `egg:_coord` を使った技術のため、ワールド生成直後から利用可能になるまでラグがあります。
#> 読み込み直後から利用する際は関数の成否を必ず確認するようにしてください。
#@code mcfunction
#> # コマンド実行者 `@s`の Rotation から Motion を取得
#> data modify storage egg:3d/motion_from_rotation <<rotation set from entity @s Rotation
#> execute unless function egg:3d/motion_from_rotation run return fail
#>
#> # 雪玉を Motion の方向に投擲.
#> execute summon minecraft:snowball run data modify entity @s Motion set from storage egg:3d/motion_from_rotation >>motion
#:

## Cleanup.
data remove storage egg:3d/motion_from_rotation >>motion

## Verify.
execute unless function egg:_coord/loaded run return fail

## Calculate
execute in egg:_coord positioned 0.0 0.0 0.0 rotated 0.0 0.0 run return run function egg:3d/-/motion_from_rotation