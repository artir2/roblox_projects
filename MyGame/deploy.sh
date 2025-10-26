#!/bin/bash

# 🚀 Roblox Game Deployment Script
# Connects your GitHub repository to your published Roblox game

set -e

GAME_ID="81050956598295"
GAME_URL="https://www.roblox.com/games/81050956598295/my-game"

echo "🎮 Deploying to Roblox Game: $GAME_ID"
echo "🌐 Game URL: $GAME_URL"

# Create build directory
mkdir -p build

echo "🔨 Building game with Rojo..."
rojo build --output build/game.rbxl

echo "📦 Build complete: build/game.rbxl"
echo ""
echo "🎯 Next steps to deploy to your Roblox game:"
echo ""
echo "OPTION 1 - Manual Upload (Recommended for now):"
echo "  1. Open Roblox Studio"
echo "  2. Go to File → Open → build/game.rbxl"
echo "  3. Test your game locally"
echo "  4. Go to File → Publish to Roblox As..."
echo "  5. Select your existing game: $GAME_ID"
echo "  6. Click 'Overwrite' to update your published game"
echo ""
echo "OPTION 2 - Live Development (For active development):"
echo "  1. Open your existing game in Roblox Studio"
echo "  2. Start Rojo server: rojo serve"
echo "  3. In Studio, install Rojo plugin and click 'Connect'"
echo "  4. Use the forwarded URL from your Codespace"
echo "  5. Your changes will sync live!"
echo ""
echo "OPTION 3 - Automated Deployment (Advanced):"
echo "  - Requires Roblox Open Cloud API setup"
echo "  - Can auto-deploy on GitHub commits"
echo "  - Contact me if you want to set this up"

# Check if we're in a Codespace and provide the connection URL
if [ ! -z "$CODESPACE_NAME" ]; then
    echo ""
    echo "🌥️ Codespace detected!"
    echo "📡 Rojo connection URL: https://$CODESPACE_NAME-34872.preview.app.github.dev"
    echo "   Use this URL in Roblox Studio's Rojo plugin"
fi

echo ""
echo "✅ Deployment preparation complete!"