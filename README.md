# Agon Snippits

A selection of useful files or routines.

build.sh
This is my main build script which is called from the text editor. It does the following:
- assembles the ASM file into a binary with `ez80asm`.
- makes a local copy of the binary in my emulator's SDCard directory.
- creates a hex file from the binary file using `srec_cat`.
- sends the hex file via serial port to `hexload` on the Agon.


send.py



sednfile.sh


