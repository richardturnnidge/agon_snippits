# Agon Snippits

A selection of useful files or routines.

### build.sh
This is my main build script which is called from the text editor. It does the following:
- assembles the ASM file into a binary with `ez80asm`.
- makes a local copy of the binary in my emulator's SDCard directory.
- creates a HEX file from the binary file using `srec_cat`.
- sends the HEX file via serial port to `hexload` on the Agon, using `send.py`.

On the Agon, type `hexload vdp` to receive the transferred file, prior to calling the build script.

Use: _build.sh filename.asm_

NOTE: needs `srecord` to be installed to use `srec_cat`. This is normally installed with `brew`.

Needs to be in the same directory as the working file.


### sendfile.sh
This is a simpler script which ony:
- creates a HEX file from the given source file (any type, text, binary, etc) using `srec_cat`.
- sends the HEX file via serial port to `hexload` on the Agon, using `send.py`.

On the Agon, type `hexload vdp` to receive the transferred file, prior to calling the build script.

Use: _sendfile.sh filename.ext_

Needs to be in the same directory as the working file.

### send.py
This is an early version which does not automatically deal with raw binary conversion to HEX.

Use: _send.py filename.hex_

This gets called from either of the above 2 scripts.

It does the following:
- opens given serial port.
- sends data in the HEX file line by line using `pyserial`.

NOTE: Uses Python3 and needs `pyserial` to be installed for Python to use the serial port.

Needs to be in the same directory as the working file.
