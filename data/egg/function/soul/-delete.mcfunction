#:function ja
#@return 処理の成否
#@text
#> `egg.soul` エンティティを明示的に破棄します。
#> 基本 `egg.soul` は実体の消滅に連動して自動的に破棄されます。
#> 実体側のホルダーは破棄されないので、明示的に破棄する場合はそちらも kill コマンドで削除してください。
#@code mcfunction
#> # `egg.soul` の強制破棄
#> execute on passengers on origin run function egg:soul/-delete
#> # ホルダーも破棄してください
#> execute on passengers run kill @s
#:

## Verify.
execute unless entity @s[tag=egg.soul] run return fail

## Implements.
execute if entity @s[tag=egg.soul.allay] run return run function egg:soul/-/allay/-delete
execute if entity @s[tag=egg.soul.nautilus] run return run function egg:soul/-/nautilus/-delete
execute if entity @s[tag=egg.soul.wolf] run return run function egg:soul/-/wolf/-delete