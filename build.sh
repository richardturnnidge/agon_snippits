#!bin/bash
# UPDATED VERSION requires 'srec_cat' to be installed

echo -ne "Build script for AgonLight2 & Console8\nAssembly File:" $1 "\n"

binfile=$(basename $1 .asm).bin
hexfile=$(basename $1 .asm).hex

echo -ne "--------------------------------------------------\n"

# make the bin file
# /usr/local/bin/ez80asm "$1" "-l"
# trying latest version of ez80asm
# /usr/local/bin/ez80asm2 "$1" "-l"
#/usr/local/bin/ez80asm-1_4 "$1" "-l"
#/usr/local/bin/ez80asm-1_9b "$1" "-l" "-v"

/usr/local/bin/ez80asm10 "$1" "-l" "-v"

echo -ne "Created ez80asm v1.10 BIN file:" $binfile "\n"




echo -ne "--------------------------------------------------\n"
echo -ne "Making emulator local copy: $binfile\n"
cp "$binfile" "../fab-agon-emulator-v0.9.69-macos/sdcard/" 

echo -ne "--------------------------------------------------\n"
echo -ne "Making HEX file:" $hexfile "\n"
# make the hex file
# echo -ne "Hex file made\n"

# initial version using intelhex command withing python module
#python3 bin2hex.py "--offset=262144" "$binfile" "$hexfile" 
#python3 bin2hex.py "--offset=0x40000" "$binfile" "$hexfile" 

# alternative bin2hex using sRecord command tool
# srec_cat "$binfile" "-binary"  "-o" "$hexfile" "-intel" "-Output_Block_Size=16"


srec_cat "$binfile" "-binary"  "-offset" "0x40000" "-o" "$hexfile" "-intel" 


####  'srec_cat test.bin -binary -offset 0x40000 -o test.hex -intel'






echo -ne "--------------------------------------------------\n"
echo -ne "Sending over serial to Agon...\n"
# send the hex file over serial port
# Console8
python3 send.py "$hexfile" "/dev/tty.usbserial-02B1CCEA"

# Agon Light 2
# python3 send.py "$binfile" "/dev/tty.usbserial-1130"

#python3 send.py "$hexfile" "/dev/tty.usbserial-1130"

# over USB serial
#python3 send.py "$hexfile" "/dev/tty.usbserial-0001"

echo -ne "--------------------------------------------------\n"

# NOTE: /dev/cu.usbserial-02B1CCEA, /dev/tty.usbserial-02B1CCEA
# /dev/tty.usbserial-0001
# Requires: ez80asm, python3, pyserial
# Run in same folder as source: bin2hex.py, send.py


