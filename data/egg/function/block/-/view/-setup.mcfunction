## Setup.
data modify storage egg:pack/call <<pack set value {}
data modify storage egg:pack/call <<pack.name set from entity @s data.egg.block.view._item.components."minecraft:custom_data".egg.setup
function egg:pack/call
## Remove tags.
tag @s remove egg.block.view._uninitialized

## Success.
return 1