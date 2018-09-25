#!/bin/bash


# $# --> number of parameter passing in.
if [ $# != 1 ]; then
  echo "Only takes in on parameter..."
  echo "Usage 1: ./devops01b.sh volumes
      2: ./devops01b.sh cpu
      3: ./devops01b.sh ram
      4: ./devops01b.sh network
      5: ./devops01b.sh all"  
else 
  option=$1
  optionLower=$(echo $option | tr '[:upper:]' '[:lower:]')
  if [ "$optionLower" == "volumes"  ]; then
    sudo df -h  
  elif [ "$optionLower"  == "cpu" ]; then
    system_profiler SPHardwareDataType | grep Cores:
    system_profiler SPHardwareDataType | grep Processors:
  elif [ "$optionLower" == "ram" ]; then
    system_profiler SPHardwareDataType | grep "  Memory:"
  elif [ "$optionLower" == "network" ]; then
    ip=$(ipconfig getifaddr en0)
    echo "IP: ${ip}"
    address=$(ifconfig en1 | awk '/ether/{print $2}')
    echo "Address: ${address}"
  elif [ "$optionLower" == "all" ]; then
    echo "-----volumes-----"
    sudo df -h
    echo "-----cpu-----"
    system_profiler SPHardwareDataType | grep Cores:
    system_profiler SPHardwareDataType | grep Processors:
    echo "-----ram-----"
    system_profiler SPHardwareDataType | grep "  Memory:"
    echo "-----network-----"
    ip=$(ipconfig getifaddr en0)
    echo "IP: ${ip}"
    address=$(ifconfig en1 | awk '/ether/{print $2}')
    echo "Address: ${address}" 
  else
    echo "Usage 1: ./devops01b.sh volumes
        2: ./devops01b.sh cpu
        3: ./devops01b.sh ram
        4: ./devops01b.sh network
        5: ./devops01b.sh all"  
  fi
fi
