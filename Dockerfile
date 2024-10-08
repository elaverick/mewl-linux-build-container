# Base image used
FROM docker.io/library/rockylinux:9

RUN dnf install -y dnf-plugins-core && \
    dnf config-manager --set-enabled crb

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
    gawk \
    m4 \
    autoconf \
    automake \
    patch \
    gettext \
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
