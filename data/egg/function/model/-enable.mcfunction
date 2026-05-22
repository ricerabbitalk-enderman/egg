#:module ja
#@text
#> BDEngine で生成したモデルを管理する機能を提供します。
#> 利用するには `mcbird-js/bde2egg.js` で事前にデータを変換する必要があります。
#:

#:function ja
#@return 処理の成否
#@text
#> モデル機能を有効化します。
#:

## Verify.
execute unless entity @s[type=minecraft:block_display] run return fail
execute if entity @s[tag=egg.model] run return fail

## Set data.
data modify entity @s data merge value {egg:{model:{}}}
## for Debug.
execute run data modify entity @s data.egg.model._debug set value {}
## Add tag.
tag @s add egg.model

## Success.
return 1