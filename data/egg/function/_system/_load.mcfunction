## Define scoreboards.
# Command
scoreboard objectives add egg trigger

## Define team.
team add egg.object
team modify egg.object deathMessageVisibility never
team modify egg.object collisionRule never

## Setup data.
data modify storage egg:bdengine looks set value {}
data modify storage egg:bdengine animation set value {}
function #egg:bdengine/load

## Load nog.
function egg:_coord/_load

## Load sub modules.
function #egg:system/load

## Reset trigger.
execute as @a[tag=egg.system] run function egg:_system/-/-initialize