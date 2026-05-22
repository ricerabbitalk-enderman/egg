#:function ja
#@return 処理の成否
#@text
#> `egg.soul` エンティティが懐く対象（フォロー）を設定します。
#@code mcfunction
#> # フォローを解除
#> execute on passengers on origin run function egg:soul/-unfollow
#:

## Verify.
execute unless entity @s[tag=egg.soul] run return fail

## Implements.
execute if entity @s[tag=egg.soul.allay] run return run function egg:soul/-/allay/-unfollow
execute if entity @s[tag=egg.soul.nautilus] run return run function egg:soul/-/nautilus/-unfollow
execute if entity @s[tag=egg.soul.wolf] run return run function egg:soul/-/wolf/-unfollow