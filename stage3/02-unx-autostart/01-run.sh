#!/bin/bash -e
## Install UNX-DJ-ENGINE Systemd Service

install -m 644 files/unx-dj-engine.service "${ROOTFS_DIR}/etc/systemd/system/"

on_chroot << EOF
    # Enable the service to start automatically on boot
    systemctl enable unx-dj-engine.service
    
    # Ensure the 'pi' user has permission to use the screen, keyboard, and sound hardware directly
    usermod -a -G video,audio,input,render pi
EOF