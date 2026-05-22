## egg:data

### egg:data/2d-float_from_rotation

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:data/2d-float_from_rotation >>2d~float` | Rotation から得られた安全な `[float, float]` データ |
| `return` | 処理の成否 (常に 1) |

コマンド実行者 `@s` の Rotation (2D Float) データを取得します。

出力される 2D Float データは **[安全なデータ](definition.md#ストレージデータの最適化問題)** に変換されます。

```mcfunction
# 0.0f 問題のある取得方法
data modify storage xxx:temp rotation set from entity @e[tag=target,limit=1] Rotation

# 0.0f 問題を回避する取得方法
execute as @e[tag=target,limit=1] run function egg:data/2d-float_from_rotation
data modify storage xxx:temp rotation set from storage egg:data/2d-float_from_rotation >>2d~float
```

### egg:data/3d-double_from_motion

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:data/3d-double_from_motion >>3d~double` | Motion から得られた安全な `[double, double, double]` データ |
| `return` | 処理の成否 (常に 1) |

コマンド実行者 `@s` の Motion (3D Double) データを取得します。

出力される 3D Double データは **[安全なデータ](definition.md#ストレージデータの最適化問題)** に変換されます。

```mcfunction
# 0.0d 問題のある取得方法
data modify storage xxx:temp motion set from entity @e[tag=target,limit=1] Motion

# 0.0d 問題を回避する取得方法
execute as @e[tag=target,limit=1] run function egg:data/3d-double_from_motion
data modify storage xxx:temp motion set from storage egg:data/3d-double_from_motion >>3d~double
```

### egg:data/3d-double_from_position

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:data/3d-double_from_position >>3d~double` | Pos から得られた安全な `[double, double, double]` データ |
| `return` | 処理の成否 (常に 1) |

コマンド実行者 `@s` の Pos (3D Double) データを取得します。

出力される 3D Double データは **[安全なデータ](definition.md#ストレージデータの最適化問題)** に変換されます。

```mcfunction
# 0.0d 問題のある取得方法
data modify storage xxx:temp position set from entity @e[tag=target,limit=1] Pos

# 0.0d 問題を回避する取得方法
execute as @e[tag=target,limit=1] run function egg:data/3d-double_from_position
data modify storage xxx:temp position set from storage egg:data/3d-double_from_position >>3d~double
```

### egg:data/adjust_2d-float

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:data/adjust_2d-float <<2d~float` | 安全でない `[float, float]` データ |
| `storage egg:data/adjust_2d-float >>2d~float` | 安全な `[float, float]` データ |
| `return` | 処理の成否 |

2D Float データを安全なデータに調整します。

出力される 2D Float データは **[安全なデータ](definition.md#ストレージデータの最適化問題)** に変換されます。

```mcfunction
# 0.0f 問題のある取得方法
data modify storage xxx:temp rotation set from entity @e[tag=target,limit=1] Rotation

# 0.0f 問題を回避するように変換
data modify storage egg:data/adjust_2d-float <<2d~float set from storage xxx:temp rotation
function egg:data/adjust_2d-float
data modify storage xxx:temp rotation set from storage egg:data/adjust_2d-float >>2d~float
```

### egg:data/adjust_3d-double

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:data/adjust_3d-double <<3d~double` | 安全でない `[double, double, double]` データ |
| `storage egg:data/adjust_3d-double >>3d~double` | 安全な `[double, double, double]` データ |
| `return` | 処理の成否 |

3D Double データを安全なデータに調整します。

出力される 3D Double データは **[安全なデータ](definition.md#ストレージデータの最適化問題)** に変換されます。

```mcfunction
# 0.0d 問題のある取得方法
data modify storage xxx:temp position set from entity @e[tag=target,limit=1] Pos

# 0.0d 問題を回避するように変換
data modify storage egg:data/adjust_3d-double <<3d~double set from storage xxx:temp position
function egg:data/adjust_3d-double
data modify storage xxx:temp rotation set from storage egg:data/adjust_3d-double >>3d~double
```

### egg:data/difference_3d-double

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:data/difference_3d-double <<begin-3d~double` | 始点の `[double, double, double]` データ |
| `storage egg:data/difference_3d-double <<end-3d~double` | 終点の `[double, double, double]` データ |
| `storage egg:data/difference_3d-double >>3d~double` | 終点ー始点の差分 `[double, double, double]` データ |
| `return` | 処理の成否 |

3D Double データ同士の差分（終点ー始点）を取ります。

**固定小数点による演算あり** → **[固定小数点について](definition.md#固定小数点)**

出力される 3D Double データは **[安全なデータ](definition.md#ストレージデータの最適化問題)** に変換されます。

```mcfunction
# 2つのエンティティの座標差分を取る
data modify storage egg:data/difference_3d-double <<begin-3d~double set from entity @e[tag=a,limit=1] Pos
data modify storage egg:data/difference_3d-double <<end-3d~double set from entity @e[tag=b,limit=1] Pos
function egg:data/difference_3d-double
data modify storage xxx:temp difference set from storage egg:data/difference_3d-double >>3d~double
```

### egg:data/scale_3d-double

| I/O | 詳細 |
| :--- | :--- |
| `storage egg:data/scale_3d-double <<3d~double` | `[double, double, double]` データ |
| `storage egg:data/scale_3d-double <<scale~double` | 倍率 |
| `storage egg:data/scale_3d-double >>3d~double` | 倍率がかかった安全な `[double, double, double]` データ |
| `return` | 処理の成否 |

3D Double データに倍率をかけます。

**固定小数点による演算あり** → **[固定小数点について](definition.md#固定小数点)**

出力される 3D Double データは **[安全なデータ](definition.md#ストレージデータの最適化問題)** に変換されます。

```mcfunction
# Motion を 1.5 する
data modify storage egg:data/scale_3d-double <<3d~double set from entity @s Motion
data modify storage egg:data/scale_3d-double <<scale~double set value 1.5
function egg:data/scale_3d-double
data modify storage xxx:temp motion set from storage egg:data/scale_3d-double >>3d~double
```