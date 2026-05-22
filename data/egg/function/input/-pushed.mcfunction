#:module ja
#@text
#> プレイヤーの右クリック入力関連の機能を提供します。
#> 右クリックの入力検知は下記のデータコンポーネントを持つアイテムを所持していることが条件になります。
#@code json
#> {
#>   "components": {
#>     "minecraft:blocks_attacks": {"damage_reductions": [{"base": 0,"factor": 0}]},
#>     "minecraft:custom_data": {"egg": {"type": "device"}}
#>   }
#> }
#@text
#> 上記のコンポーネントを持つアイテムはメインハンドかオフハンドに装備した段階で「拡張 ID」が設定されます。
#> 所持アイテムが F キーなどで切り替わったかどうかを調べるために利用できます。
#:

#:function ja
#@return 右クリック入力のティック数
#@text
#> 右クリックが押されているかどうかを取得します。
#> 押し続けられているティック数が戻り値になります。
#:

## Verify.
execute unless entity @s[type=minecraft:player] run return fail
execute unless entity @s[tag=egg.input] run return fail

## Pushed.
execute if score @s egg.input._current matches 0.. run return run scoreboard players get @s egg.input._current
## Not pushed.
return 0