## Check finish.
execute if score @s egg.animation._repeat matches 0 run return 0
## Update repeat count.
execute if score @s egg.animation._repeat matches 1.. run scoreboard players remove @s egg.animation._repeat 1
## Reset page.
scoreboard players set @s egg.animation._page 0
## Get timeline.
function egg:animation/-/-get_timeline
## Pop.
function egg:animation/-/-pop
## Set pose.
function egg:model/-set_pose
## Disable interpolation.
function egg:model/-transform_without_interpolation
## Add tags.
tag @s add egg.animation._initial_point

## Success.
return 1