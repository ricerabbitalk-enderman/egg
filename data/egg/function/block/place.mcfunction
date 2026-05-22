#:module ja
#@text
#> `egg.block` アイテムデータからカスタムブロックを設置・管理する機能を提供します。。
#> `egg.block` アイテムデータには下記のデータコンポーネントが指定されている必要があります。
#@code json
#> "components": {
#>   "minecraft:item_name": "Custom Block",
#>   "minecraft:item_model": "xxx:yyyy",
#>   "minecraft:custom_data": {
#>     "egg": {
#>       "type": "block",
#>       "base": "shroomlight", // ベースタイプ (barrier, spawner, shroomlight)
#>       "setup": "xxx:yyyy/setup", // ブロック構築時の関数名
#>       "event": "xxx:yyyy/event", // 右クリックイベントのコールバック関数名
#>       "teardown": "xxx:yyyy/teardown" // ブロック解体時の関数名
#>     }
#>   },
#>   "blocks_attacks": {"damage_reductions": [{"base": 0, "factor": 0}]}
#> }
#:

#:function ja
#@in storage item egg.block アイテムデータ
#@return 処理の成否
#@text
#> `egg.block` アイテムデータからカスタムブロックを設置します。
#@code mcfunction
#> # コマンド実行者 `@s`の持っている右クリック可能なブロックアイテムを取得.
#> function egg:player/-block
#> # 足元に egg.block として設置
#> data modify storage egg:block/place <<item set from storage egg:player/-block >>item
#> function egg:block/place
#:

## Verify.
execute unless data storage egg:block/place <<item run return fail

## Check.
data modify storage egg:block/place type set from storage egg:block/place <<item.components."minecraft:custom_data".egg.type
execute store result score #egg:block/place|unmatched -- run data modify storage egg:block/place type set value block
execute unless score #egg:block/place|unmatched -- matches 0 run return fail

## Place.
#>barrier
data modify storage egg:block/place base set from storage egg:block/place <<item.components."minecraft:custom_data".egg.base
execute store result score #egg:block/place|unmatched -- run data modify storage egg:block/place base set value barrier
execute if score #egg:block/place|unmatched -- matches 0 align xyz positioned ~0.5 ~ ~0.5 run function egg:block/-/place_base_barrier
#>shroomlight
data modify storage egg:block/place base set from storage egg:block/place <<item.components."minecraft:custom_data".egg.base
execute store result score #egg:block/place|unmatched -- run data modify storage egg:block/place base set value shroomlight
execute if score #egg:block/place|unmatched -- matches 0 align xyz positioned ~0.5 ~ ~0.5 run function egg:block/-/place_base_shroomlight
#>spawner
data modify storage egg:block/place base set from storage egg:block/place <<item.components."minecraft:custom_data".egg.base
execute store result score #egg:block/place|unmatched -- run data modify storage egg:block/place base set value spawner
execute if score #egg:block/place|unmatched -- matches 0 align xyz positioned ~0.5 ~ ~0.5 run function egg:block/-/place_base_spawner

## Success.
return 1