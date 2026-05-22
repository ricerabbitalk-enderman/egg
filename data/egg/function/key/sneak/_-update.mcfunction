## Save Previous Input.
scoreboard players operation @s egg.key.sneak._previous = @s egg.key.sneak._current

## Update use state.
# on pushed
execute if predicate egg:player/key/sneak run function egg:key/sneak/-/-push
# on released
execute unless predicate egg:player/key/sneak run function egg:key/sneak/-/-release

## Success.
return 1