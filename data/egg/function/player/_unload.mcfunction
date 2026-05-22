## Disable.
execute as @a[tag=egg.player] run function egg:player/-/-disable

## Undefine scoreboards.
scoreboard objectives remove egg.player._cooltime

## Undefine constants.
scoreboard players reset #egg:player|not_found --
scoreboard players reset #egg:player|mainhand --
scoreboard players reset #egg:player|offhand --