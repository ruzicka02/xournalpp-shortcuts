.PHONY = clean install

PLUGIN_DIR ?= /usr/share/xournalpp/plugins
PLUGIN_SHORTCUTS = shortcuts

clean:
	# removing plugin
	rm -rf "$(PLUGIN_DIR)/$(PLUGIN_SHORTCUTS)"

install:
	# installing plugin
	cp -r "./$(PLUGIN_SHORTCUTS)" "$(PLUGIN_DIR)"
