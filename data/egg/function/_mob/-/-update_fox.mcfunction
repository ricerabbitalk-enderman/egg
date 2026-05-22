## Trusting.
execute store result score #egg:_mob/-/-update_fox|trusted -- run function egg:_mob/-/-trusted
execute unless score #egg:_mob/-/-update_fox|trusted -- matches 0 if score @s egg.alignment matches 0 run return run function egg:_mob/-/-trust_player
execute if score #egg:_mob/-/-update_fox|trusted -- matches 0 if score @s egg.alignment matches 1 run return run function egg:_mob/-/-reset_newtral

## No changea.
return 0