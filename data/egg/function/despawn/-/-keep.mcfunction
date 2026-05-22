## Set scoreboards.
execute if score @s egg.despawn.life matches ..3 store result score @s egg.despawn.life run random value 4..6
## Add tags.
tag @s add egg.despawn.keep

## Success.
return 1