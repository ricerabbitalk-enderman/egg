## egg:input

### egg:input/-mainhand

| I/O | 詳細 |
| :--- | :--- |
| `return` | メインハンドに持つアイテムの拡張 ID |

メインハンドに持つアイテムの **[拡張 ID](definition.md#アイテム拡張-id)** を取得します。

### egg:input/-offhand

| I/O | 詳細 |
| :--- | :--- |
| `return` | オフハンドに持つアイテムの拡張 ID |

オフハンドに持つアイテムの **[拡張 ID](definition.md#アイテム拡張-id)** を取得します。

### egg:input/-pushed & egg:key/.../-pushed

| I/O | 詳細 |
| :--- | :--- |
| `return` | 右クリック入力のティック数 |

右クリックが押されているかどうかを取得します。

押し続けられているティック数が戻り値になります。

### egg:input/-released & egg:key/.../-released

| I/O | 詳細 |
| :--- | :--- |
| `return` | 右クリック入力が継続されたティック数 |

右クリック入力が終了したかどうかを取得します。

入力終了まで押し続けられていたティック数が戻り値になります。

### egg:input/-triggered & egg:key/.../-triggered

| I/O | 詳細 |
| :--- | :--- |
| `return` | 右クリック未入力のティック数 |

右クリック入力の瞬間を検知します。

右クリック入力まで未入力だったティック数が戻り値になります。