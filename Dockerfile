# Base image used
FROM docker.io/library/rockylinux:9

RUN /bin/sh -c echo "[mewl]" > /etc/yum.repos.d/mewl.repo && \
    echo "name=Mewl Linux - BaseOS" >> /etc/yum.repos.d/mewl.repo && \
    echo "baseurl=https://baseos.repos.mewl.io/" >> /etc/yum.repos.d/mewl.repo && \
    echo "gpgcheck=0" >> /etc/yum.repos.d/mewl.repo && \
    echo "enabled=1" >> /etc/yum.repos.d/mewl.repo

# Install necessary packages and clean up
RUN dnf install -y \
    rpm-build \
    rpmdevtools \
    gcc \
    make \
    wget \
    tar \
    gzip \
    bzip2 \
    xz \
    findutils \
    kernel-devel \
    bc \
    dwarves \
    perl \
    rsync \
    bison \
    texinfo \
    git \
    && dnf clean all && \
    rpmdev-setuptree
    
# Set the working directory
WORKDIR /root/rpmbuild

# Create a volume for RPMS
VOLUME ["/root/rpmbuild/RPMS"]

# Set environment variables
ENV VERSION=6.6.21
ENV PKG_RELEASE=1.0_mewl_proton

# Default command
CMD ["/bin/bash"]
