#:function ja
#@return オフハンドに持つアイテムの拡張 ID
#@text
#> オフハンドに持つアイテムの拡張 ID を取得します。
#:

## Verify.
execute unless entity @s[type=minecraft:player] run return fail
execute unless entity @s[tag=egg.input] run return fail

## Get Extended ID.
return run data get entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".egg.id