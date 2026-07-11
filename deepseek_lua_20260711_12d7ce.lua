-- // ========== ELITE HUB v1.0.0 ==========
-- // ANIMAL HOSPITAL SCRIPT
-- // Made by marcus
-- // LOGO: rbxassetid://121150781595166
-- // JOIN DISCORD: discord.gg/5RuMCxK3u6
-- // FUCK YOU IF YOU STEAL THIS SHIT 🥀

-- // ========== SERVICES ==========
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local CoreGui = game:GetService("CoreGui")
local VirtualUser = game:GetService("VirtualUser")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

-- // ========== LOAD RAYFIELD ==========
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
task.wait(1)

local Window = Rayfield:CreateWindow({
    Name = "ELITE HUB | ANIMAL HOSPITAL 🥀",
    Icon = 121150781595166,
    LoadingTitle = "ELITE HUB",
    LoadingSubtitle = "by marcus",
    Theme = "Dark",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "EliteHubAnimalHospital",
        FileName = "Settings"
    },
    Keybind = {
        Enabled = true,
        Key = Enum.KeyCode.RightShift,
        HoldToInteract = false
    }
})

local HomeTab = Window:CreateTab("HOME (FUCK SHIT UP)")
local FarmTab = Window:CreateTab("AUTO FARM (GRIND BITCH)")
local MiscTab = Window:CreateTab("MISC (EXTRA SHIT)")
local ServerTab = Window:CreateTab("SERVER (HOP BITCH)")
local SettingsTab = Window:CreateTab("SETTINGS (CONFIGURE BITCH)")

-- // ========== VARIABLES ==========
local Net = ReplicatedStorage:FindFirstChild("Util") and ReplicatedStorage.Util:FindFirstChild("Net")

local genv = getgenv()
genv.AutoFarm = false
genv.AutoSanity = false
genv.AutoCamera = false
genv.AnomalyESP = false
genv.SkinwalkerESP = false
genv.PatientESP = false
genv.PlayerESP = false
genv.SkipDlg = false
genv.Room = 1
genv.Class = 'Nurse'
genv.Priority = 'Treatment'
genv.AutoVisitor = false
genv.AutoTreatment = false
genv.AutoCreateLobby = false
genv.SkipDialogDoctor = false
genv.RoomToCreate = 1
genv.RoomToJoin = 1
genv.MinPlayersToStart = 2
genv.AutoBuyClass = false
genv.AutoEquipClass = false
genv.InstantInteract = false
genv.NoClip = false
genv.Speed = 16
genv.InfiniteJump = false

local autoFarmLoop = nil
local autoSanityLoop = nil
local autoCameraLoop = nil
local espLoop = nil
local espObjects = {}
local noClipConnection = nil
local speedConnection = nil
local infiniteJumpConnection = nil

-- // ========== FUNCTIONS ==========
local function getPlayerData()
    local sanityGui = LocalPlayer.PlayerGui:FindFirstChild("Sanity")
    if sanityGui then
        local frame = sanityGui:FindFirstChild("Frame")
        if frame then
            local cash = frame:FindFirstChild("cash")
            local class = frame:FindFirstChild("class")
            return {
                cash = cash and cash.Text or "---",
                class = class and class.Text or "---"
            }
        end
    end
    return {cash = "---", class = "---"}
end

local function getCatCoins()
    local menu = LocalPlayer.PlayerGui:FindFirstChild("Menu")
    if menu then
        local frame = menu:FindFirstChild("Frame")
        if frame then
            local cash = frame:FindFirstChild("cash")
            return cash and cash.Text or "---"
        end
    end
    return "---"
end

local function getRoomPlayerCount(roomNum)
    local rooms = Workspace:FindFirstChild("Rooms")
    if rooms then
        local room = rooms:FindFirstChild("Room" .. roomNum)
        if room then
            local sign = room:FindFirstChild("Sign")
            if sign then
                local playerCount = sign:FindFirstChild("PlayerCount")
                if playerCount then
                    local ui = playerCount:FindFirstChild("UI")
                    if ui then
                        local label = ui:FindFirstChild("Label")
                        if label then
                            local match = label.Text:match("(%d+)")
                            return tonumber(match) or 0
                        end
                    end
                end
            end
        end
    end
    return 0
end

local function getClosestAnimal()
    local closest = nil
    local shortest = math.huge
    local char = LocalPlayer.Character
    if not char then return nil end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return nil end
    
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Model") then
            local name = v.Name:lower()
            if name:find("animal") or name:find("patient") or name:find("dog") or name:find("cat") then
                local hrp = v:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local dist = (hrp.Position - root.Position).Magnitude
                    if dist < shortest and dist < 50 then
                        shortest = dist
                        closest = v
                    end
                end
            end
        end
    end
    return closest
end

local function interactWithObject(obj)
    if not obj then return false end
    local clickDetector = obj:FindFirstChildOfClass("ClickDetector")
    if clickDetector then
        pcall(function()
            clickDetector:Click()
        end)
        return true
    end
    local proximity = obj:FindFirstChildOfClass("ProximityPrompt")
    if proximity then
        pcall(function()
            proximity:Hold()
            task.wait(0.3)
            proximity:Release()
        end)
        return true
    end
    return false
end

local function findItemOnShelves(itemName)
    for _, shelf in pairs(Workspace:GetDescendants()) do
        if shelf:IsA("Model") and shelf.Name:lower():find("shelf") then
            for _, item in pairs(shelf:GetDescendants()) do
                if item:IsA("Model") and item.Name:lower():find(itemName:lower()) then
                    return item
                end
            end
        end
    end
    return nil
end

-- // ========== AUTO FARM ==========
local function startAutoFarm()
    if autoFarmLoop then return end
    genv.AutoFarm = true
    
    autoFarmLoop = RunService.Heartbeat:Connect(function()
        if not genv.AutoFarm then return end
        
        local animal = getClosestAnimal()
        if animal then
            interactWithObject(animal)
        end
        
        if genv.AutoVisitor then
            -- // Find visitor desk
            for _, v in pairs(Workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Name:lower():find("visitor") then
                    interactWithObject(v)
                    break
                end
            end
        end
        
        if genv.AutoTreatment then
            -- // Find treatment station
            for _, v in pairs(Workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Name:lower():find("treatment") then
                    interactWithObject(v)
                    break
                end
            end
        end
        
        task.wait(0.5)
    end)
    
    StarterGui:SetCore("SendNotification", {
        Title = "🌾 ELITE HUB",
        Text = "Auto Farm STARTED! 🥀",
        Duration = 2
    })
end

local function stopAutoFarm()
    genv.AutoFarm = false
    if autoFarmLoop then
        autoFarmLoop:Disconnect()
        autoFarmLoop = nil
    end
    StarterGui:SetCore("SendNotification", {
        Title = "🌾 ELITE HUB",
        Text = "Auto Farm STOPPED",
        Duration = 2
    })
end

-- // ========== AUTO SANITY ==========
local function startAutoSanity()
    if autoSanityLoop then return end
    genv.AutoSanity = true
    
    autoSanityLoop = RunService.Heartbeat:Connect(function()
        if not genv.AutoSanity then return end
        -- // Find sanity restore object
        for _, v in pairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") and v.Name:lower():find("sanity") or v.Name:lower():find("restore") then
                interactWithObject(v)
                break
            end
        end
        task.wait(2)
    end)
    
    StarterGui:SetCore("SendNotification", {
        Title = "🧠 ELITE HUB",
        Text = "Auto Sanity STARTED! 🥀",
        Duration = 2
    })
end

local function stopAutoSanity()
    genv.AutoSanity = false
    if autoSanityLoop then
        autoSanityLoop:Disconnect()
        autoSanityLoop = nil
    end
    StarterGui:SetCore("SendNotification", {
        Title = "🧠 ELITE HUB",
        Text = "Auto Sanity STOPPED",
        Duration = 2
    })
end

-- // ========== ESP ==========
local function clearESP()
    for _, obj in pairs(espObjects) do
        pcall(function()
            obj:Destroy()
        end
    end
    espObjects = {}
end

local function updateESP()
    clearESP()
    if not (genv.AnomalyESP or genv.SkinwalkerESP or genv.PatientESP or genv.PlayerESP) then return end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            if genv.PlayerESP then
                local highlight = Instance.new("Highlight", player.Character)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0.5
                highlight.FillColor = Color3.fromRGB(120, 180, 255)
                table.insert(espObjects, highlight)
            end
        end
    end
    
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Model") then
            local name = v.Name:lower()
            if genv.AnomalyESP and name:find("anomaly") then
                local highlight = Instance.new("Highlight", v)
                highlight.FillTransparency = 0.5
                highlight.FillColor = Color3.fromRGB(255, 165, 0)
                table.insert(espObjects, highlight)
            elseif genv.SkinwalkerESP and name:find("skinwalker") then
                local highlight = Instance.new("Highlight", v)
                highlight.FillTransparency = 0.5
                highlight.FillColor = Color3.fromRGB(255, 40, 40)
                table.insert(espObjects, highlight)
            elseif genv.PatientESP and name:find("patient") then
                local highlight = Instance.new("Highlight", v)
                highlight.FillTransparency = 0.5
                highlight.FillColor = Color3.fromRGB(0, 230, 100)
                table.insert(espObjects, highlight)
            end
        end
    end
end

local function toggleESP(type)
    if type == "Anomaly" then genv.AnomalyESP = not genv.AnomalyESP end
    if type == "Skinwalker" then genv.SkinwalkerESP = not genv.SkinwalkerESP end
    if type == "Patient" then genv.PatientESP = not genv.PatientESP end
    if type == "Player" then genv.PlayerESP = not genv.PlayerESP end
    
    if genv.AnomalyESP or genv.SkinwalkerESP or genv.PatientESP or genv.PlayerESP then
        if not espLoop then
            espLoop = RunService.RenderStepped:Connect(updateESP)
        end
    else
        if espLoop then
            espLoop:Disconnect()
            espLoop = nil
        end
        clearESP()
    end
end

-- // ========== NOCLIP ==========
local function toggleNoClip()
    genv.NoClip = not genv.NoClip
    if genv.NoClip then
        noClipConnection = RunService.Stepped:Connect(function()
            if not genv.NoClip then return end
            if LocalPlayer.Character then
                for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
        StarterGui:SetCore("SendNotification", {
            Title = "🚪 ELITE HUB",
            Text = "Noclip ENABLED 🥀",
            Duration = 2
        })
    else
        if noClipConnection then
            noClipConnection:Disconnect()
            noClipConnection = nil
        end
        StarterGui:SetCore("SendNotification", {
            Title = "🚪 ELITE HUB",
            Text = "Noclip DISABLED",
            Duration = 2
        })
    end
end

-- // ========== SPEED ==========
local function updateSpeed()
    if LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = genv.Speed
        end
    end
end

local function toggleSpeed()
    if speedConnection then
        speedConnection:Disconnect()
        speedConnection = nil
    end
    speedConnection = RunService.RenderStepped:Connect(updateSpeed)
    StarterGui:SetCore("SendNotification", {
        Title = "💨 ELITE HUB",
        Text = "Speed set to " .. genv.Speed,
        Duration = 2
    })
end

-- // ========== INFINITE JUMP ==========
local function toggleInfiniteJump()
    genv.InfiniteJump = not genv.InfiniteJump
    if genv.InfiniteJump then
        infiniteJumpConnection = UserInputService.JumpRequest:Connect(function()
            if genv.InfiniteJump and LocalPlayer.Character then
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum:ChangeState("Jumping") end
            end
        end)
        StarterGui:SetCore("SendNotification", {
            Title = "🦘 ELITE HUB",
            Text = "Infinite Jump ENABLED 🥀",
            Duration = 2
        })
    else
        if infiniteJumpConnection then
            infiniteJumpConnection:Disconnect()
            infiniteJumpConnection = nil
        end
        StarterGui:SetCore("SendNotification", {
            Title = "🦘 ELITE HUB",
            Text = "Infinite Jump DISABLED",
            Duration = 2
        })
    end
end

-- // ========== HOME TAB ==========
HomeTab:CreateSection("🏥 GAME INFORMATION")

HomeTab:CreateParagraph({
    Title = "GAME TIME",
    Content = "0h 0m 0s"
})

HomeTab:CreateParagraph({
    Title = "FPS",
    Content = "0"
})

HomeTab:CreateParagraph({
    Title = "PING",
    Content = "0ms"
})

HomeTab:CreateDivider()

HomeTab:CreateParagraph({
    Title = "💰 CASH",
    Content = "---"
})

HomeTab:CreateParagraph({
    Title = "🐱 CAT COIN",
    Content = "---"
})

HomeTab:CreateParagraph({
    Title = "👤 CLASS",
    Content = "---"
})

HomeTab:CreateButton({
    Name = "🔄 REFRESH INFO",
    Callback = function()
        local data = getPlayerData()
        local catCoins = getCatCoins()
        local homeTabChildren = HomeTab:GetChildren()
        for _, v in pairs(homeTabChildren) do
            if v:IsA("Frame") then
                for _, child in pairs(v:GetDescendants()) do
                    if child:IsA("TextLabel") and child.Text:find("CASH") then
                        local parent = child.Parent
                        for _, c in pairs(parent:GetDescendants()) do
                            if c:IsA("TextLabel") and c ~= child and c.Text:match("^%d+$") or c.Text:match("^---$") then
                                c.Text = data.cash
                            end
                        end
                    elseif child:IsA("TextLabel") and child.Text:find("CAT COIN") then
                        local parent = child.Parent
                        for _, c in pairs(parent:GetDescendants()) do
                            if c:IsA("TextLabel") and c ~= child and c.Text:match("^%d+$") or c.Text:match("^---$") then
                                c.Text = catCoins
                            end
                        end
                    elseif child:IsA("TextLabel") and child.Text:find("CLASS") then
                        local parent = child.Parent
                        for _, c in pairs(parent:GetDescendants()) do
                            if c:IsA("TextLabel") and c ~= child and c.Text:match("^%a+$") or c.Text:match("^---$") then
                                c.Text = data.class
                            end
                        end
                    end
                end
            end
        end
        StarterGui:SetCore("SendNotification", {
            Title = "🔄 ELITE HUB",
            Text = "Info refreshed!",
            Duration = 2
        })
    end
})

HomeTab:CreateSection("🔗 SOCIAL LINKS")

HomeTab:CreateButton({
    Name = "📋 COPY DISCORD LINK",
    Callback = function()
        setclipboard("https://discord.gg/5RuMCxK3u6")
        StarterGui:SetCore("SendNotification", {
            Title = "📋 ELITE HUB",
            Text = "Discord link copied!",
            Duration = 2
        })
    end
})

HomeTab:CreateButton({
    Name = "📋 COPY TIKTOK LINK",
    Callback = function()
        setclipboard("https://www.tiktok.com/@komtolmmek2script")
        StarterGui:SetCore("SendNotification", {
            Title = "📋 ELITE HUB",
            Text = "TikTok link copied!",
            Duration = 2
        })
    end
})

HomeTab:CreateButton({
    Name = "💲 COPY DONATE LINK",
    Callback = function()
        setclipboard("https://sociabuzz.com/cyraaaja/tribe")
        StarterGui:SetCore("SendNotification", {
            Title = "💲 ELITE HUB",
            Text = "Donate link copied!",
            Duration = 2
        })
    end
})

-- // ========== FARM TAB ==========
FarmTab:CreateSection("🌾 AUTO FARM")

FarmTab:CreateToggle({
    Name = "AUTO FARM",
    CurrentValue = false,
    Callback = function(v)
        if v then startAutoFarm() else stopAutoFarm() end
    end
})

FarmTab:CreateToggle({
    Name = "AUTO SANITY (100%)",
    CurrentValue = false,
    Callback = function(v)
        if v then startAutoSanity() else stopAutoSanity() end
    end
})

FarmTab:CreateToggle({
    Name = "AUTO VISITOR ONLY",
    CurrentValue = false,
    Callback = function(v)
        genv.AutoVisitor = v
    end
})

FarmTab:CreateToggle({
    Name = "AUTO TREATMENT ONLY",
    CurrentValue = false,
    Callback = function(v)
        genv.AutoTreatment = v
    end
})

FarmTab:CreateSection("⚙️ FARM SETTINGS")

FarmTab:CreateDropdown({
    Name = "PRIORITY MODE",
    Options = {"Treatment", "Visitor"},
    CurrentOption = "Treatment",
    Callback = function(v)
        genv.Priority = v
    end
})

FarmTab:CreateDropdown({
    Name = "SELECT CLASS",
    Options = {"Intern", "Nurse", "Secretary", "Paramedic", "Psychologist", "Doctor", "Security", "Head Nurse", "Surgeon", "Secret Agent"},
    CurrentOption = "Nurse",
    Callback = function(v)
        genv.Class = v
    end
})

FarmTab:CreateToggle({
    Name = "AUTO BUY SELECTED CLASS",
    CurrentValue = false,
    Callback = function(v)
        genv.AutoBuyClass = v
    end
})

FarmTab:CreateToggle({
    Name = "AUTO EQUIP SELECTED CLASS",
    CurrentValue = false,
    Callback = function(v)
        genv.AutoEquipClass = v
    end
})

FarmTab:CreateButton({
    Name = "🛒 BUY & EQUIP CLASS NOW",
    Callback = function()
        local class = genv.Class
        if Net then
            pcall(function()
                Net["RE/BuyClass"]:FireServer(class)
                task.wait(0.5)
                Net["RE/EquipClass"]:FireServer(class)
                StarterGui:SetCore("SendNotification", {
                    Title = "🛒 ELITE HUB",
                    Text = "Bought and equipped: " .. class,
                    Duration = 2
                })
            end)
        end
    end
})

FarmTab:CreateSection("🏠 LOBBY MANAGEMENT")

FarmTab:CreateToggle({
    Name = "AUTO CREATE LOBBY",
    CurrentValue = false,
    Callback = function(v)
        genv.AutoCreateLobby = v
    end
})

FarmTab:CreateDropdown({
    Name = "ROOM TO CREATE",
    Options = {"1", "2", "3"},
    CurrentOption = "1",
    Callback = function(v)
        genv.RoomToCreate = tonumber(v)
    end
})

FarmTab:CreateDropdown({
    Name = "ROOM TO JOIN",
    Options = {"1", "2", "3"},
    CurrentOption = "1",
    Callback = function(v)
        genv.RoomToJoin = tonumber(v)
    end
})

FarmTab:CreateSlider({
    Name = "MIN PLAYERS TO START",
    Range = {1, 4},
    Increment = 1,
    Suffix = "Players",
    CurrentValue = 2,
    Callback = function(v)
        genv.MinPlayersToStart = v
    end
})

FarmTab:CreateButton({
    Name = "🚪 JOIN SELECTED ROOM",
    Callback = function()
        local roomNum = genv.RoomToJoin
        local rooms = Workspace:FindFirstChild("Rooms")
        if rooms then
            local room = rooms:FindFirstChild("Room" .. roomNum)
            if room then
                local sign = room:FindFirstChild("Sign")
                if sign then
                    interactWithObject(sign)
                end
            end
        end
    end
})

FarmTab:CreateSection("📊 ROOM PLAYER COUNTS")

FarmTab:CreateParagraph({
    Title = "ROOM 1",
    Content = "0 players"
})

FarmTab:CreateParagraph({
    Title = "ROOM 2",
    Content = "0 players"
})

FarmTab:CreateParagraph({
    Title = "ROOM 3",
    Content = "0 players"
})

FarmTab:CreateButton({
    Name = "🔄 REFRESH ROOM COUNTS",
    Callback = function()
        local farmTabChildren = FarmTab:GetChildren()
        for _, v in pairs(farmTabChildren) do
            if v:IsA("Frame") then
                for _, child in pairs(v:GetDescendants()) do
                    if child:IsA("TextLabel") and child.Text:find("ROOM 1") then
                        local parent = child.Parent
                        for _, c in pairs(parent:GetDescendants()) do
                            if c:IsA("TextLabel") and c ~= child and c.Text:match("^%d+ players$") then
                                c.Text = getRoomPlayerCount(1) .. " players"
                            end
                        end
                    elseif child:IsA("TextLabel") and child.Text:find("ROOM 2") then
                        local parent = child.Parent
                        for _, c in pairs(parent:GetDescendants()) do
                            if c:IsA("TextLabel") and c ~= child and c.Text:match("^%d+ players$") then
                                c.Text = getRoomPlayerCount(2) .. " players"
                            end
                        end
                    elseif child:IsA("TextLabel") and child.Text:find("ROOM 3") then
                        local parent = child.Parent
                        for _, c in pairs(parent:GetDescendants()) do
                            if c:IsA("TextLabel") and c ~= child and c.Text:match("^%d+ players$") then
                                c.Text = getRoomPlayerCount(3) .. " players"
                            end
                        end
                    end
                end
            end
        end
        StarterGui:SetCore("SendNotification", {
            Title = "🔄 ELITE HUB",
            Text = "Room counts refreshed!",
            Duration = 2
        })
    end
})

-- // ========== MISC TAB ==========
MiscTab:CreateSection("🛠️ TOOLS")

MiscTab:CreateButton({
    Name = "🔧 FIX CAMERA",
    Callback = function()
        local misc = Workspace:FindFirstChild("Misc")
        if misc then
            local cameras = misc:FindFirstChild("Cameras")
            if cameras then
                local checkIn = cameras:FindFirstChild("Check-In")
                if checkIn then
                    local camera = checkIn:FindFirstChild("camera")
                    if camera then
                        local pp = camera:FindFirstChild("PP")
                        if pp then
                            pp.CFrame = CFrame.new(-153, 3, -59)
                            StarterGui:SetCore("SendNotification", {
                                Title = "🔧 ELITE HUB",
                                Text = "Camera fixed!",
                                Duration = 2
                            })
                        end
                    end
                end
            end
        end
    end
})

MiscTab:CreateToggle({
    Name = "AUTO CAMERA FIX",
    CurrentValue = false,
    Callback = function(v)
        genv.AutoCamera = v
    end
})

MiscTab:CreateButton({
    Name = "📸 TRIGGER SHUTTER",
    Callback = function()
        local misc = Workspace:FindFirstChild("Misc")
        if misc then
            local shutter = misc:FindFirstChild("ShutterButton")
            if shutter then
                local pp = shutter:FindFirstChild("PP")
                if pp then
                    pp.CFrame = CFrame.new(-104, 3, 2)
                    StarterGui:SetCore("SendNotification", {
                        Title = "📸 ELITE HUB",
                        Text = "Shutter triggered!",
                        Duration = 2
                    })
                end
            end
        end
    end
})

MiscTab:CreateSection("👁️ ESP")

MiscTab:CreateToggle({
    Name = "ANOMALY ESP",
    CurrentValue = false,
    Callback = function(v)
        toggleESP("Anomaly")
    end
})

MiscTab:CreateToggle({
    Name = "SKINWALKER ESP",
    CurrentValue = false,
    Callback = function(v)
        toggleESP("Skinwalker")
    end
})

MiscTab:CreateToggle({
    Name = "PATIENT ESP",
    CurrentValue = false,
    Callback = function(v)
        toggleESP("Patient")
    end
})

MiscTab:CreateToggle({
    Name = "PLAYER ESP",
    CurrentValue = false,
    Callback = function(v)
        toggleESP("Player")
    end
})

MiscTab:CreateSection("🎮 PLAYER")

MiscTab:CreateToggle({
    Name = "NOCLIP",
    CurrentValue = false,
    Callback = function(v)
        if v then
            if not genv.NoClip then toggleNoClip() end
        else
            if genv.NoClip then toggleNoClip() end
        end
    end
})

MiscTab:CreateSlider({
    Name = "SPEED",
    Range = {16, 100},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Callback = function(v)
        genv.Speed = v
        updateSpeed()
    end
})

MiscTab:CreateToggle({
    Name = "INFINITE JUMP",
    CurrentValue = false,
    Callback = function(v)
        if v then
            if not genv.InfiniteJump then toggleInfiniteJump() end
        else
            if genv.InfiniteJump then toggleInfiniteJump() end
        end
    end
})

MiscTab:CreateSection("📦 ITEM PICKUP")

MiscTab:CreateDropdown({
    Name = "ITEM TO TAKE",
    Options = {"Eye Drops", "IV Drops", "Medkit", "Thermo", "Bandages", "Ointment", "Maple Syrup", "Cough Syrup", "Medicine", "Herbs"},
    CurrentOption = "Eye Drops",
    Callback = function(v)
        genv.ItemToTake = v
    end
})

MiscTab:CreateButton({
    Name = "📦 TAKE ITEM",
    Callback = function()
        local item = findItemOnShelves(genv.ItemToTake)
        if item then
            interactWithObject(item)
            StarterGui:SetCore("SendNotification", {
                Title = "📦 ELITE HUB",
                Text = "Took " .. genv.ItemToTake,
                Duration = 2
            })
        else
            StarterGui:SetCore("SendNotification", {
                Title = "❌ ELITE HUB",
                Text = "Item not found!",
                Duration = 2
            })
        end
    end
})

MiscTab:CreateDropdown({
    Name = "TELEPORT TO SHELF",
    Options = {"Blue Shelf", "Red Shelf", "White Shelf", "Yellow Shelf", "Green Shelf"},
    CurrentOption = "Blue Shelf",
    Callback = function(v)
        genv.ShelfToTeleport = v
    end
})

MiscTab:CreateButton({
    Name = "🚀 TELEPORT TO SHELF",
    Callback = function()
        for _, shelf in pairs(Workspace:GetDescendants()) do
            if shelf:IsA("Model") and shelf.Name:lower():find(genv.ShelfToTeleport:lower()) then
                local hrp = shelf:FindFirstChild("HumanoidRootPart")
                if hrp then
                    LocalPlayer.Character:MoveTo(hrp.Position + Vector3.new(0, 3, 0))
                    StarterGui:SetCore("SendNotification", {
                        Title = "🚀 ELITE HUB",
                        Text = "Teleported to " .. genv.ShelfToTeleport,
                        Duration = 2
                    })
                    return
                end
            end
        end
        StarterGui:SetCore("SendNotification", {
            Title = "❌ ELITE HUB",
            Text = "Shelf not found!",
            Duration = 2
        })
    end
})

-- // ========== SERVER TAB ==========
ServerTab:CreateSection("🌐 SERVER INFORMATION")

ServerTab:CreateParagraph({
    Title = "SERVER ID",
    Content = game.JobId
})

ServerTab:CreateButton({
    Name = "📋 COPY SERVER ID",
    Callback = function()
        setclipboard(game.JobId)
        StarterGui:SetCore("SendNotification", {
            Title = "📋 ELITE HUB",
            Text = "Server ID copied!",
            Duration = 2
        })
    end
})

ServerTab:CreateSlider({
    Name = "HOP INTERVAL (MINUTES)",
    Range = {1, 30},
    Increment = 1,
    Suffix = "Minutes",
    CurrentValue = 5,
    Callback = function(v)
        genv.HopInterval = v
    end
})

ServerTab:CreateToggle({
    Name = "AUTO SERVER HOP",
    CurrentValue = false,
    Callback = function(v)
        genv.AutoHop = v
    end
})

ServerTab:CreateSection("🔄 SERVER ACTIONS")

ServerTab:CreateButton({
    Name = "🔄 REJOIN SERVER",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end
})

ServerTab:CreateButton({
    Name = "🎲 HOP TO RANDOM SERVER",
    Callback = function()
        local servers = {}
        local req = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true"))
        if req and req.data then
            for _, v in pairs(req.data) do
                if v.playing < v.maxPlayers and v.id ~= game.JobId then
                    table.insert(servers, v.id)
                end
            end
        end
        if #servers > 0 then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], LocalPlayer)
        end
    end
})

ServerTab:CreateButton({
    Name = "📉 HOP TO LEAST PLAYERS",
    Callback = function()
        local servers = {}
        local req = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true"))
        if req and req.data then
            for _, v in pairs(req.data) do
                if v.playing < v.maxPlayers and v.id ~= game.JobId then
                    table.insert(servers, {id = v.id, players = v.playing})
                end
            end
            table.sort(servers, function(a, b) return a.players < b.players end)
            if #servers > 0 then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[1].id, LocalPlayer)
            end
        end
    end
})

-- // ========== SETTINGS TAB ==========
SettingsTab:CreateSection("⚙️ ELITE HUB SETTINGS")

SettingsTab:CreateParagraph({
    Title = "VERSION",
    Content = "v1.0.0"
})

SettingsTab:CreateParagraph({
    Title = "MADE BY",
    Content = "marcus 🥀"
})

SettingsTab:CreateParagraph({
    Title = "LOGO ASSET",
    Content = "rbxassetid://121150781595166"
})

SettingsTab:CreateParagraph({
    Title = "JOIN DISCORD",
    Content = "discord.gg/5RuMCxK3u6"
})

SettingsTab:CreateButton({
    Name = "📋 COPY DISCORD LINK",
    Callback = function()
        setclipboard("https://discord.gg/5RuMCxK3u6")
        StarterGui:SetCore("SendNotification", {
            Title = "📋 ELITE HUB",
            Text = "Discord link copied bitch! 🥀",
            Duration = 2
        })
    end
})

SettingsTab:CreateButton({
    Name = "🔄 RESET ALL SETTINGS",
    Callback = function()
        if genv.AutoFarm then stopAutoFarm() end
        if genv.AutoSanity then stopAutoSanity() end
        if genv.NoClip then toggleNoClip() end
        if genv.InfiniteJump then toggleInfiniteJump() end
        if espLoop then espLoop:Disconnect(); espLoop = nil end
        clearESP()
        genv.AutoFarm = false
        genv.AutoSanity = false
        genv.AutoCamera = false
        genv.AnomalyESP = false
        genv.SkinwalkerESP = false
        genv.PatientESP = false
        genv.PlayerESP = false
        genv.AutoVisitor = false
        genv.AutoTreatment = false
        genv.AutoCreateLobby = false
        genv.AutoBuyClass = false
        genv.AutoEquipClass = false
        genv.InstantInteract = false
        genv.NoClip = false
        genv.Speed = 16
        genv.InfiniteJump = false
        if speedConnection then
            speedConnection:Disconnect()
            speedConnection = nil
        end
        StarterGui:SetCore("SendNotification", {
            Title = "🔄 ELITE HUB",
            Text = "All settings reset bitch! 🥀",
            Duration = 2
        })
    end
})

SettingsTab:CreateButton({
    Name = "🚀 REJOIN GAME",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end
})

SettingsTab:CreateButton({
    Name = "🗑️ UNLOAD SCRIPT",
    Callback = function()
        if genv.AutoFarm then stopAutoFarm() end
        if genv.AutoSanity then stopAutoSanity() end
        if genv.NoClip then toggleNoClip() end
        if genv.InfiniteJump then toggleInfiniteJump() end
        if espLoop then espLoop:Disconnect(); espLoop = nil end
        clearESP()
        if speedConnection then speedConnection:Disconnect(); speedConnection = nil end
        Window:Destroy()
        StarterGui:SetCore("SendNotification", {
            Title = "🗑️ ELITE HUB",
            Text = "Script unloaded. Goodbye bitch! 🥀",
            Duration = 3
        })
    end
})

-- // ========== KEYBINDS ==========
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.F then
        local farmToggle = FarmTab:FindFirstChild("AUTO FARM")
        if farmToggle then farmToggle:Toggle() end
    elseif input.KeyCode == Enum.KeyCode.G then
        local sanityToggle = FarmTab:FindFirstChild("AUTO SANITY (100%)")
        if sanityToggle then sanityToggle:Toggle() end
    elseif input.KeyCode == Enum.KeyCode.X then
        local noclipToggle = MiscTab:FindFirstChild("NOCLIP")
        if noclipToggle then noclipToggle:Toggle() end
    elseif input.KeyCode == Enum.KeyCode.J then
        local jumpToggle = MiscTab:FindFirstChild("INFINITE JUMP")
        if jumpToggle then jumpToggle:Toggle() end
    end
end)

-- // ========== UPDATES ==========
-- // Update game time
task.spawn(function()
    local startTime = tick()
    while true do
        task.wait(1)
        local elapsed = math.floor(tick() - startTime)
        local hours = math.floor(elapsed / 3600)
        local minutes = math.floor((elapsed % 3600) / 60)
        local seconds = elapsed % 60
        local timeStr = string.format("%dh %dm %ds", hours, minutes, seconds)
        
        local homeTabChildren = HomeTab:GetChildren()
        for _, v in pairs(homeTabChildren) do
            if v:IsA("Frame") then
                for _, child in pairs(v:GetDescendants()) do
                    if child:IsA("TextLabel") and child.Text:find("GAME TIME") then
                        local parent = child.Parent
                        for _, c in pairs(parent:GetDescendants()) do
                            if c:IsA("TextLabel") and c ~= child and c.Text:match("%d+h %d+m %d+s") then
                                c.Text = timeStr
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- // Update FPS and Ping
task.spawn(function()
    while true do
        task.wait(0.5)
        local fps = math.floor(1 / RunService.RenderStepped:Wait())
        local ping = math.floor(LocalPlayer:GetNetworkPing() * 1000)
        
        local homeTabChildren = HomeTab:GetChildren()
        for _, v in pairs(homeTabChildren) do
            if v:IsA("Frame") then
                for _, child in pairs(v:GetDescendants()) do
                    if child:IsA("TextLabel") and child.Text:find("FPS") then
                        local parent = child.Parent
                        for _, c in pairs(parent:GetDescendants()) do
                            if c:IsA("TextLabel") and c ~= child and c.Text:match("^%d+$") then
                                c.Text = tostring(fps)
                            end
                        end
                    elseif child:IsA("TextLabel") and child.Text:find("PING") then
                        local parent = child.Parent
                        for _, c in pairs(parent:GetDescendants()) do
                            if c:IsA("TextLabel") and c ~= child and c.Text:match("^%d+ms$") then
                                c.Text = ping .. "ms"
                            end
                        end
                    end
                end
            end
        end
    end
end)

print("████████████████████████████████████████████████████████████")
print("🏥 ELITE HUB v1.0.0 - ANIMAL HOSPITAL LOADED")
print("F = Auto Farm | G = Auto Sanity | X = Noclip | J = Infinite Jump")
print("RightShift = Toggle UI")
print("LOGO ASSET: rbxassetid://121150781595166")
print("DISCORD: discord.gg/5RuMCxK3u6")
print("Made by marcus")
print("████████████████████████████████████████████████████████████")