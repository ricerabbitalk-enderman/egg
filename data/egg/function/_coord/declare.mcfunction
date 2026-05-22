## Set parameters.
data modify storage egg:_coord/declare ** set value {}
data modify storage egg:_coord/declare **.group set from storage egg:_coord/declare <<group
data modify storage egg:_coord/declare **.name set from storage egg:_coord/declare <<name
## New object.
function egg:_coord/-/macro/new_object with storage egg:_coord/declare **
## New holder.
data modify storage egg:_coord/-/macro/new_holder <<uuid set from storage egg:_coord/-/macro/new_object >>uuid
function egg:_coord/-/macro/new_holder with storage egg:_coord/declare **

## Success.
return 1