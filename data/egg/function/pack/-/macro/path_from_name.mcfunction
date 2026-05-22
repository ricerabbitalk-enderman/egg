## Check registry.
$execute if data storage egg:pack registry.$(name) run return run data modify storage egg:pack/-/macro/path_from_name >>path set from storage egg:pack registry.$(name)

## Build path.
data modify storage egg:_path/build <<string set from storage egg:pack/call <<pack.name
$execute unless data storage egg:pack registry.$(name) if function egg:_path/build run data modify storage egg:pack registry.$(name) set from storage egg:_path/build >>path
data modify storage egg:pack/-/macro/path_from_name >>path set from storage egg:_path/build >>path

## Success.
return 1