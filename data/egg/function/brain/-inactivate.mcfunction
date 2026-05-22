#:function ja
#@return 処理の成否
#@text
#> 思考回路を無効化します。
#:

## Verify.
execute unless entity @s[type=minecraft:piglin] run return fail
execute unless entity @s[tag=egg.brain] run return fail

## Disable AI.
data modify entity @s NoAI set value true

## Success.
return 1