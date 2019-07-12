INSTALL_DIR=~/.local/bin
CRC_DIR=~/.crc

prefix=~/.local
crc_dir=~/.crc

EXEC_FILES=bin/crc

SCRIPT_FILES=bin/crc-config
SCRIPT_FILES+=bin/crc-create
SCRIPT_FILES+=bin/crc-env
SCRIPT_FILES+=bin/crc-help
SCRIPT_FILES+=bin/crc-input
SCRIPT_FILES+=bin/crc-output
SCRIPT_FILES+=bin/crc-template
SCRIPT_FILES+=bin/crc-utils
SCRIPT_FILES+=bin/crc-validate


REM_EXEC_FILES=bin/crc

REM_SCRIPT_FILES=crc-config
REM_SCRIPT_FILES+=crc-create
REM_SCRIPT_FILES+=crc-env
REM_SCRIPT_FILES+=crc-help
REM_SCRIPT_FILES+=crc-input
REM_SCRIPT_FILES+=crc-output
REM_SCRIPT_FILES+=crc-template
REM_SCRIPT_FILES+=crc-utils
REM_SCRIPT_FILES+=crc-validate

CONFIG_FILE=.crcrc

all:
	@echo "usage: make install"
	@echo "       make uninstall"

install:
	mkdir -p $(crc_dir)/bin
	install -d -m 0755 $(prefix)/bin
	install -m 0755 $(EXEC_FILES) $(prefix)/bin
	install -m 0644 $(SCRIPT_FILES) $(prefix)/bin
	install -m 0644 $(CONFIG_FILE) ~
	cp -r template $(crc_dir)/template
	cp $(CONFIG_FILE) ~/$(CONFIG_FILE)

uninstall:
	test -d $(prefix)/bin && \
	cd $(prefix)/bin && \
	rm -f $(REM_EXEC_FILES)
	rm -f $(REM_SCRIPT_FILES)
	rm -f ~/$(CONFIG_FILE)
	test -d $(crc_dir) && \
	rm -rf $(crc_dir)

test:
	cd bin && \
	bats -r .
