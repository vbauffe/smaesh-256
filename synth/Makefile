
WORK ?= ./work
NUM_SHARES ?= 2
LATENCY = 4

WORK_DIR=$(WORK)/hdl_d$(NUM_SHARES)_L$(LATENCY)

HDL_ROOT_DIR=../hdl/


synth:
	mkdir -p $(WORK)
	mkdir -p $(WORK_DIR)
	NUM_SHARES=$(NUM_SHARES) LATENCY=$(LATENCY) OUT_DIR=$(WORK_DIR) $(HDL_ROOT_DIR)/gather_sources.sh $(HDL_ROOT_DIR)
	VINCLUDE=$(WORK_DIR) VDEFINES="-DDEFAULTSHARES=$(NUM_SHARES)" TOP=aes_enc128_32bits_hpc WORK=$(WORK) SYNTH_NAME=new-inverse-d$(NUM_SHARES)-L$(LATENCY) SRC_DIR=$(WORK_DIR) LATENCY=$(LATENCY) NUM_SHARES=$(NUM_SHARES) yosys -q -c synth.tcl -l $(WORK)/synth.log

all_synth:
	for nshares in 2 3 4 5; do make -C . NUM_SHARES=$$nshares synth; done

report: all_synth
	python3 table_area.py --results-dir $(WORK) --outcsv $(WORK)/areas.csv

clean:
	-rm -r $(WORK)

.PHONY: clean smaesh_synth synth all_synth report
