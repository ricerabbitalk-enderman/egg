#:function ja
#@return 処理の成否
#@text
#> アニメーションを再生します。
#> 再生中は egg.animation.playing タグが付与されます。
#> 再生中かどうかはタグの有無で確認してください。
#:

## Verify.
execute unless entity @s[type=minecraft:block_display] run return fail
execute unless entity @s[tag=egg.animation] run return fail

## Pop.
execute unless function egg:animation/-/-pop run return fail
## Set pose.
execute unless function egg:model/-set_pose run return fail
## Disable interpolation.
execute unless function egg:model/-transform_without_interpolation run return fail
## Add tags.
tag @s add egg.animation._initial_point
tag @s add egg.animation.playing

## Success.
return 1