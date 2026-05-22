## disable features of all players
execute as @a[tag=egg.input] run function egg:input/_-disable

## Undefine scoreboards.
# Current state
scoreboard objectives remove egg.input._current
# Previous state
scoreboard objectives remove egg.input._previous