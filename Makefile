BUILD_DIR := ./build
SRC_DIR := ./src
EXEC := madinstall
EXEC2 := madlocker
EXEC3 := madcleaner

$(BUILD_DIR)/$(EXEC): $(SRC_DIR)/*.mad tools/Installer.mad
	mkdir -p $(dir $@)
	echo "compiling! - madinstall"
	madlib compile -i tools/Installer.mad -t llvm -o $@
	echo "built! - madinstall"

$(BUILD_DIR)/$(EXEC2): $(SRC_DIR)/*.mad tools/CleanVersionLock.mad
	mkdir -p $(dir $@)
	echo "compiling! - madlocker"
	madlib compile -i tools/CleanVersionLock.mad -t llvm -o $@
	echo "built! - madlocker"

$(BUILD_DIR)/$(EXEC3): $(SRC_DIR)/*.mad tools/CleanMadlibJson.mad
	mkdir -p $(dir $@)
	echo "compiling! - madcleaner"
	madlib compile -i tools/CleanMadlibJson.mad -t llvm -o $@
	echo "built! - madcleaner"

version.lock:
	madlib install

.PHONY: clean
clean:
	rm -r $(BUILD_DIR)


README.md: madlib.json
	pilcrow -i README.md --repo brekk/mad-at-json --auto

version.lock:
	madlib install

.PHONY: clean
clean:
	rm -r $(BUILD_DIR)
