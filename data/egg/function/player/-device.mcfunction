#:function ja
#@out storage item `egg.device` アイテム
#@return アイテム保持している手 `score #egg:player|(failure or mainhand or offhand) --`
#@text
#> プレイヤーが右クリック可能な手に持つ `egg.device` アイテムの情報を取得します。
#> 対象のアイテム保持がメインハンドかオフハンドかは戻り値で判断できます。
#@code mcfunction
#> # コマンド実行者 @s の持っている右クリック可能なデバイスアイテムを取得.
#> function egg:player/-device
#> # egg.device の info フィールドに追加情報があるかどうか確認
#> execute if data storage egg:player/-device >>item.components.egg.info run say has extra information.
#:

## Cleanup.
data remove storage egg:player/-device >>item

## Verify.
execute unless entity @s[type=minecraft:player] run return run scoreboard players get #egg:player|failure --
execute unless entity @s[tag=egg.player] run return run scoreboard players get #egg:player|failure --

## Check hand.
scoreboard players operation #egg:player/-device|hand -- = #egg:player|not_found --
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{egg:{type:device}}] run scoreboard players operation #egg:player/-device|hand -- = #egg:player|mainhand --
execute if items entity @s weapon.offhand *[minecraft:custom_data~{egg:{type:device}}] run scoreboard players operation #egg:player/-device|hand -- = #egg:player|offhand --

## Get item data.
execute if score #egg:player/-device|hand -- = #egg:player|mainhand -- run data modify storage egg:player/-device >>item set from entity @s SelectedItem
execute if score #egg:player/-device|hand -- = #egg:player|mainhand -- run data modify storage egg:player/-device >>item set from entity @s Inventory[-106]

## Return.
return run scoreboard players get #egg:player/-device|hand --