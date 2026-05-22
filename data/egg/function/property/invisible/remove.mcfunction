#:function ja
#@return 処理の成否 (必ず 1)
#@text
#> 永続的透明状態を解除します。
#:

## Clear effects.
effect clear @s minecraft:invisibility
## Remove tags.
tag @s remove egg.invisible

## Success.
return 1