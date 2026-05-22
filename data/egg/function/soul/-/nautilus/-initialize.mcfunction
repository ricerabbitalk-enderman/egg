## Set data.
data modify entity @s data merge value {egg:{soul:{nautilus:{}}}}
data modify entity @s Invulnerable set value true
data modify entity @s Silent set value true
## Add tags.
tag @s add egg.soul.nautilus

## Push brain.
function egg:brain/new
data modify storage egg:ride <<uuid set from storage egg:brain/new >>uuid
execute if function egg:ride on passengers run tag @s add egg.depend.vehicle

## Push shell.
function egg:shell/new
data modify storage egg:ride <<uuid set from storage egg:shell/new >>uuid
execute on passengers if function egg:ride on passengers run tag @s add egg.depend.vehicle

## Success.
return 1