-- MainMenuHandler.lua
-- Obsługa głównego menu gry

local MainMenuHandler = {}

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

-- Referencje do UI
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Inicjalizacja UI
function MainMenuHandler.init()
    print("MainMenuHandler initialized!")
    MainMenuHandler.createMainMenu()
end

-- Tworzenie głównego menu
function MainMenuHandler.createMainMenu()
    -- Sprawdź czy UI już istnieje
    if playerGui:FindFirstChild("MainMenu") then
        return
    end
    
    -- Stwórz ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "MainMenu"
    screenGui.Parent = playerGui
    
    -- Główna ramka
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 400, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    
    -- Tytuł gry
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Size = UDim2.new(1, 0, 0, 50)
    titleLabel.Position = UDim2.new(0, 0, 0, 20)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "MyGame"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextScaled = true
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.Parent = mainFrame
    
    -- Przycisk Start
    local startButton = Instance.new("TextButton")
    startButton.Name = "StartButton"
    startButton.Size = UDim2.new(0, 200, 0, 50)
    startButton.Position = UDim2.new(0.5, -100, 0, 100)
    startButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    startButton.Text = "START GAME"
    startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    startButton.TextScaled = true
    startButton.Font = Enum.Font.SourceSansBold
    startButton.Parent = mainFrame
    
    -- Obsługa kliknięcia
    startButton.MouseButton1Click:Connect(function()
        MainMenuHandler.hideMainMenu()
        -- Tutaj wywołaj funkcję rozpoczęcia gry
    end)
    
    print("Main menu created!")
end

-- Ukrycie głównego menu
function MainMenuHandler.hideMainMenu()
    local mainMenu = playerGui:FindFirstChild("MainMenu")
    if mainMenu then
        mainMenu:Destroy()
    end
end

-- Pokazanie głównego menu
function MainMenuHandler.showMainMenu()
    MainMenuHandler.createMainMenu()
end

return MainMenuHandler