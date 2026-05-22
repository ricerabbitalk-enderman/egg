#:function ja
#@in storage x~fixed ~fixed 値
#@return 整数化された ~fixed 値
#@text
#> ~fixed (1/64) 固定小数点の値を切り捨てる形で整数に変換します。
#@code mcfunction
#> # ランダムな固定小数点値を整数値化
#> execute store result score #egg:math/floor|<<x~fixed -- run random value -1024..1024
#> execute store result storage xxx:temp value~double double 0.015625 run scoreboard players get #egg:math/floor|<<x~fixed --
#> execute store result storage xxx:temp floor~double double 0.015625 run function egg:math/floor
#> tellraw @a ["floor","(",{storage:"xxx:temp",nbt:"value~double"},")","=",{storage:"xxx:temp",nbt:"floor~double"}]
#:

scoreboard players operation #egg:math/floor|div~int -- = #egg:math/floor|<<x~fixed --
scoreboard players operation #egg:math/floor|div~int -- /= #egg|unit~fixed --
scoreboard players operation #egg:math/floor|mod~fixed -- = #egg:math/floor|<<x~fixed --
scoreboard players operation #egg:math/floor|mod~fixed -- %= #egg|unit~fixed --
execute if score #egg:math/floor|mod~fixed -- matches ..-1 run scoreboard players remove #egg:math/floor|div~int -- 1
return run scoreboard players operation #egg:math/floor|div~int -- *= #egg|unit~fixed --