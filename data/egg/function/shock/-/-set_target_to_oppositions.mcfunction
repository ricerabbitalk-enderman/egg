execute on origin store result score #egg:shock/-/-set_target_to_oppositions|alignment -- run scoreboard players get @s egg.alignment

execute if score #egg:shock/-/-set_target_to_oppositions|alignment -- matches 1 run data modify storage egg:shock <<.alignment_min set value -1
execute if score #egg:shock/-/-set_target_to_oppositions|alignment -- matches 1 run data modify storage egg:shock <<.alignment_max set value -1
execute if score #egg:shock/-/-set_target_to_oppositions|alignment -- matches 0 run data modify storage egg:shock <<.alignment_min set value -1
execute if score #egg:shock/-/-set_target_to_oppositions|alignment -- matches 0 run data modify storage egg:shock <<.alignment_max set value 1
execute if score #egg:shock/-/-set_target_to_oppositions|alignment -- matches -1 run data modify storage egg:shock <<.alignment_min set value 1
execute if score #egg:shock/-/-set_target_to_oppositions|alignment -- matches -1 run data modify storage egg:shock <<.alignment_max set value 1

## Success.
return 1