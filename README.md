\# mixxxpi DDJ FLX2



A modified Raspberry Pi OS image built using `pi-gen`. It replaces standard Mixxx with the UNX-DJ-ENGINE for an optimized, low-latency, standalone DJ performance system tailored for ARM hardware and controllers like the Pioneer DDJ-FLX2.



\## Main Features

\* \*\*Optimized OS Performance\*\*: 64-bit Debian 13 "trixie" with `preempt=full` and performance CPU governor.

\* \*\*UNX-DJ-ENGINE\*\*: Highly optimized subset of Mixxx 2.4+ audio engine with 16-bit PCM buffering.

\* \*\*Ecosystem Integration\*\*: Natively reads Rekordbox (PDB/ANLZ) and Serato database structures.

\* \*\*Hardware-Accurate UI\*\*: Custom Raylib/OpenGL graphics capable of running directly via DRM-KMS (kiosk mode).

\* \*\*Hardware Compatibility\*\*: Raspberry Pi 3, 4, 400, and 5.



\## Requirements

\* Windows (with Docker Desktop and WSL2 installed), macOS, or Linux.

\* Docker must be running.



\## Installation \& Building

This project uses the `pi-gen` framework. To build the OS image:



1\. Clone this repository.

2\. Ensure Docker Desktop is open and running.

3\. Open a WSL or Git Bash terminal (Windows CMD/PowerShell cannot run bash scripts directly).

4\. Run the build command:

&#x20;  ```bash

&#x20;  ./build-docker.sh

