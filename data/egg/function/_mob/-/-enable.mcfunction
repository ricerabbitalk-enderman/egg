## Hostile.
scoreboard players set @s[type=#egg:mob/hostile] egg.alignment -1
## Newtral.
scoreboard players set @s[type=#egg:mob/newtral] egg.alignment 0
## Passive.
scoreboard players set @s[type=#egg:mob/passive] egg.alignment 1
## Add tags.
tag @s add egg.mob

## Success.
return 1