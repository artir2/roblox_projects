# 🎮 GitHub ↔ Roblox Game Mapping Guide

## 🎯 Your Game Information
- **Game ID**: `81050956598295`
- **Game URL**: https://www.roblox.com/games/81050956598295/my-game
- **GitHub Repository**: This repository

## 🔄 Development Workflow Options

### Option 1: Live Development (Recommended for active coding)

1. **Start your development environment**:
   ```bash
   # In Codespace or local environment
   rojo serve
   ```

2. **Connect from Roblox Studio**:
   - Open your existing game in Roblox Studio
   - Install the Rojo plugin from the Toolbox
   - Click "Connect" in the Rojo plugin
   - Use the connection URL (shown in terminal)

3. **Develop with live sync**:
   - Edit files in VS Code/Codespace
   - Changes appear instantly in Studio
   - Test your game in Studio
   - Commit changes to GitHub when ready

### Option 2: Build & Deploy Workflow

1. **Build your game**:
   ```bash
   # Creates a .rbxl file from your source code
   ./deploy.sh
   ```

2. **Deploy to Roblox**:
   - Download the built `build/game.rbxl` file
   - Open it in Roblox Studio
   - Go to File → Publish to Roblox As...
   - Select your existing game (ID: 81050956598295)
   - Click "Overwrite" to update

### Option 3: Automated Deployment (Advanced)

For automatic deployment on every GitHub commit:
- Requires Roblox Open Cloud API setup
- Uses GitHub Actions
- Can deploy to test and production environments

## 📁 Repository Structure Mapping

Your GitHub files map to Roblox like this:

```
GitHub Repository          →  Roblox Studio
├── src/                   →  ServerScriptService
├── StarterGui/            →  StarterGui
├── Modules/               →  ReplicatedStorage.Modules
├── Workspace/             →  Workspace
└── Tests/                 →  ServerStorage.Tests
```

## 🛠️ Getting Your Game IDs

You need to collect these IDs for full automation:

### Place ID (Required for API deployment):
1. Open your game in Roblox Studio
2. Go to Game Settings → Basic Info
3. Note the "Place ID" number

### Universe ID (Required for API deployment):
1. Go to https://create.roblox.com/dashboard/creations
2. Click on your game
3. Note the URL: the number after `/games/` is your Universe ID

## 🔧 Setup Commands

### First Time Setup:
```bash
# Make deployment script executable
chmod +x deploy.sh

# Install development tools
aftman install

# Start development server
rojo serve
```

### Daily Development:
```bash
# Start coding session
rojo serve

# Build for deployment
./deploy.sh

# Run tests
selene src/
stylua src/
```

## 🤝 Team Collaboration

### For Team Members:
1. Open this repository in Codespace
2. Run `rojo serve`
3. Connect from Roblox Studio using their Codespace URL
4. Each person gets their own development environment

### Sharing Work:
- Commit changes to GitHub regularly
- Use pull requests for code review
- Test in private Studio place before deploying to live game
- Deploy to live game only when ready

## 🔐 Security Notes

- Never commit Roblox API credentials to GitHub
- Use environment variables for sensitive data
- Test in a separate place before updating your live game
- Keep backups of your live game

## 📞 Next Steps

1. **Test the connection**:
   - Start a Codespace
   - Run `rojo serve`
   - Connect from Studio

2. **Update your game**:
   - Make a small change in VS Code
   - See it appear in Studio
   - Publish when satisfied

3. **Set up team access**:
   - Add team members to the GitHub repository
   - Add them as developers in your Roblox game
   - Share this documentation with them

Need help with any of these steps? Let me know!