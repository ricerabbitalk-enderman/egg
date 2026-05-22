## Set point.
function egg:3d/-/reset

## Set vector x.
execute \
  as @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_3d.x,limit=1] \
    run data modify entity @s Pos set from storage egg:3d/rotation_from_motion <<motion
## Rotate to x.
execute \
  as @e[x=0,y=0,z=0,type=minecraft:snowball,tag=egg.coord.holder.egg_3d.x,limit=1] on origin \
    run rotate @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_3d.origin,limit=1] facing entity @s feet
## Get rotation.
execute as @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_3d.origin,limit=1] \
  if function egg:data/2d-float_from_rotation \
    run data modify storage egg:3d/rotation_from_motion >>rotation set from storage egg:data/2d-float_from_rotation >>2d~float

## Success.
return 1