#:function ja
#@in storage .source 攻撃者の UUID (必須)
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
#> 攻撃者と友好関係にないモブを対象に敵意ダメージを与えます。
#> 攻撃者が指定されているため、犠牲者は攻撃者に敵対します。
#:

## Verify.
execute unless data storage egg:shock/give_to_others <<.distance run return fail
execute unless data storage egg:shock/give_to_others <<.amount run data modify storage egg:shock/give_to_others <<.amount set value 0
execute unless data storage egg:shock/give_to_others <<.namespace run data modify storage egg:shock/give_to_others <<.namespace set value "minecraft"
execute unless data storage egg:shock/give_to_others <<.type run data modify storage egg:shock/give_to_others <<.type set value "generic"
execute unless data storage egg:shock/give_to_others <<.scale run data modify storage egg:shock/give_to_others <<.scale set value 1.0
execute unless data storage egg:shock/give_to_others <<.xv run data modify storage egg:shock/give_to_others <<.xv set value 0.0
execute unless data storage egg:shock/give_to_others <<.yv run data modify storage egg:shock/give_to_others <<.yv set value 0.0
execute unless data storage egg:shock/give_to_others <<.zv run data modify storage egg:shock/give_to_others <<.zv set value 0.0
execute unless data storage egg:shock/give_to_others <<.preprocess run data modify storage egg:shock/give_to_others <<.preprocess set value "noop"

## Give damage.
data modify storage egg:shock << set from storage egg:shock/give_to_others <<
data modify storage egg:pointer/-set <<uuid set from storage egg:shock <<.source
execute summon minecraft:snowball \
  if function egg:pointer/-enable \
  if function egg:pointer/-set \
  if function egg:shock/-/-enable \
  if function egg:shock/-/-set_target_to_others \
  if function egg:shock/-/-set_source_position \
  if function egg:shock/-/-set_damage_data \
  if function egg:shock/-/-set_knockback_data \
  if function egg:shock/-/-give_by_source \
    run return run function egg:shock/-/-delete

## Error.
return fail