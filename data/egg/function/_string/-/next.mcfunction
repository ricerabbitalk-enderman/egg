## Check buffer length.
execute store result score #egg:_string/-/loop_to_split|length -- run data get storage egg:_string/-/loop_to_split buffer
execute if score #egg:_string/-/loop_to_split|length -- matches 0 run return 0

## Get character.
data modify storage egg:_string/-/loop_to_split char set string storage egg:_string/-/loop_to_split buffer -1
data modify storage egg:_string/-/loop_to_split buffer set string storage egg:_string/-/loop_to_split buffer 0 -1

## Update index (negative).
scoreboard players remove #egg:_string/-/loop_to_split|index -- 1

## Success.
return 1