## Teardown.
data modify storage egg:pack/call <<pack set value {}
data modify storage egg:pack/call <<pack.name set from entity @s data.egg.block.view._item.components."minecraft:custom_data".egg.teardown
function egg:pack/call

## Success.
return 1