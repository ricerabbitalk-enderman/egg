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
#> 攻撃者と敵対関係にあるモブを対象に敵意ダメージを与えます。
#> 攻撃者が指定されているため、犠牲者は攻撃者に敵対します。
#:

## Verify.
execute unless data storage egg:shock/give_to_oppositions <<.distance run return fail
execute unless data storage egg:shock/give_to_oppositions <<.amount run data modify storage egg:shock/give_to_oppositions <<.amount set value 0
execute unless data storage egg:shock/give_to_oppositions <<.namespace run data modify storage egg:shock/give_to_oppositions <<.namespace set value "minecraft"
execute unless data storage egg:shock/give_to_oppositions <<.type run data modify storage egg:shock/give_to_oppositions <<.type set value "generic"
execute unless data storage egg:shock/give_to_oppositions <<.scale run data modify storage egg:shock/give_to_oppositions <<.scale set value 1.0
execute unless data storage egg:shock/give_to_oppositions <<.xv run data modify storage egg:shock/give_to_oppositions <<.xv set value 0.0
execute unless data storage egg:shock/give_to_oppositions <<.yv run data modify storage egg:shock/give_to_oppositions <<.yv set value 0.0
execute unless data storage egg:shock/give_to_oppositions <<.zv run data modify storage egg:shock/give_to_oppositions <<.zv set value 0.0
execute unless data storage egg:shock/give_to_oppositions <<.preprocess run data modify storage egg:shock/give_to_oppositions <<.preprocess set value "noop"

## Give damage.
data modify storage egg:shock << set from storage egg:shock/give_to_oppositions <<
data modify storage egg:pointer/-set <<uuid set from storage egg:shock <<.source
execute summon minecraft:snowball \
  if function egg:pointer/-enable \
  if function egg:pointer/-set \
  if function egg:shock/-/-enable \
  if function egg:shock/-/-set_target_to_oppositions \
  if function egg:shock/-/-set_source_position \
  if function egg:shock/-/-set_damage_data \
  if function egg:shock/-/-set_knockback_data \
  if function egg:shock/-/-give_by_source \
    run return run function egg:shock/-/-delete

## Error.
return fail