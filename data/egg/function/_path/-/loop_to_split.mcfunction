## Split "/".
data modify storage egg:_string/split <<string set string storage egg:_path/-/loop_to_split buffer
execute unless function egg:_string/split_slash run return run data modify storage egg:_path/-/loop_to_split >>rest set from storage egg:_path/-/loop_to_split buffer

## Add path.
data modify storage egg:_path/build >>path.path prepend from storage egg:_string/split >>list[1]
## Set next buffer.
data modify storage egg:_path/-/loop_to_split buffer set string storage egg:_string/split >>list[0]

## Recursive call.
return run function egg:_path/-/loop_to_split