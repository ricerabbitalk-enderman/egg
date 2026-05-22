#:function ja
#@return フォローしているかどうか
#@text
#> `egg.soul` エンティティが懐く対象（フォロー）しているかどうかを取得します。
#> `function egg:soul/-followed_to` より軽量で、単純にフォローしているかどうかのみの取得に適しています。
#@code mcfunction
#> # フォローしているかどうかを通知
#> execute on passengers on origin if function egg:soul/-following run say egg.soul follow anyone.
#:

## Verify.
execute unless entity @s[tag=egg.soul] run return fail

## Implements.
execute if entity @s[tag=egg.soul.allay] run return run function egg:soul/-/allay/-following
execute if entity @s[tag=egg.soul.nautilus] run return run function egg:soul/-/nautilus/-following
execute if entity @s[tag=egg.soul.wolf] run return run function egg:soul/-/wolf/-following