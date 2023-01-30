#!/bin/bash

echo -e "\n*** Disable swap space"

echo "Before disabling"
swapon -s
free -m

sudo swapoff -a

echo "After disabling"
swapon -s
free -m
