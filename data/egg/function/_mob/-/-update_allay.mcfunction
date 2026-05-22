## Liked.
execute if data entity @s Brain.memories."minecraft:liked_player" if score @s egg.alignment matches 0 run return run function egg:_mob/-/-trust_player
execute unless data entity @s Brain.memories."minecraft:liked_player" if score @s egg.alignment matches 1 run return run function egg:_mob/-/-reset_newtral

## No changea.
return 0