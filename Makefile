INSTALL_DIR=~/.local/bin
CRC_DIR=~/.crc

prefix=~/.local
crc_dir=~/.crc

EXEC_FILES=crc

SCRIPT_FILES=bin/crc-config
SCRIPT_FILES+=bin/crc-create
SCRIPT_FILES+=bin/crc-env
SCRIPT_FILES+=bin/crc-help
SCRIPT_FILES+=bin/crc-input
SCRIPT_FILES+=bin/crc-output
SCRIPT_FILES+=bin/crc-template
SCRIPT_FILES+=bin/crc-utils
SCRIPT_FILES+=bin/crc-validate

CONFIG_FILE=.crcrc

all:
	@echo "usage: make install"
	@echo "       make uninstall"

install:
	mkdir -p $(crc_dir)/bin
	install -d -m 0755 $(prefix)/bin
	install -m 0755 $(EXEC_FILES) $(prefix)/bin
	install -m 0644 $(SCRIPT_FILES) $(crc_dir)/bin
	install -m 0644 $(CONFIG_FILE) ~
	cp -r template $(crc_dir)/template
	cp $(CONFIG_FILE) ~/$(CONFIG_FILE)

uninstall:
	test -d $(prefix)/bin && \
	cd $(prefix)/bin && \
	rm -f $(EXEC_FILES)
	rm -f ~/$(CONFIG_FILE)
	test -d $(crc_dir) && \
	rm -rf $(crc_dir)
