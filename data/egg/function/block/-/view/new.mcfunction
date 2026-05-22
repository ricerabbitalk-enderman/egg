## Summon.
summon minecraft:item_display ~ ~ ~ { \
  Tags:["egg.block.view","_uninitialized"], \
  data:{egg:{block:{view:{}}}}, \
  item:{id:"minecraft:barrier",count:1,components:{}}, \
  transformation:[-1.001f,0f,0f,0f,0f,1.001f,0f,0.5005f,0f,0f,-1.001f,0f,0f,0f,0f,1f] \
}
## Initialize.
data modify storage egg:block/-/view/-initialize << set from storage egg:block/-/view/new <<
execute \
  as @e[distance=..0.1,type=minecraft:item_display,tag=_uninitialized] \
  if function egg:block/-/view/-initialize \
    run return run data modify storage egg:block/-/view/new >>uuid set from entity @s UUID

## Error.
return fail