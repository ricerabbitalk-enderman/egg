#:module ja
#@text
#> DDA アルゴリズムによる高速レイキャストを提供します。
#> ブロック条件を満たした際はそのブロック座標からコールバック関数が呼び出されます。
#> コールバック関数が 0 以外を返した場合、レイキャストはそこで終了します。
#> コールバック関数が 0 を返した場合、レイキャストはブロックを貫通し処理を継続します。
#> コールバック関数は egg.pack データとして呼び出され egg:pack << には以下の情報が格納されています。
#@table
#> |データ|内容|
#> |:-|:-|
#> |<<.position|衝突した詳細な座標 `[double, double, double]` データ|
#> |<<.face|衝突面|
#@text
#> 衝突面は下記の定数のどれかが与えられます。
#@table
#> |スコア|意味|
#> |:-|:-|
#> |score egg:ray.face\|inside|内側 (レイキャスト開始点が既に対象ブロック内であった場合)|
#> |score egg:ray.face\|top|上側|
#> |score egg:ray.face\|bottom|下側|
#> |score egg:ray.face\|north|北側|
#> |score egg:ray.face\|south|南側|
#> |score egg:ray.face\|west|西側|
#> |score egg:ray.face\|east|東側|
#:

#:function ja
#@in storage .position 開始位置 `[double, double, double]` データ
#@in storage .rotation 進行方向 `[float, float]` データ
#@in storage .distance 限界距離
#@in storage .condition 判定条件 ("if" or "unless")
#@in storage .namespace 対象ブロックタグの名前空間
#@in storage .tag 対象ブロックのタグ名
#@in storage .callback コールバック関数名
#@return 処理結果 (衝突判定なしの場合は 0)
#@text
#> `<condition>(if or unless) #<namespace>:<tag>` の条件を満たすブロックを検知すると `<callback>` のコールバック関数を実行するレイキャストを行います。
#@code mcfunction
#> # プレイヤーであるコマンド実行者 `@s`の目の位置からレイキャスト
#> data modify storage egg:ray/cast << set value {distance:5,condition:unless,namespace:minecraft,tag:replaceable,callback:"xxx:yyyy/callback"}
#> function egg:player/-eyes
#> data modify storage egg:ray/cast <<.position set from storage egg:player/-eyes >>position
#> function egg:data/2d-float_from_rotation
#> data modify storage egg:ray/cast <<.rotation set from storage egg:data/2d-float_from_rotation >>2d~float
#> function egg:ray/cast
#:

## P
execute store result score #egg:ray/cast|P(x)~fixed -- run data get storage egg:ray/cast <<.position[0] 64
execute store result score #egg:ray/cast|P(y)~fixed -- run data get storage egg:ray/cast <<.position[1] 64
execute store result score #egg:ray/cast|P(z)~fixed -- run data get storage egg:ray/cast <<.position[2] 64

## Set pack.
data modify storage egg:pack/call <<pack set value {data:{}}
data modify storage egg:pack/call <<pack.name set from storage egg:ray/cast <<.callback
data modify storage egg:pack/call <<pack.data.position set from storage egg:ray/cast <<.position
execute store result storage egg:pack/call <<pack.data.face int 1 run scoreboard players get #egg:ray.face|inside --
## Set parameters.
data modify storage egg:ray ** set value {}
data modify storage egg:ray **.x set from storage egg:ray/cast <<.position[0]
data modify storage egg:ray **.y set from storage egg:ray/cast <<.position[1]
data modify storage egg:ray **.z set from storage egg:ray/cast <<.position[2]
data modify storage egg:ray **.distance set from storage egg:ray/cast <<.distance
data modify storage egg:ray **.condition set from storage egg:ray/cast <<.condition
data modify storage egg:ray **.namespace set from storage egg:ray/cast <<.namespace
data modify storage egg:ray **.tag set from storage egg:ray/cast <<.tag
## Check.
execute store result score #egg:ray/cast|result -- run function egg:ray/-/macro/check with storage egg:ray **
execute if score #egg:ray/cast|result -- = #egg:ray.result|lost -- run return 0
execute unless score #egg:ray/cast|result -- = #egg:ray.result|continue -- run return run scoreboard players get #egg:ray.result|result --

## unit
data modify storage egg:3d/motion_from_rotation <<rotation set from storage egg:ray/cast <<.rotation
function egg:3d/motion_from_rotation
execute store result score #egg:ray/cast|u(x)~fixed -- run data get storage egg:3d/motion_from_rotation >>motion[0] 64
execute store result score #egg:ray/cast|u(y)~fixed -- run data get storage egg:3d/motion_from_rotation >>motion[1] 64
execute store result score #egg:ray/cast|u(z)~fixed -- run data get storage egg:3d/motion_from_rotation >>motion[2] 64

## sign
scoreboard players operation #egg:math/sgn|<<x -- = #egg:ray/cast|u(x)~fixed --
execute store result score #egg:ray/cast.sgn(x) -- run function egg:math/sgn
scoreboard players operation #egg:math/sgn|<<x -- = #egg:ray/cast|u(y)~fixed --
execute store result score #egg:ray/cast.sgn(y) -- run function egg:math/sgn
scoreboard players operation #egg:math/sgn|<<x -- = #egg:ray/cast|u(z)~fixed --
execute store result score #egg:ray/cast.sgn(z) -- run function egg:math/sgn

## step
scoreboard players operation #egg:ray/cast.step(x)~fixed -- = #egg|unit~fixed --
scoreboard players operation #egg:ray/cast.step(x)~fixed -- *= #egg:ray/cast.sgn(x) --
scoreboard players operation #egg:ray/cast.step(y)~fixed -- = #egg|unit~fixed --
scoreboard players operation #egg:ray/cast.step(y)~fixed -- *= #egg:ray/cast.sgn(y) --
scoreboard players operation #egg:ray/cast.step(z)~fixed -- = #egg|unit~fixed --
scoreboard players operation #egg:ray/cast.step(z)~fixed -- *= #egg:ray/cast.sgn(z) --

## abs
scoreboard players operation #egg:math/abs|<<x -- = #egg:ray/cast|u(x)~fixed --
execute store result score #egg:ray/cast|abs(x)~fixed -- run function egg:math/abs
scoreboard players operation #egg:math/abs|<<x -- = #egg:ray/cast|u(y)~fixed --
execute store result score #egg:ray/cast|abs(y)~fixed -- run function egg:math/abs
scoreboard players operation #egg:math/abs|<<x -- = #egg:ray/cast|u(z)~fixed --
execute store result score #egg:ray/cast|abs(z)~fixed -- run function egg:math/abs

## d
scoreboard players operation #egg:ray/cast.d(x)~fixed -- = #egg|double~fixed --
scoreboard players operation #egg:ray/cast.d(x)~fixed -- /= #egg:ray/cast|abs(x)~fixed --
scoreboard players operation #egg:ray/cast.d(y)~fixed -- = #egg|double~fixed --
scoreboard players operation #egg:ray/cast.d(y)~fixed -- /= #egg:ray/cast|abs(y)~fixed --
scoreboard players operation #egg:ray/cast.d(z)~fixed -- = #egg|double~fixed --
scoreboard players operation #egg:ray/cast.d(z)~fixed -- /= #egg:ray/cast|abs(z)~fixed --

## B
scoreboard players operation #egg:math/floor|<<x~fixed -- = #egg:ray/cast|P(x)~fixed --
execute store result score #egg:ray/cast.B(x)~fixed -- run function egg:math/floor
scoreboard players operation #egg:math/floor|<<x~fixed -- = #egg:ray/cast|P(y)~fixed --
execute store result score #egg:ray/cast.B(y)~fixed -- run function egg:math/floor
scoreboard players operation #egg:math/floor|<<x~fixed -- = #egg:ray/cast|P(z)~fixed --
execute store result score #egg:ray/cast.B(z)~fixed -- run function egg:math/floor
#>zero
execute if score #egg:ray/cast.sgn(x) -- matches 0 run scoreboard players operation #egg:ray/cast.B(x)~fixed -- = #egg|MAX --
execute if score #egg:ray/cast.sgn(y) -- matches 0 run scoreboard players operation #egg:ray/cast.B(y)~fixed -- = #egg|MAX --
execute if score #egg:ray/cast.sgn(z) -- matches 0 run scoreboard players operation #egg:ray/cast.B(z)~fixed -- = #egg|MAX --

## t
#>if sgn=1 then t=(B+1-P)/abs
#>if sgn=-1 then t=(P-B)/abs
execute if score #egg:ray/cast.sgn(x) -- matches 1 run scoreboard players operation #egg:ray/cast.t(x)~fixed -- = #egg:ray/cast.B(x)~fixed --
execute if score #egg:ray/cast.sgn(y) -- matches 1 run scoreboard players operation #egg:ray/cast.t(y)~fixed -- = #egg:ray/cast.B(y)~fixed --
execute if score #egg:ray/cast.sgn(z) -- matches 1 run scoreboard players operation #egg:ray/cast.t(z)~fixed -- = #egg:ray/cast.B(z)~fixed --
execute if score #egg:ray/cast.sgn(x) -- matches 1 run scoreboard players operation #egg:ray/cast.t(x)~fixed -- += #egg|unit~fixed --
execute if score #egg:ray/cast.sgn(y) -- matches 1 run scoreboard players operation #egg:ray/cast.t(y)~fixed -- += #egg|unit~fixed --
execute if score #egg:ray/cast.sgn(z) -- matches 1 run scoreboard players operation #egg:ray/cast.t(z)~fixed -- += #egg|unit~fixed --
execute if score #egg:ray/cast.sgn(x) -- matches -1 run scoreboard players operation #egg:ray/cast.t(x)~fixed -- = #egg:ray/cast|P(x)~fixed --
execute if score #egg:ray/cast.sgn(y) -- matches -1 run scoreboard players operation #egg:ray/cast.t(y)~fixed -- = #egg:ray/cast|P(y)~fixed --
execute if score #egg:ray/cast.sgn(z) -- matches -1 run scoreboard players operation #egg:ray/cast.t(z)~fixed -- = #egg:ray/cast|P(z)~fixed --
execute if score #egg:ray/cast.sgn(x) -- matches 1 run scoreboard players operation #egg:ray/cast.t(x)~fixed -- -= #egg:ray/cast|P(x)~fixed --
execute if score #egg:ray/cast.sgn(y) -- matches 1 run scoreboard players operation #egg:ray/cast.t(y)~fixed -- -= #egg:ray/cast|P(y)~fixed --
execute if score #egg:ray/cast.sgn(z) -- matches 1 run scoreboard players operation #egg:ray/cast.t(z)~fixed -- -= #egg:ray/cast|P(z)~fixed --
execute if score #egg:ray/cast.sgn(x) -- matches -1 run scoreboard players operation #egg:ray/cast.t(x)~fixed -- -= #egg:ray/cast.B(x)~fixed --
execute if score #egg:ray/cast.sgn(y) -- matches -1 run scoreboard players operation #egg:ray/cast.t(y)~fixed -- -= #egg:ray/cast.B(y)~fixed --
execute if score #egg:ray/cast.sgn(z) -- matches -1 run scoreboard players operation #egg:ray/cast.t(z)~fixed -- -= #egg:ray/cast.B(z)~fixed --
scoreboard players operation #egg:ray/cast.t(x)~fixed -- *= #egg|unit~fixed --
scoreboard players operation #egg:ray/cast.t(y)~fixed -- *= #egg|unit~fixed --
scoreboard players operation #egg:ray/cast.t(z)~fixed -- *= #egg|unit~fixed --
scoreboard players operation #egg:ray/cast.t(x)~fixed -- /= #egg:ray/cast|abs(x)~fixed --
scoreboard players operation #egg:ray/cast.t(y)~fixed -- /= #egg:ray/cast|abs(y)~fixed --
scoreboard players operation #egg:ray/cast.t(z)~fixed -- /= #egg:ray/cast|abs(z)~fixed --

return run function egg:ray/-/loop_to_cast