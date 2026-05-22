## 用語・仕様の詳細解説

### 入出力の仕様

egg が提供する関数は独自の入出力仕様を持っています。

**スコアボード**

`function egg:xxxx/yyyy` における入出力は以下のようになります。

|スコアホルダー (`#` 疑似エンティティ)|オブジェクティブ (スコア名)|意味|
|:-|:-|:-|
|`score #egg:xxxx/yyyy\|<<input`|`--`|入力 (`<<`)|
|`score #egg:xxxx/yyyy\|>>output`|`--`|出力 (`>>`)|

上記の記述のように `<<`, `>>` の矢印で入出力の向きを表現します。

```mcfunction
# 関数名に入る方向 << が入力
scoreboard players #egg:xxxx/yyyy|<<input -- 123

# 関数呼び出し
function egg:xxxx/yyyy

# 関数名から出る方向 >> が出力
execute if score #egg:xxxx/yyyy|>>output -- matches 456.. run say valid output.
```

**ストレージ**

`function egg:xxxx/yyyy` における入出力は以下のようになります。

|名前空間|NBT パス|意味|
|:-|:-|:-|
|`storage egg:xxxx/yyyy`|`<<input`|入力 (`<<`)|
|`storage egg:xxxx/yyyy`|`>>output`|出力 (`>>`)|

上記の記述のように `<<`, `>>` の矢印で入出力の向きを表現します。

```mcfunction
# 関数名に入る方向 << が入力
data modify storage egg:3d/motion_from_rotation <<rotation set from entity @s Rotation

# 関数呼び出し
function egg:3d/motion_from_rotation

# 関数名から出る方向 >> が出力
data modify entity @s Motion set from storage egg:3d/motion_from_rotation >>motion
```

**戻り値**

戻り値は基本的に **処理の成否** を返します。

例外的に

* `egg:math/abs`, `egg:math/sgn`, `egg:math/floor` のようなどんな入力に対しても失敗せず有効な値を返す関数
* `egg:brain/-active`, `egg:soul/-following` のような入力を持たず真偽値で状態を返す関数

これらの関数は戻り値で処理結果の値をそのまま返します。

```mcfunction
# 一般的には処理の成否を返す
# 処理の成否を返すため unless function を使ってエラー分岐をシンプルに表記できます
execute as @e[tag=egg.animation] unless function egg:animation/-set run return fail

# どんな入力にも有効な値を返す関数
execute store result score #abs -- run function egg:math/abs

# 入力なしで状態を得る関数
# 状態を返す関数は前提として if(unless) function で条件判定に直接使う前提で提供されます
execute as @e[tag=egg.brain] if function egg:brain/-active run say brain is active.
```

### エンティティタグ

egg の関数にはコマンド実行者 `@s` を参照・編集するものがあり、それは関数名の接頭辞で表現されています。

|関数名|意味|
|:-|:-|
|`function egg:xxxx/yyyy`|スコアボード・ストレージの入出力だけで処理可能な関数|
|`function egg:xxxx/-yyyy`|コマンド実行者 `@s` を参照・編集する関数 (メソッド)|

コマンド実行者 `@s` を扱う関数にはモジュール `egg:xxxx` に対応したエンティティタグ `egg.xxxx` が提供されます。

`function egg:xxxx/-yyyy` を動作させるには `as` で `egg.xxxx` タグを持つエンティティをコマンド実行者 `@s` に設定してください。

```mcfunction
# エンティティを絞り込んで実行
execute at @p as @e[tag=egg.model] run function egg:model/-rotation

# コマンド実行者 @s を確認してから実行
execute at @p if entity @s[tag=egg.model] run function egg:model/-rotation
```

エンティティタグは下記の手法・関数で付与されます。

**機能追加型**

`function egg:xxxx/-enable` 関数で、現在のコマンド実行者 `@s` に機能とタグを追加します。

```mcfunction
# 利用者が自前で召喚したエンティティにタグを追加します
execute summon minecraft:interaction run function egg:interaction/-enable

# 特定機能だけを無効化したい場合は -disable を使います
execute as @e[tag=egg.interaction] run function egg:interaction/-disable

# egg.model + egg.animation のように1つのエンティティに複数の機能を持たせる必要がある場合に使われます
function egg:bdengine/ghost/new
execute as @e[distance=..0.1,tag=_uninitialized] \
  if function egg:model/-enable \
  if function egg:animation/-enable \
    run tag @s remove _uninitialized
```

**エンティティ生成型**

`function egg:xxxx/new` 関数で、新たにエンティティを召喚し、そのエンティティに機能とタグを追加します。

```mcfunction
# エンティティを召喚しつつタグを追加します
function egg:brain/new

# 出力に必ず召喚したエンティティの UUID が与えられるので、それを基準に追加作業が行えます
data modify storage egg:uuid/match <<uuid set from storage egg:brain/new >>uuid
execute as @e[distance=..0.1,tag=egg.brain] if function egg:uuid/match run function egg:brain/-activate
```

**エンティティ追加型**

`function egg:xxxx/push` 関数で、新たにエンティティを召喚し、そのエンティティに機能とタグを追加した上で現在のコマンド実行者 `@s` に騎乗させます。

```mcfunction
# エンティティを召喚しタグを追加して、コマンド実行者 @s の上に騎乗させます
function egg:brain/push

# 騎乗しているので on passengers で召喚したエンティティを参照可能です
execute on passengers run function egg:brain/-activate
```

**例外（自動追加）**

全てのプレイヤーには `egg.player` エンティティタグが自動で付与され `egg:player/-xxxx` 関連の関数は全てのプレイヤーを対象に利用可能です。

```mcfunction
# 自動追加は適用に僅かなラグがあるためタグの確認はしてください
execute as @a[tag=egg.player] run function egg:player/eyes
```

全てのプレイヤー `egg.player` とモブ `egg.mob` には一部の例外を除いてスコアボード `egg.alignment` が自動で付与されます。
`egg:alignment/xxxx` 関連の関数はそれら全てを対象に利用可能です。

```mcfunction
# egg.player タグが付与されていれば egg.alignment を保持しています
scoreboard players operation #egg:alignment/conflict|<<this -- = @p[tag=egg.player] egg.alignment

# egg.mob タグが付与されていれば egg.alignment を保持しています
scoreboard players operation #egg:alignment/conflict|<<that -- = @e[type=minecraft:spider,tag=egg.mob,limit=1] egg.alignment

# egg.alignment を引数として egg:alignment/xxxx は動作します
execute if function egg:alignment/conflict run say Conflict.

# 例外として egg.manual タグが付与された状態で召喚されたエンティティは egg.alignment を自動保持しません
# 手動で設定・管理する必要があります
summon minecraft:bee {Tags:["egg.manual"]}
```

### 固定小数点

egg は一部の実数演算を精度 6bit (1/64刻み) の固定小数点で行います。

そのため、一部の演算結果は引数によって精度にばらつきがあります。

#### なぜ 6bit なのか

Minecraft のワールド境界までの座標を格納するには符号を含めて 26bit の整数値必要になります。

どの座標を取得しても同等の精度を得るには 6bit の固定小数点精度が限界です。

実際の精度については **[精度計測結果](https://docs.google.com/spreadsheets/d/1A1fZ8uPlHeow_a4tDJxWSpsXGy8BlWc6allukIL4M0o/edit?usp=sharing)** を参照し、利用を検討してください。

### ストレージデータの最適化問題

`Pos`, `Motion`, `Rotation` のような実数配列データはストレージに記録される時点で最適化され `0.0f`, `0.0d` が削除されます。

穴の開いた実数配列ストレージデータは再度エンティティの `Pos`, `Motion`, `Rotation` にコピーする際に問題になります。

ストレージに安全にこれらのデータを保存するために一部の関数は全ての `0.0f`, `0.0d` を最適化されない十分小さい値 `1.0e-37f`, `1.0e-307d` に差し替えて問題を回避を試みます。

### 外部座標ディメンション

外部座標ディメンションは、何もない座標計算用の空虚なディメンションです。

事前生成される座標エンティティを編集することで、煩雑かつ低精度になりがちなスコアボードによる計算や、一時的なエンティティ生成による負荷のある計算を回避することができます。

ただし、このディメンションの利用準備には、読み込み時からのわずかなラグがあるため、読み込んだ直後にすぐ利用できるという保証がありません。

実際には読み込み直後にほぼ準備は完了しますが、準備が完了していない場合、これを利用した関数は失敗するので注意してください。

（利用可能になった際には `egg:_coord ready.` という通知があります。）

**既知の問題点**

外部座標ディメンションに存在する必要なエンティティは `kill @e` による無差別破壊の対象になります。

誤ってこのコマンドを実行してしまった場合は `reload` コマンドなどで再読み込みすることで再生成されます。

### アイテム拡張 ID

`egg.device` のコンポーネントを持つアイテムはメインハンドかオフハンドに装備した段階で「拡張 ID」が設定されます。

溜め撃ちを実装する際、右クリックを押し続けている間にアイテムが切り替わった場合に溜め処理を中断する必要があります。

マウスホイールや数字キーでのスロット切り替えはスロット番号の変化で確認できますが、F キーによるメインハンド⇔オフハンドの入れ替えはスロット番号が変化しないため完全に検知できません。

拡張 ID は同じアイテムでも手に持った瞬間に個別に ID を割り振るので、拡張 ID の変化を監視し続ければ F キーで両手に同じアイテムを持っていたとしても切り替えを検知できます。

### アライメント

プレイヤーとの関係性（アライメント）を以下のように定義し、それぞれのモブとの関係性を判定する機能を提供します。

|友好的|中立的|敵対的|
|:--:|:--:|:--:|
|1|0|-1|

召喚時に `egg.manual` のないモブは全てスコア `egg.alignemnt` に適切な値を設定・更新されていきます。

例えば、クモは日中は 0 で薄暗くなると -1 に正しく変化します。

`egg.manual` はカスタムモブなどに適用し、手動で適切なアライメントを設定する必要があります。

`scoreboard players set @s egg.alignment 1` のように設定しない限りアライメントが存在しない状態になり

`egg:shock` などの攻撃対象にすらならなくなる点に注意してください。

また、これはあくまでプレイヤー全体基準での関係性です。

`egg.alignment` でどちらも 1 であるプレイヤー同士の敵対関係 (PvP のチーム分け) を表現することはできません。

敵モブ同士の喧嘩も表現できません。

仮に敵同士で争っていても、プレイヤー全体から見ればどちらも -1 であることには変わりないからです。

### egg:shock 用前処理

`egg:shock` はダメージ・ノックバック処理の前に前処理が可能です。

`<<.preprocess` で関数タグ名を指定することで犠牲者をコマンド実行者 `@s`として以下の関数が前処理として呼び出されます。

`function #egg:preprocess/<関数タグ名>` (`data/egg/tags/function/preprocess/<関数タグ名>.mcfunction`)

前処理の関数の戻り値は基本 0 以外の値を返すようにしてください。

0 を返した場合は、その時点でダメージ処理全体が中断されます。