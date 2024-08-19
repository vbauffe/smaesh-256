all: help

### Python virtual environment for COMPRESS ###
PYTHON_VE=source $(VE)/bin/activate

$(VE)/pyvenv.cfg:
	mkdir -p work
	python3 -m venv $(VE)

$(VE_INSTALLED): $(VE)/pyvenv.cfg
	${PYTHON_VE}; python -m pip install -r compress/requirements.txt
	${PYTHON_VE}; python -m pip install tqdm==4.66.4
	touch $(VE_INSTALLED)


### Synthesis ###
aes32synth:
	${PYTHON_VE}; make -C ./synth WORK=$(abspath ./synth/work) report

### Testbenches ###
simu:
	make -C ./beh_simu simu

simu-simple:
	make -C ./beh_simu simu TB_TARGET=tb_core

### Formal verif ###
formal-verif:
	cd ./formal_verif && ./run_fullverif.sh

help:
	@echo "You are out of luck"

.PHONY: all run clean
