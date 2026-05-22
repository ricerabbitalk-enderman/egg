## Set point.
function egg:math/-/reset

## Set point x.
execute \
  as @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_math.x,limit=1] \
    run data modify entity @s Pos[2] set from storage egg:math/atan2 <<2d~double[0]
execute \
  as @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_math.x,limit=1] \
    run data modify entity @s Pos[0] set from storage egg:math/atan2 <<2d~double[1]
## Rotate origin to x.
execute \
  as @e[x=0,y=0,z=0,type=minecraft:snowball,tag=egg.coord.holder.egg_math.x,limit=1] on origin \
    run rotate @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_math.origin,limit=1] facing entity @s feet
## Set output data.
execute store result storage egg:math/atan2 >>atan~double double -1 \
  run data get entity @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_math.origin,limit=1] Rotation[0]

## Success.
return 1