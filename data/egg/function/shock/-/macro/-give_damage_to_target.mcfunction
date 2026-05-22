## Damage by source.
$execute \
  as @e[distance=..$(distance),type=#egg:creature,team=!egg.object,tag=!egg.shock.source,tag=egg.shock.target] \
  if function #egg:preprocess/$(preprocess) \
    run damage @s $(amount) $(namespace):$(type) \
      by @e[x=$(source_x),y=$(source_y),z=$(source_z),dx=0,dy=0,dz=0,tag=egg.shock.source,limit=1]

## Success.
return 1