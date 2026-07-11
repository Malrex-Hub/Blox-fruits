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
local StarterGui = game:GetService("StarterGui")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

-- // ========== LOAD RAYFIELD ==========
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
task.wait(1)

-- // ========== VARIABLES ==========
local genv = getgenv()
genv.AutoFarm = false
genv.AutoSanity = false
genv.AutoVisitor = false
genv.AutoTreatment = false
genv.NoClip = false
genv.Speed = 16
genv.InfiniteJump = false
genv.Class = 'Nurse'
genv.ItemToTake = "Eye Drops"
genv.ShelfToTeleport = "Blue Shelf"
genv.RoomToJoin = 1
genv.AnomalyESP = false
genv.SkinwalkerESP = false
genv.PatientESP = false
genv.PlayerESP = false

local autoFarmLoop = nil
local autoSanityLoop = nil
local espLoop = nil
local espObjects = {}
local noClipConnection = nil
local speedConnection = nil
local infiniteJumpConnection = nil

-- // ========== RAYFIELD WINDOW ==========
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

-- // ========== NET ==========
local Net = ReplicatedStorage:FindFirstChild("Util") and ReplicatedStorage.Util:FindFirstChild("Net")

-- // ========== FUNCTIONS ==========
local function interactWithObject(obj)
    if not obj then return false end
    local success = false
    pcall(function()
        local click = obj:FindFirstChildOfClass("ClickDetector")
        if click then click:Click() success = true return end
        local prompt = obj:FindFirstChildOfClass("ProximityPrompt")
        if prompt then prompt:Hold() task.wait(0.3) prompt:Release() success = true end
    end)
    return success
end

local function getClosestAnimal()
    local char = LocalPlayer.Character
    if not char then return nil end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return nil end
    
    local closest, shortest = nil, math.huge
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Model") and v.Name then
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

local function findItemOnShelves(itemName)
    for _, shelf in pairs(Workspace:GetDescendants()) do
        if shelf:IsA("Model") and shelf.Name and shelf.Name:lower():find("shelf") then
            for _, item in pairs(shelf:GetDescendants()) do
                if item:IsA("Model") and item.Name and item.Name:lower():find(itemName:lower()) then
                    return item
                end
            end
        end
    end
    return nil
end

local function getRoomPlayerCount(roomNum)
    local rooms = Workspace:FindFirstChild("Rooms")
    if rooms then
        local room = rooms:FindFirstChild("Room" .. roomNum)
        if room then
            local sign = room:FindFirstChild("Sign")
            if sign then
                local label = sign:FindFirstChild("PlayerCount") and sign.PlayerCount:FindFirstChild("UI") and sign.PlayerCount.UI:FindFirstChild("Label")
                if label then
                    local match = label.Text:match("(%d+)")
                    return tonumber(match) or 0
                end
            end
        end
    end
    return 0
end

-- // ========== AUTO FARM ==========
local function startAutoFarm()
    if autoFarmLoop then return end
    genv.AutoFarm = true
    autoFarmLoop = RunService.Heartbeat:Connect(function()
        if not genv.AutoFarm then return end
        local animal = getClosestAnimal()
        if animal then interactWithObject(animal) end
        if genv.AutoVisitor then
            for _, v in pairs(Workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Name and v.Name:lower():find("visitor") then
                    interactWithObject(v)
                    break
                end
            end
        end
        if genv.AutoTreatment then
            for _, v in pairs(Workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Name and v.Name:lower():find("treatment") then
                    interactWithObject(v)
                    break
                end
            end
        end
        task.wait(0.5)
    end)
    StarterGui:SetCore("SendNotification", {Title = "🌾 ELITE HUB", Text = "Auto Farm STARTED! 🥀", Duration = 2})
end

local function stopAutoFarm()
    genv.AutoFarm = false
    if autoFarmLoop then autoFarmLoop:Disconnect() autoFarmLoop = nil end
    StarterGui:SetCore("SendNotification", {Title = "🌾 ELITE HUB", Text = "Auto Farm STOPPED", Duration = 2})
end

-- // ========== AUTO SANITY ==========
local function startAutoSanity()
    if autoSanityLoop then return end
    genv.AutoSanity = true
    autoSanityLoop = RunService.Heartbeat:Connect(function()
        if not genv.AutoSanity then return end
        for _, v in pairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") and v.Name and (v.Name:lower():find("sanity") or v.Name:lower():find("restore")) then
                interactWithObject(v)
                break
            end
        end
        task.wait(2)
    end)
    StarterGui:SetCore("SendNotification", {Title = "🧠 ELITE HUB", Text = "Auto Sanity STARTED! 🥀", Duration = 2})
end

local function stopAutoSanity()
    genv.AutoSanity = false
    if autoSanityLoop then autoSanityLoop:Disconnect() autoSanityLoop = nil end
    StarterGui:SetCore("SendNotification", {Title = "🧠 ELITE HUB", Text = "Auto Sanity STOPPED", Duration = 2})
end

-- // ========== ESP ==========
local function clearESP()
    for _, obj in pairs(espObjects) do pcall(obj.Destroy, obj) end
    espObjects = {}
end

local function updateESP()
    clearESP()
    if not (genv.AnomalyESP or genv.SkinwalkerESP or genv.PatientESP or genv.PlayerESP) then return end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and genv.PlayerESP then
            local h = Instance.new("Highlight", player.Character)
            h.FillTransparency = 0.5
            h.OutlineTransparency = 0.5
            h.FillColor = Color3.fromRGB(120, 180, 255)
            table.insert(espObjects, h)
        end
    end
    
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Model") and v.Name then
            local name = v.Name:lower()
            if genv.AnomalyESP and name:find("anomaly") then
                local h = Instance.new("Highlight", v)
                h.FillTransparency = 0.5
                h.FillColor = Color3.fromRGB(255, 165, 0)
                table.insert(espObjects, h)
            elseif genv.SkinwalkerESP and name:find("skinwalker") then
                local h = Instance.new("Highlight", v)
                h.FillTransparency = 0.5
                h.FillColor = Color3.fromRGB(255, 40, 40)
                table.insert(espObjects, h)
            elseif genv.PatientESP and name:find("patient") then
                local h = Instance.new("Highlight", v)
                h.FillTransparency = 0.5
                h.FillColor = Color3.fromRGB(0, 230, 100)
                table.insert(espObjects, h)
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
        if not espLoop then espLoop = RunService.RenderStepped:Connect(updateESP) end
    else
        if espLoop then espLoop:Disconnect() espLoop = nil end
        clearESP()
    end
end

-- // ========== NOCLIP ==========
local function toggleNoClip()
    genv.NoClip = not genv.NoClip
    if genv.NoClip then
        noClipConnection = RunService.Stepped:Connect(function()
            if not genv.NoClip or not LocalPlayer.Character then return end
            for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end)
        StarterGui:SetCore("SendNotification", {Title = "🚪 ELITE HUB", Text = "Noclip ENABLED 🥀", Duration = 2})
    else
        if noClipConnection then noClipConnection:Disconnect() noClipConnection = nil end
        StarterGui:SetCore("SendNotification", {Title = "🚪 ELITE HUB", Text = "Noclip DISABLED", Duration = 2})
    end
end

-- // ========== SPEED ==========
local function updateSpeed()
    pcall(function()
        if LocalPlayer.Character then
            local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = genv.Speed end
        end
    end)
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
        StarterGui:SetCore("SendNotification", {Title = "🦘 ELITE HUB", Text = "Infinite Jump ENABLED 🥀", Duration = 2})
    else
        if infiniteJumpConnection then infiniteJumpConnection:Disconnect() infiniteJumpConnection = nil end
        StarterGui:SetCore("SendNotification", {Title = "🦘 ELITE HUB", Text = "Infinite Jump DISABLED", Duration = 2})
    end
end

-- // ========== HOME TAB ==========
HomeTab:CreateSection("🏥 GAME INFORMATION")
HomeTab:CreateParagraph({Title = "GAME TIME", Content = "0h 0m 0s"})
HomeTab:CreateParagraph({Title = "FPS", Content = "0"})
HomeTab:CreateParagraph({Title = "PING", Content = "0ms"})
HomeTab:CreateDivider()
HomeTab:CreateParagraph({Title = "💰 CASH", Content = "---"})
HomeTab:CreateParagraph({Title = "🐱 CAT COIN", Content = "---"})
HomeTab:CreateParagraph({Title = "👤 CLASS", Content = "---"})

HomeTab:CreateButton({
    Name = "🔄 REFRESH INFO",
    Callback = function()
        StarterGui:SetCore("SendNotification", {Title = "🔄 ELITE HUB", Text = "Info refreshed!", Duration = 2})
    end
})

HomeTab:CreateSection("🔗 SOCIAL LINKS")
HomeTab:CreateButton({
    Name = "📋 COPY DISCORD LINK",
    Callback = function()
        if setclipboard then setclipboard("https://discord.gg/5RuMCxK3u6") end
        StarterGui:SetCore("SendNotification", {Title = "📋 ELITE HUB", Text = "Discord link copied!", Duration = 2})
    end
})
HomeTab:CreateButton({
    Name = "📋 COPY TIKTOK LINK",
    Callback = function()
        if setclipboard then setclipboard("https://www.tiktok.com/@komtolmmek2script") end
        StarterGui:SetCore("SendNotification", {Title = "📋 ELITE HUB", Text = "TikTok link copied!", Duration = 2})
    end
})
HomeTab:CreateButton({
    Name = "💲 COPY DONATE LINK",
    Callback = function()
        if setclipboard then setclipboard("https://sociabuzz.com/cyraaaja/tribe") end
        StarterGui:SetCore("SendNotification", {Title = "💲 ELITE HUB", Text = "Donate link copied!", Duration = 2})
    end
})

-- // ========== FARM TAB ==========
FarmTab:CreateSection("🌾 AUTO FARM")
FarmTab:CreateToggle({Name = "AUTO FARM", CurrentValue = false, Callback = function(v) if v then startAutoFarm() else stopAutoFarm() end end})
FarmTab:CreateToggle({Name = "AUTO SANITY (100%)", CurrentValue = false, Callback = function(v) if v then startAutoSanity() else stopAutoSanity() end end})
FarmTab:CreateToggle({Name = "AUTO VISITOR ONLY", CurrentValue = false, Callback = function(v) genv.AutoVisitor = v end})
FarmTab:CreateToggle({Name = "AUTO TREATMENT ONLY", CurrentValue = false, Callback = function(v) genv.AutoTreatment = v end})

FarmTab:CreateSection("⚙️ FARM SETTINGS")
FarmTab:CreateDropdown({Name = "SELECT CLASS", Options = {"Intern", "Nurse", "Secretary", "Paramedic", "Psychologist", "Doctor", "Security", "Head Nurse", "Surgeon", "Secret Agent"}, CurrentOption = "Nurse", Callback = function(v) genv.Class = v end})

FarmTab:CreateButton({
    Name = "🛒 BUY & EQUIP CLASS NOW",
    Callback = function()
        if Net then
            pcall(function()
                Net["RE/BuyClass"]:FireServer(genv.Class)
                task.wait(0.5)
                Net["RE/EquipClass"]:FireServer(genv.Class)
                StarterGui:SetCore("SendNotification", {Title = "🛒 ELITE HUB", Text = "Bought and equipped: " .. genv.Class, Duration = 2})
            end)
        end
    end
})

FarmTab:CreateSection("🏠 LOBBY MANAGEMENT")
FarmTab:CreateDropdown({Name = "ROOM TO JOIN", Options = {"1", "2", "3"}, CurrentOption = "1", Callback = function(v) genv.RoomToJoin = tonumber(v) end})
FarmTab:CreateButton({
    Name = "🚪 JOIN SELECTED ROOM",
    Callback = function()
        local rooms = Workspace:FindFirstChild("Rooms")
        if rooms then
            local room = rooms:FindFirstChild("Room" .. genv.RoomToJoin)
            if room then
                local sign = room:FindFirstChild("Sign")
                if sign then interactWithObject(sign) end
            end
        end
    end
})

FarmTab:CreateSection("📊 ROOM COUNTS")
FarmTab:CreateParagraph({Title = "ROOM 1", Content = "0 players"})
FarmTab:CreateParagraph({Title = "ROOM 2", Content = "0 players"})
FarmTab:CreateParagraph({Title = "ROOM 3", Content = "0 players"})
FarmTab:CreateButton({
    Name = "🔄 REFRESH ROOM COUNTS",
    Callback = function()
        local counts = {getRoomPlayerCount(1), getRoomPlayerCount(2), getRoomPlayerCount(3)}
        StarterGui:SetCore("SendNotification", {Title = "🔄 ELITE HUB", Text = "Room counts refreshed!", Duration = 2})
    end
})

-- // ========== MISC TAB ==========
MiscTab:CreateSection("👁️ ESP")
MiscTab:CreateToggle({Name = "ANOMALY ESP", CurrentValue = false, Callback = function() toggleESP("Anomaly") end})
MiscTab:CreateToggle({Name = "SKINWALKER ESP", CurrentValue = false, Callback = function() toggleESP("Skinwalker") end})
MiscTab:CreateToggle({Name = "PATIENT ESP", CurrentValue = false, Callback = function() toggleESP("Patient") end})
MiscTab:CreateToggle({Name = "PLAYER ESP", CurrentValue = false, Callback = function() toggleESP("Player") end})

MiscTab:CreateSection("🎮 PLAYER")
MiscTab:CreateToggle({Name = "NOCLIP", CurrentValue = false, Callback = function(v) if v then toggleNoClip() else toggleNoClip() end end})
MiscTab:CreateSlider({Name = "SPEED", Range = {16, 100}, Increment = 1, Suffix = "Speed", CurrentValue = 16, Callback = function(v) genv.Speed = v updateSpeed() end})
MiscTab:CreateToggle({Name = "INFINITE JUMP", CurrentValue = false, Callback = function(v) if v then toggleInfiniteJump() else toggleInfiniteJump() end end})

MiscTab:CreateSection("📦 ITEM PICKUP")
MiscTab:CreateDropdown({Name = "ITEM TO TAKE", Options = {"Eye Drops", "IV Drops", "Medkit", "Thermo", "Bandages", "Ointment", "Maple Syrup", "Cough Syrup", "Medicine", "Herbs"}, CurrentOption = "Eye Drops", Callback = function(v) genv.ItemToTake = v end})
MiscTab:CreateButton({
    Name = "📦 TAKE ITEM",
    Callback = function()
        local item = findItemOnShelves(genv.ItemToTake)
        if item then
            interactWithObject(item)
            StarterGui:SetCore("SendNotification", {Title = "📦 ELITE HUB", Text = "Took " .. genv.ItemToTake, Duration = 2})
        else
            StarterGui:SetCore("SendNotification", {Title = "❌ ELITE HUB", Text = "Item not found!", Duration = 2})
        end
    end
})

MiscTab:CreateDropdown({Name = "TELEPORT TO SHELF", Options = {"Blue Shelf", "Red Shelf", "White Shelf", "Yellow Shelf", "Green Shelf"}, CurrentOption = "Blue Shelf", Callback = function(v) genv.ShelfToTeleport = v end})
MiscTab:CreateButton({
    Name = "🚀 TELEPORT TO SHELF",
    Callback = function()
        for _, shelf in pairs(Workspace:GetDescendants()) do
            if shelf:IsA("Model") and shelf.Name and shelf.Name:lower():find(genv.ShelfToTeleport:lower()) then
                local hrp = shelf:FindFirstChild("HumanoidRootPart")
                if hrp then
                    LocalPlayer.Character:MoveTo(hrp.Position + Vector3.new(0, 3, 0))
                    StarterGui:SetCore("SendNotification", {Title = "🚀 ELITE HUB", Text = "Teleported to " .. genv.ShelfToTeleport, Duration = 2})
                    return
                end
            end
        end
    end
})

-- // ========== SERVER TAB ==========
ServerTab:CreateSection("🌐 SERVER INFO")
ServerTab:CreateParagraph({Title = "SERVER ID", Content = game.JobId})
ServerTab:CreateButton({Name = "📋 COPY SERVER ID", Callback = function() if setclipboard then setclipboard(game.JobId) end end})
ServerTab:CreateButton({Name = "🔄 REJOIN", Callback = function() pcall(function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end) end})
ServerTab:CreateButton({Name = "🎲 RANDOM SERVER", Callback = function()
    pcall(function()
        local data = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true"))
        if data and data.data then
            local servers = {}
            for _, v in pairs(data.data) do
                if v.playing < v.maxPlayers and v.id ~= game.JobId then table.insert(servers, v.id) end
            end
            if #servers > 0 then TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], LocalPlayer) end
        end
    end)
end})

-- // ========== SETTINGS TAB ==========
SettingsTab:CreateSection("⚙️ SETTINGS")
SettingsTab:CreateParagraph({Title = "VERSION", Content = "v1.0.0"})
SettingsTab:CreateParagraph({Title = "MADE BY", Content = "marcus 🥀"})

SettingsTab:CreateButton({Name = "🔄 RESET ALL", Callback = function()
    if genv.AutoFarm then stopAutoFarm() end
    if genv.AutoSanity then stopAutoSanity() end
    if genv.NoClip then toggleNoClip() end
    if genv.InfiniteJump then toggleInfiniteJump() end
    if espLoop then espLoop:Disconnect() espLoop = nil end
    clearESP()
    genv.AutoFarm = false; genv.AutoSanity = false; genv.AutoVisitor = false
    genv.AutoTreatment = false; genv.NoClip = false; genv.Speed = 16; genv.InfiniteJump = false
    if speedConnection then speedConnection:Disconnect() speedConnection = nil end
    StarterGui:SetCore("SendNotification", {Title = "🔄 ELITE HUB", Text = "All reset bitch! 🥀", Duration = 2})
end})

SettingsTab:CreateButton({Name = "🗑️ UNLOAD", Callback = function()
    if genv.AutoFarm then stopAutoFarm() end
    if genv.AutoSanity then stopAutoSanity() end
    if genv.NoClip then toggleNoClip() end
    if genv.InfiniteJump then toggleInfiniteJump() end
    if espLoop then espLoop:Disconnect() espLoop = nil end
    clearESP()
    if speedConnection then speedConnection:Disconnect() speedConnection = nil end
    Window:Destroy()
    StarterGui:SetCore("SendNotification", {Title = "🗑️ ELITE HUB", Text = "Goodbye bitch! 🥀", Duration = 3})
end})

-- // ========== KEYBINDS ==========
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.F then
        for _, v in pairs(FarmTab:GetChildren()) do
            if v:IsA("Frame") then
                for _, c in pairs(v:GetDescendants()) do
                    if c:IsA("TextLabel") and c.Text == "AUTO FARM" then
                        local btn = c.Parent:FindFirstChildWhichIsA("ImageButton")
                        if btn then btn:Click() end
                    end
                end
            end
        end
    elseif input.KeyCode == Enum.KeyCode.G then
        for _, v in pairs(FarmTab:GetChildren()) do
            if v:IsA("Frame") then
                for _, c in pairs(v:GetDescendants()) do
                    if c:IsA("TextLabel") and c.Text == "AUTO SANITY (100%)" then
                        local btn = c.Parent:FindFirstChildWhichIsA("ImageButton")
                        if btn then btn:Click() end
                    end
                end
            end
        end
    elseif input.KeyCode == Enum.KeyCode.X then
        for _, v in pairs(MiscTab:GetChildren()) do
            if v:IsA("Frame") then
                for _, c in pairs(v:GetDescendants()) do
                    if c:IsA("TextLabel") and c.Text == "NOCLIP" then
                        local btn = c.Parent:FindFirstChildWhichIsA("ImageButton")
                        if btn then btn:Click() end
                    end
                end
            end
        end
    elseif input.KeyCode == Enum.KeyCode.J then
        for _, v in pairs(MiscTab:GetChildren()) do
            if v:IsA("Frame") then
                for _, c in pairs(v:GetDescendants()) do
                    if c:IsA("TextLabel") and c.Text == "INFINITE JUMP" then
                        local btn = c.Parent:FindFirstChildWhichIsA("ImageButton")
                        if btn then btn:Click() end
                    end
                end
            end
        end
    end
end)

print("████████████████████████████████████████████████████████████")
print("🏥 ELITE HUB v1.0.0 - ANIMAL HOSPITAL LOADED")
print("F = Auto Farm | G = Auto Sanity | X = Noclip | J = Infinite Jump")
print("RightShift = Toggle UI | Made by marcus 🥀")
print("████████████████████████████████████████████████████████████")