#:function ja
#@return 処理の成否
#@text
#> アニメーションを停止します。
#> 再生状況は維持されず初期状態に戻ります。
#:

## Verify.
execute unless entity @s[type=minecraft:block_display] run return fail
execute unless entity @s[tag=egg.animation] run return fail
execute unless entity @s[tag=egg.animation.playing] run return fail

## Remove tags.
tag @s remove egg.animation.playing
## Reset.
data modify storage egg:animation/-set << set from entity @s data.animation._info
execute unless function egg:animation/-set run return fail

## Success.
return 1