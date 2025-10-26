-- GameManager.lua
-- Main game manager responsible for managing game state

local GameManager = {}

-- Game states
GameManager.GameState = {
    WAITING = "Waiting",
    PLAYING = "Playing", 
    FINISHED = "Finished"
}

-- Current game state
GameManager.currentState = GameManager.GameState.WAITING

-- Initialize game manager
function GameManager.init()
    print("GameManager initialized!")
    GameManager.currentState = GameManager.GameState.WAITING
end

-- Start the game
function GameManager.startGame()
    GameManager.currentState = GameManager.GameState.PLAYING
    print("Game started!")
end

-- End the game
function GameManager.endGame()
    GameManager.currentState = GameManager.GameState.FINISHED
    print("Game ended!")
end

-- Get current state
function GameManager.getState()
    return GameManager.currentState
end

return GameManager