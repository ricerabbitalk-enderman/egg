execute at @s if predicate egg:location/dim if score @s egg.alignment matches 0 run return run scoreboard players set @s egg.alignment -1
execute at @s unless predicate egg:location/dim unless score @s egg.alignment matches 0 run return run scoreboard players set @s egg.alignment 0

## No changea.
return 0