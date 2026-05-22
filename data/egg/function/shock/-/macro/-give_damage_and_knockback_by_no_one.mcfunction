## Damage and knockback by source.
$execute \
  as @e[distance=..$(distance),type=#egg:creature,team=!egg.object,tag=!egg.shock.source,scores={egg.alignment=$(alignment_min)..$(alignment_max)}] \
  if function #egg:preprocess/$(preprocess) \
  anchored feet facing entity @s feet positioned ^ ^ ^$(distance) if function egg:shock/-/set_knockback \
    run damage @s $(amount) $(namespace):$(type)

## Success.
return 1