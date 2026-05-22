## Break.
execute if score #egg:math/-/loop_to_asin|step~fixed -- matches 0 \
  run return run scoreboard players get #egg:math/-/loop_to_asin|degree~fixed --
## Check.
scoreboard players operation #egg:math/-/loop_to_asin|x_difference~fixed -- = #egg:math/-/loop_to_asin|x_target~fixed --
scoreboard players operation #egg:math/-/loop_to_asin|x_difference~fixed -- -= #egg:math/-/loop_to_asin|x~fixed --
execute if score #egg:math/-/loop_to_asin|x_difference~fixed -- matches 0 \
  run return run scoreboard players get #egg:math/-/loop_to_asin|degree~fixed --
## Next degree.
execute if score #egg:math/-/loop_to_asin|x_difference~fixed -- matches ..-1 \
  run scoreboard players operation #egg:math/-/loop_to_asin|degree~fixed -- += #egg:math/-/loop_to_asin|step~fixed --
execute if score #egg:math/-/loop_to_asin|x_difference~fixed -- matches 1.. \
  run scoreboard players operation #egg:math/-/loop_to_asin|degree~fixed -- -= #egg:math/-/loop_to_asin|step~fixed --
## Next x.
execute \
  as @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_math.origin,limit=1] \
  store result entity @s Rotation[1] float 0.015625 \
    run scoreboard players get #egg:math/-/loop_to_asin|degree~fixed --
execute \
  at @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_math.origin,limit=1] \
  as @e[x=0,y=0,z=0,type=minecraft:snowball,tag=egg.coord.holder.egg_math.x,limit=1] on origin \
    run teleport @s ^ ^ ^1.0 ~ ~
execute store result score #egg:math/-/loop_to_asin|x~fixed -- \
  as @e[x=0,y=0,z=0,type=minecraft:snowball,tag=egg.coord.holder.egg_math.x,limit=1] on origin \
    run data get entity @s Pos[1] 64
## Next step.
scoreboard players operation #egg:math/-/loop_to_asin|step~fixed -- /= #egg|2 --
return run function egg:math/-/loop_to_asin