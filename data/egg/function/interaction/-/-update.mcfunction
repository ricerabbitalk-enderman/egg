## No signal.
execute unless data entity @s attack unless data entity @s interaction run return 0

## Attack.
execute if data entity @s attack run function egg:interaction/-/-attack
## Interact.
execute if data entity @s interaction run function egg:interaction/-/-interact

## Clear.
data remove entity @s attack
data remove entity @s interaction

## Success.
return 1