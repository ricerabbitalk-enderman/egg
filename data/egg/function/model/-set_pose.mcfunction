#:function ja
#@in storage pose ポーズデータ
#@return 処理の成否
#@text
#> モデルのポーズを変更します。
#:

## Verify.
execute unless entity @s[type=minecraft:block_display] run return fail
execute unless entity @s[tag=egg.model] run return fail
execute unless data storage egg:model/-set_pose <<pose run return fail

## Set data.
data modify storage egg:model/-/-loop_to_set_pose data set from storage egg:model/-set_pose <<pose

## Set Pose.
execute on passengers run function egg:model/-/-loop_to_set_pose

## Success.
return 1