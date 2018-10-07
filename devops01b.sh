#!/bin/bash

numberCmd=$#
options_input=($@)
echo "Usage > ./devops01b.sh [OPTIONs]"
echo "EXAMPLE > ./devops01b.sh -RAM -CPU"
echo " " 



for option in ${options_input[*]}; do
  option=$(echo $option | tr '[:lower:]' '[:upper:]')
  case $option in 
  -RAM) 
    echo "----------ram----------"
    system_profiler SPHardwareDataType | grep "  Memory:";;

  -CPU) 
    echo "----------cpu----------"
    system_profiler SPHardwareDataType | grep Cores: 
    system_profiler SPHardwareDataType | grep Processors:
    info=$(sysctl -n machdep.cpu.brand_string)
    echo "cpu info: ${info}";;
  -NETWORK) 
    echo "----------network----------"
    ip=$(ipconfig getifaddr en0)
    echo "IP: ${ip}"
    address=$(ifconfig en1 | awk '/ether/{print $2}')
    echo "Address: ${address}";;
  
  -VOLUMES)
    echo "----------volumes----------"
    sudo df -h;;

  -ALL) 
    echo "----------all-----------"
    echo "+++++volumes+++++"
    sudo df -h
    echo "+++++cpu+++++"
    echo " "
    system_profiler SPHardwareDataType | grep Cores:
    system_profiler SPHardwareDataType | grep Processors:
    echo " "
    echo "+++++ram++++++"
    system_profiler SPHardwareDataType | grep "  Memory:"
    echo " "
    echo "+++++network+++++"
    ip=$(ipconfig getifaddr en0)
    echo "IP: ${ip}"
    address=$(ifconfig en1 | awk '/ether/{print $2}')
    echo "Address: ${address}";;
  esac
done

