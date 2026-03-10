#!/bin/bash

  for i in {1..10}
  do
    date +"%H:%M:%S"
   ps -ef | tail -n +2 | wc -l
   #sleep 5 
 done

 cat /proc/cpuinfo > cpu_info.txt
 cat /etc/os-release | grep "NAME=" > os_name.txt
 cat /etc/os-release | grep "^NAME=" | awk -F= '{print $2}' | tr -d '"' > os_name_clean.txt

  for i in {50..100}
  do
    touch "${i}.txt"
 done
