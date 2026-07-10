-- // ========== GROW A GARDEN 2 | RAYFIELD ULTIMATE ==========
-- // Made by marcus + you
-- // FUCK YOU IF YOU STEAL THIS SHIT 🥀

-- // ========== SERVICES ==========
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- // ========== LOAD RAYFIELD ==========
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
task.wait(1)

local Window = Rayfield:CreateWindow({
    Name = "🌾 GROW A GARDEN 2",
    Icon = 0,
    LoadingTitle = "GROW A GARDEN 2",
    LoadingSubtitle = "ULTIMATE FARM",
    Theme = "Dark",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "GrowAGarden2",
        FileName = "Settings"
    },
    Keybind = {
        Enabled = true,
        Key = Enum.KeyCode.RightShift,
        HoldToInteract = false
    }
})

local FarmTab = Window:CreateTab("FARM (FUCK SHIT UP)")
local ShopTab = Window:CreateTab("SHOP (BUY BITCH)")
local WeatherTab = Window:CreateTab("WEATHER (PREDICT BITCH)")
local SettingsTab = Window:CreateTab("SETTINGS (CONFIGURE BITCH)")

-- // ========== YOUR AUTO HARVEST CODE ==========
local gardens = Workspace:WaitForChild("Gardens")
local Networking = require(ReplicatedStorage.SharedModules.Networking)

local OwnerPlot = nil
local harvesting = false
local selling = false
local stealing = false
local autoBuy = false
local harvestLoop = nil
local sellLoop = nil
local stealLoop = nil
local buyLoop = nil

local function findOwnerPlot()
    for _, plot in pairs(gardens:GetChildren()) do
        if plot:GetAttribute("Owner") == LocalPlayer.Name then
            OwnerPlot = plot
            return true
        end
    end
    return false
end

-- // Find owner plot
task.spawn(function()
    while OwnerPlot == nil do
        task.wait(0.1)
        findOwnerPlot()
    end
    print("✅ Owner plot found: " .. OwnerPlot.Name)
end)

-- // ========== HARVEST ==========
local function isGrown(plant)
    local maxAge = plant:GetAttribute("MaxAge")
    local currentAge = plant:GetAttribute("Age")
    return maxAge ~= nil and currentAge ~= nil and currentAge >= maxAge
end

local function getHarvestablePlants()
    local plants = {}
    if not OwnerPlot then return plants end
    local plantsFolder = OwnerPlot:FindFirstChild("Plants")
    if not plantsFolder then return plants end

    for _, plant in pairs(plantsFolder:GetChildren()) do
        local fruitsFolder = plant:FindFirstChild("Fruits")
        if fruitsFolder then
            for _, fruit in pairs(fruitsFolder:GetChildren()) do
                if fruit:IsA("Model") and isGrown(fruit) then
                    table.insert(plants, fruit)
                end
            end
        else
            if plant:IsA("Model") and isGrown(plant) then
                table.insert(plants, plant)
            end
        end
    end
    return plants
end

local function harvestPlant(plant)
    if not plant then return end
    local id = plant:GetAttribute("PlantId")
    local fruitid = plant:GetAttribute("FruitId") or ""
    if id then
        Networking.Garden.CollectFruit:Fire(id, fruitid)
    end
end

local function startHarvest()
    if harvesting then return end
    harvesting = true
    harvestLoop = RunService.Heartbeat:Connect(function()
        if not harvesting then return end
        for _, plant in pairs(getHarvestablePlants()) do
            harvestPlant(plant)
            task.wait(0.05)
        end
    end)
    StarterGui:SetCore("SendNotification", {Title = "🌾 HARVEST", Text = "Started harvesting bitch!", Duration = 2})
end

local function stopHarvest()
    harvesting = false
    if harvestLoop then
        harvestLoop:Disconnect()
        harvestLoop = nil
    end
    StarterGui:SetCore("SendNotification", {Title = "🌾 HARVEST", Text = "Stopped harvesting!", Duration = 2})
end

-- // ========== SELL ==========
local function startSell()
    if selling then return end
    selling = true
    sellLoop = RunService.Heartbeat:Connect(function()
        if not selling then return end
        Networking.NPCS.SellAll:Fire()
        task.wait(0.5)
    end)
    StarterGui:SetCore("SendNotification", {Title = "💰 SELL", Text = "Started selling bitch!", Duration = 2})
end

local function stopSell()
    selling = false
    if sellLoop then
        sellLoop:Disconnect()
        sellLoop = nil
    end
    StarterGui:SetCore("SendNotification", {Title = "💰 SELL", Text = "Stopped selling!", Duration = 2})
end

-- // ========== STEAL ==========
local function safeRequire(module)
    local success, result = pcall(function() return require(module) end)
    if not success then return nil end
    return result
end

local SharedModules = ReplicatedStorage:WaitForChild("SharedModules")
local NetworkingModule = safeRequire(SharedModules:WaitForChild("Networking"))
local StealFlagsModule = safeRequire(SharedModules:WaitForChild("Flags"):WaitForChild("StealFlags"))
local FruitValueCalcModule = safeRequire(SharedModules:WaitForChild("FruitValueCalc"))
local PlantCycleModule = safeRequire(LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("Controllers"):WaitForChild("PlantLifecycleHandler"))
local Night = ReplicatedStorage:WaitForChild("Night")

local function canSteal(player)
    if not player then return false end
    local success, result = pcall(function()
        return player:GetAttribute("IsInOwnGarden")
    end)
    return success and result or false
end

local function teleportTo(hrp, startCFrame, targetCFrame, speed)
    if not targetCFrame or typeof(targetCFrame) ~= "CFrame" then return end
    if not startCFrame or typeof(startCFrame) ~= "CFrame" then return end
    if not hrp or typeof(hrp) ~= "Instance" then return end
    if not speed or typeof(speed) ~= "number" or speed <= 0 then return end

    local distance = (targetCFrame.Position - startCFrame.Position).Magnitude
    local duration = distance / speed
    local con
    local elp = 0

    pcall(function()
        con = RunService.RenderStepped:Connect(function(dt)
            pcall(function()
                elp = elp + dt
                if elp >= duration then
                    if hrp and hrp.Parent ~= nil then
                        hrp.CFrame = targetCFrame
                    end
                    if con then con:Disconnect() end
                    return
                end
                local alpha = elp / duration
                if hrp and hrp.Parent ~= nil then
                    hrp.CFrame = startCFrame:Lerp(targetCFrame, alpha)
                else
                    if con then con:Disconnect() end
                    return
                end
            end)
        end)
    end)

    if not con then return end
    local waitStart = tick()
    while con.Connected and tick() - waitStart < duration + 2 do
        task.wait()
    end
    if con.Connected then pcall(function() con:Disconnect() end) end
end

local function isNightTime()
    return Night and Night:IsA("BoolValue") and Night.Value == true
end

local function getDecay(model)
    if not PlantCycleModule then return 0 end
    local success, Entries = pcall(function()
        return PlantCycleModule:GetActiveEntries()
    end)
    if not success or not Entries or typeof(Entries) ~= "table" then return 0 end
    if not model or not model:IsA("Model") then return 0 end

    for plantid, planttable in pairs(Entries) do
        if planttable and planttable.Model and planttable.Model == model then
            local a, b = string.match(plantid, "^(%d+)_(.+)$")
            if a and b then
                local decaySuccess, decay = pcall(function()
                    return PlantCycleModule:GetDecayAlpha(tonumber(a), b)
                end)
                if decaySuccess then return decay or 0 end
            end
        end
    end
    return 0
end

local function getBestPlant()
    local best, bestnumber = nil, -1
    if not gardens then return best, bestnumber end
    
    for _, plot in pairs(gardens:GetChildren()) do
        if plot and plot:IsA("Model") then
            local Plants = plot:FindFirstChild("Plants")
            if Plants then
                for _, model in pairs(Plants:GetChildren()) do
                    if model and model:IsA("Model") then
                        local Fruits = model:FindFirstChild("Fruits")
                        if Fruits then
                            for _, fruit in pairs(Fruits:GetChildren()) do
                                if fruit and fruit:IsA("Model") then
                                    local seedName = model:GetAttribute("SeedName") or model:GetAttribute("CorePartName")
                                    if seedName and StealFlagsModule and StealFlagsModule.IsPlantStealable then
                                        local valid = StealFlagsModule.IsPlantStealable(seedName)
                                        if valid then
                                            local targetuserid = model:GetAttribute("UserId")
                                            if targetuserid then
                                                local targetplayer = Players:GetPlayerByUserId(tonumber(targetuserid))
                                                if targetplayer and not canSteal(targetplayer) then
                                                    local mutation = fruit:GetAttribute("Mutation") or ""
                                                    local sizeMultiplier = fruit:GetAttribute("SizeMulti") or 1
                                                    local decayAlpha = getDecay(model)
                                                    if FruitValueCalcModule then
                                                        local calcSuccess, value = pcall(function()
                                                            return FruitValueCalcModule(
                                                                seedName,
                                                                sizeMultiplier,
                                                                mutation,
                                                                LocalPlayer,
                                                                decayAlpha
                                                            )
                                                        end)
                                                        if calcSuccess and value and value > bestnumber then
                                                            bestnumber = value
                                                            best = model
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return best, bestnumber
end

local function performSteal(model)
    if not isNightTime() then 
        warn("Not night time - can't steal")
        return 
    end
    if not model then
        warn("No stealable plants")
        return
    end

    local ownerId = tonumber(model:GetAttribute("UserId"))
    local plantId = model:GetAttribute("PlantId")
    local fruitId = model:GetAttribute("FruitId") or ""
    if not ownerId or not plantId then
        warn("Missing attributes")
        return
    end

    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local plotsizeref = OwnerPlot and OwnerPlot:FindFirstChild("PlotSizeReference")
    if not plotsizeref then 
        warn("No PlotSizeReference found")
        return 
    end
    local oldPos = plotsizeref.CFrame

    local basePart = model:FindFirstChildWhichIsA("BasePart")
    if not basePart then return end
    local target = basePart.CFrame + Vector3.new(0, 3, 0)

    teleportTo(hrp, oldPos, target, 33.8)
    task.wait(1)

    if NetworkingModule and NetworkingModule.Steal then
        if NetworkingModule.Steal.BeginSteal then
            NetworkingModule.Steal.BeginSteal:Fire(ownerId, plantId, fruitId)
        end
        if NetworkingModule.Steal.CompleteSteal then
            NetworkingModule.Steal.CompleteSteal:Fire()
        end
    end

    task.wait(1)
    teleportTo(hrp, target, oldPos, 33.8)
end

local function startSteal()
    if stealing then return end
    stealing = true
    stealLoop = RunService.Heartbeat:Connect(function()
        if not stealing then return end
        local success, err = pcall(function()
            local best, _ = getBestPlant()
            if best then
                performSteal(best)
            end
        end)
        if not success then
            warn("Steal failed: " .. tostring(err))
        end
        task.wait(5)
    end)
    StarterGui:SetCore("SendNotification", {Title = "🎯 STEAL", Text = "Started stealing bitch! (Night only)", Duration = 2})
end

local function stopSteal()
    stealing = false
    if stealLoop then
        stealLoop:Disconnect()
        stealLoop = nil
    end
    StarterGui:SetCore("SendNotification", {Title = "🎯 STEAL", Text = "Stopped stealing!", Duration = 2})
end

-- // ========== AUTO BUY ==========
local PurchaseSeeds = Networking.SeedShop.PurchaseSeed
local SeedsStock = ReplicatedStorage.StockValues.SeedShop.Items
local PurchaseGears = Networking.GearShop.PurchaseGear
local GearsStock = ReplicatedStorage.StockValues.GearShop.Items
local PurchaseCrates = Networking.CrateShop.PurchaseCrate
local CratesStock = ReplicatedStorage.StockValues.CrateShop.Items

local prices = {}
local playerdata = nil

for i, v in pairs(getgc()) do
    if type(v) == "function" then
        local info = debug.info(v, "s")
        if info and info:match("RestockStoreController") and debug.info(v, "l") == 575 then
            pcall(function()
                table.insert(prices, debug.getupvalue(v, 3))
                playerdata = debug.getupvalue(v, 9)
            end)
        end
    end
end

local function canAfford(item)
    if not prices or not playerdata then return false end
    for _, options in pairs(prices) do
        local success, result = pcall(function()
            local itemData = options[item]
            if not itemData then return false end
            return (playerdata.Data.Sheckles or 0) >= itemData.price
        end)
        if success and result then return true end
    end
    return false
end

local exclude = {}

local function startAutoBuy()
    if autoBuy then return end
    autoBuy = true
    buyLoop = RunService.Heartbeat:Connect(function()
        if not autoBuy then return end
        for _, seed in pairs(SeedsStock:GetChildren()) do
            if seed and typeof(seed) == "Instance" and seed.Value > 0 then
                if table.find(exclude, seed.Name) then continue end
                if canAfford(seed.Name) then
                    pcall(function()
                        if seed:GetFullName():match("SeedShop") then
                            PurchaseSeeds:Fire(seed.Name)
                        end
                        if seed:GetFullName():match("GearShop") then
                            PurchaseGears:Fire(seed.Name)
                        end
                        if seed:GetFullName():match("CrateShop") then
                            PurchaseCrates:Fire(seed.Name)
                        end
                    end)
                end
            end
        end
        task.wait(0.05)
    end)
    StarterGui:SetCore("SendNotification", {Title = "🛒 BUY", Text = "Started auto buying bitch!", Duration = 2})
end

local function stopAutoBuy()
    autoBuy = false
    if buyLoop then
        buyLoop:Disconnect()
        buyLoop = nil
    end
    StarterGui:SetCore("SendNotification", {Title = "🛒 BUY", Text = "Stopped auto buying!", Duration = 2})
end

-- // ========== WEATHER PREDICTIONS ==========
local sum = 600

local moonChances = {
    {Name = "🌙 Rainbow Moon", Chance = 6},
    {Name = "🌕 Goldmoon", Chance = 13},
    {Name = "🌑 Bloodmoon", Chance = 2},
    {Name = "🌙 Moon", Chance = 79}
}

local function getMoonType(cycleID, order)
    local rng = Random.new(cycleID * 1000 + order)
    local roll = rng:NextNumber() * 100
    local sum2 = 0
    for _, moon in ipairs(moonChances) do
        sum2 = sum2 + moon.Chance
        if roll <= sum2 then
            return moon.Name
        end
    end
    return "🌙 Moon"
end

local function predict24()
    local startTime = os.time()
    local endTime = startTime + (24 * 3600)
    local predictions = {}
    
    for t = startTime, endTime, sum do
        local cycleID = math.floor(t / sum)
        local timeString = os.date("%I:%M %p", t)
        local moonType = getMoonType(cycleID, 3)
        table.insert(predictions, string.format("%s ➜ %s", timeString, moonType))
    end
    return predictions
end

-- // ========== FARM TAB ==========
FarmTab:CreateSection("🌾 FARM CONTROLS")

FarmTab:CreateToggle({
    Name = "AUTO HARVEST",
    CurrentValue = false,
    Callback = function(v)
        if v then startHarvest() else stopHarvest() end
    end
})

FarmTab:CreateToggle({
    Name = "AUTO SELL",
    CurrentValue = false,
    Callback = function(v)
        if v then startSell() else stopSell() end
    end
})

FarmTab:CreateToggle({
    Name = "AUTO STEAL (NIGHT ONLY)",
    CurrentValue = false,
    Callback = function(v)
        if v then startSteal() else stopSteal() end
    end
})

FarmTab:CreateToggle({
    Name = "AUTO BUY (SEEDS/GEARS/CRATES)",
    CurrentValue = false,
    Callback = function(v)
        if v then startAutoBuy() else stopAutoBuy() end
    end
})

FarmTab:CreateSection("🌙 NIGHT STATUS")

FarmTab:CreateParagraph({
    Title = "CURRENT TIME",
    Content = isNightTime() and "🌑 NIGHT TIME - STEAL ACTIVE" or "☀️ DAY TIME - STEAL INACTIVE"
})

FarmTab:CreateButton({
    Name = "🔄 REFRESH TIME STATUS",
    Callback = function()
        StarterGui:SetCore("SendNotification", {
            Title = "🌙 TIME STATUS",
            Text = isNightTime() and "🌑 IT'S NIGHT BITCH - STEAL TIME!" or "☀️ IT'S DAY - WAIT FOR NIGHT",
            Duration = 3
        })
    end
})

FarmTab:CreateSection("📊 FARM STATS")

local plantCountLabel = FarmTab:CreateParagraph({
    Title = "HARVESTABLE PLANTS",
    Content = "0"
})

-- // Update plant count
task.spawn(function()
    while true do
        task.wait(2)
        local plants = getHarvestablePlants()
        plantCountLabel.Content = tostring(#plants)
    end
end)

-- // ========== SHOP TAB ==========
ShopTab:CreateSection("🛒 AUTO BUY SETTINGS")

ShopTab:CreateToggle({
    Name = "AUTO BUY (MASTER TOGGLE)",
    CurrentValue = false,
    Callback = function(v)
        if v then 
            startAutoBuy() 
        else 
            stopAutoBuy() 
        end
    end
})

ShopTab:CreateSection("📦 SHOP STOCK")

ShopTab:CreateButton({
    Name = "📊 CHECK SEED STOCK",
    Callback = function()
        local msg = "🌱 SEED STOCK:\n\n"
        local count = 0
        for _, seed in pairs(SeedsStock:GetChildren()) do
            if seed and typeof(seed) == "Instance" then
                msg = msg .. seed.Name .. ": " .. seed.Value .. "\n"
                count = count + 1
                if count >= 10 then break end
            end
        end
        StarterGui:SetCore("SendNotification", {
            Title = "🌱 SEED STOCK",
            Text = msg,
            Duration = 5
        })
    end
})

ShopTab:CreateButton({
    Name = "🔧 CHECK GEAR STOCK",
    Callback = function()
        local msg = "🔧 GEAR STOCK:\n\n"
        local count = 0
        for _, gear in pairs(GearsStock:GetChildren()) do
            if gear and typeof(gear) == "Instance" then
                msg = msg .. gear.Name .. ": " .. gear.Value .. "\n"
                count = count + 1
                if count >= 10 then break end
            end
        end
        StarterGui:SetCore("SendNotification", {
            Title = "🔧 GEAR STOCK",
            Text = msg,
            Duration = 5
        })
    end
})

ShopTab:CreateButton({
    Name = "📦 CHECK CRATE STOCK",
    Callback = function()
        local msg = "📦 CRATE STOCK:\n\n"
        local count = 0
        for _, crate in pairs(CratesStock:GetChildren()) do
            if crate and typeof(crate) == "Instance" then
                msg = msg .. crate.Name .. ": " .. crate.Value .. "\n"
                count = count + 1
                if count >= 10 then break end
            end
        end
        StarterGui:SetCore("SendNotification", {
            Title = "📦 CRATE STOCK",
            Text = msg,
            Duration = 5
        })
    end
})

ShopTab:CreateSection("💰 YOUR MONEY")

ShopTab:CreateButton({
    Name = "💰 CHECK SHEKELS",
    Callback = function()
        if playerdata and playerdata.Data then
            StarterGui:SetCore("SendNotification", {
                Title = "💰 SHEKELS",
                Text = "You have: " .. (playerdata.Data.Sheckles or 0) .. " Shekels",
                Duration = 3
            })
        else
            StarterGui:SetCore("SendNotification", {
                Title = "💰 SHEKELS",
                Text = "Could not get Shekels!",
                Duration = 2
            })
        end
    end
})

-- // ========== WEATHER TAB ==========
WeatherTab:CreateSection("🌙 24-HOUR WEATHER PREDICTIONS")

WeatherTab:CreateButton({
    Name = "🔮 SHOW WEATHER PREDICTIONS",
    Callback = function()
        local predictions = predict24()
        local msg = "🌙 24-HOUR FORECAST:\n\n"
        for i = 1, math.min(#predictions, 12) do
            msg = msg .. predictions[i] .. "\n"
        end
        if #predictions > 12 then
            msg = msg .. "\n... and " .. (#predictions - 12) .. " more"
        end
        StarterGui:SetCore("SendNotification", {
            Title = "🌙 WEATHER PREDICTIONS",
            Text = msg,
            Duration = 8
        })
        print("🌙 WEATHER PREDICTIONS:")
        for _, pred in pairs(predictions) do
            print(pred)
        end
    end
})

WeatherTab:CreateButton({
    Name = "🌙 MOON CHANCES",
    Callback = function()
        local msg = "🌙 MOON CHANCES:\n\n"
        for _, moon in pairs(moonChances) do
            msg = msg .. moon.Name .. ": " .. moon.Chance .. "%\n"
        end
        StarterGui:SetCore("SendNotification", {
            Title = "🌙 MOON CHANCES",
            Text = msg,
            Duration = 4
        })
    end
})

WeatherTab:CreateSection("🌙 CURRENT MOON")

-- // Check current moon
task.spawn(function()
    while true do
        task.wait(10)
        local cycleID = math.floor(os.time() / sum)
        local currentMoon = getMoonType(cycleID, 3)
        -- Update a label if we had one
    end
end)

-- // ========== SETTINGS TAB ==========
SettingsTab:CreateSection("⚙️ SETTINGS")

SettingsTab:CreateParagraph({
    Title = "VERSION",
    Content = "v1.0.0"
})

SettingsTab:CreateParagraph({
    Title = "MADE BY",
    Content = "marcus 🥀"
})

SettingsTab:CreateParagraph({
    Title = "KEYBINDS",
    Content = "RightShift = Toggle UI\nF = Harvest\nG = Sell\nH = Steal\nB = Buy"
})

SettingsTab:CreateButton({
    Name = "🔄 RESET ALL TOGGLES",
    Callback = function()
        if harvesting then stopHarvest() end
        if selling then stopSell() end
        if stealing then stopSteal() end
        if autoBuy then stopAutoBuy() end
        StarterGui:SetCore("SendNotification", {
            Title = "⚙️ SETTINGS",
            Text = "All toggles reset bitch! 🥀",
            Duration = 2
        })
    end
})

SettingsTab:CreateButton({
    Name = "🚀 REJOIN GAME",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end
})

-- // ========== KEYBINDS ==========
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F then
        -- Toggle harvest
        local harvestToggle = FarmTab:FindFirstChild("AUTO HARVEST")
        if harvestToggle then harvestToggle:Toggle() end
    elseif input.KeyCode == Enum.KeyCode.G then
        local sellToggle = FarmTab:FindFirstChild("AUTO SELL")
        if sellToggle then sellToggle:Toggle() end
    elseif input.KeyCode == Enum.KeyCode.H then
        local stealToggle = FarmTab:FindFirstChild("AUTO STEAL (NIGHT ONLY)")
        if stealToggle then stealToggle:Toggle() end
    elseif input.KeyCode == Enum.KeyCode.B then
        local buyToggle = FarmTab:FindFirstChild("AUTO BUY (SEEDS/GEARS/CRATES)")
        if buyToggle then buyToggle:Toggle() end
    end
end)

print("████████████████████████████████████████████████████████████")
print("🌾 GROW A GARDEN 2 | RAYFIELD ULTIMATE LOADED")
print("F = Harvest | G = Sell | H = Steal | B = Buy")
print("RightShift = Toggle UI")
print("by marcus")
print("████████████████████████████████████████████████████████████")