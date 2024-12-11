# Decrement explosionCountdown every tick while the value is greater than zero.
# This is the explosionCountdown that determines when mobGriefing will be re-enabled.
execute if score #explosionCountdown explosionCountdown matches 1.. run scoreboard players remove #explosionCountdown explosionCountdown 1

entity_type_tag explodey:boi
{
  "values": [
    "minecraft:creeper",
    "minecraft:large_fireball",
    "minecraft:wither_skull"
  ]
}

# Whenever a player is within 3 blocks of an explodey boi reset explosionCountdown to 60
execute as @a[gamemode=survival] at @s if entity @e[type=#explodey:boi,distance=..3,limit=1] run scoreboard players set #explosionCountdown explosionCountdown 60 


# If explosionCountdown is still counting down (the value is greater than zero)
# disable mobGriefing. Otherwise re-enable mobGriefing.
execute if score #explosionCountdown explosionCountdown matches 1.. run gamerule mobGriefing false
execute unless score #explosionCountdown explosionCountdown matches 1.. run gamerule mobGriefing true
