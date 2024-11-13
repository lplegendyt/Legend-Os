#!/bin/bash

# iso_build.sh
# This script builds the Legend OS ISO file.

make clean
make all

# Test the ISO with QEMU
qemu-system-x86_64 -cdrom build/legend-os.iso
