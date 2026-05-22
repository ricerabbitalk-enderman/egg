## Update on active.
execute if score @s egg.key.sneak._previous matches ..0 run scoreboard players set @s egg.key.sneak._current 0
scoreboard players add @s egg.key.sneak._current 1

## Success.
return 1