## Save Previous Input.
scoreboard players operation @s egg.key.backward._previous = @s egg.key.backward._current

## Update use state.
# on pushed
execute if predicate egg:player/key/backward run function egg:key/backward/-/-push
# on released
execute unless predicate egg:player/key/backward run function egg:key/backward/-/-release

## Success.
return 1