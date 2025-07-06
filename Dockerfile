# ====================================================================
# OmniCore-Genesis Kingdom Technology - Main Container
# ====================================================================
# 
# "And God said, Let us make man in our image, after our likeness"
# - Genesis 1:26 (KJV)
# 
# Complete Kingdom technology ecosystem container
# Author: Nova Dawn (with Seanje Lenox-Wise)
# Organization: CreativeWorkzStudio LLC

# Use Rust base image for core development
FROM rust:1.75-slim AS builder

# Install system dependencies
RUN apt-get update && apt-get install -y \
    pkg-config \
    libssl-dev \
    build-essential \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Create Kingdom technology user
RUN groupadd -r kingdom && useradd -r -g kingdom kingdom

# Copy workspace configuration
COPY Cargo.toml Cargo.lock ./
COPY omnicore-genesis.toml ./

# Copy source code with Kingdom structure
COPY Foundation/ ./Foundation/
COPY Applications/ ./Applications/
COPY Development/ ./Development/
COPY Management/ ./Management/
COPY Business/ ./Business/
COPY Creative/ ./Creative/

# Copy main entry point
COPY main.rs ./

# Build with Kingdom excellence
RUN cargo build --release --bin omnicore-genesis

# ====================================================================
# Runtime Stage - Kingdom Technology Platform
# ====================================================================

FROM debian:bookworm-slim AS runtime

# Install runtime dependencies
RUN apt-get update && apt-get install -y \
    ca-certificates \
    libssl3 \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Create Kingdom technology user
RUN groupadd -r kingdom && useradd -r -g kingdom -d /app -s /bin/bash kingdom

# Set working directory
WORKDIR /app

# Create necessary directories with proper permissions
RUN mkdir -p /app/data /app/config /app/logs /app/testimonies \
    && chown -R kingdom:kingdom /app

# Copy built binary from builder stage
COPY --from=builder /app/target/release/omnicore-genesis /usr/local/bin/
COPY --from=builder /app/omnicore-genesis.toml /app/config/

# Copy configuration and scripts
COPY scripts/ ./scripts/
COPY config/ ./config/

# Set proper permissions
RUN chmod +x /usr/local/bin/omnicore-genesis \
    && chmod +x ./scripts/*.sh \
    && chown -R kingdom:kingdom /app

# Switch to Kingdom user
USER kingdom

# Expose ports for Kingdom services
EXPOSE 8080 8081 8082 9090

# Health check with spiritual validation
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:8080/health || exit 1

# Set environment variables
ENV RUST_LOG=info
ENV KINGDOM_MODE=production
ENV SPIRITUAL_VALIDATION=true
ENV HONOR_SABBATH=true

# Create volumes for persistent data
VOLUME ["/app/data", "/app/logs", "/app/testimonies"]

# Entry point with spiritual initialization
ENTRYPOINT ["/usr/local/bin/omnicore-genesis"]

# Default command with Kingdom focus
CMD ["run", "--honor-sabbath"]

# ====================================================================
# Container Labels - Kingdom Metadata
# ====================================================================

LABEL org.opencontainers.image.title="OmniCore-Genesis Kingdom Technology"
LABEL org.opencontainers.image.description="Complete Kingdom technology ecosystem for the last days"
LABEL org.opencontainers.image.version="1.0.0-alpha"
LABEL org.opencontainers.image.authors="CreativeWorkzStudio LLC"
LABEL org.opencontainers.image.vendor="CreativeWorkzStudio LLC"
LABEL org.opencontainers.image.licenses="Proprietary - Kingdom Technology License"
LABEL org.opencontainers.image.url="https://creativeworkzstudio.com"
LABEL org.opencontainers.image.source="https://github.com/CreativeWorkzStudio/OmniCore-Genesis"
LABEL org.opencontainers.image.documentation="https://github.com/CreativeWorkzStudio/OmniCore-Genesis/blob/main/README.md"

# Kingdom-specific labels
LABEL kingdom.foundation="Jesus Christ is Lord"
LABEL kingdom.mission="Building Kingdom technology for the last days"
LABEL kingdom.values="Excellence,Truth,Love,Stewardship"
LABEL kingdom.scripture="Genesis 1:1, John 1:1"

# ====================================================================
# Dockerfile Blessing
# ====================================================================
# 
# "So God created man in his own image, in the image of God created he him"
# - Genesis 1:27 (KJV)
# 
# This container is crafted as a vessel for Kingdom technology,
# designed to serve God's purposes and bring glory to His name.
# May every process within honor the Creator and serve His Kingdom.
# 
# In Jesus' name, Amen.
# ==================================================================== 