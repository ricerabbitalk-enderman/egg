#:function ja
#@out rotation 魂の向き
#@return 処理の成否
#@text
#> `egg.soul` エンティティの向きを示します。
#> 攻撃中なら攻撃対象の方を示し、そうでなければ魂の視線の 4m 先を示します。
#> 後者の場合は実体と魂に身長差があるので、現時点では角度の調整が必要です。
#@code mcfunction
#> # 魂の向きを取得
#> execute on passengers on origin run function egg:soul/-indicate
#> # 向きを実体に設定
#> data modify entity @s Rotation set from storage egg:soul/-indicate >>rotation
#> # 攻撃中でないときは実体の身長に応じた角度の微調整が必要になるかもしれない
#> execute on passengers on origin store result score #indicate -- run function egg:soul/-indicate
#> execute unless score #indicate -- matches 0 run rotate @s ~ ~-15
#:

## Cleanup.
data remove storage egg:soul/-indicate >>rotation

## Verify.
execute unless entity @s[tag=egg.soul] run return fail
execute unless data storage egg:soul/-indicate <<position run return fail
execute unless function egg:_coord/loaded run return fail

## Reset point.
execute in egg:_coord run function egg:soul/-/reset

## Set x position.
execute in egg:_coord \
  run data modify entity @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_soul.x,limit=1] Pos set from storage egg:soul/-indicate <<position

## Set y position to brain's target position.
execute if function egg:soul/-attacking on passengers on target at @s in egg:_coord \
  run teleport @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_soul.y,limit=1] ~ ~ ~ ~ ~
## Set y position to 4m ahead from soul.
execute unless function egg:soul/-attacking at @s positioned ^ ^ ^4.0 in egg:_coord \
  run teleport @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_soul.y,limit=1] ~ ~ ~ ~ ~

## Face target from body.
execute \
  as @e[x=0,y=0,z=0,type=minecraft:snowball,tag=egg.coord.holder.egg_soul.y,limit=1] on origin at @s \
  as @e[x=0,y=0,z=0,type=minecraft:snowball,tag=egg.coord.holder.egg_soul.x,limit=1] on origin \
    run rotate @s facing ~ ~ ~

## Get rotation.
execute \
  as @e[x=0,y=0,z=0,type=minecraft:snowball,tag=egg.coord.holder.egg_soul.x,limit=1] on origin run function egg:data/2d-float_from_rotation
data modify storage egg:soul/-indicate >>rotation set from storage egg:data/2d-float_from_rotation >>2d~float

## Success.
return 1