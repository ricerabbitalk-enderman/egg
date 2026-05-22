#:function ja
#@return 処理の成否
#@text
#> `egg.soul` エンティティに攻撃対象を削除し、戦闘態勢を解除します。
#@code mcfunction
#> # 攻撃対象を削除
#> execute on passengers on origin run function egg:soul/-lift
#:

## Verify.
execute unless entity @s[tag=egg.soul] run return fail

## Implements.
execute if entity @s[tag=egg.soul.allay] run return run function egg:soul/-/allay/-lift
execute if entity @s[tag=egg.soul.nautilus] run return run function egg:soul/-/nautilus/-lift
execute if entity @s[tag=egg.soul.wolf] run return run function egg:soul/-/wolf/-lift