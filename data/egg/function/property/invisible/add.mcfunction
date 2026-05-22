#:module ja
#@text
#> 永続的なエフェクト機能（プロパティ）を提供します。
#:

#:function ja
#@return 処理の成否 (必ず 1)
#@text
#> 永続的透明状態を付与します。
#:

## Give effects.
effect give @s[type=!minecraft:creeper] minecraft:invisibility infinite 127 true
effect give @s[type=minecraft:creeper] minecraft:invisibility 5 127 true
## Add tags.
tag @s add egg.invisible

## Success.
return 1