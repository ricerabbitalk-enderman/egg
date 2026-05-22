#:module ja
#>戦闘用思考回路の機能を提供します。
#>消極的なモブに騎乗させることでモブの動きを戦闘行動的に自動操作させることができます。
#:
#:function ja
#>思考回路エンティティを @s に騎乗させます。
#@return 処理の成否
#@code mcfunction
#># egg.brain をコマンド実行者 `@s`の上に騎乗
#>function egg:brain/new
#>data modify storage egg:ride <<uuid set from storage egg:brain/new <<uuid
#>function egg:ride
#:

## Cleanup.
data remove storage egg:brain/new >>uuid

## Summon.
summon minecraft:piglin ~ ~ ~ {\
  Tags:["egg.brain","_uninitialized"],\
  Invulnerable:true,\
  NoAI:true,\
  NoGravity:true,\
  Silent:true,\
  IsBaby:false,\
  IsImmuneToZombification:true,\
  CanPickUpLoot:false,\
  Brain:{memories:{"minecraft:admiring_disabled":{value:true,ttl:9223372036854775807L}}},\
  equipment:{}\
}
## Initialize.
execute as @e[distance=..0.1,type=minecraft:piglin,tag=_uninitialized] \
  if function egg:brain/-/-initialize \
    run return run data modify storage egg:brain/new >>uuid set from entity @s UUID

## Error
return fail