## Check knockback.
scoreboard players set #egg:shock/-/-give_by_source|knockback -- 1
execute if score #egg:shock|scale~fixed -- matches 0 if score #egg:shock|xv~fixed -- matches 0 if score #egg:shock|yv~fixed -- matches 0 if score #egg:shock|zv~fixed -- matches 0 \
  run scoreboard players set #egg:shock/-/-give_by_source|knockback -- 0

## Check damage.
scoreboard players set #egg:shock/-/-give_by_source|damage -- 0
execute store result score #egg:shock/-/-give_by_source|damage -- run data get storage egg:shock <<.amount 32768

## Give shock.
execute on origin run tag @s add egg.shock.source
# Preprocess only
execute \
  if score #egg:shock/-/-give_by_source|damage -- matches 0 \
  if score #egg:shock/-/-give_by_source|knockback -- matches 0 \
    run function egg:shock/-/macro/-preprocess_by_source with storage egg:shock <<

# Damage
execute \
  unless score #egg:shock/-/-give_by_source|damage -- matches 0 \
  if score #egg:shock/-/-give_by_source|knockback -- matches 0 \
    run function egg:shock/-/macro/-give_damage_by_source with storage egg:shock <<

# Knockback
execute \
  if score #egg:shock/-/-give_by_source|damage -- matches 0 \
  unless score #egg:shock/-/-give_by_source|knockback -- matches 0 \
    run function egg:shock/-/macro/-give_knockback_by_source with storage egg:shock <<

# Damage and knockback
execute \
  unless score #egg:shock/-/-give_by_source|damage -- matches 0 \
  unless score #egg:shock/-/-give_by_source|knockback -- matches 0 \
    run function egg:shock/-/macro/-give_damage_and_knockback_by_source with storage egg:shock <<
execute on origin run tag @s remove egg.shock.source

## Success.
return 1