FROM debian:bookworm

# Set environment variables
ENV ZIG_VERSION=0.14.1

# Install dependencies and clean up afterwards
RUN apt-get update
RUN apt-get install -y --no-install-recommends curl ca-certificates gnupg xz-utils build-essential git 

# Download and install Zig
RUN curl -L "https://ziglang.org/download/${ZIG_VERSION}/zig-x86_64-linux-${ZIG_VERSION}.tar.xz" -o zig.tar.xz && tar -xf zig.tar.xz
RUN mv zig-x86_64-linux-${ZIG_VERSION} /opt/zig && ln -s /opt/zig/zig /usr/local/bin/zig
RUN rm zig.tar.xz

# Verify Zig installation
# TODO Remove once it works
RUN zig version

# Default command (can be overridden)
CMD [ "zig", "version" ]