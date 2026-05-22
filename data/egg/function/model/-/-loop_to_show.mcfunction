## Break.
execute unless data storage egg:model/-/-loop_to_show data[-1] run return 0
## Pop.
data modify storage egg:model/-/part/-show <<look set from storage egg:model/-/-loop_to_show data[-1]
data remove storage egg:model/-/-loop_to_show data[-1]

## Recursive calls.
execute if function egg:model/-/part/-show on passengers run return run function egg:model/-/-loop_to_show

## Failure.
return fail
