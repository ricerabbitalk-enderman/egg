## Update on inactive. 
execute if score @s egg.key.sprint._previous matches 0.. run scoreboard players set @s egg.key.sprint._current 0
scoreboard players remove @s egg.key.sprint._current 1

## Success.
return 1