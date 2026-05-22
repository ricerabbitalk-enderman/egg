## t(min)
scoreboard players operation #egg:ray/cast|t(min)~fixed -- = #egg:ray/cast.t(x)~fixed --
scoreboard players operation #egg:ray/cast|t(min)~fixed -- < #egg:ray/cast.t(y)~fixed --
scoreboard players operation #egg:ray/cast|t(min)~fixed -- < #egg:ray/cast.t(z)~fixed --

## Step.
execute if score #egg:ray/cast|t(min)~fixed -- = #egg:ray/cast.t(x)~fixed -- run return run function egg:ray/-/step_x
execute if score #egg:ray/cast|t(min)~fixed -- = #egg:ray/cast.t(y)~fixed -- run return run function egg:ray/-/step_y
execute if score #egg:ray/cast|t(min)~fixed -- = #egg:ray/cast.t(z)~fixed -- run return run function egg:ray/-/step_z

## Error.
return fail