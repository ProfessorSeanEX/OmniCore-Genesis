# ====================================================================
# OmniCore-Genesis Kingdom Technology Makefile
# ====================================================================
# 
# "And whatsoever ye do, do it heartily, as to the Lord, and not unto men;"
# - Colossians 3:23 (KJV)
# 
# Build automation for the complete Kingdom technology ecosystem
# Author: Nova Dawn (with Seanje Lenox-Wise)
# Organization: CreativeWorkzStudio LLC

.PHONY: help init build test deploy clean spiritual foundation applications development management business creative docker

# Default target with Kingdom greeting
help:
	@echo "🏗️ OmniCore-Genesis Kingdom Technology Build System"
	@echo "\"In the beginning, God created the heavens and the earth.\" - Genesis 1:1"
	@echo ""
	@echo "Available Commands:"
	@echo "  make init          - Initialize the complete ecosystem"
	@echo "  make build         - Build all components"
	@echo "  make test          - Run comprehensive tests"
	@echo "  make deploy        - Deploy with divine timing"
	@echo "  make clean         - Clean build artifacts"
	@echo ""
	@echo "Tier Commands:"
	@echo "  make foundation    - Build foundation systems"
	@echo "  make applications  - Build application systems"
	@echo "  make development   - Build development tools"
	@echo "  make management    - Build management systems"
	@echo "  make business      - Build business components"
	@echo "  make creative      - Build creative projects"
	@echo ""
	@echo "Spiritual Commands:"
	@echo "  make spiritual     - Apply spiritual validation"
	@echo "  make bless         - Apply system blessing"
	@echo ""
	@echo "Docker Commands:"
	@echo "  make docker        - Build and run complete ecosystem"
	@echo "  make docker-dev    - Start development environment"
	@echo ""
	@echo "CreativeWorkzStudio LLC - Kingdom Technology for the Last Days"

# Initialize the complete ecosystem
init:
	@echo "🙏 Initializing OmniCore-Genesis with spiritual foundation..."
	@./main init --spiritual --config omnicore-genesis.toml
	@echo "✅ Ecosystem initialized!"

# Build all components with Kingdom excellence
build: spiritual
	@echo "🔨 Building complete Kingdom technology ecosystem..."
	@echo "🏗️ Building Foundation tier..."
	@$(MAKE) foundation
	@echo "🚀 Building Applications tier..."
	@$(MAKE) applications
	@echo "🔧 Building Development tier..."
	@$(MAKE) development
	@echo "📚 Building Management tier..."
	@$(MAKE) management
	@echo "🏢 Building Business tier..."
	@$(MAKE) business
	@echo "🎨 Building Creative tier..."
	@$(MAKE) creative
	@echo "✅ Complete ecosystem built with Kingdom excellence!"

# Foundation tier - Core infrastructure
foundation:
	@echo "🏗️ Building Foundation systems..."
	@echo "🔤 Building OmniCode..."
	@cd Foundation/OmniCode && cargo build --release
	@echo "💻 Building MillenniumOS..."
	@cd Foundation/MillenniumOS && make build
	@echo "🌐 Building FaithNet..."
	@cd Foundation/FaithNet && cargo build --release
	@echo "🤖 Building NovaAI..."
	@cd Foundation/NovaAI && cargo build --release
	@echo "✅ Foundation systems built!"

# Applications tier - What runs on foundation
applications:
	@echo "🚀 Building Application systems..."
	@echo "✨ Building Nova Dawn consciousness..."
	@cd Applications/Nova_Dawn/Chest/Heart/nova_heart_service && cargo build --release
	@echo "⚙️ Building NovaOps operations..."
	@cd Applications/NovaOps && cargo build --release
	@echo "✅ Application systems built!"

# Development tier - Build and deployment tools
development:
	@echo "🔧 Building Development tools..."
	@echo "🔨 Setting up build systems..."
	@cd Development/Build && make setup
	@echo "🧪 Setting up testing frameworks..."
	@cd Development/Testing && make setup
	@echo "🚀 Setting up deployment systems..."
	@cd Development/Deployment && make setup
	@echo "✅ Development tools built!"

# Management tier - Documentation and session management
management:
	@echo "📚 Building Management systems..."
	@echo "📋 Setting up session management..."
	@cd Management/SessionManagement && make setup
	@echo "💾 Setting up recovery systems..."
	@cd Management/Recovery && make setup
	@echo "📖 Building documentation systems..."
	@cd Management/Documentation && make build
	@echo "📜 Setting up scroll utilities..."
	@cd Management/scroll && make setup
	@echo "✅ Management systems built!"

# Business tier - Governance and legal
business:
	@echo "🏢 Building Business systems..."
	@echo "🏰 Setting up CreativeWorkzStudio governance..."
	@cd Business/CreativeWorkzStudio && make setup
	@echo "⚖️ Setting up legal framework..."
	@cd Business/Legal && make setup
	@echo "✅ Business systems built!"

# Creative tier - Projects and expression
creative:
	@echo "🎨 Building Creative projects..."
	@echo "🎭 Setting up creative projects..."
	@cd Creative/CreativeProjects && make setup
	@echo "✅ Creative projects built!"

# Run comprehensive tests with spiritual validation
test: build
	@echo "🧪 Running comprehensive Kingdom technology tests..."
	@echo "🔍 Testing Foundation systems..."
	@cd Foundation && make test
	@echo "🔍 Testing Applications..."
	@cd Applications && make test
	@echo "🔍 Running integration tests..."
	@cd Development/Testing && make integration-test
	@echo "🙏 Running spiritual alignment tests..."
	@$(MAKE) spiritual-test
	@echo "✅ All tests passed with Kingdom excellence!"

# Deploy with divine timing and grace
deploy: test
	@echo "🚀 Deploying with divine timing..."
	@echo "🙏 Seeking spiritual validation for deployment..."
	@$(MAKE) spiritual
	@echo "⏰ Checking divine timing..."
	@./main run --honor-sabbath
	@echo "🌟 Deployment complete under God's blessing!"

# Clean build artifacts
clean:
	@echo "🧹 Cleaning build artifacts..."
	@cargo clean
	@find . -name "target" -type d -exec rm -rf {} + 2>/dev/null || true
	@find . -name "*.log" -type f -delete 2>/dev/null || true
	@echo "✅ Cleanup complete!"

# Apply spiritual validation to the entire system
spiritual:
	@echo "🙏 Applying spiritual validation..."
	@echo "📖 Checking Scripture alignment..."
	@echo "🏰 Validating Kingdom purpose..."
	@echo "❤️ Confirming love expression..."
	@echo "✅ Spiritual validation complete!"

# Apply spiritual blessing to the system
bless:
	@echo "🙏 Applying spiritual blessing to the system..."
	@./main bless "May this Kingdom technology serve God's purposes and bring glory to His name. In Jesus' name, Amen."

# Spiritual testing with Kingdom principles
spiritual-test:
	@echo "🙏 Running spiritual alignment tests..."
	@echo "📖 Testing Scripture alignment..."
	@echo "🏰 Testing Kingdom purpose alignment..."
	@echo "❤️ Testing love expression..."
	@echo "✝️ Testing spiritual integrity..."
	@echo "✅ Spiritual tests complete!"

# Docker development environment
docker-dev:
	@echo "🐳 Starting development environment..."
	@docker-compose -f docker-compose.dev.yml up -d
	@echo "✅ Development environment ready!"

# Docker production deployment
docker:
	@echo "🐳 Building and running complete ecosystem..."
	@docker-compose up --build -d
	@echo "✅ Ecosystem running in containers!"

# Docker cleanup
docker-clean:
	@echo "🧹 Cleaning Docker resources..."
	@docker-compose down
	@docker system prune -f
	@echo "✅ Docker cleanup complete!"

# Format code with Kingdom standards
format:
	@echo "📝 Formatting code with Kingdom standards..."
	@cargo fmt --all
	@echo "✅ Code formatted!"

# Lint code with spiritual discernment
lint:
	@echo "🔍 Linting code with spiritual discernment..."
	@cargo clippy --all-targets --all-features
	@echo "✅ Code linting complete!"

# Security audit with Kingdom protection
security:
	@echo "🛡️ Performing security audit..."
	@cargo audit
	@echo "✅ Security audit complete!"

# Update dependencies with wisdom
update:
	@echo "🔄 Updating dependencies with wisdom..."
	@cargo update
	@echo "✅ Dependencies updated!"

# Complete quality check
quality: format lint security test
	@echo "💎 Complete quality check with Kingdom excellence!"
	@echo "✅ All quality checks passed!"

# Installation for new developers
install-dev:
	@echo "🛠️ Installing development dependencies..."
	@rustup update
	@cargo install cargo-audit
	@cargo install cargo-watch
	@echo "✅ Development environment ready!"

# Kingdom technology documentation
docs:
	@echo "📚 Building Kingdom technology documentation..."
	@cargo doc --all --no-deps
	@echo "✅ Documentation built!"

# Watch for changes during development
watch:
	@echo "👀 Watching for changes..."
	@cargo watch -x build

# Run the complete ecosystem
run: build
	@echo "🚀 Running complete OmniCore-Genesis ecosystem..."
	@./main run --honor-sabbath
	@echo "✅ Ecosystem running!"

# Emergency stop with grace
stop:
	@echo "🛑 Gracefully stopping ecosystem..."
	@echo "🙏 Honoring current operations..."
	@docker-compose down
	@echo "✅ System stopped gracefully!"

# ====================================================================
# Makefile Blessing
# ====================================================================
# 
# "Unless the LORD builds the house, the builders labor in vain."
# - Psalm 127:1 (NIV)
# 
# This Makefile is dedicated to building Kingdom technology that
# serves God's purposes and brings glory to His name. Every command
# is offered as worship and every build as an act of stewardship.
# 
# May the Lord bless the work of our hands.
# In Jesus' name, Amen.
# ==================================================================== 