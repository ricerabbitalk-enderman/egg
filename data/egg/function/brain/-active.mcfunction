#:function ja
#@return 思考回路が有効かどうか
#@text
#> 思考回路が有効かどうかを取得します。
#> 思考回路が有効でない場合は攻撃対象を指定しても動作することはありません。
#:

## Verify.
execute unless entity @s[type=minecraft:piglin] run return fail
execute unless entity @s[tag=egg.brain] run return fail

## Active.
execute if data entity @s NoAI run return 0
return 1