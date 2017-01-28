INSTALL_DIR=/opt/research
VENV_DIR=venv
BIN=/usr/local/bin

build: *
	virtualenv $(VENV_DIR)
	$(VENV_DIR)/bin/python setup.py install

.PHONY: install
install:
	mkdir -p $(INSTALL_DIR)
	cp -r $(VENV_DIR)/* $(INSTALL_DIR)
	cp bin/* $(INSTALL_DIR)/bin
	echo "$(INSTALL_DIR)/bin/python $(INSTALL_DIR)/bin/peek.py \$$@" > $(BIN)/peek
	chmod a+x $(BIN)/peek

.PHONY: uninstall
uninstall:
	rm -rf $(INSTALL_DIR)
	rm -f $(BIN)/peek
	
.PHONY: clean
clean:
	rm -rf venv build ReSearch.egg-info
