## Update on inactive. 
execute if score @s egg.key.forward._previous matches 0.. run scoreboard players set @s egg.key.forward._current 0
scoreboard players remove @s egg.key.forward._current 1

## Success.
return 1