## Reset loaded.
scoreboard players set #egg:_coord|loaded -- 0
## Force load request.
execute in egg:_coord positioned 0.0 0.0 0.0 run forceload add 0 0 0 0

## Success.
return 1