## Interact.
execute if data entity @s interaction if function egg:block/-/interaction/-interact run return run function egg:block/-/interaction/-clear

## Attack.
execute \
  if data entity @s attack \
    run function egg:block/-/interaction/-inactivate
execute \
  unless entity @s[tag=egg.block.interaction.active] \
  if score @s egg.block._cooltime matches 0 \
    run function egg:block/-/interaction/-activate

## Tick.
execute unless entity @s[tag=egg.block.interaction.active] run scoreboard players remove @s egg.block._cooltime 1

## Clear.
return run function egg:block/-/interaction/-clear