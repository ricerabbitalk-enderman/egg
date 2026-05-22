## egg:pack

### egg:pack/call

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:pack/call <<pack` | egg.pack 関数データ |
| `return` | 関数の処理結果 |

egg.pack 関数データを実行します。

関数を NBT データとして取り扱うには下記仕様の `egg.pack` 関数データである必要があります。

```mcburnction
# egg.pack 関数データ
# name に関数名（関数ファイルの深度は aaa:bbb/ccc/ddd/eee/fff/ggg/hhh の 8 階層までに対応しています）
# data に関数呼び出し時に引き渡される汎用 NBT データ（省略可）
data modify storage xxx:temp pack set value {name:"xxx:yyyy/zzzzz",data:{value:7,flag:true}}
```

`name` の関数名が実行され、関数の戻り値を返します。

呼び出される `name` の関数内で `data` は `storage egg:pack <<` に格納されます。

内部でマクロによる処理が行われるため、あまりに頻繁な利用は処理速度の低下を招き、マクロの仕様上、再帰呼び出しには対応していません。

## egg:interaction

### egg:interaction/-enable

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:interaction/-enable <<.attack` | 左クリック（攻撃）時のコールバック用 egg.pack 関数データ |
| `storage egg:interaction/-enable <<.interact` | 右クリック（操作）時のコールバック用 egg.pack 関数データ |
| `return` | 処理の成否 |

`egg.interaction` 機能を有効化します。

右クリック時・左クリック時に実行したい関数を `egg.pack` 関数データで指定します。

```mcfunction
# 生成したインタラクションに egg.interaction 機能を有効化
data modify storage egg:interaction/-enable << set value { \
  attack:{name:"xxx:yyyy/on_attacked",data:{flag:true}}, \
  interact:{name:"xxx:yyyy/on_interacted",data:{value:5}} \
}
execute summon minecraft:interaction run function egg:interaction/-enable
```

## egg:ray

### egg:ray/cast

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:ray/cast <<.position` | 開始位置 `[double, double, double]` データ |
| `storage egg:ray/cast <<.rotation` | 進行方向 `[float, float]` データ |
| `storage egg:ray/cast <<.distance` | 限界距離 |
| `storage egg:ray/cast <<.condition` | 判定条件 ("if" or "unless") |
| `storage egg:ray/cast <<.namespace` | 対象ブロックタグの名前空間 |
| `storage egg:ray/cast <<.tag` | 対象ブロックのタグ名 |
| `storage egg:ray/cast <<.callback` | コールバック関数名 |
| `return` | 処理結果 (衝突判定なしの場合は 0) |

`<condition>(if or unless) #<namespace>:<tag>` の条件を満たすブロックを検知すると `<callback>` のコールバック関数を実行するレイキャストを行います。

コールバック関数が 0 以外を返した場合、レイキャストはそこで終了し、0 を返した場合、レイキャストはブロックを貫通し処理を継続します。

コールバック関数は `egg.pack` 関数データとして呼び出され `egg:pack <<` には以下の情報が格納されています。

|データ|内容|
|:-|:-|
|<<.position|衝突した詳細な座標 `[double, double, double]` データ|
|<<.face|衝突面|

衝突面は下記の定数のどれかが与えられます。

|スコア|意味|
|:-|:-|
|score egg:ray.face\|inside|内側 (レイキャスト開始点が既に対象ブロック内であった場合)|
|score egg:ray.face\|top|上側|
|score egg:ray.face\|bottom|下側|
|score egg:ray.face\|north|北側|
|score egg:ray.face\|south|南側|
|score egg:ray.face\|west|西側|
|score egg:ray.face\|east|東側|

```mcfunction
# プレイヤーであるコマンド実行者 `@s`の目の位置からレイキャスト
data modify storage egg:ray/cast << set value {distance:5,condition:unless,namespace:minecraft,tag:replaceable,callback:"xxx:yyyy/callback"}
function egg:player/-eyes
data modify storage egg:ray/cast <<.position set from storage egg:player/-eyes >>position
function egg:data/2d-float_from_rotation
data modify storage egg:ray/cast <<.rotation set from storage egg:data/2d-float_from_rotation >>2d~float
function egg:ray/cast
```

## egg:block

### egg:block/place

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:block/place <<item` | egg.block アイテムデータ |
| `return` | 処理の成否 |

`egg.block` アイテムデータからカスタムブロックを設置します。

`egg.block` アイテムデータには下記のデータコンポーネントが指定されている必要があります。

```json
"components": {
  "minecraft:item_name": "Custom Block",
  "minecraft:item_model": "xxx:yyyy",
  "minecraft:custom_data": {
    "egg": {
      "type": "block",
      "base": "shroomlight",          // ベースタイプ (barrier, spawner, shroomlight)
      "setup": "xxx:yyyy/setup",      // ブロック構築時の関数名
      "event": "xxx:yyyy/event",      // 右クリックイベントのコールバック関数名
      "teardown": "xxx:yyyy/teardown" // ブロック解体時の関数名
    }
  },
  "blocks_attacks": {"damage_reductions": [{"base": 0, "factor": 0}]}
}
```

現在利用可能なベースタイプは3種類です。
|ベース|特徴|
|:-|:-|
|barrier|破壊不可能|
|spawner|破壊可能|
|shroomlight|破壊可能・光源効果付き|

```mcfunction
# コマンド実行者 `@s`の持っている右クリック可能なブロックアイテムを取得.
function egg:player/-block
# 足元に egg.block として設置
data modify storage egg:block/place <<item set from storage egg:player/-block >>item
function egg:block/place
```