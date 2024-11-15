#!bin/bash
# UPDATED VERSION requires 'srec_cat' to be installed

echo -ne "Script to send a File:" $1 "\n"

binfile=$(basename $1)
hexfile=$(basename $1).hex

echo -ne "--------------------------------------------------\n"
echo -ne "Making HEX file:" $hexfile "\n"

srec_cat "$binfile" "-binary"  "-offset" "0x40000" "-o" "$hexfile" "-intel" 

echo -ne "--------------------------------------------------\n"
echo -ne "Sending over serial to Agon...\n"

# send the hex file over serial port
# different machines have different port IDs

# Console8 serial port
python3 send.py "$hexfile" "/dev/tty.usbserial-02B1CCEA"

# AgonLight2 serial port
# python3 send.py "$binfile" "/dev/tty.usbserial-1130"

echo -ne "--------------------------------------------------\n"



