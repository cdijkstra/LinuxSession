FROM fedora

COPY Assignments /app/Assignments

USER root
ENV MANPATH /usr/share/man

RUN sudo sed -i '/tsflags=nodocs/d' /etc/dnf/dnf.conf && \
dnf -y install nano util-linux man man-pages man-db tree && \
dnf -y reinstall $(rpm -qads --qf "PACKAGE: %{NAME}\n" | sed -n -E '/PACKAGE: /{s/PACKAGE: // ; h ; b }; /^not installed/ { g; p }' | uniq) && \
mandb

# Add users Alice, Bob and Chris and add Alice and Bob to the developers group
RUN getent passwd Alice >/dev/null || useradd -m -u 1000 Alice && \
    getent passwd Bob >/dev/null || useradd -m -u 1001 Bob && \
    getent passwd Chris >/dev/null || useradd -m -u 1002 Chris && \
    getent group developers >/dev/null || groupadd developers && \
    usermod -aG wheel,developers Alice && \
    usermod -aG wheel,developers Bob && \
    usermod -aG wheel Chris && \
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nopassword && \
    echo "Alice,Bob,Chris ALL=(ALL) NOPASSWD: /bin/su -" >> /etc/sudoers.d/su-nopassword

# Change ownership of /app directory recursively to Alice:developers and set User Alice
RUN chown -R Alice:developers /app && chown root:root /app/Assignments/3Permissions/rootPermission.sh && \
    chmod u=rwx,g=rwx,o= /app/Assignments/3Permissions/rootPermission.sh && \
    chown Bob:developers /app/Assignments/3Permissions/Dir1 && \
    chown Chris:Chris /app/Assignments/3Permissions/Dir2 && \
    chmod 770 /app/Assignments/3Permissions/Dir1 && \
    chmod 774 /app/Assignments/3Permissions/Dir2/Dir3 && \
    chmod 777 /app/Assignments/3Permissions/Dir2/Dir3

USER Alice
WORKDIR /app

# Run a shell command to set the immutability flag during container runtime
CMD ["/bin/bash"]