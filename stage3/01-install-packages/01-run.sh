#!/bin/bash -e
## Install Zig Toolchain & Build UNX-DJ-ENGINE

on_chroot << 'CHROOT_EOF'
    # 0. Install required system dependencies
    apt-get update
    apt-get install -y libasound2-dev libdrm-dev libgbm-dev libegl1-mesa-dev libgles2-mesa-dev g++ git curl wget tar xz-utils

    # 1. Download and install Zig compiler for ARM64
    cd /opt
    rm -rf zig zig-linux-aarch64-*
    wget https://ziglang.org/download/0.14.0/zig-linux-aarch64-0.14.0.tar.xz
    tar -xf zig-linux-aarch64-0.14.0.tar.xz
    mv zig-linux-aarch64-0.14.0 zig
    rm -f zig-linux-aarch64-0.14.0.tar.xz

    export PATH="/opt/zig:$PATH"
    echo 'export PATH="/opt/zig:$PATH"' > /etc/profile.d/zig.sh

    # 2. Clone UNX-DJ-ENGINE
    rm -rf /opt/UNX-DJ-ENGINE
    git clone --branch v0.1.4-Alpha https://github.com/rayocta303/UNX-DJ-ENGINE.git /opt/UNX-DJ-ENGINE
    cd /opt/UNX-DJ-ENGINE

    # 3. Patch build configuration to explicitly link standard C++ library (fixing undefined TagParser/std symbols)
    if [ -f "build.zig" ]; then
        sed -i 's/b.addExecutable/const exe = b.addExecutable/g' build.zig 2>/dev/null || true
        sed -i '/linkLibC()/a \    exe.linkLibCpp();' build.zig 2>/dev/null || true
    fi

    # 4. Build the engine for DRM-KMS Kiosk mode
    chmod +x build.sh 2>/dev/null || true
    if [ -f "./build.sh" ]; then
        ./build.sh drm || zig build -Dtarget=aarch64-linux-gnu -Doptimize=ReleaseFast
    else
        zig build -Dtarget=aarch64-linux-gnu -Doptimize=ReleaseFast
    fi

    # 5. Make the binary accessible system-wide
    if [ -f "zig-out/bin/unx-dj-engine" ]; then
        ln -sf /opt/UNX-DJ-ENGINE/zig-out/bin/unx-dj-engine /usr/local/bin/unx-dj-engine
    elif [ -f "unx-dj-engine" ]; then
        ln -sf /opt/UNX-DJ-ENGINE/unx-dj-engine /usr/local/bin/unx-dj-engine
    fi
CHROOT_EOF
