#:function ja
#@in storage .distance 現在位置からの影響距離 (必須)
#@in storage .amount ダメージ量 (任意 : 省略時 0.0)
#@in storage .namespace ダメージ種類の名前空間 (任意 : 省略時 "minecraft")
#@in storage .type ダメージ種類 (任意 : "generic")
#@in storage .scale ノックバック倍率 (任意 : 1.0)
#@in storage .xv 加算ノックバック x 速度 (任意 : 0.0)
#@in storage .yv 加算ノックバック y 速度 (任意 : 0.0)
#@in storage .zv 加算ノックバック z 速度 (任意 : 0.0)
#@in storage .preprocess 前処理関数の別名 (任意)
#@return 処理の成否
#@text
#> 全てのモブを対象に災害ダメージを与えます。
#> 攻撃者の指定がないため、犠牲者は敵対行動を取りません。
#@code mcfunction
#> # 最小限のダメージ処理
#> data modify storage egg:shock/give_by_no_one << set value {distance:8,amount:12}
#> function egg:shock/-/-give_by_no_one
#:

## Verify.
execute unless data storage egg:shock/give_by_no_one <<.distance run return fail
execute unless data storage egg:shock/give_by_no_one <<.amount run data modify storage egg:shock/give_by_no_one <<.amount set value 0
execute unless data storage egg:shock/give_by_no_one <<.namespace run data modify storage egg:shock/give_by_no_one <<.namespace set value "minecraft"
execute unless data storage egg:shock/give_by_no_one <<.type run data modify storage egg:shock/give_by_no_one <<.type set value "generic"
execute unless data storage egg:shock/give_by_no_one <<.scale run data modify storage egg:shock/give_by_no_one <<.scale set value 1.0
execute unless data storage egg:shock/give_by_no_one <<.xv run data modify storage egg:shock/give_by_no_one <<.xv set value 0.0
execute unless data storage egg:shock/give_by_no_one <<.yv run data modify storage egg:shock/give_by_no_one <<.yv set value 0.0
execute unless data storage egg:shock/give_by_no_one <<.zv run data modify storage egg:shock/give_by_no_one <<.zv set value 0.0
execute unless data storage egg:shock/give_by_no_one <<.preprocess run data modify storage egg:shock/give_by_no_one <<.preprocess set value "noop"

## Give damage.
data modify storage egg:shock << set from storage egg:shock/give_by_no_one <<
execute summon minecraft:snowball \
  if function egg:shock/-/-enable \
  if function egg:shock/-/-set_target_to_anyone \
  if function egg:shock/-/-set_damage_data \
  if function egg:shock/-/-set_knockback_data \
  if function egg:shock/-/-give_by_no_one \
    run return run function egg:shock/-/-delete

## Error.
return fail