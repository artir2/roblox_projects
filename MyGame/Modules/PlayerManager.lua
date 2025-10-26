-- PlayerManager.lua
-- Managing players and their statistics

local PlayerManager = {}

-- Player data table
PlayerManager.playerData = {}

-- Initialize player manager
function PlayerManager.init()
    print("PlayerManager initialized!")
end

-- Add player
function PlayerManager.addPlayer(player)
    PlayerManager.playerData[player.UserId] = {
        name = player.Name,
        score = 0,
        kills = 0,
        deaths = 0,
        joinTime = tick()
    }
    print("Player added:", player.Name)
end

-- Remove player
function PlayerManager.removePlayer(player)
    PlayerManager.playerData[player.UserId] = nil
    print("Player removed:", player.Name)
end

-- Get player data
function PlayerManager.getPlayerData(player)
    return PlayerManager.playerData[player.UserId]
end

-- Add score points
function PlayerManager.addScore(player, points)
    local data = PlayerManager.getPlayerData(player)
    if data then
        data.score = data.score + points
        print(player.Name .. " scored " .. points .. " points!")
    end
end

return PlayerManager