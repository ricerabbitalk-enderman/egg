## Verify.
execute unless data storage egg:soul/-target <<uuid run return fail

## Remove dummy.
execute unless function egg:soul/-/wolf/-attacking at @s run function egg:soul/-/wolf/-/-shift_target_mode

## Target.
data modify storage egg:brain/-target <<uuid set from storage egg:soul/-target <<uuid
execute on passengers if function egg:brain/-activate run function egg:brain/-target

## Success.
return 1