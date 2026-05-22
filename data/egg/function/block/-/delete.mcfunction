## Remove base block item.
execute if entity @s[tag=egg.block.base.barrier] as @e[distance=..2,type=minecraft:item,nbt={Item:{id:"minecraft:barrier"}},sort=nearest,limit=1] run function egg:block/-/reduce
execute if entity @s[tag=egg.block.base.shroomlight] as @e[distance=..2,type=minecraft:item,nbt={Item:{id:"minecraft:shroomlight"}},sort=nearest,limit=1] run function egg:block/-/reduce
execute if entity @s[tag=egg.block.base.spawner] as @e[distance=..2,type=minecraft:item,nbt={Item:{id:"minecraft:spawner"}},sort=nearest,limit=1] run function egg:block/-/reduce

## Drop.
data modify storage egg:block/-/drop <<item set from entity @s data.egg.block.view._item
function egg:block/-/drop

## Delete orbs.
execute if entity @s[tag=egg.block.base.spawner] positioned ~ ~0.5 ~ as @e[distance=..0.5,type=minecraft:experience_orb] run kill @s

## Delete interaction.
data modify storage egg:uuid/match <<uuid set from entity @s data.egg.block.view._interaction
execute as @e[distance=..0.1,type=minecraft:interaction,tag=egg.block.interaction] if function egg:uuid/match run kill @s
## Delete view.
execute if function egg:block/-/view/-teardown run kill @s

## Success.
return 1