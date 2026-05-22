## Break.
execute unless data storage egg:model/-/-loop_to_set_pose data[-1] run return 0
## Pop.
data modify storage egg:model/-/part/-set_pose <<pose set from storage egg:model/-/-loop_to_set_pose data[-1]
data remove storage egg:model/-/-loop_to_set_pose data[-1]

## Save debug data.
execute run data modify entity @s data.egg.model._debug.transformation set from storage egg:model/-/part/-set_pose <<pose

## Recursive calls.
execute if function egg:model/-/part/-set_pose on passengers run return run function egg:model/-/-loop_to_set_pose

## Failure.
return fail
