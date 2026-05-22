## Unmodified.
execute if score @s egg.alignment matches 1 on target if score @s egg.alignment matches -1 run return 0
execute if score @s egg.alignment matches -1 on target if score @s egg.alignment matches 1 run return 0
execute if score @s egg.alignment matches 0 on target if score @s egg.alignment matches 0 run return 0

## Modified.
return 1