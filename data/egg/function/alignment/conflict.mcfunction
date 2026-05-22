#:module ja
#@text
#> プレイヤーとの関係性（アライメント）を以下のように定義し、それぞれのモブとの関係性を判定する機能を提供します。
#@table
#> |友好的|中立的|敵対的|
#> |:--:|:--:|:--:|
#> |1|0|-1|
#@text
#> 召喚時に `egg.manual` のないモブは全てスコア `egg.alignemnt` に適切な値を設定・更新されていきます。
#> 例えば、クモは日中は 0 で薄暗くなると -1 に正しく変化します。
#> `egg.manual` はカスタムモブなどに適用し、手動で適切なアライメントを設定する必要があります。
#> `scoreboard players set @s egg.alignment 1` のように設定しない限りアライメントが存在しない状態になり
#> `egg:shock` などの攻撃対象にすらならなくなる点に注意してください。
#>
#> また、これはあくまでプレイヤー全体基準での関係性です。
#> `egg.alignment` でどちらも 1 であるプレイヤー同士の敵対関係 (PvP のチーム分け) を表現することはできません。
#>
#> 敵モブ同士の喧嘩も表現できません。
#> 仮に敵同士で争っていても、プレイヤー全体から見ればどちらも -1 であることには変わりないからです。
#:

#:function ja
#@in score this 比較対象のアライメント
#@in score that 比較対象のアライメント
#@return 対立関係かどうか
#@text
#> 2つのアライメントが対立関係かどうかを判定します。
#> `-1..1` 範囲外の無効なアライメント値が与えられた場合は判定が失敗し必ず `0` が帰ります。
#@code mcfunction
#> # tag=a と tag=b のエンティティが敵対関係かどうか確認
#> scoreboard players operation #egg:alignment/conflict|<<this -- = @e[tag=a,limit=1] egg.alignment
#> scoreboard players operation #egg:alignment/conflict|<<that -- = @e[tag=b,limit=1] egg.alignment
#> execute if function egg:alignment/conflict run say They ar conflict!
#:

## Get alignment.
scoreboard players operation #egg:alignment/conflict|relationship -- = #egg:alignment/conflict|<<this --
## Check relationship.
scoreboard players operation #egg:alignment/conflict|relationship -- *= #egg:alignment/conflict|<<that --
## Conflict.
execute if score #egg:alignment/conflict|relationship -- matches -1 run return 1
## not Conflict.
return 0