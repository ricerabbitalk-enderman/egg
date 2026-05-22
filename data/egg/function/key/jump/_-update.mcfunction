## Save Previous Input.
scoreboard players operation @s egg.key.jump._previous = @s egg.key.jump._current

## Update use state.
# on pushed
execute if predicate egg:player/key/jump run function egg:key/jump/-/-push
# on released
execute unless predicate egg:player/key/jump run function egg:key/jump/-/-release

## Success.
return 1