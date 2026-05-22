## New.
$summon minecraft:text_display 0.0 0.0 0.0 { \
  Tags:["egg.coord","egg.coord.$(group)","egg.coord.$(group).$(name)","_uninitialized"], \
  CustomName: {text:"egg.coord.$(group).$(name)"}, \
  CustomNameVisible:false \
}
execute as @e[x=0,y=0,z=0,type=minecraft:text_display,tag=_uninitialized] \
  run data modify storage egg:_coord/-/macro/new_object >>uuid set from entity @s UUID
tag @e[x=0,y=0,z=0,type=minecraft:text_display,tag=_uninitialized] remove _uninitialized

## Success.
return 1