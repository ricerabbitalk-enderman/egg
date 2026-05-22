## Initialize.
execute as @a[tag=!egg.player] run function egg:player/-/-enable
## Update.
execute as @a[tag=egg.player] unless function egg:player/-/-update run function egg:player/-/-disable