function egg:shock/-/knockback/-/move_y_at_self
function egg:shock/-/knockback/-/rotate_origin_from_x_facing_y
function egg:shock/-/knockback/-/move_z_from_origin_to_unit_distance
function egg:shock/-/knockback/-/move_w_here

## Get rate.
execute store result score #egg:shock|x~fixed@from_x -- run function egg:shock/-/knockback/-/get_coordinate_x_from_x
execute store result score #egg:shock|x~fixed@from_y -- run function egg:shock/-/knockback/-/get_coordinate_x_from_y
execute store result score #egg:shock|x~fixed@from_w -- run function egg:shock/-/knockback/-/get_coordinate_x_from_w
scoreboard players operation #egg:shock|x_length~fixed -- = #egg:shock|x~fixed@from_y --
scoreboard players operation #egg:shock|x_length~fixed -- -= #egg:shock|x~fixed@from_x --
scoreboard players operation #egg:shock|x_limit_length~fixed -- = #egg:shock|x~fixed@from_w --
scoreboard players operation #egg:shock|x_limit_length~fixed -- -= #egg:shock|x~fixed@from_x --
scoreboard players operation #egg:shock|rate~fixed -- = #egg:shock|x_limit_length~fixed --
scoreboard players operation #egg:shock|rate~fixed -- -= #egg:shock|x_length~fixed --
scoreboard players operation #egg:shock|rate~fixed -- *= #egg|unit~fixed --
scoreboard players operation #egg:shock|rate~fixed -- /= #egg:shock|x_limit_length~fixed --

## Get unit vector.
function egg:shock/-/knockback/-/get_coordinate_at_z

## Add v.
scoreboard players operation #egg:shock|x~fixed -- += #egg:shock|xv~fixed --
scoreboard players operation #egg:shock|y~fixed -- += #egg:shock|yv~fixed --
scoreboard players operation #egg:shock|z~fixed -- += #egg:shock|zv~fixed --

## Set rate.
scoreboard players operation #egg:shock|x~fixed -- *= #egg:shock|rate~fixed --
scoreboard players operation #egg:shock|y~fixed -- *= #egg:shock|rate~fixed --
scoreboard players operation #egg:shock|z~fixed -- *= #egg:shock|rate~fixed --
scoreboard players operation #egg:shock|x~fixed -- /= #egg|unit~fixed --
scoreboard players operation #egg:shock|y~fixed -- /= #egg|unit~fixed --
scoreboard players operation #egg:shock|z~fixed -- /= #egg|unit~fixed --

## Set scale and set knockback.
data modify storage egg:shock knockback set value [1.0e-307d,1.0e-307d,1.0e-307d]
execute unless score #egg:shock|x~fixed -- matches 0 store result storage egg:shock knockback[0] double 0.00024414062 \
  run scoreboard players operation #egg:shock|x~fixed -- *= #egg:shock|scale~fixed --
execute unless score #egg:shock|y~fixed -- matches 0 store result storage egg:shock knockback[1] double 0.00024414062 \
  run scoreboard players operation #egg:shock|y~fixed -- *= #egg:shock|scale~fixed --
execute unless score #egg:shock|z~fixed -- matches 0 store result storage egg:shock knockback[2] double 0.00024414062 \
  run scoreboard players operation #egg:shock|z~fixed -- *= #egg:shock|scale~fixed --