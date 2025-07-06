#!/bin/bash
# ====================================================================
# OmniCore-Genesis Dev Container Configuration Switcher
# ====================================================================
# 
# "Choose you this day whom ye will serve" - Joshua 24:15 (KJV)
# 
# Switch between full development and WSL-optimized configurations

set -e

CONFIG_DIR=".devcontainer"

echo "🏗️ OmniCore-Genesis Dev Container Configuration Switcher"
echo "\"Choose you this day whom ye will serve\" - Joshua 24:15"
echo

# Check current configuration
if [ -f "$CONFIG_DIR/devcontainer.json" ]; then
    if grep -q "WSL + Claude Code" "$CONFIG_DIR/devcontainer.json" 2>/dev/null; then
        CURRENT="WSL"
    else
        CURRENT="Full"
    fi
else
    CURRENT="None"
fi

echo "📋 Current Configuration: $CURRENT"
echo

echo "Available Configurations:"
echo "  1) Full Kingdom Development (8GB RAM, all tools)"
echo "  2) WSL + Claude Code Optimized (4GB RAM, lightweight)"
echo "  3) Show current configuration"
echo "  4) Exit"
echo

read -p "🎯 Choose configuration (1-4): " choice

case $choice in
    1)
        echo "🔄 Switching to Full Kingdom Development..."
        if [ -f "$CONFIG_DIR/devcontainer-full.json" ]; then
            cp "$CONFIG_DIR/devcontainer-full.json" "$CONFIG_DIR/devcontainer.json"
        else
            # Restore from current if it's WSL config
            if [ "$CURRENT" = "WSL" ]; then
                echo "❌ Full configuration backup not found."
                echo "Please check devcontainer-full.json or restore manually."
                exit 1
            fi
        fi
        echo "✅ Switched to Full Kingdom Development configuration"
        echo "🔄 Restart VS Code or rebuild container to apply changes"
        ;;
        
    2)
        echo "🔄 Switching to WSL + Claude Code Optimized..."
        if [ "$CURRENT" != "WSL" ]; then
            # Backup current config
            cp "$CONFIG_DIR/devcontainer.json" "$CONFIG_DIR/devcontainer-full.json"
        fi
        cp "$CONFIG_DIR/devcontainer-wsl.json" "$CONFIG_DIR/devcontainer.json"
        echo "✅ Switched to WSL + Claude Code configuration"
        echo "🔄 Restart VS Code or rebuild container to apply changes"
        ;;
        
    3)
        echo "📋 Current Configuration Details:"
        if [ -f "$CONFIG_DIR/devcontainer.json" ]; then
            echo "Name: $(grep '"name"' $CONFIG_DIR/devcontainer.json | cut -d'"' -f4)"
            echo "Memory: $(grep -A5 'hostRequirements' $CONFIG_DIR/devcontainer.json | grep 'memory' | cut -d'"' -f4 || echo 'Not specified')"
            echo "CPUs: $(grep -A5 'hostRequirements' $CONFIG_DIR/devcontainer.json | grep 'cpus' | cut -d':' -f2 | tr -d ', ' || echo 'Not specified')"
        else
            echo "❌ No configuration file found"
        fi
        ;;
        
    4)
        echo "🙏 May your development serve the Kingdom. Amen."
        exit 0
        ;;
        
    *)
        echo "❌ Invalid choice. Please select 1-4."
        exit 1
        ;;
esac

echo
echo "🙏 Configuration updated for Kingdom Technology development"
echo "\"Unless the LORD builds the house, the builders labor in vain.\" - Psalm 127:1"