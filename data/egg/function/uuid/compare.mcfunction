#:module ja
#@text
#> UUID の比較をする機能を提供します。
#:

#:function ja
#@in storage this 比較対象の UUID
#@in storage that 比較対象の UUID
#@return UUID が一致するかどうか
#@text
#> 2つの UUID が一致するかどうか取得します。
#> 双方のデータが両方存在しない場合も不一致となります (0 = 0 のような判定は存在しません)。
#> 手元に UUID しかない場合の比較に適しています。
#> 具体的なエンティティと対象の UUID が一致するかを調べる（検索する）場合は `egg:uuid/match` の利用が有効です。
#@code mcfunction
#> # tag=a を持つエンティティと tag=b を持つエンティティの UUID を比較
#> # UUID が一致するなら同一のエンティティである (tag=a も tag=b も持つ)
#> data modify storage egg:uuid/compare <<this set from entity @e[tag=a,limit=1] UUID
#> data modify storage egg:uuid/compare <<that set from entity @e[tag=b,limit=1] UUID
#> execute if function egg:uuid/compare run say They are the same.
#:

## Check.
execute unless data storage egg:uuid/compare <<this unless data storage egg:uuid/compare <<that run return 0
execute unless data storage egg:uuid/compare <<this run return 0
execute unless data storage egg:uuid/compare <<that run return 0

## Set That.
execute store result score #egg:uuid/compare|that[0] -- run data get storage egg:uuid/compare <<that[0]
execute store result score #egg:uuid/compare|that[1] -- run data get storage egg:uuid/compare <<that[1]
execute store result score #egg:uuid/compare|that[2] -- run data get storage egg:uuid/compare <<that[2]
execute store result score #egg:uuid/compare|that[3] -- run data get storage egg:uuid/compare <<that[3]
## Set This.
execute store result score #egg:uuid/compare|this[0] -- run data get storage egg:uuid/compare <<this[0]
execute store result score #egg:uuid/compare|this[1] -- run data get storage egg:uuid/compare <<this[1]
execute store result score #egg:uuid/compare|this[2] -- run data get storage egg:uuid/compare <<this[2]
execute store result score #egg:uuid/compare|this[3] -- run data get storage egg:uuid/compare <<this[3]

## Clear parameters.
data remove storage egg:uuid/compare <<that
data remove storage egg:uuid/compare <<this

## Equals.
execute \
  if score #egg:uuid/compare|this[0] -- = #egg:uuid/compare|that[0] -- \
  if score #egg:uuid/compare|this[1] -- = #egg:uuid/compare|that[1] -- \
  if score #egg:uuid/compare|this[2] -- = #egg:uuid/compare|that[2] -- \
  if score #egg:uuid/compare|this[3] -- = #egg:uuid/compare|that[3] -- \
    run return 1

## Not equals.
return 0