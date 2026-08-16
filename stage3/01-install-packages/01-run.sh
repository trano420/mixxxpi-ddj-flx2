03/UNX-DJ-ENGINE.git /opt/UNX-DJ-ENGINE
    cd /opt/UNX-DJ-ENGINE

    # 3. Build the engine specifically for DRM-KMS (Kiosk mode)
#!/bin/bash -e
## Install Zig Toolchain & Build UNX-DJ-ENGINE

on_chroot << EOF
    # 0. Install required system dependencies for Audio and DRM Kiosk mode
    apt-get update
    apt-get install -y libasound2-dev libdrm-dev libgbm-dev libegl1-mesa-dev libgles2-mesa-dev

    # 1. Download and install the Zig compiler for ARM64
    cd /opt
    wget https://ziglang.org/download/0.14.0/zig-linux-aarch64-0.14.0.tar.xz
    tar -xf zig-linux-aarch64-0.14.0.tar.xz
    mv zig-linux-aarch64-0.14.0 zig
    rm zig-linux-aarch64-0.14.0.tar.xz

    # Add Zig to the system PATH
    echo 'export PATH="/opt/zig:\$PATH"' > /etc/profile.d/zig.sh
    export PATH="/opt/zig:\$PATH"

    # 2. Clone UNX-DJ-ENGINE (Using the stable tag to avoid broken commits!)
    git clone --branch v0.1.4-Alpha https://github.com/rayocta303/UNX-DJ-ENGINE.git /opt/UNX-DJ-ENGINE
    cd /opt/UNX-DJ-ENGINE

    # 3. Build the engine specifically for DRM-KMS (Kiosk mode)
    chmod +x build.sh
    ./build.sh drm

    # 4. Make the binary accessible system-wide
    ln -s /opt/UNX-DJ-ENGINE/unx-dj-engine /usr/local/bin/unx-dj-engine
EOF#!/bin/bash -e
## Install Zig Toolchain & Build UNX-DJ-ENGINE

on_chroot << EOF
    # 0. Install required system dependencies for Audio and DRM Kiosk mode
    apt-get update
    apt-get install -y libasound2-dev libdrm-dev libgbm-dev libegl1-mesa-dev libgles2-mesa-dev

    # 1. Download and install the Zig compiler for ARM64
    cd /opt
    wget https://ziglang.org/download/0.14.0/zig-linux-aarch64-0.14.0.tar.xz
    tar -xf zig-linux-aarch64-0.14.0.tar.xz
    mv zig-linux-aarch64-0.14.0 zig
    rm zig-linux-aarch64-0.14.0.tar.xz

    # Add Zig to the system PATH
    echo 'export PATH="/opt/zig:\$PATH"' > /etc/profile.d/zig.sh
    export PATH="/opt/zig:\$PATH"

    # 2. Clone UNX-DJ-ENGINE (Using the stable tag to avoid broken commits!)
    git clone --branch v0.1.4-Alpha https://github.com/rayocta303/UNX-DJ-ENGINE.git /opt/UNX-DJ-ENGINE
    cd /opt/UNX-DJ-ENGINE

    # 3. Build the engine specifically for DRM-KMS (Kiosk mode)
    chmod +x build.sh
    ./build.sh drm

    # 4. Make the binary accessible system-wide
    ln -s /opt/UNX-DJ-ENGINE/unx-dj-engine /usr/local/bin/unx-dj-engine
EO#!/bin/bash -e
## Install Zig Toolchain & Build UNX-DJ-ENGINE

on_chroot << EOF
    # 0. Install required system dependencies for Audio and DRM Kiosk mode
    apt-get update
    apt-get install -y libasound2-dev libdrm-dev libgbm-dev libegl1-mesa-dev libgles2-mesa-dev

    # 1. Download and install the Zig compiler for ARM64
    cd /opt
    wget https://ziglang.org/download/0.14.0/zig-linux-aarch64-0.14.0.tar.xz
    tar -xf zig-linux-aarch64-0.14.0.tar.xz
    mv zig-linux-aarch64-0.14.0 zig
    rm zig-linux-aarch64-0.14.0.tar.xz

    # Add Zig to the system PATH
    echo 'export PATH="/opt/zig:\$PATH"' > /etc/profile.d/zig.sh
    export PATH="/opt/zig:\$PATH"

    # 2. Clone UNX-DJ-ENGINE (Using the stable tag to avoid broken commits!)
    git clone --branch v0.1.4-Alpha https://github.com/rayocta303/UNX-DJ-ENGINE.git /opt/UNX-DJ-ENGINE
    cd /opt/UNX-DJ-ENGINE

    # 3. Build the engine specifically for DRM-KMS (Kiosk mode)
    chmod +x build.sh
    ./build.sh drm

    # 4. Make the binary accessible system-wide
    ln -s /opt/UNX-DJ-ENGINE/unx-dj-engine /usr/local/bin/unx-dj-engine
EOF#!/bin/bash -e
## Install Zig Toolchain & Build UNX-DJ-ENGINE

on_chroot << EOF
    # 0. Install required system dependencies for Audio and DRM Kiosk mode
    apt-get update
    apt-get install -y libasound2-dev libdrm-dev libgbm-dev libegl1-mesa-dev libgles2-mesa-dev

    # 1. Download and install the Zig compiler for ARM64
    cd /opt
    wget https://ziglang.org/download/0.14.0/zig-linux-aarch64-0.14.0.tar.xz
    tar -xf zig-linux-aarch64-0.14.0.tar.xz
    mv zig-linux-aarch64-0.14.0 zig
    rm zig-linux-aarch64-0.14.0.tar.xz

    # Add Zig to the system PATH
    echo 'export PATH="/opt/zig:\$PATH"' > /etc/profile.d/zig.sh
    export PATH="/opt/zig:\$PATH"

    # 2. Clone UNX-DJ-ENGINE (Using the stable tag to avoid broken commits!)
    git clone --branch v0.1.4-Alpha https://github.com/rayocta303/UNX-DJ-ENGINE.git /opt/UNX-DJ-ENGINE
    cd /opt/UNX-DJ-ENGINE

    # 3. Build the engine specifically for DRM-KMS (Kiosk mode)
    chmod +x build.sh
    ./build.sh drm

    # 4. Make the binary accessible system-wide
    ln -s /opt/UNX-DJ-ENGINE/unx-dj-engine /usr/local/bin/unx-dj-engine
EOF#!/bin/bash -e
## Install Zig Toolchain & Build UNX-DJ-ENGINE

on_chroot << EOF
    # 0. Install required system dependencies for Audio and DRM Kiosk mode
    apt-get update
    apt-get install -y libasound2-dev libdrm-dev libgbm-dev libegl1-mesa-dev libgles2-mesa-dev

    # 1. Download and install the Zig compiler for ARM64
    cd /opt
    wget https://ziglang.org/download/0.14.0/zig-linux-aarch64-0.14.0.tar.xz
    tar -xf zig-linux-aarch64-0.14.0.tar.xz
    mv zig-linux-aarch64-0.14.0 zig
    rm zig-linux-aarch64-0.14.0.tar.xz

    # Add Zig to the system PATH
    echo 'export PATH="/opt/zig:\$PATH"' > /etc/profile.d/zig.sh
    export PATH="/opt/zig:\$PATH"

    # 2. Clone UNX-DJ-ENGINE (Using the stable tag to avoid broken commits!)
    git clone --branch v0.1.4-Alpha https://github.com/rayocta303/UNX-DJ-ENGINE.git /opt/UNX-DJ-ENGINE
    cd /opt/UNX-DJ-ENGINE

    # 3. Build the engine specifically for DRM-KMS (Kiosk mode)
    chmod +x build.sh
    ./build.sh drm

    # 4. Make the binary accessible system-wide
    ln -s /opt/UNX-DJ-ENGINE/unx-dj-engine /usr/local/bin/unx-dj-engine
EOF#!/bin/bash -e
## Install Zig Toolchain & Build UNX-DJ-ENGINE

on_chroot << EOF
    # 0. Install required system dependencies for Audio and DRM Kiosk mode
    apt-get update
    apt-get install -y libasound2-dev libdrm-dev libgbm-dev libegl1-mesa-dev libgles2-mesa-dev

    # 1. Download and install the Zig compiler for ARM64
    cd /opt
    wget https://ziglang.org/download/0.14.0/zig-linux-aarch64-0.14.0.tar.xz
    tar -xf zig-linux-aarch64-0.14.0.tar.xz
    mv zig-linux-aarch64-0.14.0 zig
    rm zig-linux-aarch64-0.14.0.tar.xz

    # Add Zig to the system PATH
    echo 'export PATH="/opt/zig:\$PATH"' > /etc/profile.d/zig.sh
    export PATH="/opt/zig:\$PATH"

    # 2. Clone UNX-DJ-ENGINE (Using the stable tag to avoid broken commits!)
    git clone --branch v0.1.4-Alpha https://github.com/rayocta303/UNX-DJ-ENGINE.git /opt/UNX-DJ-ENGINE
    cd /opt/UNX-DJ-ENGINE

    # 3. Build the engine specifically for DRM-KMS (Kiosk mode)
    chmod +x build.sh
    ./build.sh drm

    # 4. Make the
