## Publish ID.
# Mainhand.
execute if predicate egg:player/hold_device/mainhand run function egg:input/-/-update_mainhand
# Offhand.
execute if predicate egg:player/hold_device/offhand run function egg:input/-/-update_offhand

## Save Previous Input.
scoreboard players operation @s egg.input._previous = @s egg.input._current

## Update use state.
# on pushed
execute if entity @s[advancements={egg:device=true}] run function egg:input/-/-push
# on released
execute if entity @s[advancements={egg:device=false}] run function egg:input/-/-release

## Success.
return 1