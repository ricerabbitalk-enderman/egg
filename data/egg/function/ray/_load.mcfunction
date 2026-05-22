## Define Result.
# Continue
scoreboard players set #egg:ray.result|continue -- 0
# Detected
scoreboard players set #egg:ray.result|detected -- 1
# Lost
scoreboard players operation #egg:ray.result|lost -- = #egg|MIN --

## Define Face.
# Inside
scoreboard players set #egg:ray.face|inside -- 0
# North
scoreboard players set #egg:ray.face|north -- 1
# South
scoreboard players set #egg:ray.face|south -- 2
# East
scoreboard players set #egg:ray.face|east -- 3
# West
scoreboard players set #egg:ray.face|west -- 4
# Top
scoreboard players set #egg:ray.face|top -- 5
# Bottom
scoreboard players set #egg:ray.face|bottom -- 6