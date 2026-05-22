#:module ja
#@text
#> egg.alignment による関係性を考慮した範囲ダメージとノックバック機能を提供します。
#> ダメージ・ノックバック処理の前に前処理が可能です。
#> `<<.preprocess` で関数タグ名を指定することで犠牲者をコマンド実行者 `@s`として以下の関数が前処理として呼び出されます。
#> `function #egg:preprocess/<関数タグ名>` (`data/egg/tags/function/preprocess/<関数タグ名>.mcfunction`)
#> 前処理の関数の戻り値は基本 0 以外の値を返すようにしてください。
#> 0 を返した場合は、その時点でダメージ処理全体が中断されます。
#:

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
#> 攻撃者の攻撃対象 `on target` にのみダメージを与えます。
#> 主に敵対したモブのみを狙ってダメージを与える際に利用します。
#:

## Verify.
#execute unless data storage egg:shock/give_to_target <<.distance run return fail
execute unless data storage egg:shock/give_to_target <<.amount run data modify storage egg:shock/give_to_target <<.amount set value 0
execute unless data storage egg:shock/give_to_target <<.namespace run data modify storage egg:shock/give_to_target <<.namespace set value "minecraft"
execute unless data storage egg:shock/give_to_target <<.type run data modify storage egg:shock/give_to_target <<.type set value "generic"
execute unless data storage egg:shock/give_to_target <<.scale run data modify storage egg:shock/give_to_target <<.scale set value 1.0
execute unless data storage egg:shock/give_to_target <<.xv run data modify storage egg:shock/give_to_target <<.xv set value 0.0
execute unless data storage egg:shock/give_to_target <<.yv run data modify storage egg:shock/give_to_target <<.yv set value 0.0
execute unless data storage egg:shock/give_to_target <<.zv run data modify storage egg:shock/give_to_target <<.zv set value 0.0
execute unless data storage egg:shock/give_to_target <<.preprocess run data modify storage egg:shock/give_to_target <<.preprocess set value "noop"

## Give damage.
data modify storage egg:shock << set from storage egg:shock/give_to_target <<
data modify storage egg:pointer/-set <<uuid set from storage egg:shock <<.source
execute summon minecraft:snowball \
  if function egg:pointer/-enable \
  if function egg:pointer/-set \
  if function egg:shock/-/-enable \
  if function egg:shock/-/-set_source_position \
  if function egg:shock/-/-set_damage_data \
  if function egg:shock/-/-set_knockback_data \
  if function egg:shock/-/-give_to_target \
    run return run function egg:shock/-/-delete

## Error.
return fail