## B(y)
scoreboard players operation #egg:ray/cast.B(y)~fixed -- += #egg:ray/cast.step(y)~fixed --
## t(y)
scoreboard players operation #egg:ray/cast.t(y)~fixed -- += #egg:ray/cast.d(y)~fixed --
## Set face.
execute if score #egg:ray/cast.sgn(y) -- matches -1 store result storage egg:pack/call <<pack.data.face int 1 run scoreboard players get #egg:ray.face|top --
execute if score #egg:ray/cast.sgn(y) -- matches 1 store result storage egg:pack/call <<pack.data.face int 1 run scoreboard players get #egg:ray.face|bottom --
## Success.
return 1