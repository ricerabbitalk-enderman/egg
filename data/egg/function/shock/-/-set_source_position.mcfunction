## Get position.
execute on origin run function egg:data/3d-double_from_position
data modify storage egg:shock source set from storage egg:data/3d-double_from_position >>3d~double

## Set source position.
data modify storage egg:shock << merge value {source_x:0.0,source_y:0.0,source_z:0.0}
data modify storage egg:shock <<.source_x set from storage egg:shock source[0]
data modify storage egg:shock <<.source_y set from storage egg:shock source[1]
data modify storage egg:shock <<.source_z set from storage egg:shock source[2]

## Success.
return 1