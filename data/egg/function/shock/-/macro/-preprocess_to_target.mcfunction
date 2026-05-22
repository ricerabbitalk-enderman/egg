## Damage by source.
$execute \
  as @e[distance=..$(distance),type=#egg:creature,team=!egg.object,tag=!egg.shock.source,tag=egg.shock.target] \
    run function #egg:preprocess/$(preprocess)

## Success.
return 1