#!/bin/bash

if [[ $(swapon -s | wc -l) == 1 ]]; then
  SWAP_FILE='/swapfile'
  REGEX_IS_NUMBER='^[0-9]+$'

  if [[ $INTERACTIVE == 1 ]]; then
    read -p "Set the swapfile size in Gigabytes [1-8]: " SWAP_SIZE
    if ! [[ $SWAP_SIZE =~ $REGEX_IS_NUMBER ]] || [ "$SWAP_SIZE" -lt "8" ] ; then
       echo "Swap size set is not a number or is greater than 8 Gigabytes, exiting..." >&2; exit 1
    fi
    SWAP_SIZE="${SWAP_SIZE}G"
  else
    SWAP_SIZE='2G'
  fi

  if [ -f $SWAP_FILE ]; then
    echo "New $SWAP_SIZE swapfile will be created '$SWAPFILE'"
    fallocate -l $SWAP_SIZE $SWAPFILE
    chmod 600 $SWAPFILE
    ls -lh $SWAPFILE
    echo "New swapfile '$SWAPFILE' will be enabled for the system to use"
    mkswap $SWAPFILE
    swapon /swapfile
  fi

  if [[ $(cat /etc/fstab | grep swap | wc -l) == 0 ]]; then
    echo "New swapfile will be added to /etc/fstab"
    echo "$SWAPFILE   none    swap    sw    0   0" >> /etc/fstab
    cat /etc/fstab
  fi

  if [[ $(cat /etc/sysctl.conf | grep swappiness | wc -l) == 0 ]]; then
    if [[ $INTERACTIVE == 1 ]]; then
      read -p "Set the swappiness, (default for server with SSD 10, default for desktop 60) [0-100]: " SWAPPINESS
    else
      SWAPPINESS='10'
    fi
    if [[ $SWAPPINESS =~ $REGEX_IS_NUMBER ]] && [ "$SWAPPINESS" -ge "0" ] && [ "$SWAPPINESS" -le "100" ] ; then
      echo "Swappiness will be set to ${SWAPPINESS} to /etc/sysctl.conf"
      echo "vm.swappiness=${SWAPPINESS}" >> /etc/sysctl.conf
    else
      echo "Swappiness size set is not a number or is not in range - to 100, ignoring..." >&2; exit 1
    fi
  fi

  if [[ $(cat /etc/sysctl.conf | grep vfs_cache_pressure | wc -l) == 0 ]]; then
    if [[ $INTERACTIVE == 1 ]]; then
      read -p "Set the vfs_cache_pressure, (default 50) [0-100]: " VFS_CACHE_PRESSURE
    else
      VFS_CACHE_PRESSURE='10'
    fi
    if [[ $VFS_CACHE_PRESSURE =~ $REGEX_IS_NUMBER ]] && [ "$VFS_CACHE_PRESSURE" -ge "0" ] && [ "$VFS_CACHE_PRESSURE" -le "100" ] ; then
      echo "Vfs_cache_pressure will be set to ${VFS_CACHE_PRESSURE} to /etc/sysctl.conf"
      echo "vm.vfs_cache_pressure=${VFS_CACHE_PRESSURE}" >> /etc/sysctl.conf
    else
      echo "Vfs_cache_pressure size set is not a number or is not in range - to 100, ignoring..." >&2; exit 1
    fi
  fi
else
  echo "Swap already exists"
  swapon -s
  free -m
fi

unset FLAG_INTERACTIVE