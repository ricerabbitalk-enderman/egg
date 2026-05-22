## Reset coordinates.
execute \
  unless score #egg:_coord|loaded -- matches 0 \
  in egg:_coord as @e[x=0,y=0,z=0,type=minecraft:snowball,tag=egg.coord.holder.egg_3d] on origin \
    run teleport @s 0.0 0.0 0.0 0.0 0.0

## Success.
return 1