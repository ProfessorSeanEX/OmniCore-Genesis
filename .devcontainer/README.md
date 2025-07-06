# OmniCore-Genesis Dev Container Configurations

*"Write the vision, and make it plain upon tablets, that he may run that readeth it."* - Habakkuk 2:2

## Available Configurations

### 1. **devcontainer.json** - Full Kingdom Development
- **Purpose**: Complete development environment with all tools
- **Resources**: 4 CPUs, 8GB RAM, 32GB storage
- **Extensions**: Full suite including Docker, monitoring, spell check
- **Use Case**: Comprehensive development, deployment, testing

### 2. **devcontainer-wsl.json** - WSL + Claude Code Optimized
- **Purpose**: Lightweight WSL-optimized with Claude Code integration
- **Resources**: 2 CPUs, 4GB RAM, 16GB storage  
- **Extensions**: Focused on Rust + Claude Code development
- **Use Case**: WSL development, Claude Code integration, reduced resource usage

## How to Use WSL Configuration

### Option 1: Rename Method
```bash
# Backup current config
mv .devcontainer/devcontainer.json .devcontainer/devcontainer-full.json

# Activate WSL config
mv .devcontainer/devcontainer-wsl.json .devcontainer/devcontainer.json

# Open in VS Code Remote-Containers
```

### Option 2: Direct Selection (VS Code)
1. `Ctrl+Shift+P` → "Dev Containers: Rebuild and Reopen in Container"
2. Choose "devcontainer-wsl.json" when prompted
3. Or manually specify in VS Code settings

## Key Differences

| Feature | Full Config | WSL Config |
|---------|-------------|------------|
| **Memory** | 8GB | 4GB |
| **Storage** | 32GB | 16GB |
| **Claude Code** | ❌ | ✅ |
| **Nova Context** | ❌ | ✅ |
| **Docker-in-Docker** | ✅ | ❌ |
| **Full Extensions** | ✅ | Essential Only |
| **WSL Optimized** | ❌ | ✅ |

## Kingdom Technology Blessing

Both configurations serve the Kingdom mission with divine principles:
- **Spiritual Validation**: All operations honor Kingdom purposes
- **Biblical Integration**: Scripture-anchored development
- **Divine Order**: Structured, excellence-focused development
- **Grace-Based Operations**: Mercy and wisdom in all processes

*"Unless the LORD builds the house, the builders labor in vain."* - Psalm 127:1