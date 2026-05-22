#:function ja
#@in uuid フォロー対象のエンティティの UUID
#@return 処理の成否
#@text
#> egg.soul エンティティが懐く対象（フォロー）を設定します。
#> フォローによるふるまいの変化はベースエンティティ依存です。
#@code mcfunction
#> # 一番近くのプレイヤーをフォローする。
#> data modify storage egg:soul/-follow <<uuid set from entity @p UUID
#> execute on passengers on origin run function egg:soul/-follow
#:

## Verify.
execute unless entity @s[tag=egg.soul] run return fail

## Implements.
execute if entity @s[tag=egg.soul.allay] run return run function egg:soul/-/allay/-follow
execute if entity @s[tag=egg.soul.nautilus] run return run function egg:soul/-/nautilus/-follow
execute if entity @s[tag=egg.soul.wolf] run return run function egg:soul/-/wolf/-follow