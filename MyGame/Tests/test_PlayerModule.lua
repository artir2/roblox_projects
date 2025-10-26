-- test_PlayerModule
-- Unit tests for PlayerModule

local PlayerModule = require("../Modules/PlayerModule")

local function test_greetPlayer()
    PlayerModule.greetPlayer("TestPlayer")
end

test_greetPlayer()
