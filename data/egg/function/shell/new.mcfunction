#:module ja
#@text
#> 騎乗させることで操作制限の当たり判定を追加する機能を提供します。
#:

#:function ja
#> `egg.shell` エンティティを生成します。
#@out storage uuid 生成された egg.shell エンティティの UUID
#@return 処理の成否
#@code mcfunction
#> # egg.shell をコマンド実行者 `@s`の上に騎乗
#> function egg:shell/new
#> data modify storage egg:ride <<uuid set from storage egg:shell/new <<uuid
#> function egg:ride
#:

## Cleanup.
data remove storage egg:shell/new >>uuid

## New.
summon minecraft:mannequin ~ ~ ~ { \
Tags:["egg.shell","egg.object","egg.invisible","_uninitialized"], \
  Invulnerable:true, \
  NoGravity:true, \
  Silent:true, \
  Team:"egg.object", \
  attributes:[{id:"minecraft:scale",base:0.25},{id:"minecraft:burning_time",base:0.0}], \
  active_effects:[{id:"minecraft:invisibility",amplifier:127,duration:-1,show_particles:false,show_icon:false,ambient:false}] \
}
## Initialize.
execute as @e[distance=..0.1,type=minecraft:mannequin,tag=_uninitialized] \
  if function egg:shell/-/-initialize \
    run return run data modify storage egg:shell/new >>uuid set from entity @s UUID

## Error.
return fail