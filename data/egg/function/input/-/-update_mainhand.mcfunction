## Check ID.
execute if function egg:input/-mainhand run return 0

## Publish ID.
data modify storage egg:set_extended_id << set value {}
execute store result storage egg:set_extended_id <<.id int 1 run function egg:input/-/publish_extended_id
item modify entity @s weapon.mainhand egg:set_extended_id

## Published.
return 1