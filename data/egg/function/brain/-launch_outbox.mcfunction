#:function ja
#@return 処理の成否
#@text
#> 遠距離戦を挑む思考回路に設定します。
#:

## Verify.
execute unless entity @s[type=minecraft:piglin] run return fail
execute unless entity @s[tag=egg.brain] run return fail

## Equip crossbow.
execute unless items entity @s weapon.mainhand * \
  run item replace entity @s weapon.mainhand \
    with minecraft:crossbow[minecraft:item_model="minecraft:air",minecraft:enchantments={"egg:chant":1}]

## Success.
return 1