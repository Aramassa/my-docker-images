FROM docker:28.5.1-dind-alpine3.22

# Install OpenSSH server
RUN apk add --no-cache openssh-server && \
    ssh-keygen -A && \
    mkdir -p /run/sshd && \
    echo 'root:password' | chpasswd

# Install dependencies for VS Code Server
RUN apk add --no-cache \
    libstdc++ \
    libgcc \
    musl \
    bash \
    curl \
    wget \
    ca-certificates

# Configure sshd
RUN echo 'Port 22' > /etc/ssh/sshd_config && \
    echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
    echo 'PubkeyAuthentication yes' >> /etc/ssh/sshd_config && \
    echo 'AllowTcpForwarding yes' >> /etc/ssh/sshd_config && \
    echo 'AllowStreamLocalForwarding yes' >> /etc/ssh/sshd_config && \
    echo 'GatewayPorts yes' >> /etc/ssh/sshd_config && \
    echo 'PermitTunnel yes' >> /etc/ssh/sshd_config && \
    echo 'X11Forwarding no' >> /etc/ssh/sshd_config && \
    echo 'Subsystem sftp /usr/lib/ssh/sftp-server' >> /etc/ssh/sshd_config

# Create entrypoint script
RUN echo '#!/bin/sh' > /entrypoint.sh && \
    echo '/usr/sbin/sshd' >> /entrypoint.sh && \
    echo 'exec dockerd-entrypoint.sh "$@"' >> /entrypoint.sh && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD []

# Expose SSH port
EXPOSE 22

