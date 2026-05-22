#:function ja
#@return 処理の成否
#@text
#> オオカミベースの `egg.soul` エンティティを生成し、コマンド実行者 `@s`にリンクします。
#@code mcfunction
#> # オオカミベースの `egg.soul` を生成し、コマンド実行者 `@s` にリンク
#> function egg:soul/push/wolf
#> # on passengers on origin で egg.soul は参照可能
#> execute on passengers on origin run return run function egg:soul/-following
#:

## New.
execute summon minecraft:wolf if function egg:soul/-/-enable if function egg:soul/-/wolf/-initialize \
  run data modify storage egg:soul/push >>uuid set from entity @s UUID

## Push holder.
data modify storage egg:soul/holder/_push <<uuid set from storage egg:soul/push >>uuid
function egg:soul/holder/_push

## Set despawn.
function egg:despawn/-enable

## Success.
return 1