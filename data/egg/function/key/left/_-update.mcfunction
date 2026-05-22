## Save Previous Input.
scoreboard players operation @s egg.key.left._previous = @s egg.key.left._current

## Update use state.
# on pushed
execute if predicate egg:player/key/left run function egg:key/left/-/-push
# on released
execute unless predicate egg:player/key/left run function egg:key/left/-/-release

## Success.
return 1