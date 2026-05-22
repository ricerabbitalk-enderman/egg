## Call command.
# Unload.
execute if score @s egg matches -1 run function egg:_system/_unload

## Call command of sub modules.
function #egg:system/command

## Success.
return 1