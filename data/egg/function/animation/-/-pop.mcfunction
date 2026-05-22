## Check.
execute unless data entity @s data.egg.animation._timeline[-1] run return 0

## Pop.
data modify storage egg:model/-set_pose <<pose set from entity @s data.egg.animation._timeline[-1]
data remove entity @s data.egg.animation._timeline[-1]

## Save debug data.
#data modify entity @s data.egg.animation._debug.pose set from storage egg:model/-set_pose <<pose

## Success.
return 1