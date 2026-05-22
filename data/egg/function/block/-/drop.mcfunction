## Drop.
loot spawn ~ ~ ~ loot egg:block/drop
execute as @e[distance=..2,type=minecraft:item,nbt={Item:{id:"minecraft:knowledge_book",components:{"minecraft:custom_data":{egg:{type:"drop"}}}}},sort=nearest,limit=1] \
  run data modify entity @s Item set from storage egg:block/-/drop <<item

## Success.
return 1