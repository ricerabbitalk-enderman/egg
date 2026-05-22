## Attributes.
attribute @s minecraft:burning_time base set 0.0
attribute @s minecraft:attack_damage base set 0.0
attribute @s minecraft:entity_interaction_range base set 0.0
attribute @s minecraft:scale base set 0.0625
## Add property.
function egg:property/invisible/add
## Remove tags.
tag @s remove _uninitialized
## Join team.
team join egg.object @s

## Success.
return 1