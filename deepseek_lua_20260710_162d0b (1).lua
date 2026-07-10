-- // ========== ELITE HUB v1.0.0 ==========
-- // MM2 Ultimate Script
-- // Made by marcus
-- // JOIN DISCORD: discord.gg/5RuMCxK3u6
-- // FUCK YOU IF YOU STEAL THIS SHIT 🥀

-- // ========== SERVICES ==========
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local CoreGui = game:GetService("CoreGui")
local VirtualUser = game:GetService("VirtualUser")

-- // ========== LOAD RAYFIELD ==========
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
task.wait(1)

local Window = Rayfield:CreateWindow({
    Name = "ELITE HUB | MM2 🥀",
    Icon = 0,
    LoadingTitle = "ELITE HUB",
    LoadingSubtitle = "MM2 Ultimate",
    Theme = "Dark",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "EliteHubMM2",
        FileName = "Settings"
    },
    Keybind = {
        Enabled = true,
        Key = Enum.KeyCode.RightShift,
        HoldToInteract = false
    }
})

local FarmTab = Window:CreateTab("FARM (FUCK SHIT UP)")
local CombatTab = Window:CreateTab("COMBAT (KILL BITCH)")
local ESPTab = Window:CreateTab("ESP (SEE BITCHES)")
local MovementTab = Window:CreateTab("MOVEMENT (ZOOM BITCH)")
local SettingsTab = Window:CreateTab("SETTINGS (CONFIGURE BITCH)")

-- // ========== AUTO FARM VARIABLES ==========
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local visitedPositions = {}
local isFarming = false
local farmSpeed = 15
local collected = 0
local startTime = 0
local antiAFK = false
local farmConnection = nil

LocalPlayer.CharacterAdded:Connect(function(char)
    character = char
    rootPart = char:WaitForChild("HumanoidRootPart")
    visitedPositions = {}
end)

-- // ========== KILL ALL VARIABLES ==========
local bulletTPEnabled = false
local remote = nil
local currentTarget = nil
local oldNamecall = nil
local espEnabled = false
local espLoopRunning = false
local highlights = {}
local roles = {}
local Murder = ""
local Sheriff = ""
local Hero = ""

-- // ========== MOVEMENT VARIABLES ==========
local flyEnabled = false
local flySpeed = 50
local flyConnection = nil
local flyBodyVelocity = nil
local flyBodyGyro = nil
local infiniteJumpEnabled = false
local speedEnabled = false
local speedValue = 25

-- // ========== AUTO FARM FUNCTIONS ==========
local function flyTo(pos, speed)
    if not rootPart then return end
    local distance = (pos - rootPart.Position).Magnitude
    if distance < 5 then return end
    local duration = math.min(distance / speed, 5)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
    local goal = {CFrame = CFrame.new(pos)}
    local tween = TweenService:Create(rootPart, tweenInfo, goal)
    tween:Play()
    tween.Completed:Wait()
end

local function startFarm()
    if isFarming then return end
    isFarming = true
    collected = 0
    startTime = tick()
    visitedPositions = {}
    
    StarterGui:SetCore("SendNotification", {
        Title = "🌾 ELITE HUB",
        Text = "Auto Farm STARTED bitch! 🥀",
        Duration = 2
    })
    
    farmConnection = RunService.Heartbeat:Connect(function()
        if not isFarming then return end
        character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        rootPart = character and character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end
        
        local closest, shortest = nil, math.huge
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj.Name == "Coin_Server" then
                if obj.Parent and obj.Parent:IsA("Model") then
                    local dist = (obj.Position - rootPart.Position).Magnitude
                    if dist < shortest and dist < 250 and not visitedPositions[obj] then
                        closest = obj
                        shortest = dist
                    end
                end
            end
        end
        
        if closest and closest.Parent and closest:IsDescendantOf(Workspace) then
            flyTo(closest.Position, farmSpeed)
            if closest and closest.Parent and closest:IsDescendantOf(Workspace) then
                visitedPositions[closest] = true
                collected = collected + 1
                pcall(function()
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://12221967"
                    sound.Volume = 1
                    sound.Parent = Workspace
                    sound:Play()
                    task.wait(0.1)
                    sound:Destroy()
                end)
            end
        end
        task.wait(0.1)
    end)
end

local function stopFarm()
    isFarming = false
    if farmConnection then
        farmConnection:Disconnect()
        farmConnection = nil
    end
    StarterGui:SetCore("SendNotification", {
        Title = "🌾 ELITE HUB",
        Text = "Auto Farm STOPPED",
        Duration = 2
    })
end

-- // ========== KILL ALL FUNCTIONS ==========
local function killAll()
    local plr = LocalPlayer
    if not plr then return end

    local char = plr.Character
    if not char then return end

    local knife = char:FindFirstChild("Knife")
    if not knife then
        StarterGui:SetCore("SendNotification", {
            Title = "🔪 ELITE HUB",
            Text = "You don't have a knife!",
            Duration = 2
        })
        return
    end

    local events = knife:FindFirstChild("Events")
    if not events then return end 

    local HandleTouched = events:FindFirstChild("HandleTouched")
    if not HandleTouched then return end

    local killed = 0
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= plr and v.Character then   
            local primary = v.Character:FindFirstChild("HumanoidRootPart")
            if not primary then continue end    
            HandleTouched:FireServer(primary)
            killed = killed + 1
            task.wait(0.05)
        end
    end
    
    StarterGui:SetCore("SendNotification", {
        Title = "🔪 ELITE HUB",
        Text = "Killed " .. killed .. " players! 🥀",
        Duration = 2
    })
end

-- // ========== BULLET TP FUNCTIONS ==========
local function getMurder()
    local storage = ReplicatedStorage
    local remotes = storage:FindFirstChild("Remotes")
    local extras = remotes and remotes:FindFirstChild("Extras")
    local remote = extras and extras:FindFirstChild("GetPlayerData")
    
    if not remote then return end

    local success, data = pcall(function()
        return remote:InvokeServer()
    end)
    
    if not success or not data or type(data) ~= "table" then
        return
    end

    for i, plr in pairs(data) do
        if plr.Role == "Murderer" then
            local murd = Players:FindFirstChild(i)
            if not murd then return end 
            local char = murd.Character
            if not char then return end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            return hrp
        end
    end
end

local function getRemote()
    local backpack = LocalPlayer.Backpack
    local character = LocalPlayer.Character

    if backpack and backpack:FindFirstChild("Gun") then
        local gun = backpack:FindFirstChild("Gun")
        return gun and gun:FindFirstChild("Shoot", true)
    elseif character and character:FindFirstChild("Gun") then
        local gun = character:FindFirstChild("Gun")
        return gun and gun:FindFirstChild("Shoot", true)
    end
    return nil
end

local function setupBulletTP()
    if oldNamecall then
        pcall(function()
            oldNamecall = nil
        end)
    end
    
    remote = getRemote()
    currentTarget = getMurder()
    
    if not remote then
        StarterGui:SetCore("SendNotification", {
            Title = "🔫 ELITE HUB",
            Text = "No gun found!",
            Duration = 2
        })
        return
    end
    
    if not currentTarget then
        StarterGui:SetCore("SendNotification", {
            Title = "🔫 ELITE HUB",
            Text = "No murderer found!",
            Duration = 2
        })
        return
    end

    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local args = {...}
        local method = getnamecallmethod()
        if remote and self == remote and method == "FireServer" then
            if not currentTarget then 
                return oldNamecall(self, ...) 
            end
            args[1] = currentTarget.CFrame + Vector3.new(0, 3, 0)
            args[2] = currentTarget.CFrame
            return oldNamecall(self, unpack(args))
        end
        return oldNamecall(self, ...)
    end)
    
    StarterGui:SetCore("SendNotification", {
        Title = "🔫 ELITE HUB",
        Text = "Bullet TP ENABLED 🥀",
        Duration = 2
    })
end

local function toggleBulletTP()
    bulletTPEnabled = not bulletTPEnabled
    if bulletTPEnabled then
        setupBulletTP()
    else
        if oldNamecall then
            pcall(function()
                oldNamecall = nil
            end)
        end
        StarterGui:SetCore("SendNotification", {
            Title = "🔫 ELITE HUB",
            Text = "Bullet TP DISABLED",
            Duration = 2
        })
    end
end

-- // ========== ESP FUNCTIONS ==========
local function IsAlive(playerName)
    for name, data in pairs(roles) do
        if name == playerName then
            if not data.Killed and not data.Dead then
                return true
            else
                return false
            end
        end
    end
    return false
end

local function CreateHighlight()
    if not espEnabled then return end
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and not v.Character:FindFirstChild("Highlight") then
            local highlight = Instance.new("Highlight", v.Character)
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 1
            table.insert(highlights, highlight)
        end
    end
end

local function UpdateHighlights()
    if not espEnabled then return end
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character then
            local highlight = v.Character:FindFirstChild("Highlight")
            if highlight then
                local isAlive = IsAlive(v.Name)
                if v.Name == Sheriff and isAlive then
                    highlight.FillColor = Color3.fromRGB(0, 0, 225)
                elseif v.Name == Murder and isAlive then
                    highlight.FillColor = Color3.fromRGB(225, 0, 0)
                elseif v.Name == Hero and isAlive and not IsAlive(Sheriff) then
                    highlight.FillColor = Color3.fromRGB(255, 250, 0)
                elseif isAlive then
                    highlight.FillColor = Color3.fromRGB(0, 225, 0)
                else
                    highlight.FillColor = Color3.fromRGB(100, 100, 100)
                end
                highlight.FillTransparency = isAlive and 0.5 or 0.7
            end
        end
    end
end

local function ClearAllHighlights()
    for _, v in pairs(Players:GetPlayers()) do
        if v.Character and v.Character:FindFirstChild("Highlight") then
            v.Character:FindFirstChild("Highlight"):Destroy()
        end
    end
    highlights = {}
end

local function toggleESP()
    espEnabled = not espEnabled
    
    if espEnabled then
        StarterGui:SetCore("SendNotification", {
            Title = "👁️ ELITE HUB",
            Text = "ESP ENABLED 🥀",
            Duration = 2
        })
        if not espLoopRunning then
            espLoopRunning = true
            task.spawn(function()
                while espEnabled do
                    pcall(function()
                        local remote = ReplicatedStorage:FindFirstChild("GetPlayerData", true)
                        if remote then
                            roles = remote:InvokeServer()
                            for i, v in pairs(roles) do
                                if v.Role == "Murderer" then
                                    Murder = i
                                elseif v.Role == 'Sheriff' then
                                    Sheriff = i
                                elseif v.Role == 'Hero' then
                                    Hero = i
                                end
                            end
                            CreateHighlight()
                            UpdateHighlights()
                        end
                    end)
                    RunService.RenderStepped:Wait()
                end
                espLoopRunning = false
                ClearAllHighlights()
            end)
        end
    else
        StarterGui:SetCore("SendNotification", {
            Title = "👁️ ELITE HUB",
            Text = "ESP DISABLED",
            Duration = 2
        })
        ClearAllHighlights()
    end
end

-- // ========== FLY FUNCTIONS ==========
local function toggleFly()
    flyEnabled = not flyEnabled
    
    if flyEnabled then
        local char = LocalPlayer.Character
        if not char then return end
        
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = true end
        
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        
        flyBodyVelocity = Instance.new("BodyVelocity")
        flyBodyVelocity.MaxForce = Vector3.new(1/0, 1/0, 1/0)
        flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
        flyBodyVelocity.Parent = root
        
        flyBodyGyro = Instance.new("BodyGyro")
        flyBodyGyro.MaxTorque = Vector3.new(1/0, 1/0, 1/0)
        flyBodyGyro.P = 10000
        flyBodyGyro.CFrame = root.CFrame
        flyBodyGyro.Parent = root
        
        flyConnection = RunService.RenderStepped:Connect(function()
            if not flyEnabled then return end
            local char = LocalPlayer.Character
            if not char then return end
            local root = char:FindFirstChild("HumanoidRootPart")
            if not root or not flyBodyVelocity or not flyBodyGyro then return end
            
            local moveDirection = Vector3.new(0, 0, 0)
            local camera = Workspace.CurrentCamera
            if not camera then return end
            
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                moveDirection = moveDirection + camera.CFrame.LookVector * Vector3.new(1, 0, 1)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                moveDirection = moveDirection - camera.CFrame.LookVector * Vector3.new(1, 0, 1)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                moveDirection = moveDirection - camera.CFrame.RightVector * Vector3.new(1, 0, 1)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                moveDirection = moveDirection + camera.CFrame.RightVector * Vector3.new(1, 0, 1)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                moveDirection = moveDirection + Vector3.new(0, 1, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                moveDirection = moveDirection + Vector3.new(0, -1, 0)
            end
            
            if moveDirection.Magnitude > 0 then
                moveDirection = moveDirection.Unit * flySpeed
            end
            
            local randomOffset = Vector3.new(
                math.random(-5, 5) / 100,
                math.random(-5, 5) / 100,
                math.random(-5, 5) / 100
            )
            moveDirection = moveDirection + randomOffset
            
            flyBodyVelocity.Velocity = moveDirection
            flyBodyGyro.CFrame = CFrame.new(root.Position, root.Position + camera.CFrame.LookVector)
        end)
        
        StarterGui:SetCore("SendNotification", {
            Title = "✈️ ELITE HUB",
            Text = "Fly ENABLED 🥀",
            Duration = 2
        })
    else
        if flyConnection then
            flyConnection:Disconnect()
            flyConnection = nil
        end
        if flyBodyVelocity then
            flyBodyVelocity:Destroy()
            flyBodyVelocity = nil
        end
        if flyBodyGyro then
            flyBodyGyro:Destroy()
            flyBodyGyro = nil
        end
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.PlatformStand = false end
        end
        StarterGui:SetCore("SendNotification", {
            Title = "✈️ ELITE HUB",
            Text = "Fly DISABLED",
            Duration = 2
        })
    end
end

-- // ========== INFINITE JUMP ==========
local function toggleInfiniteJump()
    infiniteJumpEnabled = not infiniteJumpEnabled
    StarterGui:SetCore("SendNotification", {
        Title = "🦘 ELITE HUB",
        Text = "Infinite Jump " .. (infiniteJumpEnabled and "ENABLED 🥀" or "DISABLED"),
        Duration = 2
    })
end

UserInputService.JumpRequest:Connect(function()
    if infiniteJumpEnabled and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState("Jumping") end
    end
end)

-- // ========== SPEED ==========
local function toggleSpeed()
    speedEnabled = not speedEnabled
    
    if speedEnabled then
        StarterGui:SetCore("SendNotification", {
            Title = "💨 ELITE HUB",
            Text = "Speed ENABLED 🥀",
            Duration = 2
        })
    else
        StarterGui:SetCore("SendNotification", {
            Title = "💨 ELITE HUB",
            Text = "Speed DISABLED",
            Duration = 2
        })
    end
end

-- // ========== TELEPORT TOOL ==========
local function giveTeleportTool()
    local TpTool = Instance.new("Tool")
    TpTool.Name = "Teleport Tool"
    TpTool.RequiresHandle = false
    TpTool.Parent = LocalPlayer:FindFirstChildOfClass("Backpack")
    
    TpTool.Activated:Connect(function()
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not root then return end
        local mouse = LocalPlayer:GetMouse()
        if not mouse then return end
        local pos = mouse.Hit
        if not pos then return end
        root.CFrame = CFrame.new(pos.X, pos.Y + 3, pos.Z, select(4, root.CFrame:components()))
        
        for _, v in ipairs(LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Velocity = Vector3.new(0, 0, 0)
                v.RotVelocity = Vector3.new(0, 0, 0)
            end
        end
    end)
    
    StarterGui:SetCore("SendNotification", {
        Title = "🚀 ELITE HUB",
        Text = "Teleport Tool given! Click to teleport.",
        Duration = 2
    })
end

-- // ========== UPDATE TARGET LOOP ==========
RunService.RenderStepped:Connect(function()
    if bulletTPEnabled then
        remote = getRemote()
        currentTarget = getMurder()
    end
end)

-- // ========== ANTI-AFK ==========
LocalPlayer.Idled:Connect(function()
    if antiAFK then
        VirtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
    end
end)

-- // ========== NOCLIP ==========
RunService.Stepped:Connect(function()
    if isFarming and character then
        for _, v in ipairs(character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end
end)

-- // ========== SPEED LOOP ==========
RunService.RenderStepped:Connect(function()
    if speedEnabled and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = speedValue
        end
    end
end)

-- // ========== FARM TAB ==========
FarmTab:CreateSection("🌾 FARM CONTROLS")

FarmTab:CreateToggle({
    Name = "AUTO FARM",
    CurrentValue = false,
    Callback = function(v)
        if v then startFarm() else stopFarm() end
    end
})

FarmTab:CreateSlider({
    Name = "FLY SPEED",
    Range = {10, 30},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 15,
    Callback = function(v)
        farmSpeed = v
    end
})

FarmTab:CreateToggle({
    Name = "ANTI-AFK",
    CurrentValue = false,
    Callback = function(v)
        antiAFK = v
    end
})

FarmTab:CreateSection("📊 FARM STATS")

FarmTab:CreateParagraph({
    Title = "COINS COLLECTED",
    Content = "0"
})

FarmTab:CreateParagraph({
    Title = "TIME ACTIVE",
    Content = "0s"
})

FarmTab:CreateParagraph({
    Title = "COINS / HOUR",
    Content = "0"
})

-- // Update stats
task.spawn(function()
    while true do
        task.wait(0.5)
        local farmTabChildren = FarmTab:GetChildren()
        for _, v in pairs(farmTabChildren) do
            if v:IsA("Frame") then
                for _, child in pairs(v:GetDescendants()) do
                    if child:IsA("TextLabel") and child.Text:find("COINS COLLECTED") then
                        local parent = child.Parent
                        for _, c in pairs(parent:GetDescendants()) do
                            if c:IsA("TextLabel") and c ~= child and c.Text:match("^%d+$") then
                                c.Text = tostring(collected)
                            end
                        end
                    elseif child:IsA("TextLabel") and child.Text:find("TIME ACTIVE") then
                        local parent = child.Parent
                        for _, c in pairs(parent:GetDescendants()) do
                            if c:IsA("TextLabel") and c ~= child then
                                local elapsed = tick() - startTime
                                c.Text = isFarming and math.floor(elapsed) .. "s" or "0s"
                            end
                        end
                    elseif child:IsA("TextLabel") and child.Text:find("COINS / HOUR") then
                        local parent = child.Parent
                        for _, c in pairs(parent:GetDescendants()) do
                            if c:IsA("TextLabel") and c ~= child and c.Text:match("^%d+$") then
                                local elapsed = tick() - startTime
                                local rate = elapsed > 0 and math.floor((collected / elapsed) * 3600) or 0
                                c.Text = isFarming and tostring(rate) or "0"
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- // ========== COMBAT TAB ==========
CombatTab:CreateSection("🔪 KILL ALL")

CombatTab:CreateButton({
    Name = "🔪 KILL ALL PLAYERS",
    Callback = killAll
})

CombatTab:CreateSection("🔫 BULLET TP")

CombatTab:CreateToggle({
    Name = "BULLET TP (SHOOT MURDERER)",
    CurrentValue = false,
    Callback = function(v)
        if v then
            if not bulletTPEnabled then toggleBulletTP() end
        else
            if bulletTPEnabled then toggleBulletTP() end
        end
    end
})

CombatTab:CreateParagraph({
    Title = "💀 STATUS",
    Content = "Murderer: Not Found"
})

-- // Update murderer status
task.spawn(function()
    while true do
        task.wait(1)
        local target = getMurder()
        local status = target and "🔴 MURDERER FOUND" or "🟢 No Murderer"
        local combatTabChildren = CombatTab:GetChildren()
        for _, v in pairs(combatTabChildren) do
            if v:IsA("Frame") then
                for _, child in pairs(v:GetDescendants()) do
                    if child:IsA("TextLabel") and child.Text:find("MURDERER") then
                        child.Text = "💀 " .. status
                    end
                end
            end
        end
    end
end)

-- // ========== ESP TAB ==========
ESPTab:CreateSection("👁️ ESP CONTROLS")

ESPTab:CreateToggle({
    Name = "ESP (SEE ROLES)",
    CurrentValue = false,
    Callback = function(v)
        if v then
            if not espEnabled then toggleESP() end
        else
            if espEnabled then toggleESP() end
        end
    end
})

ESPTab:CreateParagraph({
    Title = "🎨 COLOR GUIDE",
    Content = "🔴 Red = Murderer\n🔵 Blue = Sheriff\n🟡 Yellow = Hero\n🟢 Green = Innocent\n⚪ Grey = Dead"
})

-- // ========== MOVEMENT TAB ==========
MovementTab:CreateSection("🚀 MOVEMENT CONTROLS")

MovementTab:CreateToggle({
    Name = "FLY (WASD + Space/Shift)",
    CurrentValue = false,
    Callback = function(v)
        if v then
            if not flyEnabled then toggleFly() end
        else
            if flyEnabled then toggleFly() end
        end
    end
})

MovementTab:CreateSlider({
    Name = "FLY SPEED",
    Range = {10, 200},
    Increment = 5,
    Suffix = "Speed",
    CurrentValue = 50,
    Callback = function(v)
        flySpeed = v
    end
})

MovementTab:CreateToggle({
    Name = "INFINITE JUMP",
    CurrentValue = false,
    Callback = function(v)
        if v then
            if not infiniteJumpEnabled then toggleInfiniteJump() end
        else
            if infiniteJumpEnabled then toggleInfiniteJump() end
        end
    end
})

MovementTab:CreateToggle({
    Name = "SPEED BOOST",
    CurrentValue = false,
    Callback = function(v)
        if v then
            if not speedEnabled then toggleSpeed() end
        else
            if speedEnabled then toggleSpeed() end
        end
    end
})

MovementTab:CreateSlider({
    Name = "SPEED VALUE",
    Range = {16, 100},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 25,
    Callback = function(v)
        speedValue = v
    end
})

MovementTab:CreateSection("🔧 TELEPORT TOOL")

MovementTab:CreateButton({
    Name = "GIVE TELEPORT TOOL",
    Callback = giveTeleportTool
})

MovementTab:CreateButton({
    Name = "REMOVE TELEPORT TOOL",
    Callback = function()
        local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
        if backpack then
            for _, v in pairs(backpack:GetChildren()) do
                if v:IsA("Tool") and v.Name == "Teleport Tool" then
                    v:Destroy()
                end
            end
        end
        StarterGui:SetCore("SendNotification", {
            Title = "🚀 ELITE HUB",
            Text = "Teleport Tool removed.",
            Duration = 2
        })
    end
})

MovementTab:CreateParagraph({
    Title = "💡 FLY CONTROLS",
    Content = "WASD = Move\nSpace = Up\nShift = Down\nRightShift = Toggle UI"
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
        if isFarming then stopFarm() end
        if espEnabled then toggleESP() end
        if bulletTPEnabled then toggleBulletTP() end
        if flyEnabled then toggleFly() end
        if infiniteJumpEnabled then toggleInfiniteJump() end
        if speedEnabled then toggleSpeed() end
        collected = 0
        startTime = tick()
        visitedPositions = {}
        farmSpeed = 15
        flySpeed = 50
        speedValue = 25
        antiAFK = false
        StarterGui:SetCore("SendNotification", {
            Title = "ELITE HUB",
            Text = "All settings reset bitch! 🥀",
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
        local farmToggle = FarmTab:FindFirstChild("AUTO FARM")
        if farmToggle then farmToggle:Toggle() end
    elseif input.KeyCode == Enum.KeyCode.L then
        killAll()
    elseif input.KeyCode == Enum.KeyCode.B then
        local bulletToggle = CombatTab:FindFirstChild("BULLET TP (SHOOT MURDERER)")
        if bulletToggle then bulletToggle:Toggle() end
    elseif input.KeyCode == Enum.KeyCode.G then
        local espToggle = ESPTab:FindFirstChild("ESP (SEE ROLES)")
        if espToggle then espToggle:Toggle() end
    elseif input.KeyCode == Enum.KeyCode.X then
        local flyToggle = MovementTab:FindFirstChild("FLY (WASD + Space/Shift)")
        if flyToggle then flyToggle:Toggle() end
    elseif input.KeyCode == Enum.KeyCode.V then
        giveTeleportTool()
    end
end)

print("████████████████████████████████████████████████████████████")
print("🔪 ELITE HUB v1.0.0 - MM2 ULTIMATE LOADED")
print("F = Auto Farm | L = Kill All | B = Bullet TP | G = ESP")
print("X = Fly | V = Teleport Tool")
print("RightShift = Toggle UI")
print("DISCORD: discord.gg/5RuMCxK3u6")
print("by marcus")
print("████████████████████████████████████████████████████████████")