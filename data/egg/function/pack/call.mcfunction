#:module ja
#@text
#> コールバック用に関数を NBT データで管理する機能を提供します。
#> 関数を NBT データとして取り扱うには下記仕様の `egg.pack` 関数データである必要があります。
#@code mcburnction
#> # egg.pack 関数データ
#> # name に関数名（関数ファイルの深度は aaa:bbb/ccc/ddd/eee/fff/ggg/hhh の8階層までに対応しています）
#> # data に関数呼び出し時に引き渡される汎用 NBT データ（省略可）
#> data modify storage xxx:temp pack set value {name:"xxx:yyyy/zzzzz",data:{value:7,flag:true}}
#:

#:function ja
#@in storage pack egg.pack 関数データ
#@return 関数の処理結果
#@text
#>egg.pack 関数データを実行します。
#> `name` の関数名が実行され、関数の戻り値を返します。
#> 関数内で `data` は `storage egg:pack <<` に格納されています。
#> 内部でマクロによる処理が行われるため、あまりに頻繁な利用は処理速度の低下を招きます。
#> 現在マクロの仕様上、再帰呼び出しには対応していません。
#:

## Verify.
execute unless data storage egg:pack/call <<pack run return fail

## Check nest call.
execute if data storage egg:pack << run return fail

## Set data.
data modify storage egg:pack << set value {}
execute if data storage egg:pack/call <<pack.data run data modify storage egg:pack << set from storage egg:pack/call <<pack.data

## Call name.
function egg:pack/-/macro/path_from_name with storage egg:pack/call <<pack

## Get path count.
execute store result score #egg:pack/call|count -- run data get storage egg:pack/-/macro/path_from_name >>path.path
execute unless score #egg:pack/call|count -- matches 1..8 run return fail

## Get parameters.
data modify storage egg:pack/-/macro/call ** set value {}
data modify storage egg:pack/-/macro/call **.namespace set from storage egg:pack/-/macro/path_from_name >>path.namespace
execute if score #egg:pack/call|count -- matches 1.. run data modify storage egg:pack/-/macro/call **.path_01 set from storage egg:pack/-/macro/path_from_name >>path.path[0]
execute if score #egg:pack/call|count -- matches 2.. run data modify storage egg:pack/-/macro/call **.path_02 set from storage egg:pack/-/macro/path_from_name >>path.path[1]
execute if score #egg:pack/call|count -- matches 3.. run data modify storage egg:pack/-/macro/call **.path_03 set from storage egg:pack/-/macro/path_from_name >>path.path[2]
execute if score #egg:pack/call|count -- matches 4.. run data modify storage egg:pack/-/macro/call **.path_04 set from storage egg:pack/-/macro/path_from_name >>path.path[3]
execute if score #egg:pack/call|count -- matches 5.. run data modify storage egg:pack/-/macro/call **.path_05 set from storage egg:pack/-/macro/path_from_name >>path.path[4]
execute if score #egg:pack/call|count -- matches 6.. run data modify storage egg:pack/-/macro/call **.path_06 set from storage egg:pack/-/macro/path_from_name >>path.path[5]
execute if score #egg:pack/call|count -- matches 7.. run data modify storage egg:pack/-/macro/call **.path_07 set from storage egg:pack/-/macro/path_from_name >>path.path[6]
execute if score #egg:pack/call|count -- matches 8.. run data modify storage egg:pack/-/macro/call **.path_08 set from storage egg:pack/-/macro/path_from_name >>path.path[7]

## Call with path.
execute if score #egg:pack/call|count -- matches 1 store result score #egg:pack/call|result -- run function egg:pack/-/macro/call_01 with storage egg:pack/-/macro/call **
execute if score #egg:pack/call|count -- matches 2 store result score #egg:pack/call|result -- run function egg:pack/-/macro/call_02 with storage egg:pack/-/macro/call **
execute if score #egg:pack/call|count -- matches 3 store result score #egg:pack/call|result -- run function egg:pack/-/macro/call_03 with storage egg:pack/-/macro/call **
execute if score #egg:pack/call|count -- matches 4 store result score #egg:pack/call|result -- run function egg:pack/-/macro/call_04 with storage egg:pack/-/macro/call **
execute if score #egg:pack/call|count -- matches 5 store result score #egg:pack/call|result -- run function egg:pack/-/macro/call_05 with storage egg:pack/-/macro/call **
execute if score #egg:pack/call|count -- matches 6 store result score #egg:pack/call|result -- run function egg:pack/-/macro/call_06 with storage egg:pack/-/macro/call **
execute if score #egg:pack/call|count -- matches 7 store result score #egg:pack/call|result -- run function egg:pack/-/macro/call_07 with storage egg:pack/-/macro/call **
execute if score #egg:pack/call|count -- matches 8 store result score #egg:pack/call|result -- run function egg:pack/-/macro/call_08 with storage egg:pack/-/macro/call **

## Remove data.
data remove storage egg:pack <<

## Return.
return run scoreboard players get #egg:pack/call|result --