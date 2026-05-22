## egg:model

### egg:model/define_looks

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:model/define_looks <<name` | `<モデル名>` |
| `storage egg:model/define_looks <<type` | `<見栄えタイプ>` |
| `storage egg:model/define_looks <<modifier` | 見栄えの変更情報 |
| `return` | 処理の成否 |

モデルの見栄えを定義します。

BDEngine で Additional NBT の欄に `data:{alias:xxx}` を設定した表示エンティティを以下のような変更情報で見た目を差し替えることができます。

```mcfunction
data modify storage egg:model/define_looks <<modifier set value {\
  xxx:{item:{id:"minecraft:barrier",count:1,components:{"minecraft:item_model":"xxx:yyyy"}}}, \
}
data modify storage egg:model/define_looks <<name set value ghost
data modify storage egg:model/define_looks <<type set value hold_iron_sword
function egg:model/define_looks
```

定義した見栄えは `function egg:modek/-show` で `<<path` に `<モデル名>-<モデル種類>` で設定可能です。

単純に `<モデル名>` とした場合は BDEngine での見栄えがそのまま適用されます。

### egg:model/new

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:model/new <<name` | `<モデル名>` |
| `storage egg:model/new >>uuid` | 生成されたモデルの UUID |
| `return` | 処理の成否 |

モデルを生成します。

### egg:model/-delete

| I/O | 詳細 |
| :--- | :--- |
| `return` | 処理の成否 |

モデル破壊します。

モデルは複数エンティティによる構成なので `kill` コマンドでは全構成を破壊できません。

### egg:model/-rotate_from_data

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:model/-rotate_from_data <<rotation` | `Rotation` データ |
| `return` | 処理の成否 |

モデルを回転させます。

複数の部品で構成されているため rotate だけでは全構成を回転させることができません。

### egg:model/-rotate

| I/O | 詳細 |
| :--- | :--- |
| `return` | 処理の成否 |

モデルを回転させます。

複数の部品で構成されているため rotate だけでは全構成を回転させることができません。

モデルのポーズを変更します。

### egg:model/-show

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:model/-show <<path` | `<モデル名>-<見栄えタイプ>` (`<モデル名>`で BDEngine で設定したデフォルトの見栄え) |
| `return` | 処理の成否 |

モデルを表示します。

### egg:animation/-enable

| I/O | 詳細 |
| :--- | :--- |
| `return` | 処理の成否 |

アニメーション機能を有効化します。

```mcfunction
# モデルを表示しアニメーションを再生する
data modify storage egg:model/new <<path set value <モデル名>
data modify storage egg:model/-show <<path set value <モデル名>
data modify storage egg:animation/-set << set value {repeat:-1,path:<モデル名>-<アニメーション名>}

function egg:model/new
data modify storage egg:uuid/match <<uuid set from storage egg:model/new >>uuid
execute as @e[distance=..0.1,tag=egg.model] if function egg:uuid/match \
  if function egg:model/-show \
  if function egg:animation/-enable \
  if function egg:animation/-set \
  if function egg:animation/-play \
    run return 1

return fail
```

## egg:animation

### egg:animation/-pause

| I/O | 詳細 |
| :--- | :--- |
| `return` | 処理の成否 |

アニメーションを一時停止します。

再生状況が維持され、次回再生時に途中から再生されます。

### egg:animation/-play

| I/O | 詳細 |
| :--- | :--- |
| `return` | 処理の成否 |

アニメーションを再生します。

再生中は `egg.animation.playing` タグが付与されます。

再生中かどうかはタグの有無で確認してください。

### egg:animation/-set

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:animation/-set <<.path` | `<モデル名>-<アニメーション名>` |
| `storage egg:animation/-set <<.repeat` | 繰り返し回数 (-1:無限) |
| `return` | 処理の成否 |

アニメーションデータを設定します。

BDEngine で生成・出力したアニメーションは `<モデル名>-<アニメーション名>` のパスに保存されています。

繰り返し回数を無限にしなかった場合、再生終了時は最後のフレームのポーズで静止します。

また、あくまでデータ設定のみなので、再生する際は `function egg:animation/play` を実行してください。

### egg:animation/-stop

| I/O | 詳細 |
| :--- | :--- |
| `return` | 処理の成否 |

アニメーションを停止します。

再生状況は維持されず初期状態に戻ります。
