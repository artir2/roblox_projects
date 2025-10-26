-- Main.lua
-- Main initialization script for MyGame
-- This file connects all modules and initializes the game


local Main = {}

-- Import modules
local GameManager = require(script.Parent.Modules.GameManager)
local PlayerManager = require(script.Parent.Modules.PlayerManager)
local MapGenerator = require(script.Parent.Workspace.MapGenerator)
local MainMenuHandler = require(script.Parent.StarterGui.MainMenuHandler)
local HUDManager = require(script.Parent.StarterGui.HUDManager)

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Game initialization
function Main.init()
    print("=== MyGame Starting ===")
    
    -- Initialize all managers
    GameManager.init()
    PlayerManager.init()
    MapGenerator.init()
    
    -- Generate map
    MapGenerator.generateBasicMap()
    MapGenerator.addRandomObjects(3)
    
    -- Handle player joining
    Players.PlayerAdded:Connect(function(player)
        PlayerManager.addPlayer(player)
        
        -- Wait for player to load
        player.CharacterAdded:Connect(function(character)
            Main.onPlayerSpawned(player, character)
        end)
    end)
    
    -- Handle player leaving
    Players.PlayerRemoving:Connect(function(player)
        PlayerManager.removePlayer(player)
    end)
    
    -- Initialize UI for players already in game
    for _, player in pairs(Players:GetPlayers()) do
        if player:IsA("Player") then
            PlayerManager.addPlayer(player)
            if player.Character then
                Main.onPlayerSpawned(player, player.Character)
            end
        end
    end
    
    print("=== MyGame Initialized ===")
end

-- Handle player spawn
function Main.onPlayerSpawned(player, character)
    print("Player spawned:", player.Name)
    
    -- If it's the local player, show UI
    if player == Players.LocalPlayer then
        -- Show main menu
        MainMenuHandler.init()
        
        -- Initialize HUD (initially hidden)
        -- HUDManager.init() -- Uncomment when game starts
    end
end

-- Start game
function Main.startGame()
    print("Starting game...")
    GameManager.startGame()
    
    -- Hide menu, show HUD
    if Players.LocalPlayer then
        local mainMenuHandler = require(script.Parent.StarterGui.MainMenuHandler)
        local hudManager = require(script.Parent.StarterGui.HUDManager)
        
        mainMenuHandler.hideMainMenu()
        hudManager.init()
    end
end

-- End game
function Main.endGame()
    print("Ending game...")
    GameManager.endGame()
    
    -- Show menu, hide HUD
    if Players.LocalPlayer then
        local mainMenuHandler = require(script.Parent.StarterGui.MainMenuHandler)
        local hudManager = require(script.Parent.StarterGui.HUDManager)
        
        hudManager.hideHUD()
        mainMenuHandler.showMainMenu()
    end
end

-- Auto-start when script loads
Main.init()

return Main