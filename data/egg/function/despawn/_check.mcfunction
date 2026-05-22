## Clear keep flag.
tag @e[tag=egg.despawn] remove egg.despawn.keep
## Try.
execute at @a as @e[tag=egg.despawn,distance=..72] run function egg:despawn/-/-try
execute as @e[tag=egg.despawn,tag=!egg.despawn.keep] run function egg:despawn/-/-delete

## Schedule next.
schedule function egg:despawn/_check 10t replace