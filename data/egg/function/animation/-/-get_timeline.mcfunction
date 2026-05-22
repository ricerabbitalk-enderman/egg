## Remove timeline.
data remove entity @s data.egg.animation._timeline

## Get timeline.
data modify storage egg:animation/-/-get_timeline ** set value {}
data modify storage egg:animation/-/-get_timeline **.path set from entity @s data.egg.animation._info.path
execute store result storage egg:animation/-/-get_timeline **.page int 1 run scoreboard players get @s egg.animation._page
function egg:animation/-/macro/-get_timeline with storage egg:animation/-/-get_timeline **
## Check.
execute unless data entity @s data.egg.animation._timeline run return fail

## Success.
return 1