# TestEZ Setup and Usage Guide

## What is TestEZ?

TestEZ is a **testing framework for Roblox** (not a VS Code plugin). It allows you to write unit tests for your Lua modules in Roblox Studio.

## Installation

### Method 1: Roblox Marketplace
1. Open Roblox Studio
2. Go to **Toolbox** → **Models**
3. Search for "TestEZ"
4. Insert the TestEZ model into your game
5. Move it to **ServerStorage** or **ReplicatedStorage**

### Method 2: GitHub Release
1. Download from: https://github.com/Roblox/testez/releases
2. Insert the `.rbxmx` file into Roblox Studio

### Method 3: Rojo (Advanced)
If using Rojo for development:
```bash
npm install @rbxts/testez
```

## Basic TestEZ Syntax

### Test Structure
```lua
return function()
    describe("Component Name", function()
        beforeEach(function()
            -- Setup before each test
        end)
        
        afterEach(function()
            -- Cleanup after each test
        end)
        
        it("should do something", function()
            -- Test assertions here
            expect(value).to.equal(expectedValue)
        end)
        
        it("should handle edge cases", function()
            expect(someFunction).to.throw()
        end)
    end)
end
```

### Common Assertions
```lua
-- Equality
expect(actual).to.equal(expected)
expect(actual).to.never.equal(unexpected)

-- Boolean checks
expect(value).to.be.ok()
expect(value).to.never.be.ok()

-- Type checking
expect(value).to.be.a("string")
expect(value).to.be.a("number")

-- Error checking
expect(function() error("test") end).to.throw()
expect(safeFunction).to.never.throw()

-- Nil checking
expect(value).to.be.nil()
expect(value).to.never.be.nil()
```

## Running Tests

### In Roblox Studio
1. Create a **ServerScript** in **ServerScriptService**
2. Add this code:

```lua
local TestEZ = require(game:GetService("ReplicatedStorage").TestEZ)

-- Run all tests in the Tests folder
local results = TestEZ.TestBootstrap:run({
    game.ReplicatedStorage.MyGame.Tests
})

-- Print results
if results.failureCount == 0 then
    print("✅ All tests passed!")
else
    print("❌ " .. results.failureCount .. " tests failed")
end
```

### Test Runner Script
```lua
-- TestRunner.lua (ServerScript)
local TestEZ = require(game:GetService("ReplicatedStorage").TestEZ)

local function runTests()
    print("🧪 Running tests...")
    
    local results = TestEZ.TestBootstrap:run({
        game.ReplicatedStorage.MyGame.Tests
    })
    
    print("📊 Test Results:")
    print("✅ Passed: " .. results.successCount)
    print("❌ Failed: " .. results.failureCount)
    print("⏱️ Time: " .. string.format("%.2f", results.time) .. "s")
    
    if results.failureCount > 0 then
        warn("Some tests failed! Check output for details.")
    else
        print("🎉 All tests passed!")
    end
end

-- Run tests when game starts
game.Players.PlayerAdded:Connect(function(player)
    if player.Name == "YourUsername" then -- Replace with your username
        wait(2) -- Wait for game to load
        runTests()
    end
end)
```

## Integration with VS Code

While TestEZ isn't a VS Code plugin, you can:

1. **Write tests in VS Code** using the Lua syntax highlighting
2. **Use Rojo** to sync your code between VS Code and Roblox Studio
3. **Set up Selene** (Lua linter) for better code quality
4. **Use Luau LSP** for autocomplete and type checking

### Recommended VS Code Extensions:
- **Roblox Lua** (sumneko.lua)
- **Selene** (Kampfkarren.selene-vscode) 
- **Rojo** (evaera.vscode-rojo)

## Best Practices

1. **Name test files** with `.spec.lua` extension
2. **Keep tests focused** - one feature per test
3. **Use descriptive test names** - describe what should happen
4. **Test edge cases** - null values, empty strings, etc.
5. **Mock external dependencies** when possible
6. **Run tests frequently** during development

## Example Project Structure
```
MyGame/
├── Modules/
│   ├── GameManager.lua
│   └── PlayerModule.lua
├── Tests/
│   ├── GameManager.spec.lua
│   ├── PlayerModule.spec.lua
│   └── TestRunner.server.lua
└── ...
```

Your current test setup looks great! You can run the GameManager tests by setting up the TestRunner script in Roblox Studio.