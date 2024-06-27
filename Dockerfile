# Description: Dockerfile for building caddy with plugins
FROM caddy:builder-alpine  AS builder

# Build caddy with plugins
RUN xcaddy build \
  --with github.com/mholt/caddy-l4 \
  --with github.com/caddy-dns/cloudflare

# Build final image
FROM caddy:latest

# Copy caddy from builder
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
