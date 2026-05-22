## Disable.
function egg:input/_-disable
function egg:key/backward/_-disable
function egg:key/forward/_-disable
function egg:key/left/_-disable
function egg:key/right/_-disable
function egg:key/jump/_-disable
function egg:key/sneak/_-disable
function egg:key/sprint/_-disable
## Reset scoreboards.
scoreboard players reset @s egg.alignment
## Remove tags.
tag @s remove egg.player

## Success.
return 1