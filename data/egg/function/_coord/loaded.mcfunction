## Loaded.
execute unless score #egg:_coord|loaded -- matches 0 run return 1

## Load.
execute in egg:_coord if loaded 0 0 0 run return run scoreboard players set #egg:_coord|loaded -- 1

## Unloaded yet.
return 0