## Get scale.
execute store result score #egg:shock|scale~fixed -- run data get storage egg:shock <<.scale 64

## Get additional motion.
execute store result score #egg:shock|xv~fixed -- run data get storage egg:shock <<.xv 64
execute store result score #egg:shock|yv~fixed -- run data get storage egg:shock <<.yv 64
execute store result score #egg:shock|zv~fixed -- run data get storage egg:shock <<.zv 64

## Set hypocenter.
function egg:shock/-/knockback/reset
function egg:shock/-/knockback/set_hypocenter

## Success.
return 1
