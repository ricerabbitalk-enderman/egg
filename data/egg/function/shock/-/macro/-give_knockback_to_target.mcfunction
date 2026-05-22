## Damage and knockback by source.
$execute \
  as @e[distance=..$(distance),type=#egg:creature,team=!egg.object,tag=!egg.shock.source,tag=egg.shock.target] \
  if function #egg:preprocess/$(preprocess) \
  anchored feet facing entity @s feet positioned ^ ^ ^$(distance) \
    run function egg:shock/-/set_knockback

## Success.
return 1