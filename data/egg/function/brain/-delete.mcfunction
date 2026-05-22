#:function ja
#@return 処理の成否
#@text
#> 思考回路を破壊します。
#> 無効化と違い永続的に下段のエンティティは操縦されなくなります。
#:

## Verify.
execute unless entity @s[type=minecraft:piglin] run return fail
execute unless entity @s[tag=egg.brain] run return fail

## Delete.
teleport @s ~ -1024 ~
kill @s

## Success.
return 1