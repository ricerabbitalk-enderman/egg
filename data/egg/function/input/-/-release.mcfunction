## Update on inactive. 
execute if score @s egg.input._previous matches 0.. run scoreboard players set @s egg.input._current 0
scoreboard players remove @s egg.input._current 1

## Success.
return 1