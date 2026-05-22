## Push.
data modify storage egg:pointer/-set <<uuid set from storage egg:soul/holder/_push <<uuid
execute summon minecraft:snowball if function egg:pointer/-enable if function egg:pointer/-set if function egg:soul/holder/-/-initialize \
  run data modify storage egg:ride <<uuid set from entity @s UUID
function egg:ride

## Success.
return 1