## Reset.
execute unless function egg:on/owner unless score @s egg.alignment matches 0 run return run function egg:_mob/-/-reset_newtral
## Tame.
execute if function egg:on/owner if function egg:_mob/-/-modified_owner run return run function egg:_mob/-/-tame_by_owner

## No changea.
return 0