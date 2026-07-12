-- ============ ELITE HUB - COMPLETE BLOX FRUITS (DELTA FIXED) ============
-- Made by marcus 🥀
-- Discord: discord.gg/5RuMCxK3u6
-- FUCK YOU IF YOU STEAL THIS SHIT
-- FIXED FOR DELTA EXECUTOR

-- ============ LOAD RAYFIELD ============
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ============ SERVICES ============
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local Character = LP.Character or LP.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HRP = Character:WaitForChild("HumanoidRootPart")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local Modules = ReplicatedStorage:WaitForChild("Modules")
local Net = Modules:WaitForChild("Net")
local RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
local RegisterHit = Net:WaitForChild("RE/RegisterHit")
local hitData = {[4] = "4676ac1a"}

-- ============ FIXED SESSION ID (NO getrenv/getupvalues) ============
local function GetSessionID()
    -- Simple hardcoded session ID that works everywhere
    return "4676ac1a"
end

-- ============ FIXED ATTACK FUNCTION ============
local function AttackNPC(TargetCharacter)
    if not TargetCharacter then return end
    
    pcall(function()
        -- Find a valid body part
        local targetPart = TargetCharacter:FindFirstChild("HumanoidRootPart") 
            or TargetCharacter:FindFirstChild("Head")
            or TargetCharacter:FindFirstChild("Torso")
            or TargetCharacter:FindFirstChild("UpperTorso")
            or TargetCharacter:FindFirstChild("RightLowerLeg")
            or TargetCharacter:FindFirstChild("LeftLowerLeg")
        
        if not targetPart then return end
        
        RegisterAttack:FireServer(0.5)
        task.wait()
        
        local dataTable = {
            targetPart,
            {},
            nil,
            GetSessionID()
        }
        RegisterHit:FireServer(unpack(dataTable))
    end)
end

-- ============ GLOBALS ============
_G.SelectWeapon = 'Melee'
_G.AutoFarm = false
_G.AutoNear = false
_G.AutoFarmFruits = false
_G.selectFruitFarm = 'Farm Level Mastery No Quest'
_G.FarmBone = false
_G.AutoFarmMaterial = false
_G.AutoChestFarm = false
_G.AutoCollectBerry = false
_G.AutoBossFarm = false
_G.SelectBoss = ''
_G.SelectMaterial = ''
_G.BringMonster = true
_G.BringMob = true
_G.WalkWater = true
_G.CheckPoint = false
_G.AutoHaki = true
_G.AutoActiveRaceV3 = false
_G.AutoActiveRaceV4 = false
_G.InfiniteSoru = false
_G.SpinPosition = false
_G.DodgeNoCD = false
_G.InfiniteGeppo = false
_G.InfiniteJump = false
_G.StopTween = false
_G.FastAttack = true
_G.AutoItemsQuest = false
_G.AutoQuestSea = false
_G.AutoSecondSea = false
_G.AutoBossRaid = false
_G.AutoKillGreybeard = false
_G.AutoBuyHakiColors = false
_G.AutoHakiColors = false
_G.AutoGetArticless = false
_G.AutoSaber = false
_G.Autopole = false
_G.Autosaw = false
_G.ChiefWarden = false
_G.Trident = false
_G.CheckQuestDragon = false
_G.SelectMobQuest = 'Venomous Assailant'
_G.AutoDragonQuest = false
_G.AutoFarmMobQuest = false
_G.AutoTreeDestroyer = false
_G.KillShark = false
_G.KillPiranha = false
_G.KillFishCrew = false
_G.AutoMysticIsland = false
_G.TweenMGear = false
_G.AutoDooHee = false
_G.MirageIslandESP = false
_G.SelectChip = 'Flame'
_G.AutoBuyChip = false
_G.AutoStartRaid = false
_G.AutoFarmRaidNextIsland = false
_G.AutoGetFruitLowBeli = false
_G.AutoRandomFruit = false
_G.AutoStoreFruit = false
_G.AutoEatFruit = false
_G.SelectFruitEat = 'Flame'
_G.AutoDropFruit = false
_G.SelectFruitDrop = 'Flame'
_G.NotAutoEquip = false
_G.SelectBoat = 'PirateSloop'
_G.AutoTeleportToMob = true
_G.SelectStat = 'Melee'
_G.StatAmount = 1

-- ============ FRUIT FINDER CONFIG ============
local FruitConfig = {
    AutoFruit = false,
    AutoStoreFruit = false,
    AutoServerHop = false,
    OnlyGoodFruits = true,
    FruitLog = {}
}

local GOOD_FRUITS = {
    "Buddha", "Light", "Flame", "Gravity", "Control", 
    "Dough", "Venom", "Shadow", "Dragon", "Leopard",
    "Phoenix", "Rumble", "Soul", "Dark", "String", "Spirit"
}

-- ============ SEA DETECTION ============
local PlaceId = game.PlaceId
local CurrentSea = "Sea 1"
local World1 = false
local World2 = false
local World3 = false

if PlaceId == 2753915549 then
    CurrentSea = "Sea 1"
    World1 = true
elseif PlaceId == 4442272183 then
    CurrentSea = "Sea 2"
    World2 = true
elseif PlaceId == 7449423635 then
    CurrentSea = "Sea 3"
    World3 = true
end
print("🌊 Current Sea: " .. CurrentSea)

-- ============ MOB LISTS BY SEA ============
local MobLists = {
    ["Sea 1"] = {
        "Bandit", "Monkey", "Gorilla", "Pirate", "Marine", "Desert", 
        "Ice", "Sky", "Prisoner", "Magma", "Fishman", "Snowman",
        "Chief", "Boss", "Vice Admiral", "Dragon", "Dark"
    },
    ["Sea 2"] = {
        "Swan", "Mink", "Punk", "Zombie", "Skeleton", "Ghost",
        "Cursed", "Demon", "Dragon", "Dark", "Venom", "Dough",
        "Mystic", "Flying", "Cyborg", "Ice Cream", "Diamond",
        "Rumble", "Flame", "Light", "Shadow", "Control",
        "Gravity", "Phoenix", "Buddha", "String", "Soul",
        "Raid Boss", "Cake King", "Dough King", "Greybeard"
    },
    ["Sea 3"] = {
        "Candy", "Gingerbread", "Chocolate", "Cookie", "Cake",
        "Donut", "Pudding", "Jelly", "Milk", "Honey",
        "Tree", "Wood", "Leaf", "Flower", "Vine",
        "Tiki", "Volcano", "Lava", "Fire", "Ash",
        "Hydra", "Serpent", "Dragon", "Venom", "Poison",
        "Cake Prince", "Cake Princess", "Candy King",
        "Dough King", "Raid Boss", "Indra", "Rip Indra"
    }
}

-- ============ QUESTS ============
local Quests = loadstring(game:HttpGet("https://raw.githubusercontent.com/CFR-Executor/resources/refs/heads/main/bfquestdumpfull"))()

local islandNames = {
    BanditQuest1 = "Windmill",
    MarineQuest = "MarineStart",
    JungleQuest = "Jungle",
    BuggyQuest1 = "Pirate",
    BuggyQuest2 = "Pirate",
    DesertQuest = "Desert",
    SnowQuest = "Ice",
    MarineQuest2 = "MarineBase",
    SkyQuest = "Sky",
    SkyQuest2 = "Sky",
    PrisonerQuest = "Prison",
    ImpelQuest = "Prison",
    ColosseumQuest = "Colosseum",
    MagmaQuest = "Magma",
    FishmanQuest = "Fishmen",
    SkyExp1Quest = "SkyArea1",
    SkyExp2Quest = "SkyArea2",
    FountainQuest = "Fountain"
}

-- ============ FRUIT FINDER FUNCTIONS ============
local function LoadFruitLog()
    if isfile("fruitlog.json") then
        local success, data = pcall(function()
            return HttpService:JSONDecode(readfile("fruitlog.json"))
        end)
        if success and data then FruitConfig.FruitLog = data end
    end
end

local function SaveFruitLog()
    pcall(function()
        writefile("fruitlog.json", HttpService:JSONEncode(FruitConfig.FruitLog))
    end)
end

local function LogFruit(fruitName)
    table.insert(FruitConfig.FruitLog, {
        fruit = fruitName,
        time = os.date("%Y-%m-%d %H:%M:%S")
    })
    SaveFruitLog()
    print("🍎 Found: " .. fruitName)
end

local function IsGoodFruit(fruitName)
    if not FruitConfig.OnlyGoodFruits then return true end
    for _, good in ipairs(GOOD_FRUITS) do
        if string.find(fruitName, good) then return true end
    end
    return false
end

local function CollectFruit(item)
    if not item then return false end
    local fruitName = item.Name
    if not IsGoodFruit(fruitName) then return false end
    
    if item:IsA("Tool") then
        local handle = item:FindFirstChild("Handle")
        if handle then
            local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad)
            local goal = {CFrame = CFrame.new(handle.Position + Vector3.new(0, 3, 0))}
            TweenService:Create(HRP, tweenInfo, goal):Play()
            task.wait(0.4)
            if item:IsDescendantOf(workspace) then
                LogFruit(fruitName)
                return true
            end
        end
    elseif item:IsA("Model") and (item.Name == "Fruit" or item.Name == "fruit") then
        local basePart = item:FindFirstChildWhichIsA("BasePart")
        if basePart then
            local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad)
            local goal = {CFrame = CFrame.new(basePart.Position + Vector3.new(0, 3, 0))}
            TweenService:Create(HRP, tweenInfo, goal):Play()
            task.wait(0.4)
            if item:IsDescendantOf(workspace) then
                LogFruit("Model - " .. fruitName)
                return true
            end
        end
    end
    return false
end

local function FindFruits()
    local found = false
    local collected = false
    
    for _, v in ipairs(workspace:GetChildren()) do
        if v:IsA("Tool") and string.find(string.lower(v.Name), "fruit") then
            found = true
            if FruitConfig.AutoFruit and CollectFruit(v) then
                collected = true
            end
            break
        end
    end
    
    if not collected then
        for _, v in ipairs(workspace:GetChildren()) do
            if v:IsA("Model") and (v.Name == "Fruit" or v.Name == "fruit") then
                found = true
                if FruitConfig.AutoFruit and CollectFruit(v) then
                    collected = true
                end
                break
            end
        end
    end
    
    if collected and FruitConfig.AutoStoreFruit then
        task.wait(0.5)
        for _, tool in ipairs(LP.Backpack:GetChildren()) do
            if tool:IsA("Tool") and string.find(string.lower(tool.Name), "fruit") then
                pcall(function()
                    Remotes.CommF_:InvokeServer("StoreFruit", tool:GetAttribute("OriginalName"), tool)
                    print("Stored: " .. tool.Name)
                end)
            end
        end
    end
    
    if not found and FruitConfig.AutoServerHop then
        local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
        local filtered = {}
        for _, server in ipairs(servers.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                table.insert(filtered, server)
            end
        end
        if #filtered > 0 then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, filtered[math.random(#filtered)].id)
        end
    end
end

-- ============ FARM FUNCTIONS ============
local function isOnIsland(islandName)
    local map = Workspace:FindFirstChild("Map")
    if not map then return false end
    local island = map:FindFirstChild(islandName)
    if not island then return false end
    for _, part in ipairs(island:GetDescendants()) do
        if part:IsA("BasePart") then
            local relative = part.CFrame:PointToObjectSpace(HRP.Position)
            local half = part.Size / 2
            if math.abs(relative.X) <= half.X and math.abs(relative.Z) <= half.Z then
                if relative.Y >= -50 and relative.Y <= half.Y + 50 then return true end
            end
        end
    end
    return false
end

local function moveTo(position)
    local tweenInfo = TweenInfo.new((HRP.Position - position).Magnitude / 350, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(HRP, tweenInfo, {CFrame = CFrame.new(position)})
    tween:Play()
    return tween
end

local function teleportToIsland(island)
    local map = Workspace:FindFirstChild("Map")
    if not map then return end
    
    if island == "Fishmen" or island == "Fishman" then
        local teleportSpawn = map:FindFirstChild("TeleportSpawn")
        if teleportSpawn then
            if isOnIsland("Fishmen") or isOnIsland("Fishman") then
                local exit = teleportSpawn:FindFirstChild("ExitPoint")
                if exit then HRP.CFrame = exit.CFrame end
            else
                local entrance = teleportSpawn:FindFirstChild("EntrancePoint")
                if entrance then HRP.CFrame = entrance.CFrame end
            end
        end
    elseif island == "SkyArea1" then
        local skyArea2 = map:FindFirstChild("SkyArea2")
        if skyArea2 then
            local pathway = skyArea2:FindFirstChild("PathwayHouse")
            if pathway then
                local entrance = pathway:FindFirstChild("EntrancePoint")
                if entrance then HRP.CFrame = entrance.CFrame end
            end
        end
    elseif island == "SkyArea2" then
        local skyArea1 = map:FindFirstChild("SkyArea1")
        if skyArea1 then
            local pathway = skyArea1:FindFirstChild("PathwayTemple")
            if pathway then
                local exit = pathway:FindFirstChild("ExitPoint")
                if exit then HRP.CFrame = exit.CFrame end
            end
        end
    else
        local islandModel = map:FindFirstChild(island)
        if islandModel and islandModel:GetPivot then
            moveTo(islandModel:GetPivot().Position + Vector3.new(0, 50, 0))
        end
    end
end

local function getQuest()
    local level = LP.Data.Level.Value
    local highestQuest, highestIsland
    
    for islandName, questList in pairs(Quests) do
        for _, quest in ipairs(questList) do
            if level >= quest.LevelReq then
                if not highestQuest or quest.LevelReq > highestQuest.LevelReq then
                    highestQuest = quest
                    highestIsland = islandName
                end
            end
        end
    end
    
    if not highestQuest then return nil end
    
    local questFrame = LP.PlayerGui:WaitForChild("Main"):WaitForChild("Quest")
    if not questFrame.Visible then
        pcall(function()
            Remotes.CommF_:InvokeServer(unpack(highestQuest.Args))
        end)
    end
    
    local enemyName
    local titleLabel = questFrame.Container.QuestTitle:FindFirstChild("Title")
    if titleLabel then
        local parsed = titleLabel.Text:match("Defeat%s+%d+%s+(.+)%s+%(%d+/%d+%)")
        if parsed then enemyName = parsed end
    end
    if not enemyName and highestQuest.Task then
        for name, _ in pairs(highestQuest.Task) do
            enemyName = name
            break
        end
    end
    
    local island = islandNames[highestIsland] or highestIsland
    if not isOnIsland(island) then
        teleportToIsland(island)
    end
    
    return {
        quest = highestQuest,
        enemy = enemyName,
        island = island,
        levelReq = highestQuest.LevelReq,
        args = highestQuest.Args
    }
end

local function attachFloat()
    if not HRP:FindFirstChild("FloatBV") then
        local bv = Instance.new("BodyVelocity")
        bv.Name = "FloatBV"
        bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
        bv.Velocity = Vector3.zero
        bv.Parent = HRP
    end
    if not HRP:FindFirstChild("StabilizerBG") then
        local bg = Instance.new("BodyGyro")
        bg.Name = "StabilizerBG"
        bg.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
        bg.CFrame = HRP.CFrame
        bg.Parent = HRP
    end
end

-- Auto Haki
local function AutoHaki()
    if _G.AutoHaki and not Character:FindFirstChild("HasBuso") then
        pcall(function()
            Remotes.CommF_:InvokeServer("Buso")
        end)
    end
end

-- ============ WATER WALK ============
local waterWalk = Instance.new("Part", workspace)
waterWalk.Transparency = 1
waterWalk.Name = "WaterWalk"
waterWalk.CanCollide = false
waterWalk.Size = Vector3.new(1000, 1, 1000)
waterWalk.Anchored = true

RunService.RenderStepped:Connect(function()
    waterWalk.Position = Vector3.new(HRP.Position.X, -4.5, HRP.Position.Z)
end)

-- ============ CREATE WINDOW ============
local Window = Rayfield:CreateWindow({
    Name = "ELITE HUB 🥀",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "by marcus",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "EliteHub", 
        FileName = "BloxFruits"
    },
    Discord = {
        Enabled = true,
        Invite = "5RuMCxK3u6", 
        RememberJoins = true
    }
})

-- ============ TABS ============
local MainTab = Window:CreateTab("⚔️ Main")
local FarmTab = Window:CreateTab("🌾 Farm")
local FruitTab = Window:CreateTab("🍎 Fruits")
local PlayerTab = Window:CreateTab("👤 Player")
local VisualTab = Window:CreateTab("👁️ Visual")
local TeleportTab = Window:CreateTab("🚀 Teleport")
local ShopTab = Window:CreateTab("🛒 Shop")
local MiscTab = Window:CreateTab("🎮 Misc")

-- ============ MAIN TAB ============
MainTab:CreateSection("💀 Combat")

MainTab:CreateToggle({
    Name = "Auto Farm 🔥",
    CurrentValue = false,
    Flag = "AutoFarm",
    Callback = function(Value)
        _G.AutoFarm = Value
        print(Value and "Auto Farm ON" or "Auto Farm OFF")
    end,
})

MainTab:CreateToggle({
    Name = "Auto Near Attack 🎯",
    CurrentValue = false,
    Flag = "AutoNear",
    Callback = function(Value)
        _G.AutoNear = Value
    end,
})

MainTab:CreateToggle({
    Name = "Auto Haki 🥊",
    CurrentValue = true,
    Flag = "AutoHaki",
    Callback = function(Value)
        _G.AutoHaki = Value
    end,
})

MainTab:CreateToggle({
    Name = "Fast Attack ⚡",
    CurrentValue = true,
    Flag = "FastAttack",
    Callback = function(Value)
        _G.FastAttack = Value
    end,
})

MainTab:CreateToggle({
    Name = "Bring Monster 👹",
    CurrentValue = true,
    Flag = "BringMonster",
    Callback = function(Value)
        _G.BringMonster = Value
    end,
})

MainTab:CreateToggle({
    Name = "Bring Mob 👾",
    CurrentValue = true,
    Flag = "BringMob",
    Callback = function(Value)
        _G.BringMob = Value
    end,
})

-- ============ FARM TAB ============
FarmTab:CreateSection("🌊 Current Sea: " .. CurrentSea)

-- Custom NPC Farm
local CustomTargetName = "Snowman"
local CustomFarmEnabled = false
local CustomAttackDelay = 0.1
local AvailableMobs = {}

local function GetAvailableMobs()
    local mobs = {}
    local Enemies = workspace:FindFirstChild("Enemies")
    if Enemies then
        for _, enemy in pairs(Enemies:GetChildren()) do
            if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                local name = enemy.Name
                local cleanName = name:gsub("%[Lv%.%s*%d+%]%s*", ""):gsub("%s+$","")
                if cleanName ~= "" then
                    mobs[cleanName] = true
                end
            end
        end
    end
    
    local mobList = {}
    for name, _ in pairs(mobs) do
        table.insert(mobList, name)
    end
    table.sort(mobList)
    
    if #mobList == 0 then
        mobList = MobLists[CurrentSea] or MobLists["Sea 1"]
    end
    
    return mobList
end

local function RefreshMobsList()
    AvailableMobs = GetAvailableMobs()
    print("🔄 Mobs refreshed: " .. #AvailableMobs .. " found")
    return AvailableMobs
end

RefreshMobsList()

-- FIXED CUSTOM FARM LOOP
local function StartCustomFarm()
    while CustomFarmEnabled do
        pcall(function()
            local Enemies = workspace:FindFirstChild("Enemies")
            if not Enemies then 
                task.wait(0.5) 
                return 
            end
            
            local Character = LP.Character
            if not Character then 
                task.wait(0.5) 
                return 
            end
            local RootPart = Character:FindFirstChild("HumanoidRootPart")
            if not RootPart then 
                task.wait(0.5) 
                return 
            end
            
            local foundTarget = false
            
            for _, Enemy in pairs(Enemies:GetChildren()) do
                if not CustomFarmEnabled then break end
                
                local humanoid = Enemy:FindFirstChild("Humanoid")
                if not humanoid or humanoid.Health <= 0 then 
                    goto continue 
                end
                
                local enemyName = Enemy.Name
                local cleanEnemyName = enemyName:gsub("%[Lv%.%s*%d+%]%s*", ""):gsub("%s+$","")
                
                if string.lower(cleanEnemyName) == string.lower(CustomTargetName) then
                    local TargetRootPart = Enemy:FindFirstChild("HumanoidRootPart")
                    if not TargetRootPart then 
                        goto continue 
                    end
                    
                    foundTarget = true
                    
                    if _G.AutoTeleportToMob then
                        RootPart.CFrame = CFrame.new(TargetRootPart.Position) * CFrame.new(0, 57, 0)
                        RootPart.Velocity = Vector3.zero
                    end
                    
                    task.wait(CustomAttackDelay)
                    AttackNPC(Enemy)
                end
                
                ::continue::
            end
            
            if not foundTarget then
                task.wait(0.5)
            end
        end)
        task.wait()
    end
end

FarmTab:CreateToggle({
    Name = "Custom NPC Farm 🎯",
    CurrentValue = false,
    Flag = "CustomFarm",
    Callback = function(Value)
        CustomFarmEnabled = Value
        if Value then 
            task.spawn(StartCustomFarm)
            print("🎯 Custom NPC Farm ON - Target: " .. CustomTargetName)
        else
            print("🎯 Custom NPC Farm OFF")
        end
    end,
})

FarmTab:CreateDropdown({
    Name = "Select NPC 🎯",
    Options = AvailableMobs,
    CurrentOption = AvailableMobs[1] or "Snowman",
    Flag = "CustomNPCTarget",
    Callback = function(Option)
        CustomTargetName = Option
        print("🎯 Target set to: " .. CustomTargetName)
    end,
})

FarmTab:CreateButton({
    Name = "🔄 Refresh Mobs",
    Callback = function()
        RefreshMobsList()
    end,
})

FarmTab:CreateSlider({
    Name = "Attack Delay ⏱️",
    Range = {0, 1},
    Increment = 0.05,
    Suffix = "Sec",
    CurrentValue = 0.1,
    Flag = "CustomAttackDelay",
    Callback = function(Value)
        CustomAttackDelay = Value
    end,
})

FarmTab:CreateToggle({
    Name = "Auto Teleport To Mob 🚀",
    CurrentValue = true,
    Flag = "AutoTeleportToMob",
    Callback = function(Value)
        _G.AutoTeleportToMob = Value
    end,
})

FarmTab:CreateButton({
    Name = "⚔️ Attack Once",
    Callback = function()
        pcall(function()
            local Enemies = workspace:FindFirstChild("Enemies")
            if not Enemies then 
                print("❌ No enemies found!")
                return 
            end
            
            for _, Enemy in pairs(Enemies:GetChildren()) do
                local cleanName = Enemy.Name:gsub("%[Lv%.%s*%d+%]%s*", ""):gsub("%s+$","")
                if string.lower(cleanName) == string.lower(CustomTargetName) and 
                   Enemy:FindFirstChild("Humanoid") and Enemy.Humanoid.Health > 0 then
                    AttackNPC(Enemy)
                    print("⚔️ Attacked " .. CustomTargetName)
                    break
                end
            end
        end)
    end,
})

FarmTab:CreateButton({
    Name = "💀 Kill All Mobs",
    Callback = function()
        pcall(function()
            local Enemies = workspace:FindFirstChild("Enemies")
            if not Enemies then return end
            
            local count = 0
            for _, Enemy in pairs(Enemies:GetChildren()) do
                if Enemy:FindFirstChild("Humanoid") and Enemy.Humanoid.Health > 0 then
                    AttackNPC(Enemy)
                    count = count + 1
                    task.wait(0.05)
                end
            end
            print("💀 Killed " .. count .. " mobs!")
        end)
    end,
})

FarmTab:CreateSection("🌾 Farm Options")

FarmTab:CreateToggle({
    Name = "Auto Farm Fruits 🍎",
    CurrentValue = false,
    Flag = "AutoFarmFruits",
    Callback = function(Value)
        _G.AutoFarmFruits = Value
    end,
})

FarmTab:CreateToggle({
    Name = "Auto Chest Farm 📦",
    CurrentValue = false,
    Flag = "AutoChestFarm",
    Callback = function(Value)
        _G.AutoChestFarm = Value
        if Value then
            task.spawn(function()
                while _G.AutoChestFarm do
                    pcall(function()
                        local chests = workspace:FindFirstChild("ChestModels")
                        if chests then
                            for _, chest in pairs(chests:GetChildren()) do
                                if chest:IsA("Model") then
                                    HRP.CFrame = chest:GetPivot()
                                    task.wait(0.1)
                                end
                            end
                        end
                    end)
                    task.wait()
                end
            end)
        end
    end,
})

FarmTab:CreateToggle({
    Name = "Auto Farm Bone 💀",
    CurrentValue = false,
    Flag = "FarmBone",
    Callback = function(Value)
        _G.FarmBone = Value
    end,
})

FarmTab:CreateToggle({
    Name = "Auto Farm Material 🧱",
    CurrentValue = false,
    Flag = "AutoFarmMaterial",
    Callback = function(Value)
        _G.AutoFarmMaterial = Value
    end,
})

FarmTab:CreateToggle({
    Name = "Auto Boss Farm 👹",
    CurrentValue = false,
    Flag = "AutoBossFarm",
    Callback = function(Value)
        _G.AutoBossFarm = Value
    end,
})

FarmTab:CreateDropdown({
    Name = "Select Boss",
    Options = {"Dragon", "Venom", "Dough", "Dark", "Light", "Flame"},
    CurrentOption = "Dragon",
    Flag = "SelectBoss",
    Callback = function(Option)
        _G.SelectBoss = Option
    end,
})

FarmTab:CreateDropdown({
    Name = "Select Material",
    Options = {"Scrap Metal", "Wood", "Stone", "Leather"},
    CurrentOption = "Scrap Metal",
    Flag = "SelectMaterial",
    Callback = function(Option)
        _G.SelectMaterial = Option
    end,
})

-- ============ FRUIT TAB ============
FruitTab:CreateSection("🍎 Fruit Finder")

FruitTab:CreateToggle({
    Name = "Auto Find Fruits 🍎",
    CurrentValue = false,
    Flag = "FruitAutoFind",
    Callback = function(Value)
        FruitConfig.AutoFruit = Value
        print(Value and "Fruit finder ON" or "Fruit finder OFF")
    end,
})

FruitTab:CreateToggle({
    Name = "Auto Store Fruits 💰",
    CurrentValue = false,
    Flag = "FruitAutoStore",
    Callback = function(Value)
        FruitConfig.AutoStoreFruit = Value
    end,
})

FruitTab:CreateToggle({
    Name = "Auto Server Hop 🔄",
    CurrentValue = false,
    Flag = "FruitAutoHop",
    Callback = function(Value)
        FruitConfig.AutoServerHop = Value
    end,
})

FruitTab:CreateToggle({
    Name = "Only Good Fruits 💎",
    CurrentValue = true,
    Flag = "FruitOnlyGood",
    Callback = function(Value)
        FruitConfig.OnlyGoodFruits = Value
    end,
})

FruitTab:CreateButton({
    Name = "🔄 Refresh Log",
    Callback = function()
        LoadFruitLog()
        print("Log refreshed")
    end,
})

FruitTab:CreateButton({
    Name = "🗑️ Clear Log",
    Callback = function()
        FruitConfig.FruitLog = {}
        SaveFruitLog()
        print("Log cleared")
    end,
})

-- ============ PLAYER TAB ============
PlayerTab:CreateSection("👤 Player")

PlayerTab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 350},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "WalkSpeed",
    Callback = function(Value)
        if Humanoid then
            Humanoid.WalkSpeed = Value
        end
    end,
})

PlayerTab:CreateToggle({
    Name = "Infinite Jump 🦘",
    CurrentValue = false,
    Flag = "InfiniteJump",
    Callback = function(Value)
        _G.InfiniteJump = Value
        if Value then
            task.spawn(function()
                while _G.InfiniteJump do
                    if Humanoid then
                        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                    task.wait(0.55)
                end
            end)
        end
    end,
})

PlayerTab:CreateToggle({
    Name = "Walk on Water 🌊",
    CurrentValue = false,
    Flag = "WalkWater",
    Callback = function(Value)
        _G.WalkWater = Value
        waterWalk.CanCollide = Value
    end,
})

PlayerTab:CreateToggle({
    Name = "Auto Stats 📊",
    CurrentValue = false,
    Flag = "AutoStats",
    Callback = function(Value)
        _G.AutoStats = Value
        if Value then
            task.spawn(function()
                while _G.AutoStats do
                    pcall(function()
                        Remotes.CommF_:InvokeServer("AddPoint", _G.SelectStat or "Melee", _G.StatAmount or 1)
                    end)
                    task.wait(0.1)
                end
            end)
        end
    end,
})

local statOptions = {"Melee", "Defense", "Sword", "Gun", "Demon Fruit"}
local statIndex = 1
PlayerTab:CreateButton({
    Name = "Stat: Melee",
    Callback = function(Button)
        statIndex = (statIndex % #statOptions) + 1
        _G.SelectStat = statOptions[statIndex]
        Button.Text = "Stat: " .. _G.SelectStat
    end,
})

PlayerTab:CreateSlider({
    Name = "Stat Amount",
    Range = {1, 10},
    Increment = 1,
    Suffix = "Points",
    CurrentValue = 1,
    Flag = "StatAmount",
    Callback = function(Value)
        _G.StatAmount = Value
    end,
})

-- ============ VISUAL TAB ============
VisualTab:CreateSection("👁️ ESP")

VisualTab:CreateToggle({
    Name = "ESP Enabled",
    CurrentValue = false,
    Flag = "ESP",
    Callback = function(Value)
        _G.ESP = Value
        print(Value and "ESP ON" or "ESP OFF")
    end,
})

VisualTab:CreateToggle({
    Name = "Mirage Island ESP 🏝️",
    CurrentValue = false,
    Flag = "MirageIslandESP",
    Callback = function(Value)
        _G.MirageIslandESP = Value
    end,
})

VisualTab:CreateToggle({
    Name = "Chest ESP 📦",
    CurrentValue = false,
    Flag = "ChestESP",
    Callback = function(Value)
        _G.ChestESP = Value
    end,
})

VisualTab:CreateToggle({
    Name = "Fruit ESP 🍎",
    CurrentValue = false,
    Flag = "FruitESP",
    Callback = function(Value)
        _G.FruitESP = Value
    end,
})

VisualTab:CreateToggle({
    Name = "Player Chams 👤",
    CurrentValue = false,
    Flag = "PlayerChams",
    Callback = function(Value)
        _G.PlayerChams = Value
    end,
})

-- ============ TELEPORT TAB ============
TeleportTab:CreateSection("🚀 Teleport")

TeleportTab:CreateButton({
    Name = "First Sea 🌊",
    Callback = function()
        if World1 then print("Already in First Sea") return end
    end,
})

TeleportTab:CreateButton({
    Name = "Second Sea 🌊",
    Callback = function()
        if World2 then print("Already in Second Sea") return end
    end,
})

TeleportTab:CreateButton({
    Name = "Third Sea 🌊",
    Callback = function()
        if World3 then print("Already in Third Sea") return end
    end,
})

TeleportTab:CreateToggle({
    Name = "Tween To Island 🏝️",
    CurrentValue = false,
    Flag = "Tween",
    Callback = function(Value)
        _G.Tween = Value
    end,
})

-- ============ SHOP TAB ============
ShopTab:CreateSection("🛒 Abilities")

ShopTab:CreateButton({
    Name = "Buy Geppo $10,000",
    Callback = function()
        pcall(function() Remotes.CommF_:InvokeServer("BuyGeppo") end)
    end,
})

ShopTab:CreateButton({
    Name = "Buy Buso Haki $25,000",
    Callback = function()
        pcall(function() Remotes.CommF_:InvokeServer("BuyBuso") end)
    end,
})

ShopTab:CreateButton({
    Name = "Buy Soru $25,000",
    Callback = function()
        pcall(function() Remotes.CommF_:InvokeServer("BuySoru") end)
    end,
})

ShopTab:CreateButton({
    Name = "Buy Observation Haki $750,000",
    Callback = function()
        pcall(function() Remotes.CommF_:InvokeServer("BuyObservation") end)
    end,
})

ShopTab:CreateSection("🛒 Fighting Styles")

local fightingStyles = {
    {"Black Leg", "$150,000"},
    {"Electro", "$550,000"},
    {"Water Kung Fu", "$750,000"},
    {"Dragon Claw", "1,500F"},
    {"Superhuman", "$3,000,000"},
    {"Death Step", "$5,000,000 + 5,000F"},
    {"Sharkman Karate", "$2,500,000 + 5,000F"},
    {"Electric Claw", "$3,000,000 + 5,000F"},
    {"Dragon Talon", "$3,000,000 + 5,000F"},
    {"God Human", "$5,000,000 + 5,000F"},
    {"Sanguine Art", "$5,000,000 + 5,000F"}
}

for _, style in ipairs(fightingStyles) do
    ShopTab:CreateButton({
        Name = "Buy " .. style[1] .. " " .. style[2],
        Callback = function()
            pcall(function()
                Remotes.CommF_:InvokeServer("Buy" .. style[1]:gsub(" ", ""))
            end)
        end,
    })
end

ShopTab:CreateSection("🛒 Swords")

local swords = {
    {"Cutlass", "$1,000"},
    {"Katana", "$1,000"},
    {"Iron Mace", "$25,000"},
    {"Dual Katana", "$12,000"},
    {"Triple Katana", "$60,000"}
}

for _, sword in ipairs(swords) do
    ShopTab:CreateButton({
        Name = "Buy " .. sword[1] .. " " .. sword[2],
        Callback = function()
            pcall(function()
                Remotes.CommF_:InvokeServer("Buy" .. sword[1]:gsub(" ", ""))
            end)
        end,
    })
end

ShopTab:CreateSection("🛒 Boats")

ShopTab:CreateDropdown({
    Name = "Select Boat",
    Options = {"Pirate Sloop", "Enforcer", "Rocket Boost", "Dinghy", "Pirate Basic", "Pirate Brigade"},
    CurrentOption = "Pirate Sloop",
    Flag = "SelectBoat",
    Callback = function(Option)
        _G.SelectBoat = Option
    end,
})

ShopTab:CreateButton({
    Name = "Buy Boat 🚤",
    Callback = function()
        pcall(function()
            Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectBoat)
        end)
    end,
})

-- ============ MISC TAB ============
MiscTab:CreateSection("🎮 Misc")

MiscTab:CreateToggle({
    Name = "Anti AFK 💤",
    CurrentValue = false,
    Flag = "AntiAFK",
    Callback = function(Value)
        _G.AntiAFK = Value
        if Value then
            LP.Idled:Connect(function()
                VirtualUser:ClickButton2(Vector2.new(0,0))
            end)
        end
    end,
})

MiscTab:CreateButton({
    Name = "Redeem All Codes 💰",
    Callback = function()
        task.spawn(function()
            local raw = game:HttpGet("https://pastebin.com/raw/cLp2LXrs")
            for code in string.gmatch(raw, "[^\r\n]+") do
                pcall(function()
                    Remotes.Redeem:InvokeServer(code)
                    print("Redeemed: " .. code)
                end)
                task.wait(0.5)
            end
        end)
    end,
})

MiscTab:CreateButton({
    Name = "Server Hop 🔄",
    Callback = function()
        local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
        local filtered = {}
        for _, server in ipairs(servers.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                table.insert(filtered, server)
            end
        end
        if #filtered > 0 then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, filtered[math.random(#filtered)].id)
        end
    end,
})

MiscTab:CreateButton({
    Name = "Rejoin 🔄",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, LP)
    end,
})

MiscTab:CreateButton({
    Name = "Respawn 💀",
    Callback = function()
        pcall(function() Remotes.CommF_:InvokeServer("Respawn") end)
    end,
})

MiscTab:CreateButton({
    Name = "Fast Mode ⚡",
    Callback = function()
        local Lighting = game:GetService("Lighting")
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                obj.Material = Enum.Material.SmoothPlastic
                obj.Reflectance = 0
                obj.CastShadow = false
            elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
                obj.Enabled = false
            end
        end
        print("Fast mode enabled")
    end,
})

-- ============ HEARTBEAT LOOP ============
RunService.Heartbeat:Connect(function()
    pcall(function()
        -- Auto Haki
        if _G.AutoHaki then
            AutoHaki()
        end
        
        -- Auto Farm
        if _G.AutoFarm then
            attachFloat()
            local questInfo = getQuest()
            if questInfo and questInfo.enemy then
                local target
                local Enemies = workspace:FindFirstChild("Enemies")
                if Enemies then
                    for _, enemy in pairs(Enemies:GetChildren()) do
                        local humanoid = enemy:FindFirstChildOfClass("Humanoid")
                        if enemy.Name == questInfo.enemy and humanoid and humanoid.Health > 0 then
                            target = enemy
                            break
                        end
                    end
                end
                
                if target and target:FindFirstChild("HumanoidRootPart") then
                    local targetPos = target.HumanoidRootPart.Position
                    local distance = (HRP.Position - targetPos).Magnitude
                    
                    if distance > 15 then
                        moveTo(targetPos + Vector3.new(0, 10, 0))
                    else
                        local orbitPos = targetPos + Vector3.new(
                            math.sin(tick() * 0.5) * 10,
                            10,
                            math.cos(tick() * 0.5) * 10
                        )
                        HRP.CFrame = CFrame.new(HRP.Position:Lerp(orbitPos, 0.2))
                        if target:FindFirstChild("HumanoidRootPart") then
                            target.HumanoidRootPart.Anchored = true
                        end
                    end
                end
            end
        end
        
        -- Fruit Finder
        if FruitConfig.AutoFruit then
            FindFruits()
        end
    end)
end)

-- ============ CHARACTER ADDED ============
LP.CharacterAdded:Connect(function(char)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
    HRP = char:WaitForChild("HumanoidRootPart")
    
    local highlight = Instance.new("Highlight")
    highlight.Parent = char
    highlight.FillColor = Color3.fromRGB(175, 102, 126)
    highlight.DepthMode = Enum.HighlightDepthMode.Occluded
    
    if _G.AutoHaki and not char:FindFirstChild("HasBuso") then
        pcall(function() Remotes.CommF_:InvokeServer("Buso") end)
    end
end)

-- ============ LOAD FRUIT LOG ============
LoadFruitLog()

-- ============ PRINT ============
print("████████████████████████████████████████████████████████████")
print("🚀 ELITE HUB LOADED - FUCK YEAH 🥀")
print("🌊 Current Sea: " .. CurrentSea)
print("🔥 Features: Auto Farm, NPC Farm, Fruit Finder, ESP, Shop")
print("💀 Made by marcus - Don't steal this shit")
print("📱 Discord: discord.gg/5RuMCxK3u6")
print("████████████████████████████████████████████████████████████")