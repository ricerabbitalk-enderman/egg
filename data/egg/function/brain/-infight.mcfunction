#:function ja
#@return 接近戦状態かどうか
#@text
#> 接近戦を挑む思考回路かどうかを取得します。
#:

## Verify.
execute unless entity @s[type=minecraft:piglin] run return fail
execute unless entity @s[tag=egg.brain] run return fail

## Infight.
execute if items entity @s weapon.mainhand * run return 0
return 1