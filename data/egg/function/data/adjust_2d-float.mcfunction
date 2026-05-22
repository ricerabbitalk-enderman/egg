#:function ja
#@in storage 2d~float 安全でない `[float, float]` データ
#@out storage 2d~float 安全な `[float, float]` データ
#@return 処理の成否
#@text
#> 2D Float データを安全なデータに調整します。
#> 値のない個所を最適化されたと解釈して `1.0e-37f` で埋めます。
#@code mcfunction
#> # 0.0f 問題のある取得方法
#> data modify storage xxx:temp rotation set from entity @e[tag=target,limit=1] Rotation
#>
#> # 0.0f 問題を回避するように変換
#> data modify storage egg:data/adjust_2d-float <<2d~float set from storage xxx:temp rotation
#> function egg:data/adjust_2d-float
#> data modify storage xxx:temp rotation set from storage egg:data/adjust_2d-float >>2d~float
#:

## Cleanup.
data remove storage egg:data/adjust_2d-float >>2d~float

## Verify.
execute unless data storage egg:data/adjust_2d-float <<2d~float run return fail

## Initialize.
data modify storage egg:data/adjust_2d-float >>2d~float set value [1.0e-37f,1.0e-37f]
## Set data.
execute if data storage egg:data/adjust_2d-float <<2d~float[0] \
  run data modify storage egg:data/adjust_2d-float >>2d~float[0] set from storage egg:data/adjust_2d-float <<2d~float[0]
execute if data storage egg:data/adjust_2d-float <<2d~float[1] \
  run data modify storage egg:data/adjust_2d-float >>2d~float[1] set from storage egg:data/adjust_2d-float <<2d~float[1]

## Success.
return 1