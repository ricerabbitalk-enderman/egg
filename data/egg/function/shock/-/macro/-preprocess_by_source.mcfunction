## Damage by source.
$execute \
  as @e[distance=..$(distance),type=#egg:creature,team=!egg.object,tag=!egg.shock.source,scores={egg.alignment=$(alignment_min)..$(alignment_max)}] \
    run function #egg:preprocess/$(preprocess)

## Success.
return 1