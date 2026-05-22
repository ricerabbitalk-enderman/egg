## Check knockback.
scoreboard players set #egg:shock/-/-give_to_target|knockback -- 1
execute if score #egg:shock|scale~fixed -- matches 0 if score #egg:shock|xv~fixed -- matches 0 if score #egg:shock|yv~fixed -- matches 0 if score #egg:shock|zv~fixed -- matches 0 \
  run scoreboard players set #egg:shock/-/-give_to_target|knockback -- 0

## Check damage.
scoreboard players set #egg:shock/-/-give_to_target|damage -- 0
execute store result score #egg:shock/-/-give_to_target|damage -- run data get storage egg:shock <<.amount 32768

## Give shock.
execute on origin run tag @s add egg.shock.source
execute on origin on target run tag @s add egg.shock.target
# Preprocess only
execute \
  if score #egg:shock/-/-give_to_target|damage -- matches 0 \
  if score #egg:shock/-/-give_to_target|knockback -- matches 0 \
    run function egg:shock/-/macro/-preprocess_to_target with storage egg:shock <<
# Damage
execute \
  unless score #egg:shock/-/-give_to_target|damage -- matches 0 \
  if score #egg:shock/-/-give_to_target|knockback -- matches 0 \
    run function egg:shock/-/macro/-give_damage_to_target with storage egg:shock <<
# Knockback
execute \
  if score #egg:shock/-/-give_to_target|damage -- matches 0 \
  unless score #egg:shock/-/-give_to_target|knockback -- matches 0 \
    run function egg:shock/-/macro/-give_knockback_to_target with storage egg:shock <<
# Damage and knockback
execute \
  unless score #egg:shock/-/-give_to_target|damage -- matches 0 \
  unless score #egg:shock/-/-give_to_target|knockback -- matches 0 \
    run function egg:shock/-/macro/-give_damage_and_knockback_to_target with storage egg:shock <<
execute on origin on target run tag @s remove egg.shock.target
execute on origin run tag @s remove egg.shock.source

## Success.
return 1