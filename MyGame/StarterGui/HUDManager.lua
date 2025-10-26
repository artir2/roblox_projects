-- HUDManager.lua
-- Managing user interface in the game (HUD)

local HUDManager = {}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- References
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Connections
local updateConnection

-- HUD initialization
function HUDManager.init()
    print("HUDManager initialized!")
    HUDManager.createHUD()
end

-- Creating HUD
function HUDManager.createHUD()
    -- Check if HUD already exists
    if playerGui:FindFirstChild("GameHUD") then
        return
    end
    
    -- Create ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "GameHUD"
    screenGui.Parent = playerGui
    
    -- Score panel
    local scoreFrame = Instance.new("Frame")
    scoreFrame.Name = "ScoreFrame"
    scoreFrame.Size = UDim2.new(0, 200, 0, 100)
    scoreFrame.Position = UDim2.new(0, 20, 0, 20)
    scoreFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    scoreFrame.BackgroundTransparency = 0.3
    scoreFrame.BorderSizePixel = 0
    scoreFrame.Parent = screenGui
    
    -- Score label
    local scoreLabel = Instance.new("TextLabel")
    scoreLabel.Name = "ScoreLabel"
    scoreLabel.Size = UDim2.new(1, 0, 0.5, 0)
    scoreLabel.Position = UDim2.new(0, 0, 0, 0)
    scoreLabel.BackgroundTransparency = 1
    scoreLabel.Text = "Score: 0"
    scoreLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    scoreLabel.TextScaled = true
    scoreLabel.Font = Enum.Font.SourceSansBold
    scoreLabel.Parent = scoreFrame
    
    -- Health label
    local healthLabel = Instance.new("TextLabel")
    healthLabel.Name = "HealthLabel"
    healthLabel.Size = UDim2.new(1, 0, 0.5, 0)
    healthLabel.Position = UDim2.new(0, 0, 0.5, 0)
    healthLabel.BackgroundTransparency = 1
    healthLabel.Text = "Health: 100"
    healthLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    healthLabel.TextScaled = true
    healthLabel.Font = Enum.Font.SourceSansBold
    healthLabel.Parent = scoreFrame
    
    print("HUD created!")
    
    -- Start HUD updating
    HUDManager.startUpdating()
end

-- Starting HUD updates
function HUDManager.startUpdating()
    updateConnection = RunService.Heartbeat:Connect(function()
        HUDManager.updateHUD()
    end)
end

-- HUD update
function HUDManager.updateHUD()
    local hud = playerGui:FindFirstChild("GameHUD")
    if not hud then return end
    
    local scoreLabel = hud:FindFirstChild("ScoreFrame"):FindFirstChild("ScoreLabel")
    local healthLabel = hud:FindFirstChild("ScoreFrame"):FindFirstChild("HealthLabel")
    
    if scoreLabel then
        -- Here get the actual player score
        scoreLabel.Text = "Score: 0" -- Replace with actual score
    end
    
    if healthLabel and player.Character and player.Character:FindFirstChild("Humanoid") then
        local health = math.floor(player.Character.Humanoid.Health)
        healthLabel.Text = "Health: " .. health
    end
end

-- Hide HUD
function HUDManager.hideHUD()
    local hud = playerGui:FindFirstChild("GameHUD")
    if hud then
        hud:Destroy()
    end
    
    if updateConnection then
        updateConnection:Disconnect()
        updateConnection = nil
    end
end

-- Show HUD
function HUDManager.showHUD()
    HUDManager.createHUD()
end

return HUDManager