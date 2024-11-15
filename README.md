# Agon Snippits

A selection of useful files or routines.

### build.sh
This is my main build script which is called from the text editor. It does the following:
- assembles the ASM file into a binary with `ez80asm`.
- makes a local copy of the binary in my emulator's SDCard directory.
- creates a HEX file from the binary file using `srec_cat`.
- sends the HEX file via serial port to `hexload` on the Agon, using `send.py`.

On the Agon, type `hexload vdp` to receive the transferred file, prior to calling the build script.

NOTE: needs `srecord` to be installed to use `srec_cat`. This is normally installed with `brew`.


### sendfile.sh
This is a simpler script which ony:
- creates a HEX file from the given source file (any type, text, binary, etc) using `srec_cat`.
- sends the HEX file via serial port to `hexload` on the Agon, using `send.py`.

On the Agon, type `hexload vdp` to receive the transferred file, prior to calling the build script.


### send.py
This is an early version which does not automatically deal with raw binary conversion to HEX.

This gets called from either of the above 2 scripts.

It does the following:
- opens given serial port.
- sends data in the HEX file line by line using `pyserial`.

NOTE: Uses Python3 and needs `pyserial` to be installed for Python to use the serial port.

