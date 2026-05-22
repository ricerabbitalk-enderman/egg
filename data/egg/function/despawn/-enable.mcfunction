#:module ja
#@text
#> 距離による強制デスポーン判定を提供します。
#> `egg.despwan` 機能が有効化されたエンティティは、全プレイヤーから 72m よりも離れた段階で強制デスポーンします。
#> 64m より離れた場合も、ある程度の生存期間まで範囲外に存在し続けると強制デスポーンします。
#> カスタムモブのようにシステムが自動デスポーンできないエンティティをある程度自然にデスポーンさせることができます。
#:

#:function ja
#@return 処理の成否 (必ず 1)
#@text
#> egg.despawn 機能を有効化します。
#@code mcfunction
#> # 召喚した特殊モブ（今回は自動デスポーンの無効化）に egg.despawn 機能を有効化
#> summon minecraft:wolf ~ ~ ~ {Tags:["_uninitialized"],PersistenceRequired:true}
#> execute as @e[distance=..0.1,tag=_uninitialized] if function egg:despawn/-enable run tag @s remove _uninitialized
#:

## Verify.
execute if entity @s[tag=egg.despawn] run return fail

## Set scoreboards.
execute store result score @s egg.despawn.life run random value 4..6
## Add tags.
tag @s add egg.despawn

## Success.
return 1