execute as @e[type=minecraft:wolf,tag=egg.mob] run return run function egg:_mob/-/-update_wolf
execute as @e[type=minecraft:piglin,tag=egg.mob] run return run function egg:_mob/-/-update_target
execute as @e[type=minecraft:allay,tag=egg.mob] run return run function egg:_mob/-/-update_allay
execute as @e[type=minecraft:ocelot,tag=egg.mob] run return run function egg:_mob/-/-update_ocelot
execute as @e[type=minecraft:fox,tag=egg.mob] run return run function egg:_mob/-/-update_fox
execute as @e[type=#egg:mob/nocturnal,tag=egg.mob] run return run function egg:_mob/-/-update_nocturnal
execute as @e[type=#egg:mob/emotional,tag=egg.mob] run return run function egg:_mob/-/-update_target
execute as @e[type=#egg:mob/tameable,tag=egg.mob] run return run function egg:_mob/-/-update_tameable

## No change.
return 0