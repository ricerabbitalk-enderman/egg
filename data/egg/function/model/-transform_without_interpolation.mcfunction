#:function ja
#@return 処理の成否
#@text
#> モデルの動きに補完効果を削除します。
#:

## Verify.
execute unless entity @s[type=minecraft:block_display] run return fail
execute unless entity @s[tag=egg.model] run return fail

## Set data.
execute on passengers run return run function egg:model/-/-loop_to_transform_without_interpolation