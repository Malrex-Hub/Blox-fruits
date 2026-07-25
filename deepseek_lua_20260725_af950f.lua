-- // ========== ELITE HUB - BLADE BALL v1.0 ==========
-- // Made by marcus 🥀
-- // JOIN DISCORD: discord.gg/5RuMCxK3u6
-- // FUCK YOU IF YOU STEAL THIS SHIT

-- // ========== LOAD RAYFIELD ==========
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
task.wait(1)

-- // ========== SERVICES ==========
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Stats = game:GetService("Stats")
local Debris = game:GetService("Debris")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local StarterGui = game:GetService("StarterGui")

-- // ========== GAME CHECK ==========
if game.GameId ~= 4777817887 then 
    StarterGui:SetCore("SendNotification", {
        Title = "ELITE HUB",
        Text = "This is not Blade Ball! 🥀",
        Duration = 3
    })
    return 
end

if not game:IsLoaded() then game.Loaded:Wait() end

local isMobile = UserInputService.TouchEnabled and not (UserInputService.KeyboardEnabled or UserInputService.MouseEnabled)
local Runtime = workspace:FindFirstChild("Runtime")
workspace.ChildAdded:Connect(function(c) if c.Name == "Runtime" then Runtime = c end end)

-- // ========== VARIABLES ==========
local tornadoTimestamp = tick()
local isTornadoActive = false
local parryCount = 0
local Parried = false
local Lerp_Radians = 0
local Last_Warping = tick()
local Curving = tick()
local speedBiasAmount = 8
local spamDistanceOffset = 20
local closestPlayer = nil
local autoParryEnabled = false
local autoSpamEnabled = false
local flyEnabled = false
local espEnabled = false
local bhopEnabled = false
local strafeEnabled = false
local flySpeed = 36
local strafe_speed = 2
local walkSpeed = 16
local visualizerActive = false
local isMobile = UserInputService.TouchEnabled and not (UserInputService.KeyboardEnabled or UserInputService.MouseEnabled)

-- // ========== PARRY FUNCTIONS ==========
local function FireParry()
    if isMobile then
        local ok, btn = pcall(function()
            return LP.PlayerGui.Hotbar.Block
        end)
        if ok and btn then
            for _, s in ipairs(btn:GetDescendants()) do
                if s:IsA("Sound") then s.Volume = 0 end
            end
            pcall(function() firesignal(btn.Activated) end)
            for _, s in ipairs(btn:GetDescendants()) do
                if s:IsA("Sound") then s.Volume = 1 end
            end
        end
    else
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
        task.defer(function()
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
        end)
    end
end

-- // ========== AP ENGINE ==========
local AP_Engine = {}

function AP_Engine.GetBalls()
    local list = {}
    local folder = workspace:FindFirstChild("Balls")
    if not folder then return list end
    for _, inst in ipairs(folder:GetChildren()) do
        if inst:GetAttribute("realBall") then
            inst.CanCollide = false
            table.insert(list, inst)
        end
    end
    return list
end

function AP_Engine.GetBall()
    local folder = workspace:FindFirstChild("Balls")
    if not folder then return nil end
    for _, inst in ipairs(folder:GetChildren()) do
        if inst:GetAttribute("realBall") then
            inst.CanCollide = false
            return inst
        end
    end
    return nil
end

function AP_Engine.ClosestPlayer()
    local maxDist = math.huge
    local found = nil
    local alive = workspace:FindFirstChild("Alive")
    if not alive then return nil end
    for _, ent in ipairs(alive:GetChildren()) do
        if tostring(ent) ~= tostring(LP) and ent.PrimaryPart then
            local d = LP:DistanceFromCharacter(ent.PrimaryPart.Position)
            if d < maxDist then maxDist = d; found = ent end
        end
    end
    closestPlayer = found
    return found
end

function AP_Engine.GetBallProperties()
    local ball = AP_Engine.GetBall()
    if not ball then return { Velocity=Vector3.zero, Direction=Vector3.zero, Distance=0, Dot=0 } end
    local char = LP.Character
    if not char or not char.PrimaryPart then return { Velocity=Vector3.zero, Direction=Vector3.zero, Distance=0, Dot=0 } end
    local dir = (char.PrimaryPart.Position - ball.Position).Unit
    local dist = (char.PrimaryPart.Position - ball.Position).Magnitude
    return { Velocity=Vector3.zero, Direction=dir, Distance=dist, Dot=0 }
end

function AP_Engine.GetEntityProperties()
    AP_Engine.ClosestPlayer()
    if not closestPlayer then return false end
    local char = LP.Character
    if not char or not char.PrimaryPart then return false end
    return {
        Velocity = closestPlayer.PrimaryPart.Velocity,
        Direction = (char.PrimaryPart.Position - closestPlayer.PrimaryPart.Position).Unit,
        Distance = (char.PrimaryPart.Position - closestPlayer.PrimaryPart.Position).Magnitude,
    }
end

function AP_Engine.Lerp(a, b, t) return a + (b - a) * t end

function AP_Engine.IsCurved()
    local ball = AP_Engine.GetBall(); if not ball then return false end
    local zoomies = ball:FindFirstChild("zoomies"); if not zoomies then return false end
    local char = LP.Character; if not char or not char.PrimaryPart then return false end
    local velocity = zoomies.VectorVelocity
    local ballDir = velocity.Unit
    local direction = (char.PrimaryPart.Position - ball.Position).Unit
    local dot = direction:Dot(ballDir)
    local speed = velocity.Magnitude
    local speedThreshold = math.min(speed / 100, 40)
    local dirDiff = (ballDir - velocity).Unit
    local dirSimilarity = direction:Dot(dirDiff)
    local dotDiff = dot - dirSimilarity
    local distance = (char.PrimaryPart.Position - ball.Position).Magnitude
    local pings = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
    local dotThreshold = 0.5 - (pings / 1000)
    local reachTime = distance / speed - (pings / 1000)
    local ballDistThresh = 15 - math.min(distance / 1000, 15) + speedThreshold
    local clampedDot = math.clamp(dot, -1, 1)
    local radians = math.rad(math.asin(clampedDot))
    Lerp_Radians = AP_Engine.Lerp(Lerp_Radians, radians, 0.8)
    if speed > 100 and reachTime > pings / 10 then
        ballDistThresh = math.max(ballDistThresh - 15, 15)
    end
    if distance < ballDistThresh then return false end
    if dotDiff < dotThreshold then return true end
    if Lerp_Radians < 0.018 then Last_Warping = tick() end
    if (tick() - Last_Warping) < (reachTime / 1.5) then return true end
    if (tick() - Curving) < (reachTime / 1.5) then return true end
    return dot < dotThreshold
end

function AP_Engine.ShouldParry(ball)
    if not ball then return false end
    local char = LP.Character; if not char or not char.PrimaryPart then return false end
    local zoomies = ball:FindFirstChild("zoomies"); if not zoomies then return false end
    if ball:GetAttribute("target") ~= tostring(LP) then return false end
    if ball:FindFirstChild("ComboCounter") then return false end
    if ball:FindFirstChild("AeroDynamicSlashVFX") then
        Debris:AddItem(ball.AeroDynamicSlashVFX, 0)
        tornadoTimestamp = tick()
    end
    if Runtime and Runtime:FindFirstChild("Tornado") then
        local dur = (Runtime.Tornado:GetAttribute("TornadoTime") or 1) + 0.314159
        if (tick() - tornadoTimestamp) < dur then return false end
    end
    local velocity = zoomies.VectorVelocity
    local speed = velocity.Magnitude
    local distance = (char.PrimaryPart.Position - ball.Position).Magnitude
    local ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue() / 10
    local speedBias = math.min(speed / 20, speedBiasAmount)
    local triggerDist = speed / 2.9 + ping - speedBias
    local oneBall = AP_Engine.GetBall()
    if oneBall and oneBall:GetAttribute("target") == tostring(LP) and AP_Engine.IsCurved() then
        return false
    end
    if char.PrimaryPart:FindFirstChild("SingularityCape") then return false end
    return distance <= triggerDist
end

function AP_Engine.SpamService(spamData)
    local ball = AP_Engine.GetBall(); if not ball then return 0 end
    AP_Engine.ClosestPlayer(); if not closestPlayer then return 0 end
    local result = 0
    local alv = ball.AssemblyLinearVelocity
    local mag = alv.Magnitude
    local approachDot = (LP.Character.PrimaryPart.Position - ball.Position).Unit:Dot(alv.Unit)
    local distToClose = LP:DistanceFromCharacter(closestPlayer.PrimaryPart.Position)
    local adjPing = spamData.Ping + math.min(mag / 6.5, 95)
    if adjPing < spamData.Entity_Properties.Distance then return result end
    if adjPing < spamData.Ball_Properties.Distance then return result end
    if adjPing < distToClose then return result end
    local speedPenalty = 5 - math.min(mag / 5, 5)
    return adjPing - math.clamp(approachDot, -1, 0) * speedPenalty
end

-- // ========== BALL TRACKER ==========
local function CreateBallTracker(p)
    local tracker = { activeBalls={}, ballConns={}, folderConns={}, wsConn=nil }
    local function onAdded(ball)
        if not ball:IsA("Part") then return end
        if not (ball:GetAttribute("realBall")==true or ball.Name:match("^%d+$")) then return end
        if not ball.Parent then return end
        if ball.Parent.Name ~= "Balls" and ball.Parent.Name ~= "TrainingBalls" then return end
        if ball:GetAttribute("target") == p.Name then tracker.activeBalls[ball] = true end
        tracker.ballConns[ball] = ball:GetAttributeChangedSignal("target"):Connect(function()
            tracker.activeBalls[ball] = (ball:GetAttribute("target") == p.Name) or nil
        end)
        ball.AncestryChanged:Connect(function(_, par)
            if not par then
                if tracker.ballConns[ball] then tracker.ballConns[ball]:Disconnect() end
                tracker.ballConns[ball] = nil; tracker.activeBalls[ball] = nil
            end
        end)
    end
    local function onRemoved(ball)
        if tracker.ballConns[ball] then tracker.ballConns[ball]:Disconnect() end
        tracker.ballConns[ball] = nil; tracker.activeBalls[ball] = nil
    end
    local function connectFolder(folder)
        if tracker.folderConns[folder] then return end
        for _, b in ipairs(folder:GetChildren()) do onAdded(b) end
        tracker.folderConns[folder] = {
            a = folder.ChildAdded:Connect(onAdded),
            r = folder.ChildRemoved:Connect(onRemoved),
        }
    end
    tracker.wsConn = workspace.ChildAdded:Connect(function(c)
        if c.Name=="Balls" or c.Name=="TrainingBalls" then connectFolder(c) end
    end)
    for _, c in ipairs(workspace:GetChildren()) do
        if c.Name=="Balls" or c.Name=="TrainingBalls" then connectFolder(c) end
    end
    function tracker:GetActiveBalls()
        local list = {}
        for ball in pairs(self.activeBalls) do
            if ball and ball.Parent then table.insert(list, ball)
            else self.activeBalls[ball] = nil end
        end
        return list
    end
    function tracker:Destroy()
        if self.wsConn then self.wsConn:Disconnect() end
        for _, conns in pairs(self.folderConns) do conns.a:Disconnect(); conns.r:Disconnect() end
        for _, c in pairs(self.ballConns) do c:Disconnect() end
        self.ballConns = {}; self.activeBalls = {}
    end
    return tracker
end

local BallTracker = CreateBallTracker(LP)

local function HasActiveBall() return #BallTracker:GetActiveBalls() > 0 end

local autoParryConns = {}

local function cleanupLoop(name)
    if not autoParryConns[name] then return end
    for _, c in ipairs(autoParryConns[name]) do
        if c and c.Connected then c:Disconnect() end
    end
    autoParryConns[name] = nil
end

local function CreateAutoParryLoop(name, action, instant)
    cleanupLoop(name)
    local conns = {}
    table.insert(conns, RunService.PreSimulation:Connect(function()
        if not getgenv()[name] then return end
        local char = LP.Character; if not char or not char.PrimaryPart then return end
        if Parried then return end
        for _, ball in ipairs(AP_Engine.GetBalls()) do
            if AP_Engine.ShouldParry(ball) then
                action()
                Parried = true
                ball:GetAttributeChangedSignal("target"):Once(function() Parried = false end)
                parryCount += 1
                task.delay(0.5, function() if parryCount > 0 then parryCount -= 1 end end)
                break
            end
        end
    end))
    if instant then
        table.insert(conns, RunService.RenderStepped:Connect(function()
            if not getgenv()[name] then return end
            if HasActiveBall() then
                local ball = AP_Engine.GetBall()
                if ball and AP_Engine.ShouldParry(ball) then action() end
            end
        end))
    end
    autoParryConns[name] = conns
end

-- // ========== TOGGLE AUTO SPAM ==========
local function toggleAutoSpam(state)
    if state == autoSpamEnabled then return end
    autoSpamEnabled = state
    if autoSpamEnabled then
        local function doSpam()
            local char = LP.Character; if not char or not char.PrimaryPart then return end
            local ball = AP_Engine.GetBall(); if not ball then return end
            local zoomies = ball:FindFirstChild("zoomies"); if not zoomies then return end
            AP_Engine.ClosestPlayer(); if not closestPlayer then return end
            local rawPing = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
            local clampedPing = math.clamp(rawPing / 10, 10, 16)
            local spamCtx = {
                Ball_Properties = AP_Engine.GetBallProperties(),
                Entity_Properties = AP_Engine.GetEntityProperties(),
                Ping = clampedPing,
            }
            local score = AP_Engine.SpamService(spamCtx)
            local ballDist = LP:DistanceFromCharacter(ball.Position)
            local plrDist = LP:DistanceFromCharacter(closestPlayer.PrimaryPart.Position)
            local tgtModel = workspace.Alive and workspace.Alive:FindFirstChild(ball:GetAttribute("target"))
            if tgtModel and score >= plrDist and score >= ballDist then
                if ballDist <= score + spamDistanceOffset and parryCount > 1 then
                    FireParry()
                end
            end
        end
        autoSpamConns[1] = RunService.PreSimulation:Connect(function() if autoSpamEnabled then doSpam() end end)
        autoSpamConns[2] = RunService.RenderStepped:Connect(function() if autoSpamEnabled then doSpam() end end)
        autoSpamConns[3] = RunService.Heartbeat:Connect(function() if autoSpamEnabled then doSpam() end end)
    else
        for _, c in ipairs(autoSpamConns) do
            if c and c.Connected then c:Disconnect() end
        end
        autoSpamConns = {}
    end
end

-- // ========== CREATE RAYFIELD WINDOW ==========
local Window = Rayfield:CreateWindow({
    Name = "ELITE HUB | BLADE BALL 🥀",
    Icon = 111242474897847,  -- // Your logo ID
    LoadingTitle = "ELITE HUB",
    LoadingSubtitle = "by marcus",
    Theme = "Default",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "EliteHubBladeBall",
        FileName = "Settings"
    },
    Keybind = {
        Enabled = true,
        Key = Enum.KeyCode.RightShift,
        HoldToInteract = false
    }
})

-- // ========== TABS ==========
local CombatTab = Window:CreateTab("⚔️ COMBAT")
local MovementTab = Window:CreateTab("💨 MOVEMENT")
local VisualTab = Window:CreateTab("👁️ VISUAL")
local MiscTab = Window:CreateTab("🎮 MISC")
local SettingsTab = Window:CreateTab("⚙️ SETTINGS")

-- // ========== COMBAT TAB ==========
CombatTab:CreateSection("🛡️ AUTO PARRY")

CombatTab:CreateToggle({
    Name = "Auto Parry",
    CurrentValue = false,
    Callback = function(v)
        getgenv().ap_elite = v
        if v then
            CreateAutoParryLoop("ap_elite", FireParry, false)
            StarterGui:SetCore("SendNotification", {
                Title = "🛡️ ELITE HUB",
                Text = "Auto Parry ENABLED 🥀",
                Duration = 2
            })
        else
            cleanupLoop("ap_elite")
            StarterGui:SetCore("SendNotification", {
                Title = "🛡️ ELITE HUB",
                Text = "Auto Parry DISABLED",
                Duration = 2
            })
        end
    end
})

CombatTab:CreateToggle({
    Name = "Instant Mode",
    CurrentValue = false,
    Callback = function(v)
        getgenv().ap_elite_instant = v
        if v then
            CreateAutoParryLoop("ap_elite_instant", FireParry, true)
            StarterGui:SetCore("SendNotification", {
                Title = "⚡ ELITE HUB",
                Text = "Instant Mode ENABLED 🥀",
                Duration = 2
            })
        else
            cleanupLoop("ap_elite_instant")
        end
    end
})

CombatTab:CreateSlider({
    Name = "Speed Bias",
    Range = {0, 20},
    Increment = 1,
    Suffix = "Bias",
    CurrentValue = 8,
    Callback = function(v)
        speedBiasAmount = v
    end
})

CombatTab:CreateDivider()

CombatTab:CreateSection("🔄 AUTO SPAM")

CombatTab:CreateToggle({
    Name = "Auto Spam",
    CurrentValue = false,
    Callback = function(v)
        toggleAutoSpam(v)
        if v then
            StarterGui:SetCore("SendNotification", {
                Title = "🔄 ELITE HUB",
                Text = "Auto Spam ENABLED 🥀",
                Duration = 2
            })
        else
            StarterGui:SetCore("SendNotification", {
                Title = "🔄 ELITE HUB",
                Text = "Auto Spam DISABLED",
                Duration = 2
            })
        end
    end
})

CombatTab:CreateSlider({
    Name = "Spam Distance Offset",
    Range = {5, 60},
    Increment = 1,
    Suffix = "Offset",
    CurrentValue = 20,
    Callback = function(v)
        spamDistanceOffset = v
    end
})

CombatTab:CreateDivider()

CombatTab:CreateSection("📊 LIVE INFO")

local pingLabel = CombatTab:CreateParagraph({
    Title = "PING",
    Content = "Loading..."
})

local parryLabel = CombatTab:CreateParagraph({
    Title = "PARRIES",
    Content = "0"
})

local speedLabel = CombatTab:CreateParagraph({
    Title = "BALL SPEED",
    Content = "0"
})

RunService.Heartbeat:Connect(function()
    local ping = pcall(function() return math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()) end) and math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()) or 0
    local ball = AP_Engine.GetBall()
    local speed = 0
    if ball then
        local z = ball:FindFirstChild("zoomies")
        if z then speed = math.floor(z.VectorVelocity.Magnitude) end
    end
    pingLabel.Content = ping .. "ms"
    parryLabel.Content = tostring(parryCount)
    speedLabel.Content = tostring(speed)
end)

CombatTab:CreateDivider()

CombatTab:CreateSection("👁️ VISUALISER")

CombatTab:CreateToggle({
    Name = "Parry Range Visualiser",
    CurrentValue = false,
    Callback = function(v)
        visualizerActive = v
        if v then
            StarterGui:SetCore("SendNotification", {
                Title = "👁️ ELITE HUB",
                Text = "Visualiser ENABLED 🥀",
                Duration = 2
            })
        else
            StarterGui:SetCore("SendNotification", {
                Title = "👁️ ELITE HUB",
                Text = "Visualiser DISABLED",
                Duration = 2
            })
        end
    end
})

local visualizerPart = Instance.new("Part")
visualizerPart.Shape = Enum.PartType.Ball
visualizerPart.Anchored = true
visualizerPart.CanCollide = false
visualizerPart.Material = Enum.Material.ForceField
visualizerPart.Transparency = 0.5
visualizerPart.Size = Vector3.new(0, 0, 0)
visualizerPart.Parent = workspace

RunService.RenderStepped:Connect(function()
    if not visualizerActive then return end
    local char = LP.Character
    if not char or not char.PrimaryPart then return end
    local ball = AP_Engine.GetBall()
    if ball and char.PrimaryPart then
        local spd = (ball:FindFirstChild("zoomies") and ball.zoomies.VectorVelocity.Magnitude) or 0
        local radius = math.clamp(spd / 2.4 + 10, 15, 200)
        visualizerPart.Size = Vector3.new(radius, radius, radius)
        visualizerPart.CFrame = char.PrimaryPart.CFrame
    else
        visualizerPart.Size = Vector3.new(0, 0, 0)
    end
end)

-- // ========== MOVEMENT TAB ==========
MovementTab:CreateSection("🏃 MOVEMENT")

local bhopConn = nil
MovementTab:CreateToggle({
    Name = "BHop",
    CurrentValue = false,
    Callback = function(v)
        bhopEnabled = v
        if v then
            bhopConn = RunService.PostSimulation:Connect(function()
                local char = LP.Character
                if not char then return end
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum and hum:GetState() ~= Enum.HumanoidStateType.Freefall then
                    if hum.MoveDirection.Magnitude > 0 and hum.FloorMaterial ~= Enum.Material.Air then
                        hum:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end
            end)
            StarterGui:SetCore("SendNotification", {
                Title = "🏃 ELITE HUB",
                Text = "BHop ENABLED 🥀",
                Duration = 2
            })
        else
            if bhopConn then bhopConn:Disconnect(); bhopConn = nil end
        end
    end
})

local strafeConn = nil
MovementTab:CreateToggle({
    Name = "Strafe",
    CurrentValue = false,
    Callback = function(v)
        strafeEnabled = v
        if v then
            strafeConn = RunService.Heartbeat:Connect(function(dt)
                local char = LP.Character
                if not char or not char.PrimaryPart then return end
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum and hum.MoveDirection.Magnitude ~= 0 then
                    char:TranslateBy(hum.MoveDirection * strafe_speed * 2 * dt)
                end
            end)
            StarterGui:SetCore("SendNotification", {
                Title = "🏃 ELITE HUB",
                Text = "Strafe ENABLED 🥀",
                Duration = 2
            })
        else
            if strafeConn then strafeConn:Disconnect(); strafeConn = nil end
        end
    end
})

MovementTab:CreateSlider({
    Name = "Strafe Speed",
    Range = {1, 40},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 2,
    Callback = function(v)
        strafe_speed = v
    end
})

MovementTab:CreateDivider()

MovementTab:CreateSection("⚡ SPEED")

MovementTab:CreateToggle({
    Name = "Speed Boost",
    CurrentValue = false,
    Callback = function(v)
        local char = LP.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = v and walkSpeed or 16
        end
        if v then
            StarterGui:SetCore("SendNotification", {
                Title = "⚡ ELITE HUB",
                Text = "Speed Boost ENABLED 🥀",
                Duration = 2
            })
        end
    end
})

MovementTab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 120},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Callback = function(v)
        walkSpeed = v
        local char = LP.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = v end
    end
})

MovementTab:CreateDivider()

MovementTab:CreateSection("🪰 FLY")

local flyConn = nil
local bodyVel, bodyGyro

MovementTab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Callback = function(v)
        flyEnabled = v
        if v then
            local char = LP.Character
            if not char then return end
            local root = char:FindFirstChild("HumanoidRootPart")
            if not root then return end
            bodyVel = Instance.new("BodyVelocity", root)
            bodyVel.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            bodyGyro = Instance.new("BodyGyro", root)
            bodyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
            bodyGyro.P = 1e4
            flyConn = RunService.Heartbeat:Connect(function()
                if not flyEnabled then return end
                local cf = Camera.CFrame
                local dir = Vector3.zero
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += cf.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= cf.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= cf.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += cf.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.new(0, 1, 0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then dir -= Vector3.new(0, 1, 0) end
                bodyVel.Velocity = dir.Magnitude > 0 and dir.Unit * flySpeed or Vector3.zero
                bodyGyro.CFrame = cf
            end)
            StarterGui:SetCore("SendNotification", {
                Title = "🪰 ELITE HUB",
                Text = "Fly ENABLED 🥀",
                Duration = 2
            })
        else
            if flyConn then flyConn:Disconnect(); flyConn = nil end
            if bodyVel then bodyVel:Destroy(); bodyVel = nil end
            if bodyGyro then bodyGyro:Destroy(); bodyGyro = nil end
        end
    end
})

MovementTab:CreateSlider({
    Name = "Fly Speed",
    Range = {10, 200},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 36,
    Callback = function(v)
        flySpeed = v
    end
})

MovementTab:CreateDivider()

MovementTab:CreateSection("⚡ PERFORMANCE")

local noRenderConn = nil
MovementTab:CreateToggle({
    Name = "No Render (FPS Boost)",
    CurrentValue = false,
    Callback = function(v)
        pcall(function()
            LP.PlayerScripts.EffectScripts.ClientFX.Disabled = v
        end)
        if v then
            noRenderConn = workspace.Runtime and workspace.Runtime.ChildAdded:Connect(function(child)
                Debris:AddItem(child, 0)
            end)
            StarterGui:SetCore("SendNotification", {
                Title = "⚡ ELITE HUB",
                Text = "No Render ENABLED 🥀",
                Duration = 2
            })
        else
            if noRenderConn then noRenderConn:Disconnect(); noRenderConn = nil end
        end
    end
})

-- // ========== VISUAL TAB ==========
VisualTab:CreateSection("👁️ ESP")

local espHLs = {}

VisualTab:CreateToggle({
    Name = "Player ESP",
    CurrentValue = false,
    Callback = function(v)
        espEnabled = v
        if v then
            RunService:BindToRenderStep("EliteESP", 201, function()
                local alive = workspace:FindFirstChild("Alive")
                if not alive then return end
                for model, hl in pairs(espHLs) do
                    if not (model and model.Parent) then
                        pcall(function() hl:Destroy() end)
                        espHLs[model] = nil
                    end
                end
                for _, model in ipairs(alive:GetChildren()) do
                    if tostring(model.Name) ~= tostring(LP.Name) then
                        if not espHLs[model] then
                            local hl = Instance.new("Highlight")
                            hl.Adornee = model
                            hl.FillTransparency = 0.5
                            hl.FillColor = Color3.fromRGB(58, 130, 255)
                            hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                            hl.OutlineTransparency = 0.1
                            hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            hl.Parent = CoreGui
                            espHLs[model] = hl
                        end
                    end
                end
            end)
            StarterGui:SetCore("SendNotification", {
                Title = "👁️ ELITE HUB",
                Text = "ESP ENABLED 🥀",
                Duration = 2
            })
        else
            RunService:UnbindFromRenderStep("EliteESP")
            for model, hl in pairs(espHLs) do pcall(function() hl:Destroy() end) end
            espHLs = {}
        end
    end
})

local ballHL = nil
VisualTab:CreateToggle({
    Name = "Ball ESP",
    CurrentValue = false,
    Callback = function(v)
        if v then
            local ball = AP_Engine.GetBall()
            if ball then
                ballHL = Instance.new("Highlight")
                ballHL.Adornee = ball
                ballHL.FillTransparency = 0.3
                ballHL.FillColor = Color3.fromRGB(255, 80, 80)
                ballHL.OutlineColor = Color3.fromRGB(255, 200, 50)
                ballHL.OutlineTransparency = 0
                ballHL.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                ballHL.Parent = CoreGui
            end
            StarterGui:SetCore("SendNotification", {
                Title = "👁️ ELITE HUB",
                Text = "Ball ESP ENABLED 🥀",
                Duration = 2
            })
        else
            if ballHL then pcall(function() ballHL:Destroy() end); ballHL = nil end
        end
    end
})

VisualTab:CreateDivider()

VisualTab:CreateSection("🌈 FULLBRIGHT")

local origBright, origAmb
VisualTab:CreateToggle({
    Name = "Fullbright",
    CurrentValue = false,
    Callback = function(v)
        if v then
            origBright = Lighting.Brightness
            origAmb = Lighting.Ambient
            Lighting.Brightness = 10
            Lighting.Ambient = Color3.fromRGB(178, 178, 178)
            Lighting.GlobalShadows = false
            StarterGui:SetCore("SendNotification", {
                Title = "🌈 ELITE HUB",
                Text = "Fullbright ENABLED 🥀",
                Duration = 2
            })
        else
            if origBright then Lighting.Brightness = origBright end
            if origAmb then Lighting.Ambient = origAmb end
            Lighting.GlobalShadows = true
        end
    end
})

VisualTab:CreateDivider()

VisualTab:CreateSection("🎯 CHAMS")

local chamHLs = {}
VisualTab:CreateToggle({
    Name = "Chams",
    CurrentValue = false,
    Callback = function(v)
        if v then
            RunService:BindToRenderStep("EliteChams", 202, function()
                local alive = workspace:FindFirstChild("Alive")
                if not alive then return end
                for model, hl in pairs(chamHLs) do
                    if not (model and model.Parent) then pcall(function() hl:Destroy() end); chamHLs[model] = nil end
                end
                for _, model in ipairs(alive:GetChildren()) do
                    if model.Name ~= LP.Name and not chamHLs[model] then
                        local hl = Instance.new("Highlight")
                        hl.Adornee = model
                        hl.FillTransparency = 0
                        hl.FillColor = Color3.fromRGB(255, 60, 80)
                        hl.OutlineTransparency = 1
                        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        hl.Parent = CoreGui
                        chamHLs[model] = hl
                    end
                end
            end)
            StarterGui:SetCore("SendNotification", {
                Title = "🎯 ELITE HUB",
                Text = "Chams ENABLED 🥀",
                Duration = 2
            })
        else
            RunService:UnbindFromRenderStep("EliteChams")
            for _, hl in pairs(chamHLs) do pcall(function() hl:Destroy() end) end
            chamHLs = {}
        end
    end
})

-- // ========== MISC TAB ==========
MiscTab:CreateSection("🎮 MISC")

MiscTab:CreateButton({
    Name = "Open Sword Crate",
    Callback = function()
        pcall(function()
            ReplicatedStorage.Remote.RemoteFunction:InvokeServer("PromptPurchaseCrate", workspace.Spawn.Crates.NormalSwordCrate)
        end)
    end
})

MiscTab:CreateButton({
    Name = "Open Explosion Crate",
    Callback = function()
        pcall(function()
            ReplicatedStorage.Remote.RemoteFunction:InvokeServer("PromptPurchaseCrate", workspace.Spawn.Crates.NormalExplosionCrate)
        end)
    end
})

MiscTab:CreateDivider()

MiscTab:CreateSection("🔄 AUTO RESPAWN")

local autoRespawnEnabled = false
MiscTab:CreateToggle({
    Name = "Auto Respawn",
    CurrentValue = false,
    Callback = function(v)
        autoRespawnEnabled = v
        if v then
            local hum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.Died:Connect(function()
                    if autoRespawnEnabled then task.wait(0.2); LP:LoadCharacter() end
                end)
            end
            StarterGui:SetCore("SendNotification", {
                Title = "🔄 ELITE HUB",
                Text = "Auto Respawn ENABLED 🥀",
                Duration = 2
            })
        end
    end
})

MiscTab:CreateDivider()

MiscTab:CreateSection("🦘 INFINITE JUMP")

local ijConn = nil
MiscTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(v)
        if v then
            ijConn = UserInputService.JumpRequest:Connect(function()
                local char = LP.Character
                if not char then return end
                local hum = char:FindFirstChildOfClass("Humanoid")
                if not hum then return end
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
            end)
            StarterGui:SetCore("SendNotification", {
                Title = "🦘 ELITE HUB",
                Text = "Infinite Jump ENABLED 🥀",
                Duration = 2
            })
        else
            if ijConn then ijConn:Disconnect(); ijConn = nil end
        end
    end
})

MiscTab:CreateDivider()

MiscTab:CreateSection("🔄 SERVER HOP")

MiscTab:CreateButton({
    Name = "Server Hop",
    Callback = function()
        local ts = game:GetService("TeleportService")
        pcall(function()
            ts:Teleport(game.PlaceId, LP)
        end)
    end
})

MiscTab:CreateDivider()

MiscTab:CreateSection("📋 COPY DISCORD")

MiscTab:CreateButton({
    Name = "Copy Discord Link",
    Callback = function()
        setclipboard("https://discord.gg/5RuMCxK3u6")
        StarterGui:SetCore("SendNotification", {
            Title = "📋 ELITE HUB",
            Text = "Discord link copied bitch! 🥀",
            Duration = 2
        })
    end
})

-- // ========== SETTINGS TAB ==========
SettingsTab:CreateSection("⚙️ SETTINGS")

SettingsTab:CreateParagraph({
    Title = "VERSION",
    Content = "v1.0.0 🥀"
})

SettingsTab:CreateParagraph({
    Title = "MADE BY",
    Content = "marcus 🥀"
})

SettingsTab:CreateParagraph({
    Title = "DISCORD",
    Content = "discord.gg/5RuMCxK3u6"
})

SettingsTab:CreateParagraph({
    Title = "DEVICE",
    Content = isMobile and "📱 MOBILE" or "💻 PC"
})

SettingsTab:CreateDivider()

SettingsTab:CreateSection("🔄 RESET")

SettingsTab:CreateButton({
    Name = "Reset All Settings",
    Callback = function()
        if getgenv().ap_elite then
            getgenv().ap_elite = false
            cleanupLoop("ap_elite")
        end
        if getgenv().ap_elite_instant then
            getgenv().ap_elite_instant = false
            cleanupLoop("ap_elite_instant")
        end
        if autoSpamEnabled then toggleAutoSpam(false) end
        if bhopEnabled then bhopEnabled = false; if bhopConn then bhopConn:Disconnect(); bhopConn = nil end end
        if strafeEnabled then strafeEnabled = false; if strafeConn then strafeConn:Disconnect(); strafeConn = nil end end
        if flyEnabled then flyEnabled = false; if flyConn then flyConn:Disconnect(); flyConn = nil end end
        if espEnabled then espEnabled = false; RunService:UnbindFromRenderStep("EliteESP") end
        if visualizerActive then visualizerActive = false end
        if autoRespawnEnabled then autoRespawnEnabled = false end
        if ijConn then ijConn:Disconnect(); ijConn = nil end
        
        StarterGui:SetCore("SendNotification", {
            Title = "🔄 ELITE HUB",
            Text = "All settings reset bitch! 🥀",
            Duration = 2
        })
    end
})

SettingsTab:CreateButton({
    Name = "Unload Script",
    Callback = function()
        if getgenv().ap_elite then cleanupLoop("ap_elite") end
        if getgenv().ap_elite_instant then cleanupLoop("ap_elite_instant") end
        if autoSpamEnabled then toggleAutoSpam(false) end
        if bhopConn then bhopConn:Disconnect() end
        if strafeConn then strafeConn:Disconnect() end
        if flyConn then flyConn:Disconnect() end
        if noRenderConn then noRenderConn:Disconnect() end
        if ijConn then ijConn:Disconnect() end
        RunService:UnbindFromRenderStep("EliteESP")
        RunService:UnbindFromRenderStep("EliteChams")
        if visualizerPart then visualizerPart:Destroy() end
        Window:Destroy()
        StarterGui:SetCore("SendNotification", {
            Title = "🗑️ ELITE HUB",
            Text = "Script unloaded. Goodbye bitch! 🥀",
            Duration = 3
        })
    end
})

-- // ========== CONSOLE OUTPUT ==========
print("████████████████████████████████████████████████████████████")
print("🥀 ELITE HUB v1.0.0 - BLADE BALL LOADED")
print("🛡️ Auto Parry | 💨 Movement | 👁️ ESP | 🎮 Misc")
print("📱 Discord: discord.gg/5RuMCxK3u6")
print("💀 Made by marcus - FUCK YOU IF YOU STEAL THIS")
print("████████████████████████████████████████████████████████████")

StarterGui:SetCore("SendNotification", {
    Title = "ELITE HUB | BLADE BALL",
    Text = "LOADED BITCH! 🥀",
    Duration = 3
})