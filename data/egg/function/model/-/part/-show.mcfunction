## Set look.
execute if entity @s[type=minecraft:block_display] run data modify entity @s block_state set from storage egg:model/-/part/-show <<look.block_state
execute if entity @s[type=minecraft:item_display] run data modify entity @s item set from storage egg:model/-/part/-show <<look.item
execute if entity @s[type=minecraft:text_display] run data modify entity @s text set from storage egg:model/-/part/-show <<look.text

## Success.
return 1