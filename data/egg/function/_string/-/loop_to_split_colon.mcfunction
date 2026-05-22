## Next.
execute unless function egg:_string/-/next run return 0

## Compare char and separator.
execute store success score #egg:_string/-/loop_to_split|success -- \
  run data modify storage egg:_string/-/loop_to_split char set value ":"

## Continue.
execute unless score #egg:_string/-/loop_to_split|success -- matches 0 run return run function egg:_string/-/loop_to_split_colon

## Split.
return run function egg:_string/-/split