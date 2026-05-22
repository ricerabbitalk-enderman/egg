## Set count.
data modify storage egg:block/-/view/-initialize <<.item.count set value 1

## Set data.
data modify entity @s data.egg.block.view._item set from storage egg:block/-/view/-initialize <<.item
data modify entity @s data.egg.block.view._interaction set from storage egg:block/-/view/-initialize <<.interaction
data modify entity @s item.components."minecraft:item_model" set from storage egg:block/-/view/-initialize <<.item.components."minecraft:item_model"
## Remove tags.
tag @s remove _uninitialized
## Add tags.
tag @s add egg.block.view._uninitialized

## Success.
return 1