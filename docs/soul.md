## egg:soul

### egg:soul/push/allay

| I/O | 詳細 |
| :--- | :--- |
| `return` | 処理の成否 |

アレイベースの `egg.soul` エンティティを生成し、コマンド実行者 `@s`にリンクします。

```mcfunction
# アレイベースの `egg.soul` を生成し、コマンド実行者 `@s`にリンク
function egg:soul/push/allay
# on passengers on origin で `egg.soul` は参照可能
execute on passengers on origin run return run function egg:soul/-following
```

### egg:soul/push/nautilus

| I/O | 詳細 |
| :--- | :--- |
| `return` | 処理の成否 |

オウムガイベースの `egg.soul` エンティティを生成し、コマンド実行者 `@s` にリンクします。

```mcfunction
# オウムガイベースの egg.soul を生成し、コマンド実行者 `@s`にリンク
function egg:soul/push/nautilus
# on passengers on origin で egg.soul は参照可能
execute on passengers on origin run return run function egg:soul/-following
```

### egg:soul/push/wolf

| I/O | 詳細 |
| :--- | :--- |
| `return` | 処理の成否 |

オオカミベースの `egg.soul` エンティティを生成し、コマンド実行者 `@s`にリンクします。

```mcfunction
# オオカミベースの `egg.soul` を生成し、コマンド実行者 `@s` にリンク
function egg:soul/push/wolf
# on passengers on origin で egg.soul は参照可能
execute on passengers on origin run return run function egg:soul/-following
```

### egg:soul/-attacking

| I/O | 詳細 |
| :--- | :--- |
| `return` | 攻撃中かどうか |

egg.soul エンティティが攻撃中かどうかを取得します。

攻撃中の場合は `on passengers` が `egg.brain` であることが保証され `on passengers on target` で攻撃対象を参照可能です。

```mcfunction
# 攻撃中か確認し、攻撃中なら攻撃対象を発光させる。
execute on passengers on origin if function egg:soul/-attacking on passengers on target \
  run effect give @s minecraft:glowing 5 0 true
```

### egg:soul/-follow

| I/O | 詳細 |
| :--- | :--- |
| `uuid フォロー対象のエンティティの UUID` | UUID |
| `return` | 処理の成否 |

`egg.soul` エンティティが懐く対象（フォロー）を設定します。

フォローによるふるまいの変化はベースエンティティ依存です。

```mcfunction
# 一番近くのプレイヤーをフォローする。
data modify storage egg:soul/-follow <<uuid set from entity @p UUID
execute on passengers on origin run function egg:soul/-follow
```

### egg:soul/-following_to

| I/O | 詳細 |
| :--- | :--- |
| `uuid フォロー対象のエンティティの UUID` | UUID |
| `return` | 処理の成否 |

`egg.soul` エンティティが懐く対象（フォロー）しているエンティティの UUID を取得します。

```mcfunction
# フォロー対象のプレイヤーを検索する（発光させる）
execute on passengers on origin run function egg:soul/-following_to
data modify storage egg:uuid/match <<uuid set from storage egg:soul/-following_to >>uuid
execute as @a if function egg:uuid/match run effect give @s minecraft:glowing 5 0 true
```

### egg:soul/-following

| I/O | 詳細 |
| :--- | :--- |
| `return` | フォローしているかどうか |

`egg.soul` エンティティが懐く対象（フォロー）しているかどうかを取得します。

`function egg:soul/-followed_to` より軽量で、単純にフォローしているかどうかのみの取得に適しています。

```mcfunction
# フォローしているかどうかを通知
execute on passengers on origin if function egg:soul/-following run say egg.soul follow anyone.
```

### egg:soul/-indicate

| I/O | 詳細 |
| :--- | :--- |
| `rotation 魂の向き` |  |
| `return` | 処理の成否 |

`egg.soul` エンティティの向きを示します。

攻撃中なら攻撃対象の方を示し、そうでなければ魂の向きを示します。

後者の場合は実体と魂に身長差があるので、現時点では角度調整が必要な可能性があります（現状は魂の視線の 4m 先を目標点としています）。

```mcfunction
# 魂の向きを取得
execute on passengers on origin run function egg:soul/-indicate
# 向きを実体に設定
data modify entity @s Rotation set from storage egg:soul/-indicate >>rotation
# 攻撃中でないときは実体の身長差があまりに大きければ角度の微調整が必要？
execute on passengers on origin store result score #indicate -- run function egg:soul/-indicate
execute unless score #indicate -- matches 0 run rotate @s ~ ~-15
```

### egg:soul/-lift

| I/O | 詳細 |
| :--- | :--- |
| `return` | 処理の成否 |

`egg.soul` エンティティに攻撃対象を削除し、戦闘態勢を解除します。

```mcfunction
# 攻撃対象を削除
execute on passengers on origin run function egg:soul/-lift
```

### egg:soul/-target

| I/O | 詳細 |
| :--- | :--- |
| `uuid 攻撃対象のエンティティの UUID` | UUID |
| `return` | 処理の成否 |

`egg.soul` エンティティに攻撃対象を設定し、戦闘態勢に移ります。

```mcfunction
# 一番近いプレイヤーにとっての敵を攻撃対象に設定
execute at @s run data modify storage egg:soul/-target <<uuid set from entity @e[sort=nearest,scores={egg.alignment=-1},limit=1] UUID
execute on passengers on origin run function egg:soul/-target
```

### egg:soul/-unfollow

| I/O | 詳細 |
| :--- | :--- |
| `return` | 処理の成否 |

`egg.soul` エンティティが懐く対象（フォロー）を設定します。

```mcfunction
# フォローを解除
execute on passengers on origin run function egg:soul/-unfollow
```

## egg:brain

### egg:brain/-infight

| I/O | 詳細 |
| :--- | :--- |
| `return` | 接近戦状態かどうか |

接近戦を挑む思考回路かどうかを取得します。

### egg:brain/-launch_infight

| I/O | 詳細 |
| :--- | :--- |
| `return` | 処理の成否 |

接近戦を挑む思考回路に設定します。

### egg:brain/-launch_outbox

| I/O | 詳細 |
| :--- | :--- |
| `return` | 処理の成否 |

遠距離戦を挑む思考回路に設定します。

## egg:despawn

### egg:despawn/-disable

| I/O | 詳細 |
| :--- | :--- |
| `return` | 処理の成否 (必ず 1) |

`egg.despawn` 機能を無効化します。

飼いならしなどの変化でデスポーンを無効化したいときに使います。

```mcfunction
# egg.despawn 機能を持つ特殊モブが飼いならされていれば egg.dwspawn 機能を無効化
execute as @e[tag=egg.despawn] if data entity @s Owner run function egg:despawn/-disable
```

### egg:despawn/-enable

| I/O | 詳細 |
| :--- | :--- |
| `return` | 処理の成否 (必ず 1) |

`egg.despawn` 機能を有効化します。

`egg.despwan` 機能が有効化されたエンティティは、全プレイヤーから 72m よりも離れた段階で強制デスポーンします。

64m より離れた場合も、ある程度の生存期間まで範囲外に存在し続けると強制デスポーンします。

カスタムモブのようにシステムが自動デスポーンできないエンティティをある程度自然にデスポーンさせることができます。

```mcfunction
# 召喚した特殊モブ（今回は自動デスポーンの無効化）に egg.despawn 機能を有効化
summon minecraft:wolf ~ ~ ~ {Tags:["_uninitialized"],PersistenceRequired:true}
execute as @e[distance=..0.1,tag=_uninitialized] if function egg:despawn/-enable run tag @s remove _uninitialized
```