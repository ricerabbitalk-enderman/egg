#:function ja
#@return 処理の成否
#@text
#> 接近戦を挑む思考回路に設定します。
#:

## Verify.
execute unless entity @s[type=minecraft:piglin] run return fail
execute unless entity @s[tag=egg.brain] run return fail

## Remove crossbow.
execute if items entity @s weapon.mainhand * run item replace entity @s weapon.mainhand with minecraft:air

## Success.
return 1