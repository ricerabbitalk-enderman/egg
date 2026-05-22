## Trusted.
execute store result score #egg:_mob/-/-update_ocelot|trusting -- run function egg:_mob/-/-trusting
execute unless score #egg:_mob/-/-update_ocelot|trusting -- matches 0 if score @s egg.alignment matches 0 run return run function egg:_mob/-/-trust_player
execute if score #egg:_mob/-/-update_ocelot|trusting -- matches 0 if score @s egg.alignment matches 1 run return run function egg:_mob/-/-reset_newtral

## No changea.
return 0