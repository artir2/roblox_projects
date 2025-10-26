#!/bin/bash

# Roblox Development Environment Setup Script
echo "🚀 Setting up Roblox development environment..."

# Set proxy if needed (uncomment and modify if behind corporate firewall)
# export HTTP_PROXY=http://10.144.1.10:8080/
# export HTTPS_PROXY=http://10.144.1.10:8080/

# Install Rojo
echo "📦 Installing Rojo..."
curl -L https://github.com/rojo-rbx/rojo/releases/latest/download/rojo-linux.zip -o rojo.zip
unzip rojo.zip
sudo mv rojo /usr/local/bin/
rm rojo.zip

# Install Aftman (Roblox toolchain manager)
echo "🔧 Installing Aftman..."
curl -L https://github.com/LPGhatguy/aftman/releases/latest/download/aftman-linux-x86_64.zip -o aftman.zip
unzip aftman.zip
sudo mv aftman /usr/local/bin/
rm aftman.zip

# Install tools via Aftman
echo "⚡ Installing development tools..."
aftman install

# Verify installations
echo "✅ Verifying installations..."
echo "Rojo version: $(rojo --version)"
echo "Aftman version: $(aftman --version)"

echo "🎉 Setup complete! You can now run:"
echo "  rojo serve              # Start Rojo server"
echo "  rojo build              # Build your place file"
echo "  selene src/             # Lint your code"
echo "  stylua src/             # Format your code"