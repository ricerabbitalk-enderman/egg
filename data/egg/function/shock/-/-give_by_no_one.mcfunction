## Check knockback.
scoreboard players set #egg:shock/-/-give_by_no_one|knockback -- 1
execute if score #egg:shock|scale~fixed -- matches 0 if score #egg:shock|xv~fixed -- matches 0 if score #egg:shock|yv~fixed -- matches 0 if score #egg:shock|zv~fixed -- matches 0 \
  run scoreboard players set #egg:shock/-/-give_by_no_one|knockback -- 0

## Check damage.
scoreboard players set #egg:shock/-/-give_by_no_one|damage -- 0
execute store result score #egg:shock/-/-give_by_no_one|damage -- run data get storage egg:shock <<.amount 32768

## Give shock.
# Preprocess only
execute \
  if score #egg:shock/-/-give_by_no_one|damage -- matches 0 \
  if score #egg:shock/-/-give_by_no_one|knockback -- matches 0 \
    run function egg:shock/-/macro/-preprocess_by_no_one with storage egg:shock <<
# Damage
execute \
  unless score #egg:shock/-/-give_by_no_one|damage -- matches 0 \
  if score #egg:shock/-/-give_by_no_one|knockback -- matches 0 \
    run function egg:shock/-/macro/-give_damage_by_no_one with storage egg:shock <<
# Knockback
execute \
  if score #egg:shock/-/-give_by_no_one|damage -- matches 0 \
  unless score #egg:shock/-/-give_by_no_one|knockback -- matches 0 \
    run function egg:shock/-/macro/-give_knockback_by_no_one with storage egg:shock <<
# Damage and knockback
execute \
  unless score #egg:shock/-/-give_by_no_one|damage -- matches 0 \
  unless score #egg:shock/-/-give_by_no_one|knockback -- matches 0 \
    run function egg:shock/-/macro/-give_damage_and_knockback_by_no_one with storage egg:shock <<

## Success.
return 1