## Lost.
$execute positioned $(x) $(y) $(z) unless entity @s[distance=..$(distance)] run return run scoreboard players get #egg:ray.result|lost --
## Detect.
$execute positioned $(x) $(y) $(z) $(condition) block ~ ~ ~ #$(namespace):$(tag) align xyz run return run function egg:pack/call
## Continue.
return run scoreboard players get #egg:ray.result|continue --