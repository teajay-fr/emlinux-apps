#!/bin/sh
qemu-system-arm -machine versatileab -cpu arm1176 -m 256 -no-reboot -serial stdio -append "root=/dev/sda rw init=/bin/bash" -hda images/rootfs.ext2 -kernel ~/Téléchargements/kernel-qemu -net nic -net user,net=192.168.0.0/24,dhcpstart=192.168.0.40,hostfwd=tcp::8080-:80,hostfwd=tcp::2222-:22,hostfwd=tcp::1443-:143
