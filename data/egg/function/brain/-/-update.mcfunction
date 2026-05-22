## Check passengers.
execute unless function egg:on/vehicle run return 0

## Check outbox.
execute if function egg:brain/-infight run return 1

## Update tick.
scoreboard players add @s egg.brain._tick 1
## Keep Storategy.
execute if score @s egg.brain._tick matches 1000 run function egg:brain/-launch_outbox
## Reset tick.
execute if score @s egg.brain._tick matches 1000.. run scoreboard players set @s egg.brain._tick 0

## Continue.
return 1