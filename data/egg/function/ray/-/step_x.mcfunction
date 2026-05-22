## B(x)
scoreboard players operation #egg:ray/cast.B(x)~fixed -- += #egg:ray/cast.step(x)~fixed --
## t(x)
scoreboard players operation #egg:ray/cast.t(x)~fixed -- += #egg:ray/cast.d(x)~fixed --
## Set face.
execute if score #egg:ray/cast.sgn(x) -- matches -1 store result storage egg:pack/call <<pack.data.face int 1 run scoreboard players get #egg:ray.face|east --
execute if score #egg:ray/cast.sgn(x) -- matches 1 store result storage egg:pack/call <<pack.data.face int 1 run scoreboard players get #egg:ray.face|west --
## Success.
return 1