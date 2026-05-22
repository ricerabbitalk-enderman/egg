## Set scoreboards.
scoreboard players remove @s egg.despawn.life 1
## Add tags.
execute if score @s egg.despawn.life matches 1.. run tag @s add egg.despawn.keep

## Success.
return 1