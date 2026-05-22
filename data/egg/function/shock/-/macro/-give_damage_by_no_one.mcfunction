## Damage.
$execute \
  as @e[distance=..$(distance),type=#egg:creature,team=!egg.object,tag=!egg.shock.source,scores={egg.alignment=$(alignment_min)..$(alignment_max)}] \
  if function #egg:preprocess/$(preprocess) \
    run damage @s $(amount) $(namespace):$(type)

## Success.
return 1