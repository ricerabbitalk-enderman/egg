execute \
  as @e[x=0,y=0,z=0,type=minecraft:snowball,tag=egg.coord.holder.egg_shock.x,limit=1] on origin at @s \
  as @e[x=0,y=0,z=0,type=minecraft:snowball,tag=egg.coord.holder.egg_shock.y,limit=1] on origin facing entity @s feet \
    run rotate @e[x=0,y=0,z=0,type=minecraft:text_display,tag=egg.coord.egg_shock.origin,limit=1] ~ ~