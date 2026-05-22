## Set point.
function egg:3d/-/reset

## Rotate origin.
execute \
  as @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_3d.x,limit=1] \
    run data modify entity @s Rotation set from storage egg:3d/motion_from_rotation <<rotation
## Move by unit.
execute \
  as @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_3d.x,limit=1] \
  rotated as @s \
  if function egg:3d/-/move_by_unit \
  if function egg:data/3d-double_from_position \
    run data modify storage egg:3d/motion_from_rotation >>motion set from storage egg:data/3d-double_from_position >>3d~double

## Success.
return 1