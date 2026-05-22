## Break.
execute unless data storage egg:model/-/loop_to_define_looks <<looks[-1] run return 1
## Pop.
data modify storage egg:model/-/loop_to_define_looks look set from storage egg:model/-/loop_to_define_looks <<looks[-1]
data remove storage egg:model/-/loop_to_define_looks <<looks[-1]
## Modify.
data modify storage egg:model/-/macro/modify_look <<modifier set from storage egg:model/-/loop_to_define_looks <<modifier
data remove storage egg:model/-/macro/modify_look >>look
function egg:model/-/macro/modify_look with storage egg:model/-/loop_to_define_looks look
# minecraft:item_display
execute \
  if data storage egg:model/-/macro/modify_look >>look.item \
  if data storage egg:model/-/loop_to_define_looks look.item \
    run data modify storage egg:model/-/loop_to_define_looks look.item set from storage egg:model/-/macro/modify_look >>look.item
# minecraft:block_display
execute \
  if data storage egg:model/-/macro/modify_look >>look.block_state \
  if data storage egg:model/-/loop_to_define_looks look.block_state \
    run data modify storage egg:model/-/loop_to_define_looks look.block_state set from storage egg:model/-/macro/modify_look >>look.block_state
# minecraft:text_display
execute \
  if data storage egg:model/-/macro/modify_look >>look.text \
  if data storage egg:model/-/loop_to_define_looks look.text \
    run data modify storage egg:model/-/loop_to_define_looks look.text set from storage egg:model/-/macro/modify_look >>look.text
## Prepend.
data modify storage egg:model/-/loop_to_define_looks >>looks prepend from storage egg:model/-/loop_to_define_looks look
## Next [Recursive call].
return run function egg:model/-/loop_to_define_looks