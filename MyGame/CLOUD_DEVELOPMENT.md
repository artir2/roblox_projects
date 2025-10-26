# 🌥️ Cloud Development Setup

This repository is configured for cloud-based Roblox development using Rojo.

## 🚀 Quick Start with GitHub Codespaces

1. **Open in Codespaces**:
   - Go to your GitHub repository
   - Click the green "Code" button
   - Select "Codespaces" tab
   - Click "Create codespace on main"

2. **Wait for environment setup** (automatic):
   - Container will build with all tools pre-installed
   - Rojo, Aftman, Selene, and StyLua will be ready

3. **Start developing**:
   ```bash
   # Start Rojo server (automatically forwards port 34872)
   rojo serve
   
   # In Roblox Studio, connect to: your-codespace-url-34872.preview.app.github.dev
   ```

## 🤝 Team Collaboration Benefits

- **Consistent environment** for all team members
- **No local setup required** - just open in browser
- **Shared development server** - everyone can connect to the same Rojo instance
- **Pre-configured tools** - Luau LSP, linting, formatting ready to go
- **Version control integration** - commits and PRs work seamlessly

## 🛠️ Available Commands

```bash
# Development
rojo serve                    # Start development server
rojo build --output game.rbxl # Build place file

# Code quality
selene src/                   # Lint Lua code
stylua src/                   # Format Lua code

# Tool management
aftman install               # Install/update tools
aftman list                  # List installed tools
```

## 🌐 Connecting from Roblox Studio

1. Install the Rojo plugin in Roblox Studio
2. Start `rojo serve` in your Codespace
3. Copy the forwarded port URL (shows in VS Code)
4. In Studio, click "Connect" and paste the URL

## 🔧 Local Development (Alternative)

If you prefer local development:

```bash
# Clone repository
git clone <your-repo-url>
cd MyGame

# Install tools
curl -L https://github.com/LPGhatguy/aftman/releases/latest/download/aftman-linux-x86_64.zip -o aftman.zip
unzip aftman.zip && sudo mv aftman /usr/local/bin/

# Install project tools
aftman install

# Start development
rojo serve
```

## 📁 Project Structure

```
MyGame/
├── .devcontainer/          # Cloud development configuration
├── src/                    # Server scripts
├── StarterGui/            # Client GUI scripts
├── Workspace/             # Workspace scripts (MapGenerator, etc.)
├── Modules/               # Shared modules
├── Tests/                 # Unit tests
├── default.project.json   # Rojo project configuration
├── aftman.toml           # Tool dependencies
└── selene.toml           # Linting configuration
```