## Get alignment of target.
scoreboard players set #egg:_mob/-/-conflict_target|alignment -- 0
execute on target run scoreboard players operation #egg:_mob/-/-conflict_target|alignment -- = @s egg.alignment
## Inverse.
scoreboard players operation #egg:_mob/-/-conflict_target|alignment -- *= #egg|-1 --
## Set alignment.
scoreboard players operation @s egg.alignment = #egg:_mob/-/-conflict_target|alignment --

## Success.
return 1