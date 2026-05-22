## Follow.
data modify storage egg:soul/-/allay/-follow liked_player set value {}
data modify storage egg:soul/-/allay/-follow liked_player.value set from storage egg:soul/-follow <<uuid
data modify entity @s Brain merge value {memories:{}}
data modify entity @s Brain.memories."minecraft:liked_player" set from storage egg:soul/-/allay/-follow liked_player

## Success.
return 1