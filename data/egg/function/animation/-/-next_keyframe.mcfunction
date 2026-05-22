## Skip initial point.
execute if entity @s[tag=egg.animation._initial_point] run return run tag @s remove egg.animation._initial_point

## Pop.
execute unless function egg:animation/-/-pop run return run function egg:animation/-/-next_page
## Set pose.
function egg:model/-set_pose
## Enable interpolation.
function egg:model/-transform_with_interpolation

## Success.
return 1
