## Verify.
execute unless data storage egg:soul/-target <<uuid run return fail

## Target.
data modify storage egg:brain/-target <<uuid set from storage egg:soul/-target <<uuid
execute on passengers if function egg:brain/-activate run function egg:brain/-target

## Success.
return 1