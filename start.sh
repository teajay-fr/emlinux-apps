#!/bin/sh
qemu-system-arm -machine versatileab -cpu arm1176 -m 256 -no-reboot -serial stdio -append "root=/dev/sda rw init=/bin/bash" -hda images/rootfs.ext2 -kernel ~/Téléchargements/kernel-qemu 
