#:function ja
#@in storage name モデル名
#@out storage uuid 生成されたモデルの UUID
#@return 処理の成否
#@text
#> モデルを生成します。
#:

## Cleanup.
data remove storage egg:model/new >>uuid

## Verify.
execute unless data storage egg:model/new <<name run return fail

## New.
data modify storage egg:model/-/macro/new_model ** set value {}
data modify storage egg:model/-/macro/new_model **.model set from storage egg:model/new <<name
function egg:model/-/macro/new_model with storage egg:model/-/macro/new_model **
execute as @e[distance=..0.1,type=minecraft:block_display,tag=_uninitialized] \
  if function egg:model/-enable \
    run return run data modify storage egg:model/new >>uuid set from entity @s UUID

## Error.
return fail