#:function ja
#>２つのアライメントが友好関係かどうかを判定します。
#>`-1..1` 範囲外の無効なアライメント値が与えられた場合は判定が失敗し必ず `0` が帰ります。
#@in score this 比較対象のアライメント
#@in score that 比較対象のアライメント
#@return 友好関係かどうか
#@code mcfunction
#># tag=a と tag=b のエンティティ友好関係かどうか確認
#>scoreboard players operation #egg:alignment/friendly|<<this -- = @e[tag=a,limit=1] egg.alignment
#>scoreboard players operation #egg:alignment/friendly|<<that -- = @e[tag=b,limit=1] egg.alignment
#>execute if function egg:alignment/friendly run say Friendly!
#:

## Get alignment.
scoreboard players operation #egg:alignment/friendly|relationship -- = #egg:alignment/friendly|<<this --
## Check relationship.
scoreboard players operation #egg:alignment/friendly|relationship -- *= #egg:alignment/friendly|<<that --
## Friendly.
execute if score #egg:alignment/friendly|relationship -- matches 1 run return 1
## not Friendly.
return 0