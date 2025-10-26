-- GameManager.spec.lua
-- Unit tests for GameManager

-- This is an example test using TestEZ
-- To use, install TestEZ in your Roblox project

local GameManager = require(script.Parent.Parent.Modules.GameManager)

return function()
    describe("GameManager", function()
        beforeEach(function()
            GameManager.init()
        end)
        
        it("should initialize with WAITING state", function()
            expect(GameManager.getState()).to.equal(GameManager.GameState.WAITING)
        end)
        
        it("should change to PLAYING when game starts", function()
            GameManager.startGame()
            expect(GameManager.getState()).to.equal(GameManager.GameState.PLAYING)
        end)
        
        it("should change to FINISHED when game ends", function()
            GameManager.startGame()
            GameManager.endGame()
            expect(GameManager.getState()).to.equal(GameManager.GameState.FINISHED)
        end)
        
        it("should have all required game states", function()
            expect(GameManager.GameState.WAITING).to.be.ok()
            expect(GameManager.GameState.PLAYING).to.be.ok()
            expect(GameManager.GameState.FINISHED).to.be.ok()
        end)
    end)
end