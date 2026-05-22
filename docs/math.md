## egg:math

### egg:math/abs

| I/O | 詳細 |
| :--- | :--- |
| `score #egg:math/abs\|<<x --` | x |
| `return` | |x| |

絶対値を取得します。

```mcfunction
# -3 の絶対値を取得
scoreboard players set #egg:math/abs|<<x -- -3
execute store result score #abs -- run function egg:math/abs
tellraw @a ["|-3| = ",{score:{name:"#abs",objective:"--"}}]
```

### egg:math/asin_acos

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:math/asin_acos <<x~double` | x (-1 <= x <= 1) |
| `storage egg:math/asin_acos >>asin~double` | asin 値（度数法） |
| `storage egg:math/asin_acos >>acos~double` | acos 値（度数法） |
| `return` | 処理の成否 |

asin, acos を取得します。

許容範囲外の x はエラーにならず範囲内に丸められます。

**固定小数点による演算あり** → **[固定小数点について](definition.md#固定小数点)**

```mcfunction
# ランダムな x の asin, acos を取得
execute store result storage egg:math/asin_acos <<x~double double 0.015625 run random value -64..64
function egg:math/asin_acos
tellraw @a [ \
  "x",":",{storage:"egg:math/asin_acos",nbt:"<<x~double"},",", \
  "asin",":",{storage:"egg:math/asin_acos",nbt:">>asin~double"},",", \
  "acos",":",{storage:"egg:math/asin_acos",nbt:">>acos~double"} \
]
```

### egg:math/atan2

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:math/atan2 <<2d~double` | [double, double] データ |
| `storage egg:math/atan2 >>atan~double` | atan 値 (度数法) |
| `return` | 処理の成否（外部座標ディメンションが利用できない場合は失敗する） |

360 度対応の atan を取得します。

**外部座標ディメンション利用** → **[外部座標ディメンションについて](definition.md#外部座標ディメンション)**

```mcfunction
# ランダムな x, z の atan を取得
data modify storage egg:math/atan2 <<2d~double set value [1.0e-307d,1.0e-307d]
execute store result storage egg:math/atan2 <<2d~double[0] double 0.015625 run random value -1024..1024
execute store result storage egg:math/atan2 <<2d~double[1] double 0.015625 run random value -1024..1024
execute unless function egg:math/atan2 run return fail
tellraw @a ["2d",":",{storage:"egg:math/atan2",nbt:"<<2d~double"},",","atan",":",{storage:"egg:math/atan2",nbt:">>atan~double"}]
```

### egg:math/cos

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:math/cos <<degree~double` | 角度 (度数法) |
| `storage egg:math/cos >>cos~double` | cos 値 |
| `return` | 処理の成否（外部座標ディメンションが利用できない場合は失敗する） |

cos を取得します。

**外部座標ディメンション利用** → **[外部座標ディメンションについて](definition.md#外部座標ディメンション)**

```mcfunction
# ランダムな角度（度数法）の cos を取得
execute store result storage egg:math/cos <<degree~double double 0.015625 run random value -11520..11520
execute unless function egg:math/cos run return fail
tellraw @a ["degree",":",{storage:"egg:math/cos",nbt:"<<degree~double"},",","cos",":",{storage:"egg:math/cos",nbt:">>cos~double"}]
```

### egg:math/floor

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:math/floor <<x~fixed` | ~fixed 値 |
| `return` | 整数化された ~fixed 値 |

固定小数点を小数部切り捨てで整数化します。

（`-0.x` は `-1` になります）

**固定小数点による演算あり** → **[固定小数点について](definition.md#固定小数点)**

```mcfunction
# ランダムな固定小数点値を整数値化
execute store result score #egg:math/floor|<<x~fixed -- run random value -1024..1024
execute store result storage xxx:temp value~double double 0.015625 run scoreboard players get #egg:math/floor|<<x~fixed --
execute store result storage xxx:temp floor~double double 0.015625 run function egg:math/floor
tellraw @a ["floor","(",{storage:"xxx:temp",nbt:"value~double"},")","=",{storage:"xxx:temp",nbt:"floor~double"}]
```

### egg:math/sgn

| I/O | 詳細 |
| :--- | :--- |
| `score #egg:math/sgn\|<<x --` | x |
| `return` | sgn x |

符号を取得します。

```mcfunction
# -3 の符号を取得
scoreboard players set #egg:math/sgn|<<x -- -3
execute store result score #sgn -- run function egg:math/sgn
tellraw @a ["sgn -3 = ",{score:{name:"#sgn",objective:"--"}}]
```

### egg:math/sin

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:math/sin <<degree~double` | 角度 (度数法) |
| `storage egg:math/sin >>sin~double` | sin 値 |
| `return` | 処理の成否（外部座標ディメンションが利用できない場合は失敗する） |

sin を取得します。

**外部座標ディメンション利用** → **[外部座標ディメンションについて](definition.md#外部座標ディメンション)**

```mcfunction
# ランダムな角度（度数法）の sin を取得
execute store result storage egg:math/sin <<degree~double double 0.015625 run random value -11520..11520
execute unless function egg:math/sin run return fail
tellraw @a ["degree",":",{storage:"egg:math/sin",nbt:"<<degree~double"},",","sin",":",{storage:"egg:math/sin",nbt:">>sin~double"}]
```

### egg:math/tan

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:math/tan <<degree~double` | 角度 (度数法) |
| `storage egg:math/tan >>tan~double` | tan 値 |
| `return` | 処理の成否（外部座標ディメンションが利用できない場合は失敗する） |

tan を取得します。

**固定小数点による演算あり** → **[固定小数点について](definition.md#固定小数点)**

**外部座標ディメンション利用** → **[外部座標ディメンションについて](definition.md#外部座標ディメンション)**

```mcfunction
# ランダムな角度（度数法）の tan を取得
execute store result storage egg:math/tan <<degree~double double 0.015625 run random value -11520..11520
execute unless function egg:math/tan run return fail
tellraw @a ["degree",":",{storage:"egg:math/tan",nbt:"<<degree~double"},",","tan",":",{storage:"egg:math/tan",nbt:">>tan~double"}]
```