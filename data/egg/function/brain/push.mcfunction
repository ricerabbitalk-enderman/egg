#:function ja
#>egg.brain エンティティを生成し、コマンド実行者 `@s`に騎乗させます。
#@return 処理の成否
#@code mcfunction
#># egg.brain をコマンド実行者 `@s`の上に騎乗
#>function egg:brain/push
#># on passengers でアクセス可能
#>execute on passengers if entity @s[tag=egg.brain] run say Blocking right click.
#:

## Push.
function egg:brain/new
data modify storage egg:ride <<uuid set from storage egg:brain/new <<uuid
return run function egg:ride