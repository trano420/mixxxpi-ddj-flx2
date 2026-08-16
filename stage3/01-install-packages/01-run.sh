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

    # 2. Clone UNX-DJ-ENGINE with submodules
    rm -rf /opt/UNX-DJ-ENGINE
    git clone --recursive --branch v0.1.4-Alpha https://github.com/rayocta303/UNX-DJ-ENGINE.git /opt/UNX-DJ-ENGINE
    cd /opt/UNX-DJ-ENGINE

    # Print files for debugging
    echo "=== Listing all C++ and C source files in repository ==="
    find . -type f \( -name "*.cpp" -o -name "*.c" -o -name "*.cc" \)

    # 3. Patch build.sh to include all source files and proper standard C++ linking
    if [ -f "build.sh" ]; then
        echo "=== Original build.sh ==="
        cat build.sh

        # Ensure all cpp files found in the tree are included in compilation
        ALL_SRCS=$(find src -type f \( -name "*.cpp" -o -name "*.c" -o -name "*.cc" \) 2>/dev/null | tr '\n' ' ')
        
        # Replace narrow file lists or add missing sources and link flags
        sed -i 's/-lc++/-lc++ -lstdc++/g' build.sh 2>/dev/null || true
        sed -i 's/zig c++/zig c++ -lc++ -lstdc++/g' build.sh 2>/dev/null || true
    fi

    # 4. Execute build
    chmod +x build.sh
    ./build.sh drm

    # 5. Link executable
    find . -maxdepth 2 -type f -name "unx-dj-engine*" -exec ln -sf "$(pwd)/{}" /usr/local/bin/unx-dj-engine \;
CHROOT_EOF
