#:module ja
#@text
#> BDEngine をベースとしたモデルデータ `egg.model` にアニメーション機能を提供します。
#> 前提として `egg.model` エンティティにのみ付与できる機能です。
#:

#:function ja
#@return 処理の成否
#@text
#> アニメーション機能を有効化します。
#@code mcfunction
#> # モデルを表示しアニメーションを再生する
#> data modify storage egg:model/-show <<path set value <model_name>
#> data modify storage egg:animation/-set << set value {repeat:-1,path:<model_name>-<animation_name>}
#>
#> function egg:bdengine/<model_name>/new
#> execute as @e[tag=_uninitialized] \
#>   if function egg:model/-show \
#>   if function egg:animation/-enable \
#>   if function egg:animation/-set \
#>   if function egg:animation/-play \
#>     run return run tag @e[tag=_uninitialized] remove _uninitialized
#>
#> return fail
#:

## Verify.
execute unless entity @s[type=minecraft:block_display] run return fail
execute if entity @s[tag=egg.animation] run return fail

## Set scoreboards.
scoreboard players set @s egg.animation._tick 0
scoreboard players set @s egg.animation._page 0
scoreboard players set @s egg.animation._count 0
scoreboard players set @s egg.animation._repeat 0
## Set data.
data modify entity @s data merge value {egg:{animation:{}}}
## for Debug.
#data modify entity @s data.egg.animation._debug set value {}
## Add tags.
tag @s add egg.animation

## Success.
return 1
