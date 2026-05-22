## Next ID.
# MAX to MIN.
execute if score #egg:input/-/publish_extended_id|id -- = #egg|MAX -- run scoreboard players operation #egg:input/-/publish_extended_id|id -- = #egg|MIN --
# Increment.
execute unless score #egg:input/-/publish_extended_id|id -- = #egg|MAX -- run scoreboard players add #egg:input/-/publish_extended_id|id -- 1

## Skip ID.
# 0 is invalid ID.
execute if score #egg:input/-/publish_extended_id|id -- matches 0 run scoreboard players set #egg:input/-/publish_extended_id|id -- 1

## Publish.
return run scoreboard players get #egg:input/-/publish_extended_id|id --