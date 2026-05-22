## egg:uuid

### egg:uuid/compare

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:uuid/compare <<this` | 比較対象の UUID |
| `storage egg:uuid/compare <<that` | 比較対象の UUID |
| `return` | UUID が一致するかどうか |

2つの UUID が一致するかどうか取得します。

双方のデータが両方存在しない場合も不一致となります (0 = 0 のような判定は存在しません)。

手元に UUID しかない場合の比較に適しています。

具体的なエンティティと対象の UUID が一致するかを調べる（検索する）場合は `egg:uuid/match` の利用が有効です。

```mcfunction
# tag=a を持つエンティティと tag=b を持つエンティティの UUID を比較
# UUID が一致するなら同一のエンティティである (tag=a も tag=b も持つ)
data modify storage egg:uuid/compare <<this set from entity @e[tag=a,limit=1] UUID
data modify storage egg:uuid/compare <<that set from entity @e[tag=b,limit=1] UUID
execute if function egg:uuid/compare run say They are the same.
```

### egg:uuid/match

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:uuid/match <<uuid` | マッチ対象の UUID |
| `return` | UUID が一致するかどうか |

UUID がコマンド実行者 `@s` と一致するかどうか取得します。

`as` を使い具体的な複数のエンティティから対象の UUID を持つものを検索するのに適しています。

ただし、検索対象のエンティティが多すぎる場合は処理効率が大幅に低下する点に注意してください。

距離や種類などの条件で可能な限り数を絞り込むことで回避できます。

```mcfunction
# キツネの信頼対象（のうちの一人）を探し出して発光させる
execute as @e[type=fox,limit=1] run data modify storage egg:uuid/match <<uuid set from entity @s Trusted[0]
execute as @a if function egg:uuid/match run effect give @s glowing 5 0 true

# 悪い例
# 全てのエンティティを対象にする @e を使用するとその数だけ比較作業が行われます
# 仮に検索の最初でヒットしても試行回数は変わらないので注意してください
execute as @e if function egg:uuid/match run effect give @s glowing 5 0 true

# 良い例
# 例えばその場に召喚したエンティティを探したいなら distance=..0.1 で距離を限定すると検索対象が数体に収まります
execute summon minecraft:bee run data modify storage egg:uuid/match <<uuid set from entity @s UUID
execute as @e[distance=..0.1,type=minecraft:bee] if function egg:uuid/match run say It is a summoned bee.
```

## egg:on

### egg:on/attacker

| I/O | 詳細 |
| :--- | :--- |
| `return` | コマンド実行者 `@s` への攻撃者の有無 |

攻撃者の有無を取得します。

### egg:on/controller

| I/O | 詳細 |
| :--- | :--- |
| `return` | コマンド実行者 `@s` の操縦者の有無 |

操縦者の有無を取得します。

### egg:on/leasher

| I/O | 詳細 |
| :--- | :--- |
| `return` | コマンド実行者 `@s` の牽引者の有無 |

牽引者の有無を取得します。

### egg:on/origin

| I/O | 詳細 |
| :--- | :--- |
| `return` | コマンド実行者 `@s` の発生源の有無 |

発生源の有無を取得します。

### egg:on/owner

| I/O | 詳細 |
| :--- | :--- |
| `return` | コマンド実行者 `@s` の飼い主の有無 |

飼い主の有無を取得します。

### egg:on/passengers

| I/O | 詳細 |
| :--- | :--- |
| `return` | コマンド実行者 `@s` への騎乗者の数 |

騎乗者の数を取得します。

### egg:on/target

| I/O | 詳細 |
| :--- | :--- |
| `return` | コマンド実行者 `@s` の攻撃対象の有無 |

攻撃対象の有無を取得します。

### egg:on/vehicle

| I/O | 詳細 |
| :--- | :--- |
| `return` | コマンド実行者 `@s` の乗り物の有無 |

乗り物の有無を取得します。

## egg:pointer

### egg:pointer/-enable

| I/O | 詳細 |
| :--- | :--- |
| `return` | 処理の成否 |

コマンド実行者 `@s` の雪玉を対象に雪玉ポインタ機能を有効化します。

### egg:pointer/-set

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:pointer/-set <<uuid` | 参照するエンティティの UUID |
| `return` | 処理の成否 |

雪玉ポインタの参照先を設定します。

ポインタ同士を直接相互参照はできません。

## egg:property

### egg:property/invisible/add

| I/O | 詳細 |
| :--- | :--- |
| `return` | 処理の成否 (必ず 1) |

永続的透明状態を付与します。

解除されても即座に透明状態を自動付与します。

### egg:property/invisible/remove

| I/O | 詳細 |
| :--- | :--- |
| `return` | 処理の成否 (必ず 1) |

永続的透明状態を解除します。

## egg:ride

### egg:ride

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:ride <<uuid` | 騎乗するエンティティの UUID |
| `return` | 処理の成否 |


コマンド実行者 `@s`の上にエンティティを騎乗させます。
