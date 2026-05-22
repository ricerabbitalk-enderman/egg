## Update on active.
execute if score @s egg.key.right._previous matches ..0 run scoreboard players set @s egg.key.right._current 0
scoreboard players add @s egg.key.right._current 1

## Success.
return 1