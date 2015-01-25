#!/bin/sh
make O=$PWD/output BR2_EXTERNAL=$PWD/apps -C buildroot $@
