#:function ja
#@in storage uuid 騎乗するエンティティの UUID
#@return 処理の成否
#@text
#> コマンド実行者 `@s`の上にエンティティを騎乗させます。
#:

## Verify.
execute unless data storage egg:ride <<uuid run return fail

## Passengers expected.
execute store result score #egg:ride|passengers_expected -- run function egg:on/passengers
scoreboard players add #egg:ride|passengers_expected -- 1

## Ride.
tag @s add egg._vehicle
data modify storage egg:pointer/-set <<uuid set from storage egg:ride <<uuid
execute at @s summon minecraft:snowball \
  if function egg:pointer/-enable \
  if function egg:pointer/-set \
  if function egg:_/_ride \
    run kill @s
tag @s remove egg._vehicle

## Passengers actual.
execute store result score #egg:ride|passengers_actual -- run function egg:on/passengers

## Result.
execute if score #egg:ride|passengers_expected -- = #egg:ride|passengers_actual -- run return 1
return fail