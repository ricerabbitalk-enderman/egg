## Enable.
function egg:input/_-enable
function egg:key/backward/_-enable
function egg:key/forward/_-enable
function egg:key/left/_-enable
function egg:key/right/_-enable
function egg:key/jump/_-enable
function egg:key/sneak/_-enable
function egg:key/sprint/_-enable
## Set scoreboards.
scoreboard players set @s egg.alignment 1
## Add tags.
tag @s add egg.player

## Success.
return 1