## Get count.
execute store result score #egg:block/-/reduce|count -- run data get entity @s Item.count

## Delete.
execute if score #egg:block/-/reduce|count -- matches 1 run kill @s

## Reduce.
execute store result entity @s Item.count int 1 run scoreboard players remove #egg:block/-/reduce|count -- 1

## Success.
return 1