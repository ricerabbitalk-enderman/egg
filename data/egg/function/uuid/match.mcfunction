#:function ja
#@in storage uuid マッチ対象の UUID
#@return UUID が一致するかどうか
#@text
#> UUID がコマンド実行者 `@s` と一致するかどうか取得します。
#> `as` を使い具体的な複数のエンティティから対象の UUID を持つものを検索するのに適しています。
#> ただし、検索対象のエンティティが多すぎる場合は処理効率が大幅に低下する点に注意してください。
#> 距離や種類などの条件で可能な限り数を絞り込むことで回避できます。
#@code mcfunction
#> # キツネの信頼対象（のうちの一人）を探し出して発光させる
#> execute as @e[type=fox,limit=1] run data modify storage egg:uuid/match <<uuid set from entity @s Trusted[0]
#> execute as @a if function egg:uuid/match run effect give @s glowing 5 0 true
#>
#> # 悪い例
#> # 全てのエンティティを対象にする @e を使用するとその数だけ比較作業が行われます
#> # 仮に検索の最初でヒットしても試行回数は変わらないので注意してください
#> execute as @e if function egg:uuid/match run effect give @s glowing 5 0 true
#>
#> # 良い例
#> # 例えばその場に召喚したエンティティを探したいなら distance=..0.1 で距離を限定すると検索対象が数体に収まります
#> execute summon minecraft:bee run data modify storage egg:uuid/match <<uuid set from entity @s UUID
#> execute as @e[distance=..0.1,type=minecraft:bee] if function egg:uuid/match run say It is a summoned bee.
#:

## Check.
execute unless data storage egg:uuid/match <<uuid run return 0

## Set That.
execute store result score #egg:uuid/match.that[0] -- run data get storage egg:uuid/match <<uuid[0]
execute store result score #egg:uuid/match.that[1] -- run data get storage egg:uuid/match <<uuid[1]
execute store result score #egg:uuid/match.that[2] -- run data get storage egg:uuid/match <<uuid[2]
execute store result score #egg:uuid/match.that[3] -- run data get storage egg:uuid/match <<uuid[3]
## Set This.
data modify storage egg:uuid/match uuid set from entity @s UUID
execute store result score #egg:uuid/match.this[0] -- run data get storage egg:uuid/match uuid[0]
execute store result score #egg:uuid/match.this[1] -- run data get storage egg:uuid/match uuid[1]
execute store result score #egg:uuid/match.this[2] -- run data get storage egg:uuid/match uuid[2]
execute store result score #egg:uuid/match.this[3] -- run data get storage egg:uuid/match uuid[3]

## Matched.
execute \
  if score #egg:uuid/match.this[0] -- = #egg:uuid/match.that[0] -- \
  if score #egg:uuid/match.this[1] -- = #egg:uuid/match.that[1] -- \
  if score #egg:uuid/match.this[2] -- = #egg:uuid/match.that[2] -- \
  if score #egg:uuid/match.this[3] -- = #egg:uuid/match.that[3] -- \
    run return 1

## Unmatched.
return 0