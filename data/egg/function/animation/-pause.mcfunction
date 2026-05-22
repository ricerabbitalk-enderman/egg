#:function ja
#@return 処理の成否
#@text
#> アニメーションを一時停止します。
#> 再生状況が維持され、次回再生時に途中から再生されます。
#:

## Verify.
execute unless entity @s[type=minecraft:block_display] run return fail
execute unless entity @s[tag=egg.animation] run return fail
execute unless entity @s[tag=egg.animation.playing] run return fail

## Set scoreboards.
scoreboard players set @s egg.animation._tick 0
## Remove tags.
tag @s remove egg.animation._initial_point
tag @s remove egg.animation.playing

## Success.
return 1