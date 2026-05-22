## Save Previous Input.
scoreboard players operation @s egg.key.forward._previous = @s egg.key.forward._current

## Update use state.
# on pushed
execute if predicate egg:player/key/forward run function egg:key/forward/-/-push
# on released
execute unless predicate egg:player/key/forward run function egg:key/forward/-/-release

## Success.
return 1