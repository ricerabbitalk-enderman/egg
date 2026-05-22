## Disable shell.
execute on passengers on passengers run function egg:shell/-delete
## Disable brain.
execute on passengers run function egg:brain/-delete
## Delete.
teleport @s ~ -1024 ~
kill @s

## Success.
return 1