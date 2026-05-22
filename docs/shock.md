## egg:alignment

### egg:alignment/conflict

| I/O | 詳細 |
| :--- | :--- |
| `score #egg:alignment/conflict\|<<this --` | 比較対象のアライメント |
| `score #egg:alignment/conflict\|<<that --` | 比較対象のアライメント |
| `return` | 対立関係かどうか |

2つのアライメントが対立関係かどうかを判定します。

`-1..1` 範囲外の無効なアライメント値が与えられた場合は判定が失敗し必ず `0` が帰ります。

アライメントについては **[アライメント](definition.md#アライメント)** を参照してください。

```mcfunction
# tag=a と tag=b のエンティティが敵対関係かどうか確認
scoreboard players operation #egg:alignment/conflict|<<this -- = @e[tag=a,limit=1] egg.alignment
scoreboard players operation #egg:alignment/conflict|<<that -- = @e[tag=b,limit=1] egg.alignment
execute if function egg:alignment/conflict run say They ar conflict!
```

### egg:alignment/friendly

| I/O | 詳細 |
| :--- | :--- |
| `score #egg:alignment/friendly\|<<this --` | 比較対象のアライメント |
| `score #egg:alignment/friendly\|<<that --` | 比較対象のアライメント |
| `return` | 友好関係かどうか |

2つのアライメントが友好関係かどうかを判定します。

`-1..1` 範囲外の無効なアライメント値が与えられた場合は判定が失敗し必ず `0` が帰ります。

アライメントについては **[アライメント](definition.md#アライメント)** を参照してください。

```mcfunction
# tag=a と tag=b のエンティティ友好関係かどうか確認
scoreboard players operation #egg:alignment/friendly|<<this -- = @e[tag=a,limit=1] egg.alignment
scoreboard players operation #egg:alignment/friendly|<<that -- = @e[tag=b,limit=1] egg.alignment
execute if function egg:alignment/friendly run say Friendly!
```

## egg:shock

### egg:shock/give_by_no_one

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:shock/give_by_no_one <<.distance` | 現在位置からの影響距離 (必須) |
| `storage egg:shock/give_by_no_one <<.amount` | ダメージ量 (任意 : 省略時 0.0) |
| `storage egg:shock/give_by_no_one <<.namespace` | ダメージ種類の名前空間 (任意 : 省略時 "minecraft") |
| `storage egg:shock/give_by_no_one <<.type` | ダメージ種類 (任意 : "generic") |
| `storage egg:shock/give_by_no_one <<.scale` | ノックバック倍率 (任意 : 1.0) |
| `storage egg:shock/give_by_no_one <<.xv` | 加算ノックバック x 速度 (任意 : 0.0) |
| `storage egg:shock/give_by_no_one <<.yv` | 加算ノックバック y 速度 (任意 : 0.0) |
| `storage egg:shock/give_by_no_one <<.zv` | 加算ノックバック z 速度 (任意 : 0.0) |
| `storage egg:shock/give_by_no_one <<.preprocess` | 前処理関数の別名 (任意) |
| `return` | 処理の成否 |

全てのモブを対象に災害ダメージを与えます。

攻撃者の指定がないため、犠牲者は敵対行動を取りません。

```mcfunction
# 最小限のダメージ処理
data modify storage egg:shock/give_by_no_one << set value {distance:8,amount:12}
function egg:shock/-/-give_by_no_one
```

### egg:shock/give_to_anyone

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:shock/give_to_anyone <<.source` | 攻撃者の UUID (必須) |
| `storage egg:shock/give_to_anyone <<.distance` | 現在位置からの影響距離 (必須) |
| `storage egg:shock/give_to_anyone <<.amount` | ダメージ量 (任意 : 省略時 0.0) |
| `storage egg:shock/give_to_anyone <<.namespace` | ダメージ種類の名前空間 (任意 : 省略時 "minecraft") |
| `storage egg:shock/give_to_anyone <<.type` | ダメージ種類 (任意 : "generic") |
| `storage egg:shock/give_to_anyone <<.scale` | ノックバック倍率 (任意 : 1.0) |
| `storage egg:shock/give_to_anyone <<.xv` | 加算ノックバック x 速度 (任意 : 0.0) |
| `storage egg:shock/give_to_anyone <<.yv` | 加算ノックバック y 速度 (任意 : 0.0) |
| `storage egg:shock/give_to_anyone <<.zv` | 加算ノックバック z 速度 (任意 : 0.0) |
| `storage egg:shock/give_to_anyone <<.preprocess` | 前処理関数の別名 (任意) |
| `return` | 処理の成否 |

攻撃者以外の全てのモブを対象に敵意ダメージを与えます。

攻撃者が指定されているため、犠牲者は攻撃者に敵対します。

### egg:shock/give_to_oppositions

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:shock/give_to_oppositions <<.source` | 攻撃者の UUID (必須) |
| `storage egg:shock/give_to_oppositions <<.distance` | 現在位置からの影響距離 (必須) |
| `storage egg:shock/give_to_oppositions <<.amount` | ダメージ量 (任意 : 省略時 0.0) |
| `storage egg:shock/give_to_oppositions <<.namespace` | ダメージ種類の名前空間 (任意 : 省略時 "minecraft") |
| `storage egg:shock/give_to_oppositions <<.type` | ダメージ種類 (任意 : "generic") |
| `storage egg:shock/give_to_oppositions <<.scale` | ノックバック倍率 (任意 : 1.0) |
| `storage egg:shock/give_to_oppositions <<.xv` | 加算ノックバック x 速度 (任意 : 0.0) |
| `storage egg:shock/give_to_oppositions <<.yv` | 加算ノックバック y 速度 (任意 : 0.0) |
| `storage egg:shock/give_to_oppositions <<.zv` | 加算ノックバック z 速度 (任意 : 0.0) |
| `storage egg:shock/give_to_oppositions <<.preprocess` | 前処理関数の別名 (任意) |
| `return` | 処理の成否 |

攻撃者と敵対関係にあるモブを対象に敵意ダメージを与えます。

攻撃者が指定されているため、犠牲者は攻撃者に敵対します。

攻撃者との関係性は **[アライメント](definition.md#アライメント)** で判断されます。

### egg:shock/give_to_others

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:shock/give_to_others <<.source` | 攻撃者の UUID (必須) |
| `storage egg:shock/give_to_others <<.distance` | 現在位置からの影響距離 (必須) |
| `storage egg:shock/give_to_others <<.amount` | ダメージ量 (任意 : 省略時 0.0) |
| `storage egg:shock/give_to_others <<.namespace` | ダメージ種類の名前空間 (任意 : 省略時 "minecraft") |
| `storage egg:shock/give_to_others <<.type` | ダメージ種類 (任意 : "generic") |
| `storage egg:shock/give_to_others <<.scale` | ノックバック倍率 (任意 : 1.0) |
| `storage egg:shock/give_to_others <<.xv` | 加算ノックバック x 速度 (任意 : 0.0) |
| `storage egg:shock/give_to_others <<.yv` | 加算ノックバック y 速度 (任意 : 0.0) |
| `storage egg:shock/give_to_others <<.zv` | 加算ノックバック z 速度 (任意 : 0.0) |
| `storage egg:shock/give_to_others <<.preprocess` | 前処理関数の別名 (任意) |
| `return` | 処理の成否 |

攻撃者と友好関係にないモブを対象に敵意ダメージを与えます。

攻撃者が指定されているため、犠牲者は攻撃者に敵対します。

攻撃者との関係性は **[アライメント](definition.md#アライメント)** で判断されます。

### egg:shock/give_to_target

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:shock/give_to_target <<.source` | 攻撃者の UUID (必須) |
| `storage egg:shock/give_to_target <<.distance` | 現在位置からの影響距離 (必須) |
| `storage egg:shock/give_to_target <<.amount` | ダメージ量 (任意 : 省略時 0.0) |
| `storage egg:shock/give_to_target <<.namespace` | ダメージ種類の名前空間 (任意 : 省略時 "minecraft") |
| `storage egg:shock/give_to_target <<.type` | ダメージ種類 (任意 : "generic") |
| `storage egg:shock/give_to_target <<.scale` | ノックバック倍率 (任意 : 1.0) |
| `storage egg:shock/give_to_target <<.xv` | 加算ノックバック x 速度 (任意 : 0.0) |
| `storage egg:shock/give_to_target <<.yv` | 加算ノックバック y 速度 (任意 : 0.0) |
| `storage egg:shock/give_to_target <<.zv` | 加算ノックバック z 速度 (任意 : 0.0) |
| `storage egg:shock/give_to_target <<.preprocess` | 前処理関数の別名 (任意) |
| `return` | 処理の成否 |

攻撃者の攻撃対象 `on target` にのみダメージを与えます。

主に敵対したモブのみを狙ってダメージを与える際に利用します。