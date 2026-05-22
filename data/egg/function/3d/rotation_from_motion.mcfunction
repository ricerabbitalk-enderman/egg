#:function ja
#@in storage motion Motion データ
#@out storage rotateion Rotation データ
#@return 処理の成否（外部座標ディメンションが利用できない場合は失敗する）
#@text
#> Motion （単位ベクトル）から Rotation （角度）を取得します。
#> 外部座標ディメンション egg:_coord を使った技術のため、ワールド生成直後から利用可能になるまでラグがあります。
#> 読み込み直後から利用する際は関数の成否を必ず確認するようにしてください。
#@code mcfunction
#> # コマンド実行者 `@s`の Motion から Rotation を取得
#> data modify storage egg:3d/rotation_from_motion <<motion set from entity @s Motion
#> execute unless function egg:3d/rotation_from_motion run return fail
#>
#> # コマンド実行者 `@s`の向きを Rotation に設定（矢の角度を進行方向から設定するなどの処理）
#> data modify entity @s Rotation set from storage egg:3d/rotation_from_motion >>rotation
#:

## Cleanup.
data remove storage egg:3d/rotation_from_motion >>rotation

## Verify.
execute unless function egg:_coord/loaded run return fail

## Calculate.
execute in egg:_coord positioned 0.0 0.0 0.0 rotated 0.0 0.0 run return run function egg:3d/-/rotation_from_motion