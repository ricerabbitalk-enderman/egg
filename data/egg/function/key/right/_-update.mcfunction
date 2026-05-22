## Save Previous Input.
scoreboard players operation @s egg.key.right._previous = @s egg.key.right._current

## Update use state.
# on pushed
execute if predicate egg:player/key/right run function egg:key/right/-/-push
# on released
execute unless predicate egg:player/key/right run function egg:key/right/-/-release

## Success.
return 1