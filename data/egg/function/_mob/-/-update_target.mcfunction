## Reset.
execute unless function egg:on/target unless score @s egg.alignment matches 0 run return run function egg:_mob/-/-reset_newtral
## Conflict.
execute if function egg:on/target if function egg:_mob/-/-modified_target run return run function egg:_mob/-/-conflict_target

## No changea.
return 0