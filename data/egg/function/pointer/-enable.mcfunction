#:module ja
#@text
#> エンティティの参照を管理する雪玉ポインタ機能を提供します。
#> 雪玉に `NoGravity`, `Invulnerable` を設定することで `on origin` でエンティティを参照できるポインタエンティティを実現できます。
#:

#:function ja
#@return 処理の成否
#@text
#> コマンド実行者 `@s` の雪玉を対象に雪玉ポインタ機能を有効化します。
#:

## Verify.
execute unless entity @s[type=minecraft:snowball] run return fail
execute if entity @s[tag=egg.pointer] run return fail

## Set data.
data modify entity @s Invulnerable set value true
data modify entity @s Silent set value true
data modify entity @s NoGravity set value true
data modify entity @s Item set value {id:"minecraft:barrier",count:1,components:{"minecraft:item_model":"minecraft:air"}}
## Add tags.
tag @s add egg.pointer

## Success.
return 1