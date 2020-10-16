.PHONY = clean install

PLUGIN_DIR ?= /usr/share/xournalpp/plugins
PLUGIN_SHORTCUTS = shortcuts

clean:
	# removing plugin
	test -d "$(PLUGIN_DIR)"
	rm -rf "$(PLUGIN_DIR)/$(PLUGIN_SHORTCUTS)"

install:
	# installing plugin
	test -d "$(PLUGIN_DIR)"
	cp -r "./$(PLUGIN_SHORTCUTS)" "$(PLUGIN_DIR)"
