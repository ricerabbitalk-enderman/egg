execute if score @s egg.player._cooltime matches 1.. run return run scoreboard players remove @s egg.player._cooltime 1

scoreboard players set @s egg.player._cooltime 3

## Try place block.
data modify storage egg:ray/cast << set value { \
  distance: 5.0, \
  condition: unless, \
  namespace: minecraft, \
  tag: replaceable, \
  callback: "egg:player/-/pack/-place" \
}
function egg:player/-eyes
data modify storage egg:ray/cast <<.position set from storage egg:player/-eyes >>position
function egg:data/2d-float_from_rotation
data modify storage egg:ray/cast <<.rotation set from storage egg:data/2d-float_from_rotation >>rotation

return run function egg:ray/cast