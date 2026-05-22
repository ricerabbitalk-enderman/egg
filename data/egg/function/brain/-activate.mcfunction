#:function ja
#@return 処理の成否
#@text
#> 思考回路を有効化します。
#:

## Verify.
execute unless entity @s[type=minecraft:piglin] run return fail
execute unless entity @s[tag=egg.brain] run return fail

## Enable AI.
data modify entity @s NoAI set value false

## Success.
return 1