## New.
execute summon minecraft:text_display if function egg:soul/-/wolf/dummy/-initialize \
  run data modify storage egg:soul/-/wolf/dummy/new >>uuid set from entity @s UUID

## Success.
return 1