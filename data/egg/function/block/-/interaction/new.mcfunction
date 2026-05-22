## New.
data modify storage egg:block/-/interaction/-initialize << set from storage egg:block/-/interaction/new <<
data remove storage egg:block/-/interaction/new >>uuid
execute \
  summon minecraft:interaction \
  if function egg:block/-/interaction/-initialize \
  if function egg:block/-/interaction/-activate \
    run return run data modify storage egg:block/-/interaction/new >>uuid set from entity @s UUID

## Error.
return fail