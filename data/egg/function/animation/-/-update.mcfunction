## Update Tick.
scoreboard players add @s egg.animation._tick 1
## Update Keyframe.
scoreboard players operation @s egg.animation._tick %= #egg:animation/-/-update|wait --
execute \
  if score @s egg.animation._tick matches 0 \
  unless entity @s[tag=egg.animation.finished] \
  unless function egg:animation/-/-next_keyframe \
    run tag @s add egg.animation.finished

## Success.
return 1