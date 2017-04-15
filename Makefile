INSTALL_DIR=/opt/research
VENV_DIR=venv
BIN=/usr/local/bin

PEEK=rspeek
FLIP=rsflip
READD=rsreadd
FINDD=rsfindd
QPQT=qpqt

build: *
	wget http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -N -O miniconda.sh
	bash ./miniconda.sh -b -f -p $(VENV_DIR)
	$(VENV_DIR)/bin/conda update --yes conda
	$(VENV_DIR)/bin/conda install --yes nltk numpy pandas Cython llvmlite numba
	$(VENV_DIR)/bin/python setup.py install

.PHONY: install
install:
	mkdir -p $(INSTALL_DIR)
	cp -r $(VENV_DIR)/* $(INSTALL_DIR)
	cp bin/* $(INSTALL_DIR)/bin
	# rspeek
	echo "$(INSTALL_DIR)/bin/python $(INSTALL_DIR)/bin/peek.py \$$@" > $(BIN)/$(PEEK)
	chmod a+x $(BIN)/$(PEEK)
	# rsflip
	echo "$(INSTALL_DIR)/bin/python $(INSTALL_DIR)/bin/flip.py \$$@" > $(BIN)/$(FLIP)
	chmod a+x $(BIN)/$(FLIP)
	# rsreadd
	echo "$(INSTALL_DIR)/bin/python $(INSTALL_DIR)/bin/readd.py \$$@" > $(BIN)/$(READD)
	chmod a+x $(BIN)/$(READD)
	# rsreadd
	echo "$(INSTALL_DIR)/bin/python $(INSTALL_DIR)/bin/findd.py \$$@" > $(BIN)/$(FINDD)
	chmod a+x $(BIN)/$(FINDD)
	# qpqt
	echo "$(INSTALL_DIR)/bin/python $(INSTALL_DIR)/bin/qpqt.py \$$@" > $(BIN)/$(QPQT)
	chmod a+x $(BIN)/$(QPQT)

.PHONY: uninstall
uninstall:
	rm -rf $(INSTALL_DIR)
	rm -f $(BIN)/$(PEEK) $(BIN)/$(FLIP) $(BIN)/$(READD) $(BIN)/$(FINDD) $(BIN)/$(QPQT)
	
.PHONY: clean
clean:
	rm -rf venv build ReSearch.egg-info
