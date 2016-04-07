#!/bin/bash

# Show much time it took for the whole script to run
TIME_END=$(date +"%s")
TIME_DIFF=$(($TIME_END-$TIME_START))
echo "Provision took $(($TIME_DIFF / 60)) minutes and $(($TIME_DIFF % 60)) seconds."