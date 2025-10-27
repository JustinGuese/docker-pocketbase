FROM alpine:latest

ARG PB_VERSION=0.31.0

RUN apk update && apk upgrade --no-cache && \
  apk add --no-cache \
  unzip \
  ca-certificates

# download and unzip PocketBase
# Automatically detect architecture
ARG ARCH
RUN ARCH=$(uname -m); \
  case "$ARCH" in \
    x86_64) ARCH=amd64 ;; \
    aarch64) ARCH=arm64 ;; \
    armv7l) ARCH=armv7 ;; \
    *) echo "Unsupported architecture: $ARCH" && exit 1 ;; \
  esac && \
  wget -O /tmp/pb.zip "https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_${ARCH}.zip"
RUN unzip /tmp/pb.zip -d /pb/

# uncomment to copy the local pb_migrations dir into the image
# COPY ./pb_migrations /pb/pb_migrations

# uncomment to copy the local pb_hooks dir into the image
# COPY ./pb_hooks /pb/pb_hooks

EXPOSE 8080

# start PocketBase
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"]