#:module ja
#@text
#> エンティティの関係性を取得する機能を提供します。
#> これらの機能は `on` によるコマンド実行者 `@s` の切り替わりを防ぎながら、安全にその存在を確認できます。
#@code mcfunction
#> # vehicle （乗り物）の存在確認
#> execute if function egg:on/vehicle run tellraw @a [{selector:"@s"}," ride a vehicle."]
#>
#> # 悪い例
#> # こうすると on vehicle で @s が切り替わり "<vehicle> ride a vehicle." となる
#> execute on vehicle run tellraw @a [{selector:"@s"}," ride a vehicle."]
#>
#> # 有効なパターン
#> # on vehicle では「乗り物に乗っていない」というパターンを検知できません
#> # そういう場合にも egg:on は有効です
#> execute unless function egg:on/vehicle run tellraw @a [{selector:"@s"}," is walking."]
#:

#:function ja
#@return コマンド実行者 `@s` への攻撃者の有無
#> 攻撃者の有無を取得します。
#:

## Has attacker (0 or 1)
execute on attacker run return 1
return 0