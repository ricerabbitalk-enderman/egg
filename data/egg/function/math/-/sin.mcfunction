## Set point.
function egg:math/-/reset

## Rotate x.
execute \
  as @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_math.x,limit=1] \
    run data modify entity @s Rotation[0] set from storage egg:math/sin <<degree~double
## Get sin and cos.
execute \
  as @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_math.x,limit=1] at @s \
    run teleport @s ^ ^ ^-1.0 ~ ~
execute \
  as @e[x=0,y=0,z=0,type=minecraft:snowball,tag=egg.coord.holder.egg_math.x,limit=1] on origin \
    run function egg:data/3d-double_from_position

## Set output data.
data modify storage egg:math/sin >>sin~double set from storage egg:data/3d-double_from_position >>3d~double[0]

## Success.
return 1