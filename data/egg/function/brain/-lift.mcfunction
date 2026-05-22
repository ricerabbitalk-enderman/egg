#:function ja
#@return 処理の成否
#@text
#> 攻撃対象を削除し警戒状態を解除します。
#:

## Verify.
execute unless entity @s[type=minecraft:piglin] run return fail
execute unless entity @s[tag=egg.brain] run return fail

## Lift.
data remove entity @s Brain.memories."minecraft:angry_at"

## Success.
return 1