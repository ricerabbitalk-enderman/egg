## Next page.
scoreboard players add @s egg.animation._page 1
## Repeat.
execute if score @s egg.animation._page = @s egg.animation._count run return run function egg:animation/-/-repeat
## Get timeline.
function egg:animation/-/-get_timeline

## Next keyframe.
return run function egg:animation/-/-next_keyframe
