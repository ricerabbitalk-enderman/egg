#:function ja
#@out storage item `egg.block` アイテム
#@return アイテム保持している手 `score #egg:player|(failure or mainhand or offhand) --`
#@text
#> プレイヤーが右クリック可能な手に持つ `egg.block` アイテムの情報を取得します。
#> 対象のアイテム保持がメインハンドかオフハンドかは戻り値で判断できます。
#@code mcfunction
#> # コマンド実行者 `@s`の持っている右クリック可能なブロックアイテムを取得.
#> function egg:player/-block
#> # 足元に egg.block として設置
#> data modify storage egg:block/place <<item set from storage egg:player/-block >>item
#> function egg:block/place
#:

## Cleanup.
data remove storage egg:player/-block >>item

## Verify.
execute unless entity @s[type=minecraft:player] run return run scoreboard players get #egg:player|failure --
execute unless entity @s[tag=egg.player] run return run scoreboard players get #egg:player|failure --

## Check hand.
scoreboard players operation #egg:player/-block|hand -- = #egg:player|not_found --
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{egg:{type:block}}] run scoreboard players operation #egg:player/-block|hand -- = #egg:player|mainhand --
execute if items entity @s weapon.offhand *[minecraft:custom_data~{egg:{type:block}}] run scoreboard players operation #egg:player/-block|hand -- = #egg:player|offhand --

## Get item data.
execute if score #egg:player/-block|hand -- = #egg:player|mainhand -- run data modify storage egg:player/-block >>item set from entity @s SelectedItem
execute if score #egg:player/-block|hand -- = #egg:player|mainhand -- run data modify storage egg:player/-block >>item set from entity @s Inventory[-106]

## Return.
return run scoreboard players get #egg:player/-block|hand --