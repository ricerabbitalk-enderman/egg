## Set data.
data modify entity @s data merge value {egg:{soul:{}}}
## Attributes.
attribute @s minecraft:burning_time base set 0.0
attribute @s minecraft:attack_damage base set 0.0
attribute @s minecraft:scale base set 0.0625
## Set property.
function egg:property/invisible/add
## Add tags.
tag @s add egg.soul
## Join team.
team join egg.object @s

## Success.
return 1