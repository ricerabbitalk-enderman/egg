#:function ja
#@return 処理の成否 (必ず 1)
#@text
#> `egg.despawn` 機能を無効化します。
#> 飼いならしなどの変化でデスポーンを無効化したいときに使います。
#@code mcfunction
#> # egg.despawn 機能を持つ特殊モブが飼いならされていれば egg.dwspawn 機能を無効化
#> execute as @e[tag=egg.despawn] if data entity @s Owner run function egg:despawn/-disable
#:

## Verify.
execute unless entity @s[tag=egg.despawn] run return fail

## Reset scoreboards.
scoreboard players reset @s egg.despawn.life
## Remove tags.
tag @s remove egg.despawn

## Success.
return 1