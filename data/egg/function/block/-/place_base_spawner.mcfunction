## Set block.
setblock ~ ~ ~ minecraft:spawner

## Set block data.
data modify block ~ ~ ~ SpawnPotentials set value []
data modify block ~ ~ ~ MaxNearbyEntities set value 1
data modify block ~ ~ ~ RequiredPlayerRange set value 1

## New interaction.
data modify storage egg:block/-/interaction/new << set value {cooltime:45}
data modify storage egg:block/-/interaction/new <<.event set from storage egg:block/place <<item.components."minecraft:custom_data".egg.event
execute if data storage egg:block/-/interaction/new <<.event unless function egg:block/-/interaction/new run return fail

## New view.
data modify storage egg:block/-/view/new << set value {}
data modify storage egg:block/-/view/new <<.item set from storage egg:block/place <<item
data modify storage egg:block/-/view/new <<.interaction set from storage egg:block/-/interaction/new >>uuid
execute unless function egg:block/-/view/new run return fail
## Add tags.
data modify storage egg:uuid/match <<uuid set from storage egg:block/-/view/new >>uuid
execute as @e[distance=..0.1,type=minecraft:item_display,tag=egg.block.view] if function egg:uuid/match run tag @s add egg.block.base.spawner

## Sound.
playsound minecraft:block.spawner.place block @a ~ ~ ~

## Success.
return 1