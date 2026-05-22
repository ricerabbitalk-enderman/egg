## Help.
# Caption.
tellraw @s [ \
  {text:"## "}, \
  {translate:"egg.help.caption",fallback:"Essential General Gear (egg)"}, \
  {text:" "}, \
  {translate:"egg.help.version",fallback:"ver."}, \
  {text:" "}, \
  {score:{name:"#egg|VERSION.MAJOR",objective:"--"}}, \
  {text:" "}, \
  {score:{name:"#egg|VERSION.MINOR",objective:"--"}}, \
  {text:" "}, \
  {score:{name:"#egg|VERSION.BUILD",objective:"--"}}, \
]
# Unload Command.
tellraw @s [ \
  {text:"  -1: "}, \
  {translate:"egg.help.command.unload",fallback:"Unload egg and sub modules."}, \
]

## Show help of sub modules.
function #egg:system/help

## Success.
return 1