# Essential General Gear (egg)

## 目次

- [1. 概要](#1-概要--introduction)
- [2. 対応バージョンと前提](#2-対応バージョンと前提)
- [3. インストール方法](#3-インストール方法)
- [4. 関数の入出力ルール](#4-関数の入出力ルール)
- [5. エンティティとタグの関係](#5-エンティティとタグの関係)
- [6. 主な機能一覧](#6-主な機能一覧)
- [7. 各機能の簡単な使い方例](#7-各機能の簡単な使い方例)

## 1. 概要 / Introduction

Essential General Gear (egg) は、Minecraft データパック作成者のための基盤データパックです。

データパックでは、カスタムモブや特殊なブロック、物理的な挙動の再現など、バニラが提供していないのにデータパックを作る上で欲しい機能が数多く存在します。  
egg はそうした機能を集約・一般化を目指すライブラリです。

これを利用することで、データパック作成の敷居を大幅に下げ、制作者が**本来作りたい世界観やギミック**に集中できる環境を提供します。

本データパックは **[MIT License](LICENSE)** のもとで公開されています。

egg を基盤にする代表的なプロジェクトとして、  
- 次元移動型データパック `overflows` (開発中)
- その中に実装される幻想ディメンション `mystique` (開発中)

などがあります。

## 2. 対応バージョンと前提

**対応バージョン**
- Minecraft Java Edition 26.1.x（安定版）のみ

（今後のスナップショット対応は、安定性が確認でき次第順次開放予定）

**前提**
本データパックに特別な前提条件はありません。  
単体で動作します。

## 3. インストール方法

1. ダウンロードした `mcbird-egg.zip` を **ワールドの `datapacks` フォルダ**にコピーしてください。
2. ワールドを一度退出して再入室してください。

> **注意**  
> egg にはディメンションとエンチャントの定義が含まれているため、`/reload` だけでは不十分な場合があります。必ずワールドの再入室をおすすめします。

インストール完了後、`/trigger egg` で動作確認ができます。

## 4. 関数の入出力ルール

eggの関数はスコアボードとストレージを使ってデータをやり取りします。

**入力**  
- スコアボード：`score #egg:(関数パス)|<<変数名 --`  
- ストレージ：`storage egg:(関数パス) <<変数名`

**出力**  
- スコアボード：`score #egg:(関数パス)|>>変数名 --`  
- ストレージ：`storage egg:(関数パス) >>変数名`

詳細な仕様やエンティティタグの扱い方は **[インターフェース詳細解説](./reference_of_interface.md)** を参照してください。

## 5. エンティティとタグの関係

一部の機能は、特定のタグを持つエンティティを `@s` として指定する必要があります。

関数名に `-`（ハイフン）が付いているものは専用タグ必須です。

```mcfunction
execute as @e[tag=egg.brain] run function egg:brain/-target
```

## 6. 主な機能一覧

egg は、データパック作成を強力に支援する以下の機能群を提供します。

### 3D関連

* モーションと回転の相互変換、6bit精度の固定小数点演算  
* **プレイヤーやモブの向いた方向に物体を正確に投擲する機能**

  → オリジナルの魔法やアイテムを放つようなギミックが作りやすくなり、複雑な動きや座標計算も大幅に簡略化できます。

### 入力関連

* **特殊アイテムの右クリック検知**、操作キーの入力検知

  → インタラクティブなギミック（魔法の発動、装置の操作など）が作りやすくなります。

### モデル・アニメーション関連

* BDEngine で作成した**3Dモデルの読み込み・表示**
* **アニメーション再生機能**

  → 高品質なカスタムモデルを比較的簡単に実装可能

### ダメージ処理関連

* 柔軟なダメージ・ノックバック・効果付与処理（プレイヤーとの関係性を考慮）
* プレイヤーとの関係性を考慮した判定

  → カスタムモブの攻撃処理や**特殊な戦闘ギミックを大幅に簡略化できます**。

### カスタムモブ関連

* 懐き（フォロー）機能と戦闘行動を組み合わせた汎用システム
  → Mirror Phantom (mystique) をはじめとする、**高度で柔軟なカスタムモブを比較的簡単に作成できます**。

### カスタムブロック関連

* レイキャストによる精密検知、右クリック機能、外観変更を兼ね備えた疑似カスタムブロック

  → **インタラクティブな装置や特殊なブロック（感知式照明、隠し扉など）が作りやすくなります**。

### その他便利機能

* コールバック関数のデータ化、エンティティポインタ、疑似デスポーン処理など

  → データパック作成時のさまざまな **「面倒くさい部分」を軽減します**。

## 7. 各機能の簡単な使い方例

以下に主な機能の概要と基本的な使用例を記載しています。  
詳細は各機能のリファレンスを参照してください。

### 小目次
- [egg:3d — 3D計算関連機能](#egg3d--3d計算関連機能)
- [egg:input & egg:key — 入力関連機能](#egginput--eggkey--入力関連機能)
- [egg:model & egg:animation — モデル＆アニメーション機能](#eggmodel--egganimation--モデルアニメーション機能)
- [egg:block — カスタムブロック機能](#eggblock--疑似カスタムブロック機能)
- [egg:soul & egg:brain — カスタムモブ基盤](#eggsoul--eggbrain---カスタムモブ基盤魂思考回路)
- [egg:shock — 拡張ダメージ処理](#eggshock--拡張ダメージ処理)
- [egg:alignment — 関係性判定機能](#eggalignment--関係性判定機能)
- [egg:data — ストレージデータ安全管理](#eggdata--ストレージデータ安全管理)
- [egg:math — 数学関連機能](#eggmath--数学関係機能)
- [egg:player — プレイヤー情報取得](#eggplayer--プレイヤー情報取得)
- [egg:utility — その他の便利機能](#eggutility--その他の便利機能)

## egg:3d — 3D計算関連機能

`Motion`（移動力）と `Rotation`（向き）の相互変換を中心に、3Dベクトル関連の便利機能を提供します。

特に**プレイヤーやモブの向いた方向に物体を正確に投擲する**処理が大幅に簡単になります。

### 主な用途
* オリジナル魔法や飛翔体の投擲
* 進行方向に合わせてエンティティの向きを調整
* ベクトル演算（内積・外積・単位ベクトルなど）

### 基本的な使用例

```shoot.mcfunction
# 向いた方向にドラゴンの火の玉を投擲
data modify storage egg:3d/motion_from_rotation <<rotation set from entity @s Rotation
function egg:3d/motion_from_rotation
execute summon minecraft:dragon_fireball run data modify entity @s Motion set from storage egg:3d/motion_from_rotation >>motion
```

```tick.mcfunction
# 飛翔体の向きを移動力から更新し続ける
data modify storage egg:3d/rotation_from_motion <<motion set from entity @s Motion
function egg:3d/rotation_from_motion
data modify entity @s Rotation set from storage egg:3d/rotation_from_motion >>rotation
```

### 詳細機能一覧

* [egg:3d/motion_from_rotation](docs/3d.md#egg3dmotion_from_rotation) — `Rotation` → `Motion`（単位ベクトル）
* [egg:3d/rotation_from_motion](docs/3d.md#egg3drotation_from_motion) — `Motion` → `Rotation`
* [egg:3d/unit_vector](docs/3d.md#egg3dunit_vector) — 単位ベクトルを取得
* [egg:3d/scalar](docs/3d.md#egg3dscalar) — ベクトルの大きさを取得
* [egg:3d/cross_product](docs/3d.md#egg3dcross_product) — 外積
* [egg:3d/dot_product](docs/3d.md#egg3ddot_product) — 内積

※ 一部の関数は**固定小数点演算**による精度制限や、**外部座標ディメンション**を使用しています。

### 注意事項

* 固定小数点を使用する関数については **[固定小数点について](docs/definition.md#固定小数点)** と **[精度計測結果](https://docs.google.com/spreadsheets/d/1A1fZ8uPlHeow_a4tDJxWSpsXGy8BlWc6allukIL4M0o/edit?usp=sharing)** を参照してください。
* 外部座標ディメンション egg:_coord を使用する関数は、ワールド読み込み直後に利用できない場合があります（詳細は **[外部座標ディメンション](./feature_coord.md)** を参照）。

## egg:input & egg:key — 入力関連機能

プレイヤーの**右クリック**と**各種操作キー**の入力を検知できます。

**egg:input**（右クリック検知）を使うには、以下の NBT を持ったアイテム（`egg.device`）を手に持つ必要があります。

```json
{
  "components": {
    "minecraft:blocks_attacks": {"damage_reductions": [{"base": 0,"factor": 0}]},
    "minecraft:custom_data": {"egg": {"type": "device"}},
    "minecraft:max_stack_size": 1  // egg.device はスタックできない ("minecraft:max_damage" でも可)
  }
}
```

**egg:key**（WASD・ジャンプ・スニークなど）は、全プレイヤーに自動で有効化されます。

### 基本的な使用例

```mcfunction
# 押している間を検知
execute store result score #pushed -- run function egg:key/forward/-pushed

# 押した瞬間を検知
execute store result score #triggered -- run function egg:key/jump/-triggered

# 離した瞬間を検知
execute store result score #released -- run function egg:key/sneak/-released
```

### 対応キー

* 方向キー：forward（前進）、backward（後退）、left、right
* 動作キー：jump（ジャンプ）、sneak（スニーク）、sprint（ダッシュ）

### 詳細機能一覧

* [egg:input/-pushed & egg:key/xxx/-pushed](docs/input.md#egginput-pushed--eggkey-pushed) — 押している間を検知
* [egg:input/-triggered & egg:key/xxx/-triggered](docs/input.md#egginput-triggered--eggkey-triggered) — 押した瞬間を検知
* [egg:input/-released & egg:key/xxx/-released](docs/input.md#egginput-released--eggkey-released) — 離した瞬間を検知
* [egg:input/-mainhand](docs/input.md#egginput-mainhand) / [egg:input/-offhand](docs/input.md#egginput-offhand) — アイテム拡張 ID 取得

## egg:model & egg:animation — モデル＆アニメーション機能

BDEngine で作成した3Dモデルをワールド内に召喚・表示・アニメーション再生できます。

### 事前準備

BDEngine で出力したzipファイルを `bde2egg.js` で変換する必要があります。

### 基本的な使用例 (生成→表示→アニメーション再生)

```mcfunction
# モデル生成
data modify storage egg:model/new <<name set value <モデル名>
function egg:model/new
data modify storage egg:uuid/match <<uuid set from storage egg:model/new >>uuid

# モデル表示
data modify storage egg:model/-show <<path set value <モデル名>
execute as @e[distance=..0.1,tag=egg.model] if function egg:uuid/match run function egg:model/-show

# アニメーション再生
data modify storage egg:animation/set << set value {path:<モデル名>-<アニメーション名>,repeat:-1}
execute as @e[distance=..0.1,tag=egg.model] if function egg:uuid/match \
  if function egg:animation/-enable \
  if function egg:animation/-set \
  if function egg:animation/-play \
    run return 1

# エラー
return fail
```

### 主な機能

* **egg:model**：モデルの生成・表示・回転・ポーズ変更
* **egg:animation**：アニメーションの設定・再生・一時停止・停止

### 注意

* モデルは複数エンティティで構成されるため、削除時は `egg:model/-delete` を使用してください。
* 見栄えの変更は `egg:model/define_looks` で可能です。

### 詳細機能一覧

* [egg:model/define_looks](docs/model.md#eggmodeldefine_looks) — モデルの見栄えを定義
* [egg:model/new](docs/model.md#eggmodelnew) — モデルを生成
* [egg:model/-delete](docs/model.md#eggmodel-delete) — モデルを削除
* [egg:model/-show](docs/model.md#eggmodel-show) — モデルを表示
* [egg:model/-rotate](docs/model.md#eggmodel-rotate) — モデルを回転
* [egg:model/-rotate_from_data](docs/model.md#eggmodel-rotate_from_data) — モデルを回転 (`Rotation` 版)
* [egg:animation/-enable](docs/model.md#egganimation-enable) — モデルのアニメーション機能を有効化
* [egg:animation/-set](docs/model.md#egganimation-set) — アニメーションを設定
* [egg:animation/-play](docs/model.md#egganimation-play) — アニメーションを再生
* [egg:animation/-pause](docs/model.md#egganimation-pause) — アニメーションを一時停止
* [egg:animation/-stop](docs/model.md#egganimation-stop) — アニメーションを停止

## egg:pack — コールバック関数の NBT データ化

関数名と引数データを1つのNBTにまとめて、コールバックとして扱えるようにします。

### 基本的な使用例

```mcfunction
# 関数データを保存
data modify entity @s data.callback set value {
  name: "xxx:yyyy/zzzz",
  data: {flag:true, value:3}
}

# 呼び出し
data modify storage egg:pack/call <<pack set from entity @s data.callback
function egg:pack/call
```

### 詳細機能一覧

* [egg:pack/call](docs/event.md#eggpackcall) — `egg.pack` 関数データを実行

## egg:interaction — イベント型インタラクション

インタラクションエンティティのクリックを、コールバック関数で簡単に扱えるようにします。

### 基本的な使用例

右クリック時・左クリック時に実行したい関数を `egg.pack` 関数データで指定します。

```mcfunction
# インタラクションをイベント型に設定
data modify storage egg:interaction/-enable << set value {
  attack:   {name:"xxx:on_attacked", data:{flag:true}},
  interact: {name:"xxx:on_interacted", data:{value:5}}
}
execute summon minecraft:interaction run function egg:interaction/-enable
```

### 詳細機能一覧

* [egg:interaction/-enable](docs/event.md#egginteraction-enable) — 左クリック・右クリックのコールバックを設定

## egg:ray — 高速レイキャスト機能

DDAアルゴリズムを使った高速なレイキャスト機能です。

### 基本的な使用例

```mcfunction
# プレイヤーの目線から5m先までレイキャスト
data modify storage egg:ray/cast << set value {
  distance: 5,
  condition: "unless",
  namespace: "minecraft",
  tag: "replaceable",
  callback: "xxx:yyyy/on_hit"
}

function egg:player/-eyes
data modify storage egg:ray/cast <<.position set from storage egg:player/-eyes >>position
function egg:data/2d-float_from_rotation
data modify storage egg:ray/cast <<.rotation set from storage egg:data/2d-float_from_rotation >>2d~float

function egg:ray/cast
```

### 詳細機能一覧

* [egg:ray/cast](docs/event.md#eggraycast) — レイキャスト実行

## egg:block — 疑似カスタムブロック機能

手に持ったアイテムの NBT データを基に、右クリックで設置可能なカスタムブロックを実装できます。外観・右クリック時のイベント・破壊時の処理を自由に設定可能です。

### 必須コンポーネント

```json
"components": {
  "minecraft:item_name": "Custom Block",
  "minecraft:item_model": "xxx:yyyy",
  "minecraft:custom_data": {
    "egg": {
      "type": "block",           // 必須
      "base": "shroomlight",     // 必須（barrier / shroomlight / spawner）
      "setup": "xxx:setup",      // 任意：設置時
      "event": "xxx:on_click",   // 任意：右クリック時
      "teardown": "xxx:teardown" // 任意：破壊時
    }
  },
  "minecraft:blocks_attacks": {"damage_reductions": [{"base": 0, "factor": 0}]}
}
```

### 基本的な使用例（データパック側から設置する場合）

```mcfunction
# 持っている egg.block アイテムを取得して設置
function egg:player/-block
data modify storage egg:block/place <<item set from storage egg:player/-block >>item
execute at @s run function egg:block/place
```

プレイヤーは上記のコンポーネントが設定されたアイテムを持っていれば、**右クリックするだけでカスタムブロックを設置**できます。

### 詳細機能一覧

* [egg:block/place](docs/event.md#eggblockplace) — NBT データからカスタムブロック設置

## egg:soul & egg:brain —  カスタムモブ基盤（魂＋思考回路）

懐き（フォロー）と戦闘行動を両立させた、高度なカスタムモブを作成するための基盤機能です。egg:soul（魂）が平常時の友好的な行動を、egg:brain（思考回路）が戦闘時の行動を担当します。

### 基本的な使用例

```mcfunction
# 1. オオカミベースの魂を生成・リンク
function egg:soul/push/wolf

# 2. 最も近いプレイヤーをフォロー対象に設定
data modify storage egg:soul/-follow <<uuid set from entity @p UUID
execute on passengers on origin run function egg:soul/-follow

# 3. 魂の動きを実体に反映（毎ティック推奨）
execute on passengers on origin run data modify entity @s Motion set from entity @s Motion
execute on passengers on origin run data modify entity @s Rotation set from entity @s Rotation
```

### 攻撃対象の設定例

```mcfunction
# 攻撃対象を設定（戦闘モードに移行）
data modify storage egg:soul/-target <<uuid set from entity @e[sort=nearest,scores={egg.alignment=-1},limit=1] UUID
execute on passengers on origin run function egg:soul/-target
```

### 詳細機能一覧

* [egg:soul/push/allay](docs/soul.md#eggsoulpushallay) / [egg:soul/push/nautilus](docs/soul.md#eggsoulpushnautilus) / [egg:soul/push/wolf](docs/soul.md#eggsoulpushwolf) — `egg.soul` を生成・実態にリンク
* [egg:soul/-attacking](docs/soul.md#eggsoul-attacking) — 戦闘中かどうか
* [egg:soul/-target](docs/soul.md#eggsoul-target) / [egg:soul/-lift](docs/soul.md#eggsoul-lift) — 攻撃対象の設定 / 解除
* [egg:soul/-follow](docs/soul.md#eggsoul-follow) / [egg:soul/-unfollow](docs/soul.md#eggsoul-unfollow) — フォロー対象の設定 / 解除
* [egg:soul/-following_to](docs/soul.md#eggsoul-following_to) — フォロー対象の UUID を取得
* [egg:soul/-following](docs/soul.md#eggsoul-following) — フォローしているかどうか
* [egg:brain/-infight](docs/soul.md#eggbrain-infight) — 接近戦状態かどうか
* [egg:brain/-launch_infight](docs/soul.md#eggbrain-launch_infight) / [egg:brain/-launch_outbox](docs/soul.md#eggbrain-launch_outbox) — 接近戦 / 遠距離戦を挑む思考回路に設定

### 注意点

* 実体（ベースモブ）は `egg.soul` を参照して自ら追従する必要があります（`Motion` と `Rotation` の反映推奨）
* 実体が消滅すると `egg.soul` と `egg.brain` も自動で消滅します

## egg:despawn — 自動デスポーン機能

遠くに離れたカスタムモブなどを自然にデスポーンさせる機能です。

### 基本的な使用例

```mcfunction
# 召喚した特殊モブ（今回は自動デスポーンの無効化）に egg.despawn 機能を有効化
summon minecraft:wolf ~ ~ ~ {Tags:["_uninitialized"],PersistenceRequired:true}
execute as @e[distance=..0.1,tag=_uninitialized] if function egg:despawn/-enable run tag @s remove _uninitialized
```

```mcfunction
# egg.despawn 機能を持つ特殊モブが飼いならされていれば egg.dwspawn 機能を無効化
execute as @e[tag=egg.despawn] if data entity @s Owner run function egg:despawn/-disable
```

### 詳細機能一覧

* [egg:despawn/-enable](docs/soul.md#eggdespawn-enable) / [egg:despawn/-disable](docs/soul.md#eggdespawn-disable) — デスポーンの有効化 / 無効化

## egg:shock — 拡張ダメージ処理

プレイヤーとの関係性（`egg.alignment`）を考慮した、柔軟で実用的なダメージ処理機能を提供します。

### 主な特徴

* コマンド実行位置を中心とした範囲ダメージ
* 攻撃者の別指定（投擲武器など間接攻撃に対応）
* ノックバックの細かい制御
* 前処理（エフェクト付与など）の設定
* `egg.alignment` による対象選別

### 基本的な使用例

```mcfunction
# 自分を中心として8m以内の敵対モブに12ダメージ + ノックバック
data modify storage egg:shock/give_to_oppositions << set value {distance:8, amount:12, yv:0.75}
data modify storage egg:shock/give_to_oppositions <<.source set from entity @s UUID
execute at @s run function egg:shock/give_to_oppositions
```

### 詳細機能一覧

* [egg:shock/give_by_no_one](docs/shock.md#eggshockgive_by_no_one) — 攻撃者なしの災害ダメージ
* [egg:shock/give_to_anyone](docs/shock.md#eggshockgive_to_anyone) — 攻撃者以外すべてにダメージ
* [egg:shock/give_to_oppositions](docs/shock.md#eggshockgive_to_oppositionss) — 敵対関係のみにダメージ（最もよく使う）
* [egg:shock/give_to_others](docs/shock.md#eggshockgive_to_others) — 友好関係以外すべてにダメージ
* [egg:shock/give_to_target](docs/shock.md#eggshockgive_to_target) — 攻撃対象のみにダメージ

### 注意

前処理 (`<<.preprocess`) を設定すると、ダメージを受ける前に任意の関数を実行できます。
詳細は **[shock 用前処理](docs/definition.md#eggshock-用前処理)** を参照。

## egg:alignment — 関係性判定機能

プレイヤーを基準としたモブとの関係性（アライメント）を管理・判定します。

|友好的|中立的|敵対的|
|:--:|:--:|:--:|
|1|0|-1|

召喚時に `egg.manual` タグがないモブは自動で適切な値が設定されます。
詳細は **[アライメント](docs/definition.md#アライメント)** を参照。

### 基本的な使用例

```mcfunction
# tag=a と tag=b のエンティティが敵対関係かどうか確認
scoreboard players operation #egg:alignment/conflict|<<this -- = @e[tag=a,limit=1] egg.alignment
scoreboard players operation #egg:alignment/conflict|<<that -- = @e[tag=b,limit=1] egg.alignment
execute if function egg:alignment/conflict run say They ar conflict!
```

### 詳細機能一覧
* [egg:alignment/conflict](docs/shock.md#eggalignmentconflict) — 対立判定
* [egg:alignment/friendly](docs/shock.md#eggalignmentfriendly) — 友好判定

### 注意

* これはプレイヤー視点の関係性です（PvPや敵同士の関係は表現できません）
* `egg.manual` タグを持つエンティティは自動設定されないので、手動管理が必要です

## egg:data — ストレージデータ安全管理

`Pos`、`Motion`、`Rotation` などの実数配列データをストレージに保存する際に発生する**0.0の最適化消失問題**を回避します。

### 基本的な使用例

```mcfunction
# 安全に Motion を取得
execute as @s run function egg:data/3d-double_from_motion
data modify storage temp:motion set from storage egg:data/3d-double_from_motion >>3d~double
```

### 詳細機能一覧

* [egg:data/2d-float_from_rotation](docs/data.md#eggdata2d-float_from_rotation) — 安全に `Rotation` を取得
* [egg:data/3d-double_from_motion](docs/data.md#eggdata3d-double_from_motion) — 安全に `Motion` を取得
* [egg:data/3d-double_from_position](docs/data.md#eggdata3d-double_from_position) — 安全に `Pos` を取得
* [egg:data/adjust_2d-float](docs/data.md#eggdataadjust_2d-float) — 2D Float データを安全なデータに調整
* [egg:data/adjust_3d-double](docs/data.md#eggdataadjust_3d-double) — 3D Double データを安全なデータに調整
* [egg:data/difference_3d-double](docs/data.md#eggdatadifference_3d-double) — 3D Double データ同士の差分
* [egg:data/scale_3d-double](docs/data.md#eggdatascale_3d-double) — 3D Double データに倍率の乗算

## egg:player — プレイヤー情報取得

プレイヤーに関する便利情報を取得できます（全プレイヤーに自動適用）。

### 詳細機能一覧

* [egg:player/-block](docs/player#eggplayer-block) — 手に持つ `egg.block` アイテム情報取得
* [egg:player/-device](docs/player#eggplayer-device) — 手に持つ `egg.device` アイテム情報取得
* [egg:player/-eyes](docs/player#eggplayer-eyes) — 目線位置を取得

## egg:math — 数学関係機能

各種数学関数を提供します。

### 基本的な使用例

```mcfunction
# 絶対値を取得
scoreboard players set #egg:math/abs|<<x -- -3
execute store result score #abs -- run function egg:math/abs
```

### 詳細機能一覧

* [egg:math/abs](docs/math.md#eggmathabs) — 絶対値
* [egg:math/sgn](docs/math.md#eggmathsin) — 符号
* [egg:math/floor](docs/math.md#eggmathsgn) — 小数点切り捨て
* [egg:math/sin](docs/math.md#eggmathcos) — sin
* [egg:math/cos](docs/math.md#eggmathfloor) — cos
* [egg:math/tan](docs/math.md#eggmathtan) — tan
* [egg:math/asin_acos](docs/math.md#eggmathasin_acos) — asin, acos
* [egg:math/atan2](docs/math.md#eggmathatan2) — atan2

## egg:utility — その他の便利機能

### 詳細機能一覧

#### egg:uuid — UUID 比較 

* [egg:uuid/compare](docs/utility.md#egguuidcompare) — 2つのUUIDが一致するか
* [egg:uuid/match](docs/utility.md#egguuidmatch) — 指定UUIDを持つエンティティを検索

#### egg:on — execute on の安全版

on コマンドの @s 切り替わりを防ぎながら関係性を確認できます。

* [egg:on/xxxx](docs/utility.md#eggon) — 関係性の情報取得

#### egg:pointer — エンティティ参照ポインタ

* [egg:pointer/-enable](docs/utility.md#eggpointer-enable) — 雪玉ポインタを有効化
* [egg:pointer/-set](docs/utility.md#eggpointer-set) — 参照先を設定

#### egg:property/invisible — 永続透明化

エンティティを永続的に透明化します（エフェクトより安定）。

* [egg:property/invisible/add](docs/utility.md#eggpropertyinvisibleadd) / [egg:property/invisible/remove](docs/utility.md#eggpropertyinvisibleremove) — 永続透明化の付与 / 解除

#### egg:ride — 騎乗

UUID を元にエンティティを騎乗させます。

* [egg:ride](docs/utility.md#eggride-1) — エンティティ騎乗


## 8. 既知の問題 / 今後の予定

### 現在の既知の問題

- 一部の3D関連関数（`cross_product`, `dot_productなど`）は固定小数点演算のため精度に制限があります。
- 外部座標ディメンション `egg:_coord` を使用する関数は、ワールド読み込み直後に利用できない場合があります。
- 大量のモデル・カスタムモブを同時に扱うと処理負荷が増大します（最適化の余地あり）。
- `egg.block` の連続破壊とスニーク設置（右クリック抑止）動作が再現できていません。

### 今後の予定

- さらなる精度向上と負荷軽減
- スナップショット版への対応拡大
- より高度なカスタムモブAIサンプルの追加
- ドキュメントの拡充（動画解説など）

ご意見・ご要望・バグ報告は GitHub の Issue までお願いします。

## 9. クレジット

### 作成者

- **ricerabbitalk**（メイン開発・設計）
- **鯱朧**（ドキュメント作成支援）

### 特別感謝

- テストプレイやフィードバックをくれた皆さん
- BDEngine の開発者の方々
- Minecraft データパックコミュニティの皆さん

### ライセンス

本データパックの本体部分は **[MIT License](LICENSE)** のもとで公開されています。  
商用・非商用問わず、自由に利用・改変・再配布可能です。

ただし、egg ベースに開発されるデータパックや、後日公開予定の動作サンプル chick 内の一部にある **創作要素**（Mirror Phantomなどの独自世界観に関わる部分）は別途ライセンスを確認してください。

### データの著作権について

egg を含めた mcbird プロジェクトは、BDEngine の出力データを変換・再生するためのシステム枠組みを提供しています。
サードパーティ製のモデルデータ、または他者が作成したモデルデータをご利用の際は、必ず原作者の利用規約（ライセンス）を確認し、許諾された範囲内でご利用ください。

### 免責事項

MIT License の免責事項と重複しますが、mcbird プロジェクトの利用によって生じた、著作権上のトラブル、データの破損、その他いかなる損害についても、開発者は一切の責任を負いかねます。

---

**Essential General Gear (egg)** をご利用いただきありがとうございます！  
このデータパックが、あなたのデータパック制作を少しでも楽にできれば幸いです。

何か問題や提案がありましたら、遠慮なくお知らせください。