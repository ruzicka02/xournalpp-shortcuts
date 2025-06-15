# xournalpp-shortcuts

Custom fork of another shortcut plugin, [FabianUntermoser/xournalpp-shortcuts](https://gitlab.com/FabianUntermoser/xournalpp-shortcuts).

Install plugin with `make clean install`.

By default, the Makefile assumes a flatpak installation and the plugin will be installed to `~/.var/app/com.github.xournalpp.xournalpp/config/xournalpp/plugins`.
If you want to override the plugin directory, install with:

```
PLUGIN_DIR="my-plugin-dir" make clean install
```
