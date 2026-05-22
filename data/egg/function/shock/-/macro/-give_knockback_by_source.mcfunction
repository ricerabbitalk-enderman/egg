## Damage and knockback by source.
$execute \
  as @e[distance=..$(distance),type=#egg:creature,team=!egg.object,tag=!egg.shock.source,scores={egg.alignment=$(alignment_min)..$(alignment_max)}] \
  if function #egg:preprocess/$(preprocess) \
  anchored feet facing entity @s feet positioned ^ ^ ^$(distance) \
    run function egg:shock/-/set_knockback

## Success.
return 1