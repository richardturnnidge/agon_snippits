#!bin/bash
# NOTE: 
# Requires: bsc, ez80asm, python3, pyserial & srec_cat (SRecord tools) to be installed

echo "Compile and Build script for AgonLight2 & Console8"
echo "BSimple file:" $1 

binfile=$(basename $1 .bs).bin
hexfile=$(basename $1 .bs).hex

echo "--------------------------------------------------"

# compile to ASM file and run ez80asm in one shot with '+'' option
/usr/local/bin/bsc "$1" "+"

echo "--------------------------------------------------"
echo "Created ez80asm binary:" $binfile 

# make copy for emulator
echo "--------------------------------------------------"
echo "Making emulator local copy: $binfile"

cp "$binfile" "../../fab-agon-emulator-v0.9.89-macos/sdcard/" 

echo "--------------------------------------------------"
echo "Making HEX file:" $hexfile 

# make the hex file
srec_cat "$binfile" "-binary"  "-offset" "0x40000" "-o" "$hexfile" "-intel" 

echo "--------------------------------------------------"
echo "Sending over serial to Agon..."

# send the hex file over serial port to Agon Light 2
python3 send.py "$hexfile" "/dev/tty.usbserial-1120"

echo "--------------------------------------------------"


# note: device will have different port address
# check ports with: ls /dev/tty.*
# other possible ports:
# Console8
# python3 send.py "$hexfile" "/dev/tty.usbserial-02B1CCEA"

# Agon Light 2
# python3 send.py "$hexfile" "/dev/tty.usbserial-1130"

