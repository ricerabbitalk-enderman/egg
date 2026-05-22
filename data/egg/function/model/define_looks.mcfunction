#:function ja
#@in storage name モデル名
#@in storage type モデル種類
#@in storage modifier 見栄えの変更情報
#@return 処理の成否
#@text
#> モデルの見栄えを定義します。
#> BDEngine で Additional NBT の欄に `data:{alias:xxx}` を設定した表示エンティティを以下のような変更情報で見た目を差し替えることができます。
#@code mcfunction
#> data modify storage egg:model/define_looks <<modifier set value {\
#>   xxx:{item:{id:"minecraft:barrier",count:1,components:{"minecraft:item_model":"xxx:yyyy"}}}, \
#>   weapon:{item:{id:"minecraft:iron_sword",count:1}}, \
#>   head:{block_state:{id:"minecraft:carved_pumpkin",count:1}} \
#> }
#> data modify storage egg:model/define_looks <<name set value ghost
#> data modify storage egg:model/define_looks <<type set value hold_iron_sword
#> function egg:model/define_looks
#@text
#> 定義した見栄えは `function egg:modek/-show` で `<<path` に `<モデル名>-<モデル種類>` で設定可能です。
#> 単純に `<モデル名>` とした場合は BDEngine での見栄えがそのまま適用されます。
#:

## Verify.
execute unless data storage egg:model/define_looks <<name run return fail
execute unless data storage egg:model/define_looks <<type run return fail
execute unless data storage egg:model/define_looks <<modifier run return fail

## Get looks.
data modify storage egg:model/-/macro/get_looks ** set value {}
data modify storage egg:model/-/macro/get_looks **.path set from storage egg:model/define_looks <<name
data remove storage egg:model/-/macro/get_looks >>looks
function egg:model/-/macro/get_looks with storage egg:model/-/macro/get_looks **

## Check.
execute unless data storage egg:model/-/macro/get_looks >>looks run return fail

## Modfiy.
data modify storage egg:model/-/loop_to_define_looks <<looks set from storage egg:model/-/macro/get_looks >>looks
data modify storage egg:model/-/loop_to_define_looks <<modifier set from storage egg:model/define_looks <<modifier
data modify storage egg:model/-/loop_to_define_looks >>looks set value []
execute unless function egg:model/-/loop_to_define_looks run return fail

## Set looks.
data modify storage egg:model/-/macro/set_looks <<looks set from storage egg:model/-/loop_to_define_looks >>looks
data modify storage egg:model/-/macro/set_looks ** set value {}
data modify storage egg:model/-/macro/set_looks **.model set from storage egg:model/define_looks <<name
data modify storage egg:model/-/macro/set_looks **.name set from storage egg:model/define_looks <<type
return run function egg:model/-/macro/set_looks with storage egg:model/-/macro/set_looks **