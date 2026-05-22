#:function ja
#@return 処理の成否
#@text
#> モデル破壊します。
#> モデルは複数エンティティによる構成なので `kill` コマンドでは全構成を破壊できません。
#:

## Verify.
execute unless entity @s[type=minecraft:block_display] run return fail
execute unless entity @s[tag=egg.model] run return fail

## Kill.
execute on passengers run function egg:model/-/-loop_to_delete
kill @s

## Success.
return 1