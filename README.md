# xournalpp-shortcuts

Custom fork of another shortcut plugin, [FabianUntermoser/xournalpp-shortcuts](https://gitlab.com/FabianUntermoser/xournalpp-shortcuts).

Install plugin with `make clean install`.

By default, the Makefile assumes a flatpak installation and the plugin will be installed to `~/.var/app/com.github.xournalpp.xournalpp/config/xournalpp/plugins`.
If you want to override the plugin directory, install with:

```
PLUGIN_DIR="my-plugin-dir" make clean install
```

## Keybinds

| Key         | Action Description                    | Function Called   | Effect Type       |
|-------------|----------------------------------------|-------------------|-------------------|
| `f`         | Fill on/off                            | `fill()`          | Toggle            |
| `t`         | Cycle through tools                    | `tool()`          | Cycle             |
| `s`         | Cycle through selection tools          | `select()`        | Cycle             |
| `e`         | Cycle through eraser types             | `eraser()`        | Cycle             |
| `v`         | Cycle through drawing types            | `drawingtype()`   | Cycle             |
| `Shift+v`   | Toggle current drawing type on/off     | `nodrawingtype()` | Toggle            |
| `c`         | Cycle through colors                   | `color()`         | Cycle             |
| `l`         | Cycle through line style               | `linestyle()`     | Cycle             |
| `b`         | Toggle between drawing and hand tools  | `scroll()`        | Toggle (Hand mode) |

## Possible shortcuts

All the available commands are listed in [ActionType.enum.h - Github](https://github.com/xournalpp/xournalpp/blob/release-1.2/src/core/enums/ActionType.enum.h).
