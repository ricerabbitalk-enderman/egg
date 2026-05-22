## Set point.
function egg:3d/-/reset

## Set point x.
execute \
  as @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_3d.x,limit=1] \
    run data modify entity @s Pos set from storage egg:3d/scalar <<3d~double
## Rotate origin to x.
execute \
  as @e[x=0,y=0,z=0,type=minecraft:snowball,tag=egg.coord.holder.egg_3d.x,limit=1] on origin \
    run rotate @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_3d.origin,limit=1] facing entity @s feet
## Get unit vector.
execute \
  at @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_3d.origin,limit=1] \
  as @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_3d.y,limit=1] \
  if function egg:3d/-/move_by_unit \
  if function egg:data/3d-double_from_position \
    run data modify storage egg:3d/scalar unit_3d~double set from storage egg:data/3d-double_from_position >>3d~double
## Get unit vector.
execute store result score #egg:3d/-/scalar|unit_x~fixed -- run data get storage egg:3d/scalar unit_3d~double[0] 64
scoreboard players operation #egg:math/abs|<<x -- = #egg:3d/-/scalar|unit_x~fixed --
execute store result score #egg:3d/-/scalar|abs_unit_x~fixed -- run function egg:math/abs
execute store result score #egg:3d/-/scalar|unit_y~fixed -- run data get storage egg:3d/scalar unit_3d~double[1] 64
scoreboard players operation #egg:math/abs|<<x -- = #egg:3d/-/scalar|unit_y~fixed --
execute store result score #egg:3d/-/scalar|abs_unit_y~fixed -- run function egg:math/abs
execute store result score #egg:3d/-/scalar|unit_z~fixed -- run data get storage egg:3d/scalar unit_3d~double[2] 64
scoreboard players operation #egg:math/abs|<<x -- = #egg:3d/-/scalar|unit_z~fixed --
execute store result score #egg:3d/-/scalar|abs_unit_z~fixed -- run function egg:math/abs
## Get vector.
execute store result score #egg:3d/-/scalar|x~fixed -- run data get storage egg:3d/scalar <<3d~double[0] 64
scoreboard players operation #egg:math/abs|<<x -- = #egg:3d/-/scalar|x~fixed --
execute store result score #egg:3d/-/scalar|abs_x~fixed -- run function egg:math/abs
execute store result score #egg:3d/-/scalar|y~fixed -- run data get storage egg:3d/scalar <<3d~double[1] 64
scoreboard players operation #egg:math/abs|<<x -- = #egg:3d/-/scalar|y~fixed --
execute store result score #egg:3d/-/scalar|abs_y~fixed -- run function egg:math/abs
execute store result score #egg:3d/-/scalar|z~fixed -- run data get storage egg:3d/scalar <<3d~double[2] 64
scoreboard players operation #egg:math/abs|<<x -- = #egg:3d/-/scalar|z~fixed --
execute store result score #egg:3d/-/scalar|abs_z~fixed -- run function egg:math/abs
## Get max.
scoreboard players operation #egg:3d/-/scalar|max~fixed -- = #egg:3d/-/scalar|abs_x~fixed --
scoreboard players operation #egg:3d/-/scalar|max~fixed -- > #egg:3d/-/scalar|abs_y~fixed --
scoreboard players operation #egg:3d/-/scalar|max~fixed -- > #egg:3d/-/scalar|abs_z~fixed --
## Get scalar.
scoreboard players operation #egg:3d/-/scalar|scalar~fixed -- = #egg:3d/-/scalar|max~fixed --
scoreboard players operation #egg:3d/-/scalar|scalar~fixed -- *= #egg|unit~fixed --
execute if score #egg:3d/-/scalar|max~fixed -- = #egg:3d/-/scalar|abs_x~fixed -- run scoreboard players operation #egg:3d/-/scalar|scalar~fixed -- /= #egg:3d/-/scalar|abs_unit_x~fixed --
execute if score #egg:3d/-/scalar|max~fixed -- = #egg:3d/-/scalar|abs_y~fixed -- run scoreboard players operation #egg:3d/-/scalar|scalar~fixed -- /= #egg:3d/-/scalar|abs_unit_y~fixed --
execute if score #egg:3d/-/scalar|max~fixed -- = #egg:3d/-/scalar|abs_z~fixed -- run scoreboard players operation #egg:3d/-/scalar|scalar~fixed -- /= #egg:3d/-/scalar|abs_unit_z~fixed --
execute store result storage egg:3d/scalar >>scalar~double double 0.015625 run scoreboard players get #egg:3d/-/scalar|scalar~fixed --

## Success.
return 1