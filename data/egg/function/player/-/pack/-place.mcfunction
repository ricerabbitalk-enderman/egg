## Get information
execute store result score #egg:player/-/pack/-place|result -- run function egg:player/-block
execute if score #egg:player/-/pack/-place|result -- = #egg:player|failure -- run return fail
execute if score #egg:player/-/pack/-place|result -- = #egg:player|not_found -- run return fail

## Place.
data modify storage egg:block/place <<item set from storage egg:player/-block >>item
execute store result score #egg:player/-/pack/-place|face -- run data get storage egg:pack <<.face
execute if score #egg:player/-/pack/-place|face -- = #egg:ray.face|inside -- positioned ~ ~ ~ unless function egg:block/place run return fail
execute if score #egg:player/-/pack/-place|face -- = #egg:ray.face|bottom -- positioned ~ ~-1 ~ unless function egg:block/place run return fail
execute if score #egg:player/-/pack/-place|face -- = #egg:ray.face|top -- positioned ~ ~1 ~ unless function egg:block/place run return fail
execute if score #egg:player/-/pack/-place|face -- = #egg:ray.face|north -- positioned ~ ~ ~-1 unless function egg:block/place run return fail
execute if score #egg:player/-/pack/-place|face -- = #egg:ray.face|south -- positioned ~ ~ ~1 unless function egg:block/place run return fail
execute if score #egg:player/-/pack/-place|face -- = #egg:ray.face|east -- positioned ~1 ~ ~ unless function egg:block/place run return fail
execute if score #egg:player/-/pack/-place|face -- = #egg:ray.face|west -- positioned ~-1 ~ ~ unless function egg:block/place run return fail

## Consume.
execute if score #egg:player/-/pack/-place|result -- = #egg:player|mainhand -- run item modify entity @s weapon.mainhand egg:consume
execute if score #egg:player/-/pack/-place|result -- = #egg:player|offhand -- run item modify entity @s weapon.offhand egg:consume

## Swing.
execute if score #egg:player/-/pack/-place|result -- = #egg:player|mainhand -- run swing @s mainhand
execute if score #egg:player/-/pack/-place|result -- = #egg:player|offhand -- run swing @s offhand

## Success.
return 1