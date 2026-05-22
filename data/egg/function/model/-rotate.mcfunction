#:function ja
#@return 処理の成否
#@text
#> モデルを回転させます。
#> 複数の部品で構成されているため rotate だけでは全構成を回転させることができません。
#:

## Verify.
execute unless entity @s[type=minecraft:block_display] run return fail
execute unless entity @s[tag=egg.model] run return fail

## Rotate.
rotate @s ~ ~
data modify storage egg:model/-rotate rotation set from entity @s Rotation
function egg:model/-/-loop_to_rotate
return 1