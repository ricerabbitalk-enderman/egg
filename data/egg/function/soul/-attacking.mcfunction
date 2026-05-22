#:function ja
#@return 攻撃中かどうか
#@text
#> egg.soul エンティティが攻撃中かどうかを取得します。
#> 攻撃中の場合は on passengers が egg.brain であることが保証され on passengers on target で攻撃対象を参照可能です。
#@code mcfunction
#> # 攻撃中か確認し、攻撃中なら攻撃対象を発光させる。
#> execute on passengers on origin if function egg:soul/-attacking on passengers on target \
#>   run effect give @s minecraft:glowing 5 0 true
#:

## Verify.
execute unless entity @s[tag=egg.soul] run return fail

## Implements.
execute if entity @s[tag=egg.soul.allay] run return run function egg:soul/-/allay/-attacking
execute if entity @s[tag=egg.soul.nautilus] run return run function egg:soul/-/nautilus/-attacking
execute if entity @s[tag=egg.soul.wolf] run return run function egg:soul/-/wolf/-attacking