execute as @e[type=minecraft:item_display,tag=egg.block.view] at @s unless function egg:block/-/update run function egg:block/-/delete
execute at @a as @e[distance=..6,type=minecraft:interaction,tag=egg.block.interaction] at @s \
  run function egg:block/-/interaction/-update