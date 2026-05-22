## egg:player

### egg:player/-block

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:player/-block >>item` | `egg.block` アイテム |
| `return` | アイテム保持している手 `score #egg:player\|(failure or mainhand or offhand) --` |

プレイヤーが右クリック可能な手に持つ `egg.block` アイテムの情報を取得します。

対象のアイテム保持がメインハンドかオフハンドかは戻り値で判断できます。

```mcfunction
# コマンド実行者 `@s`の持っている右クリック可能なブロックアイテムを取得.
function egg:player/-block
# 足元に egg.block として設置
data modify storage egg:block/place <<item set from storage egg:player/-block >>item
function egg:block/place
```

### egg:player/-device

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:player/-device >>item` | `egg.device` アイテム |
| `return` | アイテム保持している手 `score #egg:player\|(failure or mainhand or offhand) --` |

プレイヤーが右クリック可能な手に持つ `egg.device` アイテムの情報を取得します。

対象のアイテム保持がメインハンドかオフハンドかは戻り値で判断できます。

```mcfunction
# コマンド実行者 @s の持っている右クリック可能なデバイスアイテムを取得.
function egg:player/-device
# egg.device の info フィールドに追加情報があるかどうか確認
execute if data storage egg:player/-device >>item.components.egg.info run say has extra information.
```

### egg:player/-eyes

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:player/-eyes >>position` | 目線の位置 `[double, double, double]` データ |
| `return` | 処理の成否 |

プレイヤーの目線の位置を取得します。

出力される 3D Double データは **[安全なデータ](definition.md#ストレージデータの最適化問題)** に変換されます。

```mcfunction
# 目線の位置をレイキャストの開始位置に設定
function egg:player/-eyes
data modify storage egg:ray/cast <<.position set from storage egg:player/-eyes >>position
```