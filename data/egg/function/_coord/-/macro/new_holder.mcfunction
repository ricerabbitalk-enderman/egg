## New.
$summon minecraft:snowball 0.0 0.0 0.0 { \
  Tags:["egg.coord.holder","egg.coord.holder.$(group)","egg.coord.holder.$(group).$(name)","_uninitialized"], \
  NoGravity:true, \
  Invulnerable:true, \
  CustomName: {text:"egg.coord.holder.$(group).$(name)"}, \
  CustomNameVisible:false \
}
data modify storage egg:pointer/-set <<uuid set from storage egg:_coord/-/macro/new_holder <<uuid
execute as @e[x=0,y=0,z=0,type=minecraft:snowball,tag=_uninitialized] if function egg:pointer/-enable if function egg:pointer/-set \
  run data modify storage egg:_coord/-/macro/new_holder >>uuid set from entity @s UUID
tag @e[x=0,y=0,z=0,type=minecraft:snowball,tag=_uninitialized] remove _uninitialized

## Success.
return 1