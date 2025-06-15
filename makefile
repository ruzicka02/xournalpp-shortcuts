.PHONY = clean install

PLUGIN_DIR ?= $(HOME)/.var/app/com.github.xournalpp.xournalpp/config/xournalpp/plugins
PLUGIN_SHORTCUTS = shortcuts

clean:
	# removing plugin
	test -d "$(PLUGIN_DIR)"
	rm -rf "$(PLUGIN_DIR)/$(PLUGIN_SHORTCUTS)"

install:
	# installing plugin
	test -d "$(PLUGIN_DIR)"
	cp -r "./$(PLUGIN_SHORTCUTS)" "$(PLUGIN_DIR)"
