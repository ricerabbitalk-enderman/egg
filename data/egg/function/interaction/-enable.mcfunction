#:module ja
#@textt
#> クリックによりコールバックが実行されるイベント型機能を実装します。
#:

#:function ja
#@in storage .attack 左クリック（攻撃）時のコールバック用 egg.pack 関数データ
#@in storage .interact 右クリック（操作）時のコールバック用 egg.pack 関数データ
#@return 処理の成否
#@text
#> `egg.interaction` 機能を有効化します。
#> 右クリック時・左クリック時に実行したい関数を `egg.pack` 関数データで指定します。
#@code mcfunction
#> # 生成したインタラクションに egg.interaction 機能を有効化
#> data modify storage egg:interaction/-enable << set value { \
#>   attack:{name:"xxx:yyyy/on_attacked",data:{flag:true}}, \
#>   interact:{name:"xxx:yyyy/on_interacted",data:{value:5}} \
#> }
#> execute summon minecraft:interaction run function egg:interaction/-enable
#:

## Verify.
execute unless entity @s[type=minecraft:interaction] run return fail
execute if entity @s[tag=egg.interaction] run return fail

## Set data.
data modify entity @s data merge value {egg:{interaction:{}}}
data modify entity @s data.egg.interaction._attack set from storage egg:interaction/-enable <<.attack
data modify entity @s data.egg.interaction._interact set from storage egg:interaction/-enable <<.interact
## Add tags.
tag @s add egg.interaction

## Success.
return 1