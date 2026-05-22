#:function ja
#@return 処理の成否
#@text
#> `egg.shell` エンティティを破壊します。

## Delete.
execute on passengers run ride @s dismount
ride @s dismount
teleport ~ -1024 ~
kill @s

return 1