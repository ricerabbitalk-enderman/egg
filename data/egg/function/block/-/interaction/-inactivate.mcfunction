## Set position.
data modify entity @s Pos set from entity @s data.egg.block.interaction._position
teleport @s ~ ~0.0005 ~
## Set scoreboards.
execute store result score @s egg.block._cooltime run data get entity @s data.egg.block.interaction._cooltime
## Set data.
data modify entity @s width set value 0.999
data modify entity @s height set value 0.999
## Remove tags.
tag @s remove egg.block.interaction.active

## Success.
return 1