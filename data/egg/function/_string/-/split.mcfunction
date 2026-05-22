## Split.
data modify storage egg:_string/-/macro/split range set value {begin:0}
execute store result storage egg:_string/-/macro/split range.end int 1 run scoreboard players get #egg:_string/-/loop_to_split|index --
data modify storage egg:_string/-/macro/split <<string set string storage egg:_string/-/loop_to_split string
function egg:_string/-/macro/split with storage egg:_string/-/macro/split range
## Add result.
data modify storage egg:_string/split >>list append from storage egg:_string/-/macro/split >>string

## Add empty string.
execute if score #egg:_string/-/loop_to_split|index -- matches 0 run return run data modify storage egg:_string/split >>list append value ""

## Correct index.
scoreboard players add #egg:_string/-/loop_to_split|index -- 1
## Split.
data modify storage egg:_string/-/macro/split range set value {}
execute store result storage egg:_string/-/macro/split range.begin int 1 run scoreboard players get #egg:_string/-/loop_to_split|index --
execute store result storage egg:_string/-/macro/split range.end int 1 run scoreboard players get #egg:_string/-/loop_to_split|count --
data modify storage egg:_string/-/macro/split <<string set string storage egg:_string/-/loop_to_split string
function egg:_string/-/macro/split with storage egg:_string/-/macro/split range
## Add result.
data modify storage egg:_string/split >>list append from storage egg:_string/-/macro/split >>string

## Success.
return 1