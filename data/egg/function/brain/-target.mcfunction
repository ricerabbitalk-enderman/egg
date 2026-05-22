#:function ja
#@in storage uuid 戦闘対象とするモブの `UUID`
#@return 処理の成否
#@text
#> 戦闘対象を指定し警戒状態にします。
#:

## Verify.
execute unless entity @s[type=minecraft:piglin] run return fail
execute unless entity @s[tag=egg.brain] run return fail

## Lift.
execute unless data storage egg:brain/-target <<uuid run return fail

## Check.
data remove storage egg:uuid/compare <<this
data remove storage egg:uuid/compare <<that
data modify storage egg:uuid/compare <<this set from storage egg:brain/-target <<uuid
data modify storage egg:uuid/compare <<that set from entity @s Brain.memories."minecraft:angry_at".value
execute if data storage egg:uuid/compare <<that if function egg:uuid/compare run return 1

## Target.
data modify storage egg:brain/-target angry_at set value {ttl:100L}
data modify storage egg:brain/-target angry_at.value set from storage egg:brain/-target <<uuid
data modify entity @s Brain merge value {memories:{}}
data modify entity @s Brain.memories."minecraft:angry_at" set from storage egg:brain/-target angry_at
## Enable AI.
data modify entity @s NoAI set value false

## Success.
return 1