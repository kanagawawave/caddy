# Description: Dockerfile for building caddy with plugins
FROM caddy:2.7.6-builder AS builder

# Build caddy with plugins
RUN xcaddy build \
  --with github.com/mholt/caddy-l4 \

# Build final image
FROM caddy:2.7.6

# Copy caddy from builder
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

# Run caddy binary
ENTRYPOINT ["/usr/bin/caddy"]
