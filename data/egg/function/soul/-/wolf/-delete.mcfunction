execute at @s run function egg:soul/-/wolf/-lift
function egg:soul/-unfollow

## Disable shell.
execute on passengers on passengers on passengers run function egg:shell/-delete
## Disable brain.
execute on passengers on passengers run function egg:brain/-delete
## Disable dummy.
execute on passengers run kill @s
## Delete.
teleport @s ~ -1024 ~
kill @s

## Success.
return 1