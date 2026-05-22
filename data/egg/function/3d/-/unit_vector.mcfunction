## Set point.
function egg:3d/-/reset

## Set vector x.
execute \
  as @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_3d.x,limit=1] \
    run data modify entity @s Pos set from storage egg:3d/unit_vector <<3d~double
## Rotate to x.
execute \
  as @e[x=0,y=0,z=0,type=minecraft:snowball,tag=egg.coord.holder.egg_3d.x,limit=1] on origin \
    run rotate @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_3d.origin,limit=1] facing entity @s feet
## Move to unit.
execute \
  at @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_3d.origin,limit=1] \
  as @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_3d.y,limit=1] \
  if function egg:3d/-/move_by_unit \
  if function egg:data/3d-double_from_position \
    run data modify storage egg:3d/unit_vector >>3d~double set from storage egg:data/3d-double_from_position >>3d~double

## Success.
return 1