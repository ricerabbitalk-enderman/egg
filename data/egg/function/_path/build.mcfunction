## Split `/`.
data modify storage egg:_path/build >>path set value {path:[]}
data modify storage egg:_path/-/loop_to_split buffer set from storage egg:_path/build <<string
function egg:_path/-/loop_to_split

## Split ':'
data modify storage egg:_string/split <<string set from storage egg:_path/-/loop_to_split >>rest
function egg:_string/split_colon

## Result.
data modify storage egg:_path/build >>path.namespace set from storage egg:_string/split >>list[0]
data modify storage egg:_path/build >>path.path prepend from storage egg:_string/split >>list[1]

## Success.
return 1