## Get position.
function egg:data/3d-double_from_position

## Get fixed.
scoreboard players set #egg:shock|x~fixed -- 0
scoreboard players set #egg:shock|y~fixed -- 0
scoreboard players set #egg:shock|z~fixed -- 0
execute store result score #egg:shock|x~fixed -- run data get storage egg:data/3d-double_from_position >>3d~double[0] 64
execute store result score #egg:shock|y~fixed -- run data get storage egg:data/3d-double_from_position >>3d~double[1] 64
execute store result score #egg:shock|z~fixed -- run data get storage egg:data/3d-double_from_position >>3d~double[2] 64