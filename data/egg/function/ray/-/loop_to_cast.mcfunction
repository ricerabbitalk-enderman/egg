## Step.
function egg:ray/-/step

## Set pack.
data modify storage egg:pack/call <<pack.data.position set value [1.0e-307d,1.0e-307d,1.0e-307d]
execute unless score #egg:ray/cast.B(x)~fixed -- matches 0 store result storage egg:pack/call <<pack.data.position[0] double 0.015625 \
  run scoreboard players get #egg:ray/cast.B(x)~fixed --
execute unless score #egg:ray/cast.B(y)~fixed -- matches 0 store result storage egg:pack/call <<pack.data.position[1] double 0.015625 \
  run scoreboard players get #egg:ray/cast.B(y)~fixed --
execute unless score #egg:ray/cast.B(z)~fixed -- matches 0 store result storage egg:pack/call <<pack.data.position[2] double 0.015625 \
  run scoreboard players get #egg:ray/cast.B(z)~fixed --
## Set parameters.
execute store result storage egg:ray **.x double 0.015625 run scoreboard players get #egg:ray/cast.B(x)~fixed --
execute store result storage egg:ray **.y double 0.015625 run scoreboard players get #egg:ray/cast.B(y)~fixed --
execute store result storage egg:ray **.z double 0.015625 run scoreboard players get #egg:ray/cast.B(z)~fixed --
## Check.
execute store result score #egg:ray/-/loop_to_cast|result -- run function egg:ray/-/macro/check with storage egg:ray **
execute if score #egg:ray/-/loop_to_cast|result -- = #egg:ray.result|lost -- run return 0
execute unless score #egg:ray/-/loop_to_cast|result -- = #egg:ray.result|continue -- run return run scoreboard players get #egg:ray.result|result --

## Success.
return run function egg:ray/-/loop_to_cast