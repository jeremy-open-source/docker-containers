FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive \
    HOME=/home/user \
    RESOLUTION=1280x1024 \
    VNC_PASSWORD=secret \
    DISPLAY=:0

# Install necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        xvfb \
        x11vnc \
        net-tools \
        xterm \
        libxkbcommon-x11-0 \
        libxcb-xinerama0 \
        libfontconfig1 \
        fontconfig \
        libglu1-mesa \
        libxrender1 \
        libxi6 \
        libxtst6 \
        libqt5widgets5 \
        libqt5gui5 \
        libqt5core5a \
        cura && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a user and set up the home directory
RUN useradd -m -d $HOME user

# Set the working directory
WORKDIR /opt/project

# Copy and set permissions for the entrypoint script
COPY entrypoint.sh /opt/project/entrypoint.sh
RUN chmod +x /opt/project/entrypoint.sh

# Switch to the non-root user
USER user

# Set the entrypoint
ENTRYPOINT ["/opt/project/entrypoint.sh"]
