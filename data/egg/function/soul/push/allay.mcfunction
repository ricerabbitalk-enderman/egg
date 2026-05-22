#:module ja
#@text
#> 懐き（フォロー）と戦闘用思考回路を兼ね備えた魂のふるまいを示す `egg.soul` 機能を提供します。
#> function egg:soul/push/xxxx でベースとなるモブの魂を生成し、コマンド実行者 `@s`にそれを参照するホルダーを騎乗させます。
#> 実体であるコマンド実行者 `@s`から on passengers on origin で `egg.soul` エンティティを参照可能です。
#:

#:function ja
#@return 処理の成否
#@text
#> アレイベースの `egg.soul` エンティティを生成し、コマンド実行者 `@s`にリンクします。
#@code mcfunction
#> # アレイベースの `egg.soul` を生成し、コマンド実行者 `@s`にリンク
#> function egg:soul/push/allay
#> # on passengers on origin で `egg.soul` は参照可能
#> execute on passengers on origin run return run function egg:soul/-following
#:

## New.
execute summon minecraft:allay if function egg:soul/-/-enable if function egg:soul/-/allay/-initialize \
  run data modify storage egg:soul/push >>uuid set from entity @s UUID

## Push holder.
data modify storage egg:soul/holder/_push <<uuid set from storage egg:soul/push >>uuid
function egg:soul/holder/_push

## Set despawn.
function egg:despawn/-enable

## Success.
return 1