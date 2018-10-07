#!/bin/bash

echo "1. number of volumes, size of each volume, free space on each volume"
sudo df -h
echo " "
echo "2. number cpus/cores, information about the cpus/core"
system_profiler SPHardwareDataType | grep Cores:
system_profiler SPHardwareDataType | grep Processors:
sysctl -n machdep.cpu.brand_string
echo " "
echo "3. your mac address and ip address"
ip=$(ipconfig getifaddr en0)
echo "IP: ${ip}"
address=$(ifconfig en1 | awk '/ether/{print $2}')
echo "Address: ${address}"

echo "4. amount of ram"
system_profiler SPHardwareDataType | grep "  Memory:"
