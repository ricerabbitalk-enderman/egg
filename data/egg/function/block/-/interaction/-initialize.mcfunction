## Get position.
function egg:data/3d-double_from_position

## Set scoreboards.
scoreboard players set @s egg.block._cooltime 0
## Set data.
data modify entity @s data set value {egg:{block:{interaction:{}}}}
data modify entity @s data.egg.block.interaction._event set from storage egg:block/-/interaction/-initialize <<.event
data modify entity @s data.egg.block.interaction._cooltime set from storage egg:block/-/interaction/-initialize <<.cooltime
data modify entity @s data.egg.block.interaction._position set from storage egg:data/3d-double_from_position >>3d~double
## Add tags.
tag @s add egg.block.interaction

## Success.
return 1