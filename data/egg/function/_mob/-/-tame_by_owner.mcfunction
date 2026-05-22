## Get alignment of target.
scoreboard players set #egg:_mob/-/-tame_by_owner|alignment -- 0
execute on owner run scoreboard players operation #egg:_mob/-/-tame_by_owner|alignment -- = @s egg.alignment
## Set alignment.
scoreboard players operation @s egg.alignment = #egg:_mob/-/-tame_by_owner|alignment --

return 1