## Dismount entities.
execute on passengers on passengers on passengers run data modify storage egg:soul/-/wolf/dummy shell set from entity @s UUID
execute on passengers on passengers on passengers run ride @s dismount
execute on passengers on passengers run data modify storage egg:soul/-/wolf/dummy dummy set from entity @s UUID
execute on passengers on passengers run ride @s dismount
execute on passengers run data modify storage egg:soul/-/wolf/dummy brain set from entity @s UUID
execute on passengers run ride @s dismount

## Mount entities.
data modify storage egg:ride <<uuid set from storage egg:soul/-/wolf/dummy dummy
function egg:ride
data modify storage egg:ride <<uuid set from storage egg:soul/-/wolf/dummy brain
execute on passengers run function egg:ride
data modify storage egg:ride <<uuid set from storage egg:soul/-/wolf/dummy shell
execute on passengers on passengers run function egg:ride

## Success.
return 1