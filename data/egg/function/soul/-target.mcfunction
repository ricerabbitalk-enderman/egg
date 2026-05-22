#:function ja
#@out uuid 攻撃対象のエンティティの UUID
#@return 処理の成否
#@text
#> `egg.soul` エンティティに攻撃対象を設定し、戦闘態勢に移ります。
#@code mcfunction
#> # 一番近いプレイヤーにとっての敵を攻撃対象に設定
#> execute at @s run data modify storage egg:soul/-target <<uuid set from entity @e[sort=nearest,scores={egg.alignment=-1},limit=1] UUID
#> execute on passengers on origin run function egg:soul/-target
#:

## Verify.
execute unless entity @s[tag=egg.soul] run return fail

## Implements.
execute if entity @s[tag=egg.soul.allay] run return run function egg:soul/-/allay/-target
execute if entity @s[tag=egg.soul.nautilus] run return run function egg:soul/-/nautilus/-target
execute if entity @s[tag=egg.soul.wolf] run return run function egg:soul/-/wolf/-target