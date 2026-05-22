## Set position.
data modify entity @s Pos set from entity @s data.egg.block.interaction._position
teleport @s ~ ~-0.0005 ~
## Set data.
data modify entity @s width set value 1.001
data modify entity @s height set value 1.001
## Add tags.
tag @s add egg.block.interaction.active

## Success.
return 1