#:function ja
#@out uuid フォロー対象のエンティティの UUID
#@return 処理の成否
#@text
#> egg.soul エンティティが懐く対象（フォロー）しているエンティティの UUID を取得します。
#@code mcfunction
#> # フォロー対象のプレイヤーを検索する（発光させる）
#> execute on passengers on origin run function egg:soul/-following_to
#> data modify storage egg:uuid/match <<uuid set from storage egg:soul/-following_to >>uuid
#> execute as @a if function egg:uuid/match run effect give @s minecraft:glowing 5 0 true
#:

## Cleanup.
data remove storage egg:soul/-following_to >>uuid

## Verify.
execute unless entity @s[tag=egg.soul] run return fail

## Implements.
execute if entity @s[tag=egg.soul.allay] run return run function egg:soul/-/allay/-following_to
execute if entity @s[tag=egg.soul.nautilus] run return run function egg:soul/-/nautilus/-following_to
execute if entity @s[tag=egg.soul.wolf] run return run function egg:soul/-/wolf/-following_to