#:function ja
#@in storage 3d~double 安全でない `[double, double, double]` データ
#@out storage 3d~double 安全な `[double, double, double]` データ
#@return 処理の成否
#@text
#> 3D Double データを安全なデータに調整します。
#> 値のない個所を最適化されたと解釈して `1.0e-307d` で埋めます。
#@code mcfunction
#> # 0.0d 問題のある取得方法
#> data modify storage xxx:temp position set from entity @e[tag=target,limit=1] Pos
#>
#> # 0.0d 問題を回避するように変換
#> data modify storage egg:data/adjust_3d-double <<3d~double set from storage xxx:temp position
#> function egg:data/adjust_3d-double
#> data modify storage xxx:temp rotation set from storage egg:data/adjust_3d-double >>3d~double
#:

## Cleanup.
data remove storage egg:data/adjust_3d-double >>3d~double

## Verify.
execute unless data storage egg:data/adjust_3d-double <<3d~double run return fail

## Initialize.
data modify storage egg:data/adjust_3d-double >>3d~double set value [1.0e-307d,1.0e-307d,1.0e-307d]
## Set data.
execute if data storage egg:data/adjust_3d-double <<3d~double[0] \
  run data modify storage egg:data/adjust_3d-double >>3d~double[0] set from storage egg:data/adjust_3d-double <<3d~double[0]
execute if data storage egg:data/adjust_3d-double <<3d~double[1] \
  run data modify storage egg:data/adjust_3d-double >>3d~double[1] set from storage egg:data/adjust_3d-double <<3d~double[1]
execute if data storage egg:data/adjust_3d-double <<3d~double[2] \
  run data modify storage egg:data/adjust_3d-double >>3d~double[2] set from storage egg:data/adjust_3d-double <<3d~double[2]
## Success.
return 1