#:function ja
#@return メインハンドに持つアイテムの拡張 ID
#@text
#> メインハンドに持つアイテムの拡張 ID を取得します。
#:

## Verify.
execute unless entity @s[type=minecraft:player] run return fail
execute unless entity @s[tag=egg.input] run return fail

## Get Extended ID.
return run data get entity @s SelectedItem.components."minecraft:custom_data".egg.id