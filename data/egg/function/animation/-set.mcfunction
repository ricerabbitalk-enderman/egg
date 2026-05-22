#:function ja
#@in storage .path アニメーションデータのパス
#@in storage .repeat 繰り返し回数 (-1:無限)
#@return 処理の成否
#@text
#> アニメーションデータを設定します。
#> BDEngine で生成・出力したアニメーションは <モデル名>-<アニメーション名> のパスに保存されています。
#> 繰り返し回数を無限にしなかった場合、再生終了時は最後のフレームのポーズで静止します。
#> また、あくまでデータ設定のみなので、再生する際は `function egg:animation/play` を実行してください。
#:

## Verify.
execute unless entity @s[type=minecraft:block_display] run return fail
execute unless entity @s[tag=egg.animation] run return fail
execute unless data storage egg:animation/-set <<.repeat run return fail
execute unless data storage egg:animation/-set <<.path run return fail

## Get information.
data modify entity @s data.egg.animation._info set from storage egg:animation/-set <<

## Set scoreboards.
scoreboard players set @s egg.animation._tick 0
scoreboard players set @s egg.animation._page 0
scoreboard players set @s egg.animation._repeat 0
scoreboard players set @s egg.animation._count 0
execute store result score @s egg.animation._repeat run data get storage egg:animation/-set <<.repeat
execute store result score @s egg.animation._count run function egg:animation/-/macro/-get_count with storage egg:animation/-set <<
## Get timeline.
execute unless function egg:animation/-/-get_timeline run return fail
## Remove tags.
tag @s remove egg.animation._initial_point
tag @s remove egg.animation.finished
tag @s remove egg.animation.playing

## Success.
return 1