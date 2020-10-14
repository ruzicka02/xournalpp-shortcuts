.PHONY = clean install

PLUGIN_SHORTCUTS=shortcuts
XPP_PLUGIN_DIR=/usr/share/xournalpp/plugins

clean:
	# removing plugin
	rm -r "$(XPP_PLUGIN_DIR)/$(PLUGIN_SHORTCUTS)"

install:
	# installing plugin
	cp -r "./$(PLUGIN_SHORTCUTS)" "$(XPP_PLUGIN_DIR)"
