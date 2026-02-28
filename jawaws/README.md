# Supermicro IPMI JavaWS (iKVM)

Quick vibe coded, dockerized `javaws` launcher for legacy Supermicro/ATEN IPMI KVM consoles.
Use at your own risk!

This container is intended for old BMC firmwares that still require:
- Java Web Start (`.jnlp`)
- 32-bit userspace/runtime
- Java 8 compatibility (newer Java versions often fail)

Search keywords:
- `supermicro ipmi javaws`
- `supermicro ikvm jnlp`
- `aten ikvm kvmmain`
- `ipmi java 8 docker`
- `connect failed sd:28`
- `a singal 17 is raised`

## Why this image exists

Many Supermicro motherboards ship an ATEN-based KVM viewer that breaks on modern desktop Java runtimes.
This image pins an older compatible stack:
- `i386/debian:stretch-slim`
- `openjdk-8-jre`
- `icedtea-netx` (`javaws`)

## Usage

From this directory:

```bash
./run.sh
```

Or pass a custom JNLP path:

```bash
./run.sh /work/your-launch.jnlp
```

## Requirements

- Docker + Docker Compose
- X11 display on the host
- Access to the IPMI/BMC network from the container host

`run.sh` already:
- enables local Docker X11 access (`xhost +local:docker`)
- builds the image
- runs the container with your user UID/GID

## Troubleshooting

- `Ignoring option PermSize/MaxPermSize`
  - Normal for Java 8. Safe to ignore.

- `Unable to use Firefox's proxy settings. Using "DIRECT" as proxy type.`
  - Common IcedTea-Web message. Usually harmless.

- `connect failed sd:28`
  - Usually BMC/network/auth/cipher issue after launch, not a Java install issue.
  - Verify IPMI IP, credentials, firewall, and that iKVM is enabled.

- `a singal 17 is raised`
  - Legacy app log typo/noise seen with old ATEN KVM clients.

## Security note

This image relaxes Java security policies to support outdated firmware endpoints.
Use only on trusted networks and only for legacy IPMI access.
