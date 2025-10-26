-- PlayerManager.spec.lua
-- Unit tests for PlayerManager

local PlayerManager = require(script.Parent.Parent.Modules.PlayerManager)

return function()
    describe("PlayerManager", function()
        local mockPlayer
        
        beforeEach(function()
            PlayerManager.init()
            -- Mock player object for testing
            mockPlayer = {
                UserId = 12345,
                Name = "TestPlayer"
            }
        end)
        
        afterEach(function()
            -- Clean up player data
            PlayerManager.playerData = {}
        end)
        
        it("should add player data when player joins", function()
            PlayerManager.addPlayer(mockPlayer)
            local data = PlayerManager.getPlayerData(mockPlayer)
            
            expect(data).to.be.ok()
            expect(data.name).to.equal("TestPlayer")
            expect(data.score).to.equal(0)
            expect(data.kills).to.equal(0)
            expect(data.deaths).to.equal(0)
        end)
        
        it("should remove player data when player leaves", function()
            PlayerManager.addPlayer(mockPlayer)
            PlayerManager.removePlayer(mockPlayer)
            local data = PlayerManager.getPlayerData(mockPlayer)
            
            expect(data).to.equal(nil)
        end)
        
        it("should add score correctly", function()
            PlayerManager.addPlayer(mockPlayer)
            PlayerManager.addScore(mockPlayer, 100)
            local data = PlayerManager.getPlayerData(mockPlayer)
            
            expect(data.score).to.equal(100)
        end)
        
        it("should accumulate score correctly", function()
            PlayerManager.addPlayer(mockPlayer)
            PlayerManager.addScore(mockPlayer, 50)
            PlayerManager.addScore(mockPlayer, 30)
            local data = PlayerManager.getPlayerData(mockPlayer)
            
            expect(data.score).to.equal(80)
        end)
    end)
end