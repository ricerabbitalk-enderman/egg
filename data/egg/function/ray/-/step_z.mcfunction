## B(z)
scoreboard players operation #egg:ray/cast.B(z)~fixed -- += #egg:ray/cast.step(z)~fixed --
## t(z)
scoreboard players operation #egg:ray/cast.t(z)~fixed -- += #egg:ray/cast.d(z)~fixed --
## Set face.
execute if score #egg:ray/cast.sgn(z) -- matches -1 store result storage egg:pack/call <<pack.data.face int 1 run scoreboard players get #egg:ray.face|south --
execute if score #egg:ray/cast.sgn(z) -- matches 1 store result storage egg:pack/call <<pack.data.face int 1 run scoreboard players get #egg:ray.face|north --
## Success.
return 1