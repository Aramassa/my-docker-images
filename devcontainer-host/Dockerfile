FROM docker:28.5.1-dind-alpine3.22

# Install OpenSSH server
RUN apk add --no-cache openssh-server && \
    ssh-keygen -A && \
    mkdir -p /run/sshd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo 'root:password' | chpasswd && \
    echo 'AllowTcpForwarding yes' >> /etc/ssh/sshd_config && \
    echo 'AllowStreamLocalForwarding yes' >> /etc/ssh/sshd_config && \
    echo 'GatewayPorts yes' >> /etc/ssh/sshd_config && \
    echo 'PermitTunnel yes' >> /etc/ssh/sshd_config

# Create entrypoint script
RUN echo '#!/bin/sh' > /entrypoint.sh && \
    echo '/usr/sbin/sshd' >> /entrypoint.sh && \
    echo 'exec dockerd-entrypoint.sh "$@"' >> /entrypoint.sh && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD []

# Expose SSH port
EXPOSE 22

