BUILD_DIR := ./build

README.md: madlib.json
	pilcrow -i README.md --repo brekk/mad-at-json --auto

version.lock:
	madlib install

.PHONY: clean
clean:
	rm -r $(BUILD_DIR)
