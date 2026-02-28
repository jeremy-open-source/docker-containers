FROM i386/debian:stretch-slim

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /work

RUN sed -i 's|deb.debian.org/debian|archive.debian.org/debian|g; s|deb.debian.org/debian-security|archive.debian.org/debian-security|g; s|security.debian.org/debian-security|archive.debian.org/debian-security|g' /etc/apt/sources.list \
    && sed -i '/stretch-updates/d' /etc/apt/sources.list \
    && printf 'Acquire::Check-Valid-Until "false";\nAcquire::AllowInsecureRepositories "true";\n' > /etc/apt/apt.conf.d/99archive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl \
    openjdk-8-jre \
    icedtea-netx \
    fontconfig fonts-dejavu-core \
    libx11-6 libxext6 libxi6 libxtst6 libxrender1 \
    libfreetype6 zlib1g libstdc++6 \
    libasound2 libxrender1 libxt6 libxtst6 libxi6 \
    libxkbcommon0 libgl1-mesa-dri libcanberra-gtk-module \
    libxpm4 libxaw7 libnss3 libnspr4 \
    libxt6 libxmu6 libxext6 libxrender1 libxtst6 libxi6 \
  && rm -rf /var/lib/apt/lists/*

# Fix for JNLP needing certain libs
RUN ln -s /usr/lib/i386-linux-gnu/libXrender.so.1 /usr/lib/i386-linux-gnu/libXrender.so \
    && ln -s /usr/lib/i386-linux-gnu/libXtst.so.6 /usr/lib/i386-linux-gnu/libXtst.so \
    && ln -s /usr/lib/i386-linux-gnu/libXi.so.6 /usr/lib/i386-linux-gnu/libXi.so

# Provide a wrapper to ensure HOME/XDG dirs exist for icedtea-web
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Relax Java security at build time when we have root permissions
RUN JAVA_SECURITY_FILE=$(find /etc -path '/etc/java-*-openjdk*/security/java.security' | head -n 1) \
    && if [ -f "$JAVA_SECURITY_FILE" ]; then \
        sed -i 's/^jdk.tls.disabledAlgorithms=.*/jdk.tls.disabledAlgorithms=/g' "$JAVA_SECURITY_FILE"; \
        sed -i 's/^jdk.certpath.disabledAlgorithms=.*/jdk.certpath.disabledAlgorithms=/g' "$JAVA_SECURITY_FILE"; \
        sed -i 's/^jdk.jar.disabledAlgorithms=.*/jdk.jar.disabledAlgorithms=/g' "$JAVA_SECURITY_FILE"; \
        sed -i 's/^jdk.disabled.namedCurves=.*/jdk.disabled.namedCurves=/g' "$JAVA_SECURITY_FILE"; \
        sed -i 's/^jdk.tls.legacyAlgorithms=.*/jdk.tls.legacyAlgorithms=/g' "$JAVA_SECURITY_FILE"; \
    fi

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/work/launch.jnlp"]
