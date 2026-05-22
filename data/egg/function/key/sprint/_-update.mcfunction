## Save Previous Input.
scoreboard players operation @s egg.key.sprint._previous = @s egg.key.sprint._current

## Update use state.
# on pushed
execute if predicate egg:player/key/sprint run function egg:key/sprint/-/-push
# on released
execute unless predicate egg:player/key/sprint run function egg:key/sprint/-/-release

## Success.
return 1