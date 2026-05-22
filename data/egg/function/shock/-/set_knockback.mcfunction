## Get knockback motion.
function egg:shock/-/knockback/get_knockback_motion

## Set knockback motion.
data modify entity @s Motion set from storage egg:shock knockback

## Success.
return 1