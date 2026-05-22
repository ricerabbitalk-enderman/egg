## Enable features of users.
execute as @a[tag=!egg.system] run function egg:_system/-/-enable
## Update features of users.
execute as @a[tag=egg.system] at @s unless function egg:_system/-/-update run function egg:_system/-/-disable

## Check coordinates.
execute \
  if score #egg:_coord|loaded -- matches 0 \
  if function egg:_coord/loaded \
  if function egg:_coord/_initialize \
    run say egg:_coord ready.

## Update sub modules.
function #egg:system/tick

## Revoke advancement trigger.
advancement revoke @a only egg:device
advancement revoke @a only egg:block

## Reset coordinates.
execute \
  unless score #egg:_coord|loaded -- matches 0 \
  in egg:_coord as @e[x=0,y=0,z=0,type=minecraft:snowball,tag=egg.coord.holder] on origin \
    run teleport @s 0.0 0.0 0.0 0.0 0.0

return 1