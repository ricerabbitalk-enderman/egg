## disable features of all players
execute as @a[tag=egg.system] run function egg:_system/-/-disable

## Unload sub modules.
function #egg:system/unload

## Teardown nog.
function egg:_coord/_unload

## Teardown data.
data remove storage egg:bdengine looks
data remove storage egg:bdengine animation

## Undefine team.
team remove egg.object

## Undefine scoreboards
# Command.
scoreboard objectives remove egg