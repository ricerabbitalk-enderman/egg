scoreboard players set #egg:soul/_load|leak_shells -- 0
execute as @e[tag=egg.depend.vehicle,tag=egg.shell] if function egg:shell/-delete run scoreboard players add #egg:soul/_load|leak_shells -- 1
execute if score #egg:soul/_load|leak_shells -- matches 1.. run tellraw @a ["Leaking shells detected!", {score:{name:"#egg:soul/_load|leak_shells",objective:"--"}}]

scoreboard players set #egg:soul/_load|leak_brains -- 0
execute as @e[tag=egg.depend.vehicle,tag=egg.brain] if function egg:brain/-delete run scoreboard players add #egg:soul/_load|leak_brains -- 1
execute if score #egg:soul/_load|leak_brains -- matches 1.. run tellraw @a ["Leaking brains detected!", {score:{name:"#egg:soul/_load|leak_brains",objective:"--"}}]

scoreboard players set #egg:soul/_load|leak_dummies -- 0
execute as @e[tag=egg.depend.vehicle,tag=egg.soul.wolf.dummy] if function egg:soul/-/wolf/dummy/-delete run scoreboard players add #egg:soul/_load|leak_dummies -- 1
execute if score #egg:soul/_load|leak_dummies -- matches 1.. run tellraw @a ["Leaking dummies detected!", {score:{name:"#egg:soul/_load|leak_dummies",objective:"--"}}]

scoreboard players set #egg:soul/_load|leak_holders -- 0
execute as @e[tag=egg.depend.vehicle,tag=egg.soul.holder] if function egg:soul/holder/-delete run scoreboard players add #egg:soul/_load|leak_holders -- 1
execute if score #egg:soul/_load|leak_holders -- matches 1.. run tellraw @a ["Leaking holders detected!", {score:{name:"#egg:soul/_load|leak_holders",objective:"--"}}]