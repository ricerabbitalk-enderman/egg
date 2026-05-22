## Setup.
execute if entity @s[tag=egg.block.view._uninitialized] run function egg:block/-/view/-setup

## Check base block.
execute if entity @s[tag=egg.block.base.barrier] unless block ~ ~ ~ minecraft:barrier run return 0
execute if entity @s[tag=egg.block.base.shroomlight] unless block ~ ~ ~ minecraft:shroomlight run return 0
execute if entity @s[tag=egg.block.base.spawner] unless block ~ ~ ~ minecraft:spawner run return 0

## Success.
return 1