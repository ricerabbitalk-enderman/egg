## Set default data.
execute unless data storage egg:shock <<.namespace run data modify storage egg:shock <<.namespace set value "minecraft"
execute unless data storage egg:shock <<.type run data modify storage egg:shock <<.type set value "generic"

## Success.
return 1