-- MapGenerator.lua
-- Generator mapy i obiektów na workspace

local MapGenerator = {}

-- Serwisy
local Workspace = game:GetService("Workspace")

-- Inicjalizacja generatora mapy
function MapGenerator.init()
    print("MapGenerator initialized!")
end

-- Generowanie podstawowej mapy
function MapGenerator.generateBasicMap()
    print("Generating basic map...")
    
    -- Usuń istniejącą mapę jeśli istnieje
    MapGenerator.clearMap()
    
    -- Stwórz folder na mapę
    local mapFolder = Instance.new("Folder")
    mapFolder.Name = "GeneratedMap"
    mapFolder.Parent = Workspace
    
    -- Stwórz podstawową platformę
    local platform = Instance.new("Part")
    platform.Name = "MainPlatform"
    platform.Size = Vector3.new(100, 4, 100)
    platform.Position = Vector3.new(0, 0, 0)
    platform.Anchored = true
    platform.BrickColor = BrickColor.new("Bright green")
    platform.Material = Enum.Material.Grass
    platform.Parent = mapFolder
    
    -- Dodaj kilka przeszkód
    for i = 1, 5 do
        local obstacle = Instance.new("Part")
        obstacle.Name = "Obstacle" .. i
        obstacle.Size = Vector3.new(8, 12, 8)
        obstacle.Position = Vector3.new(
            math.random(-40, 40),
            8,
            math.random(-40, 40)
        )
        obstacle.Anchored = true
        obstacle.BrickColor = BrickColor.new("Really red")
        obstacle.Material = Enum.Material.Neon
        obstacle.Parent = mapFolder
    end
    
    -- Dodaj punkty spawnu
    MapGenerator.createSpawnPoints(mapFolder)
    
    print("Basic map generated!")
end

-- Tworzenie punktów spawnu
function MapGenerator.createSpawnPoints(mapFolder)
    local spawnFolder = Instance.new("Folder")
    spawnFolder.Name = "SpawnPoints"
    spawnFolder.Parent = mapFolder
    
    -- Stwórz 4 punkty spawnu w rogach
    local spawnPositions = {
        Vector3.new(-30, 10, -30),
        Vector3.new(30, 10, -30),
        Vector3.new(-30, 10, 30),
        Vector3.new(30, 10, 30)
    }
    
    for i, position in ipairs(spawnPositions) do
        local spawnPoint = Instance.new("Part")
        spawnPoint.Name = "SpawnPoint" .. i
        spawnPoint.Size = Vector3.new(4, 1, 4)
        spawnPoint.Position = position
        spawnPoint.Anchored = true
        spawnPoint.CanCollide = false
        spawnPoint.BrickColor = BrickColor.new("Bright blue")
        spawnPoint.Material = Enum.Material.ForceField
        spawnPoint.Transparency = 0.5
        spawnPoint.Parent = spawnFolder
    end
end

-- Czyszczenie mapy
function MapGenerator.clearMap()
    local existingMap = Workspace:FindFirstChild("GeneratedMap")
    if existingMap then
        existingMap:Destroy()
    end
end

-- Losowe umieszczenie obiektów
function MapGenerator.addRandomObjects(count)
    local mapFolder = Workspace:FindFirstChild("GeneratedMap")
    if not mapFolder then
        print("No map found! Generate map first.")
        return
    end
    
    local objectsFolder = Instance.new("Folder")
    objectsFolder.Name = "RandomObjects"
    objectsFolder.Parent = mapFolder
    
    for i = 1, count do
        local obj = Instance.new("Part")
        obj.Name = "RandomObject" .. i
        obj.Size = Vector3.new(
            math.random(2, 6),
            math.random(2, 10),
            math.random(2, 6)
        )
        obj.Position = Vector3.new(
            math.random(-45, 45),
            obj.Size.Y / 2 + 2,
            math.random(-45, 45)
        )
        obj.Anchored = true
        obj.BrickColor = BrickColor.random()
        obj.Parent = objectsFolder
    end
    
    print("Added " .. count .. " random objects!")
end

return MapGenerator