#:function ja
#@in storage path 見栄えパス (`<モデル名>`で BDEngine で設定したデフォルトの見栄え)
#@return 処理の成否
#@text
#> モデルを表示します。
#:

## Verify.
execute unless entity @s[type=minecraft:block_display] run return fail
execute unless entity @s[tag=egg.model] run return fail

## Get looks.
data modify storage egg:model/-/macro/get_looks ** set value {}
data modify storage egg:model/-/macro/get_looks **.path set from storage egg:model/-show <<path
data remove storage egg:model/-/macro/get_looks >>looks
function egg:model/-/macro/get_looks with storage egg:model/-/macro/get_looks **
## Check.
execute unless data storage egg:model/-/macro/get_looks >>looks run return fail

## Set Pose.
data modify storage egg:model/-/-loop_to_show data set from storage egg:model/-/macro/get_looks >>looks
execute on passengers run function egg:model/-/-loop_to_show

## Success.
return 1