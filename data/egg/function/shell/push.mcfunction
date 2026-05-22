#:function ja
#@return 処理の成否
#@text
#> `egg.shell` エンティティを生成し、コマンド実行者 `@s`に騎乗させます。
#@code mcfunction
#> # egg.shell をコマンド実行者 `@s`の上に騎乗
#> function egg:shell/push
#> # on passengers でアクセス可能
#> execute on passengers if entity @s[tag=egg.shell] run say Blocking right click.
#:

function egg:shell/new
data modify storage egg:ride <<uuid set from storage egg:shell/new <<uuid
return run function egg:ride