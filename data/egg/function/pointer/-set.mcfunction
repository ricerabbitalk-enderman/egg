#:function ja
#@in storage uuid 参照するエンティティの UUID
#@return 処理の成否
#@text
#> 雪玉ポインタの参照先を設定します。
#> ポインタ同士を直接相互参照はできません。
#:

## Verify.
execute unless entity @s[type=minecraft:snowball] run return fail
execute unless entity @s[tag=egg.pointer] run return fail

## Remove.
execute unless data storage egg:pointer/-set <<uuid run data remove entity @s Owner
## Set.
execute if data storage egg:pointer/-set <<uuid run data modify entity @s Owner set from storage egg:pointer/-set <<uuid

## Success.
return 1