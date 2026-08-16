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
    git clone --recursive --branch v0.1.4-Alpha https://github.com/rayocta303/UNX-DJ-ENGINE.git /opt/UNX-DJ-ENGINE
    cd /opt/UNX-DJ-ENGINE

    # 3. Patch build.sh to append the missing Serato and Kaitai source files
    if [ -f "build.sh" ]; then
        # Add lib/serato/*.cpp and lib/kaitai/kaitai/kaitaistream.cpp wherever .cpp files are compiled
        sed -i 's|src/library/serato_reader.cpp|src/library/serato_reader.cpp lib/serato/serato_tags.cpp lib/serato/serato_parser.cpp lib/serato/serato_waveform.cpp lib/kaitai/kaitai/kaitaistream.cpp|g' build.sh 2>/dev/null || true
        
        # Ensure include paths for serato and kaitai headers are available
        sed -i 's|-Isrc|-Isrc -Ilib/serato -Ilib/kaitai|g' build.sh 2>/dev/null || true
        
        # Ensure standard C++ library is linked
        sed -i 's/zig c++/zig c++ -lc++ -lstdc++/g' build.sh 2>/dev/null || true
    fi

    # 4. Run build
    chmod +x build.sh
    ./build.sh drm

    # 5. Make the binary accessible system-wide
    find . -maxdepth 2 -type f -name "unx-dj-engine*" -exec ln -sf "$(pwd)/{}" /usr/local/bin/unx-dj-engine \;
CHROOT_EOF
