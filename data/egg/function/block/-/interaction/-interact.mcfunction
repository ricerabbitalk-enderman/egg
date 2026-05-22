## Call.
data modify storage egg:pack/call <<pack set value {}
data modify storage egg:pack/call <<pack.name set from entity @s data.egg.block.interaction._event
function egg:pack/call

## Success.
return 1