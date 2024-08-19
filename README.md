# SMAesH-256

An optimized masked hardware implementation of AES-128 & AES-256 encryption and decryption using HPC masking scheme.

This work is an extension of the implementation published by [SIMPLE-Crypto](https://simple-crypto.org) available in [open-source](https://github.com/simple-crypto/SMAesH).

## Contents

- `hdl`: Verilog implementation and its testbench.
- `beh_simu`: Scripts for behavioral simulation using iverilog.
- `synth`: Scripts to synthesize the implementation using yosys and nangate45-pdk.
- `formal_verif`: Scripts for formal verification with [fullverif](https://github.com/cassiersg/fullverif)

## License

See [LICENSE.txt](LICENSE.txt) and [COPYRIGHT.txt](COPYRIGHT.txt).
See also the [SIMPLE-Crypto licensing policy](https://www.simple-crypto.dev/organization).

## Acknowledgements

The original work by SIMPLE-Crypto has been funded in part by the Belgian Fund for Scientific Research
(F.R.S.-FNRS) through individual researchers' grants, by the European Union
(EU) through the ERC project 724725 (acronym SWORD) and the ERC project
101096871 (acronym BRIDGE), and by the Walloon Region through the Win2Wal
project PIRATE (convention number 1910082).

The modifications were carried out as part of a master thesis.