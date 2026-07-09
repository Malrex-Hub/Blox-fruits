-- // ========== ELITE HUB v1.0.0 | COMPLETE FIXED ==========
-- // discord.gg/5RuMCxK3u6
-- // FUCK YOU IF YOU STEAL THIS SHIT - 9,175 MEMBERS 🥀

-- // ========== SERVICES ==========
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local isMobile = UserInputService.TouchEnabled

-- // ========== HARDCODED MEMBER COUNT ==========
local memberCount = "9,175"

-- // ========== ANIMATED LOADING SCREEN ==========
local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "EliteHubLoading"
loadingGui.Parent = game:GetService("CoreGui")
loadingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
loadingGui.ResetOnSpawn = false

-- // Background
local loadingBg = Instance.new("Frame")
loadingBg.Size = UDim2.new(1, 0, 1, 0)
loadingBg.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
loadingBg.Parent = loadingGui

-- // Animated gradient
local gradientOverlay = Instance.new("Frame")
gradientOverlay.Size = UDim2.new(1, 0, 1, 0)
gradientOverlay.BackgroundColor3 = Color3.fromRGB(10, 10, 18)
gradientOverlay.BackgroundTransparency = 0.5
gradientOverlay.Parent = loadingBg

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(46, 204, 113)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(155, 89, 182)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(46, 204, 113))
})
gradient.Rotation = 45
gradient.Parent = gradientOverlay

local gradientConnection
gradientConnection = RunService.RenderStepped:Connect(function()
    gradient.Rotation = (gradient.Rotation or 0) + 0.2
end)

-- // Main card
local loadingCard = Instance.new("Frame")
loadingCard.Size = UDim2.new(0, 380, 0, 280)
loadingCard.Position = UDim2.new(0.5, -190, 0.5, -140)
loadingCard.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
loadingCard.BackgroundTransparency = 0.2
loadingCard.BorderSizePixel = 0
loadingCard.Parent = loadingBg

local cardCorner = Instance.new("UICorner")
cardCorner.CornerRadius = UDim.new(0, 16)
cardCorner.Parent = loadingCard

-- // Glow border
local glowBorder = Instance.new("Frame")
glowBorder.Size = UDim2.new(1, 4, 1, 4)
glowBorder.Position = UDim2.new(0, -2, 0, -2)
glowBorder.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
glowBorder.BackgroundTransparency = 0.8
glowBorder.BorderSizePixel = 0
glowBorder.Parent = loadingCard

local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(0, 18)
glowCorner.Parent = glowBorder

local glowTween = TweenService:Create(glowBorder, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
    BackgroundTransparency = 0.4
})
glowTween:Play()

-- // Logo
local logoIcon = Instance.new("TextLabel")
logoIcon.Size = UDim2.new(0, 60, 0, 60)
logoIcon.Position = UDim2.new(0.5, -30, 0, 20)
logoIcon.BackgroundTransparency = 1
logoIcon.Text = "🔥"
logoIcon.TextColor3 = Color3.fromRGB(255, 200, 50)
logoIcon.Font = Enum.Font.GothamBold
logoIcon.TextSize = 48
logoIcon.TextScaled = true
logoIcon.Parent = loadingCard

local bounceTween = TweenService:Create(logoIcon, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out, -1, true), {
    Position = UDim2.new(0.5, -30, 0, 15)
})
bounceTween:Play()

-- // Title
local logoText = Instance.new("TextLabel")
logoText.Size = UDim2.new(1, 0, 0, 40)
logoText.Position = UDim2.new(0, 0, 0, 80)
logoText.BackgroundTransparency = 1
logoText.Text = "ELITE HUB"
logoText.TextColor3 = Color3.fromRGB(255, 255, 255)
logoText.Font = Enum.Font.GothamBold
logoText.TextSize = 32
logoText.TextScaled = true
logoText.Parent = loadingCard

-- // Subtitle
local subtitleText = Instance.new("TextLabel")
subtitleText.Size = UDim2.new(1, 0, 0, 20)
subtitleText.Position = UDim2.new(0, 0, 0, 115)
subtitleText.BackgroundTransparency = 1
subtitleText.Text = "JAILBREAK EDITION 🥀"
subtitleText.TextColor3 = Color3.fromRGB(46, 204, 113)
subtitleText.Font = Enum.Font.Gotham
subtitleText.TextSize = 14
subtitleText.TextScaled = true
subtitleText.Parent = loadingCard

-- // Status
local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1, -40, 0, 25)
statusText.Position = UDim2.new(0, 20, 0, 145)
statusText.BackgroundTransparency = 1
statusText.Text = "INITIALIZING..."
statusText.TextColor3 = Color3.fromRGB(180, 180, 200)
statusText.Font = Enum.Font.Gotham
statusText.TextSize = 13
statusText.TextXAlignment = Enum.TextXAlignment.Center
statusText.Parent = loadingCard

-- // Progress bar
local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0.85, 0, 0, 6)
barBg.Position = UDim2.new(0.075, 0, 0, 180)
barBg.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
barBg.BorderSizePixel = 0
barBg.Parent = loadingCard

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(1, 0)
barCorner.Parent = barBg

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
barFill.BorderSizePixel = 0
barFill.Parent = barBg

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(1, 0)
fillCorner.Parent = barFill

-- // Progress text
local progressText = Instance.new("TextLabel")
progressText.Size = UDim2.new(1, 0, 0, 20)
progressText.Position = UDim2.new(0, 0, 0, 195)
progressText.BackgroundTransparency = 1
progressText.Text = "0%"
progressText.TextColor3 = Color3.fromRGB(150, 150, 180)
progressText.Font = Enum.Font.Gotham
progressText.TextSize = 11
progressText.TextXAlignment = Enum.TextXAlignment.Center
progressText.Parent = loadingCard

-- // Version
local versionText = Instance.new("TextLabel")
versionText.Size = UDim2.new(1, 0, 0, 20)
versionText.Position = UDim2.new(0, 0, 0, 225)
versionText.BackgroundTransparency = 1
versionText.Text = "v1.0.0 | " .. memberCount .. " MEMBERS"
versionText.TextColor3 = Color3.fromRGB(100, 100, 130)
versionText.Font = Enum.Font.Gotham
versionText.TextSize = 10
versionText.TextXAlignment = Enum.TextXAlignment.Center
versionText.Parent = loadingCard

-- // Skip button
local skipBtn = Instance.new("TextButton")
skipBtn.Size = UDim2.new(0, 100, 0, 28)
skipBtn.Position = UDim2.new(0.5, -50, 0, 252)
skipBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
skipBtn.BackgroundTransparency = 0.5
skipBtn.Text = "SKIP 🥀"
skipBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
skipBtn.Font = Enum.Font.GothamBold
skipBtn.TextSize = 12
skipBtn.Parent = loadingCard

local skipCorner = Instance.new("UICorner")
skipCorner.CornerRadius = UDim.new(0, 8)
skipCorner.Parent = skipBtn

skipBtn.MouseEnter:Connect(function()
    TweenService:Create(skipBtn, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play()
end)
skipBtn.MouseLeave:Connect(function()
    TweenService:Create(skipBtn, TweenInfo.new(0.2), {BackgroundTransparency = 0.5}):Play()
end)

local skipPressed = false
skipBtn.MouseButton1Click:Connect(function() skipPressed = true end)

-- // Loading steps
local steps = {
    { text = "🚀 INITIALIZING ENGINE...", progress = 10 },
    { text = "🔓 BYPASSING JAILBREAK...", progress = 25 },
    { text = "⚡ LOADING MODULES...", progress = 40 },
    { text = "👁️ CONFIGURING ESP...", progress = 55 },
    { text = "🛠️ SETTING UP TOOLS...", progress = 70 },
    { text = "🎯 LOADING ROBBERY REMOVALS...", progress = 85 },
    { text = "🔥 FUCKING READY 🥀", progress = 100 }
}

local currentProgress = 0

for _, step in ipairs(steps) do
    if skipPressed then break end
    statusText.Text = step.text
    local targetProgress = step.progress
    local progressDifference = targetProgress - currentProgress
    for i = 1, 10 do
        if skipPressed then break end
        local newProgress = currentProgress + (progressDifference * (i / 10))
        TweenService:Create(barFill, TweenInfo.new(0.05), {Size = UDim2.new(newProgress / 100, 0, 1, 0)}):Play()
        progressText.Text = string.format("%.0f%%", newProgress)
        task.wait(0.05)
    end
    currentProgress = targetProgress
    task.wait(0.2)
end

-- // 100% then destroy loading screen
TweenService:Create(barFill, TweenInfo.new(0.3), {Size = UDim2.new(1, 0, 1, 0)}):Play()
progressText.Text = "100%"
task.wait(0.3)

-- // Fade out the BACKGROUND FRAME
local fadeTween = TweenService:Create(loadingBg, TweenInfo.new(0.4), {BackgroundTransparency = 1})
fadeTween:Play()
fadeTween.Completed:Connect(function()
    loadingGui:Destroy()
    if gradientConnection then gradientConnection:Disconnect() end
    -- // NOW LOAD RAYFIELD
    loadRayfield()
end)

-- // ========== FUNCTION TO LOAD RAYFIELD AFTER LOADING SCREEN ==========
function loadRayfield()
    -- // Load Rayfield with pcall to catch errors
    local success, Rayfield = pcall(function()
        return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    end)
    
    if not success or not Rayfield then
        -- // Fallback if Rayfield fails
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "ELITE HUB",
            Text = "Rayfield failed to load, using fallback mode",
            Duration = 3
        })
        return
    end
    
    task.wait(1)
    
    local Window = Rayfield:CreateWindow({
        Name = "ELITE HUB | JAILBREAK 🥀",
        Icon = 0,
        LoadingTitle = "ELITE HUB",
        LoadingSubtitle = "FUCK SHIT UP",
        Theme = "Dark",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = "EliteHub",
            FileName = "Settings"
        },
        Keybind = {
            Enabled = true,
            Key = Enum.KeyCode.RightShift,
            HoldToInteract = false
        }
    })
    
    local MainTab = Window:CreateTab("MAIN (FUCK SHIT UP)")
    local ESPTab = Window:CreateTab("ESP (SEE BITCHES)")
    local MiscTab = Window:CreateTab("MISC (EXTRA SHIT)")
    local FlyTab = Window:CreateTab("FLY (ZOOM BITCH)")
    local RobberiesTab = Window:CreateTab("ROBBERIES (STEAL THAT SHIT)")
    
    -- // ========== GIVE ITEMS ==========
    MainTab:CreateSection("GIVE ITEMS")
    
    MainTab:CreateButton({
        Name = "GIVE ITEMS (PISTOL, BATON, SHOTGUN, SWAT)",
        Callback = function()
            if Workspace:FindFirstChild('Givers') then
                local detectors = {}
                local tempPart = Instance.new('Part', Workspace)
                tempPart.Anchored = true
                tempPart.CanCollide = false
                tempPart.CFrame = LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame
                for _, giver in pairs(Workspace.Givers:GetChildren()) do
                    local clickDetector = giver:FindFirstChildOfClass('ClickDetector')
                    if clickDetector then
                        local data = { ClickDetector = clickDetector, OriginalParent = giver }
                        clickDetector.Parent = tempPart
                        data.Event = clickDetector.MouseClick:Connect(function()
                            clickDetector.Parent = giver
                        end)
                        table.insert(detectors, data)
                    end
                end
                task.wait(10)
                for _, data in pairs(detectors) do
                    data.ClickDetector.Parent = data.OriginalParent
                    data.Event:Disconnect()
                end
            end
        end
    })
    
    MainTab:CreateButton({
        Name = "GIVE GLIDER (FLY BITCH)",
        Callback = function()
            if Workspace:FindFirstChild('Givers') then
                local detectors = {}
                local tempPart = Instance.new('Part', Workspace)
                tempPart.Anchored = true
                tempPart.CanCollide = false
                tempPart.CFrame = LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame
                local glider = Workspace.Givers:FindFirstChild('Glider')
                local clickDetector = glider and glider:FindFirstChildOfClass('ClickDetector')
                if clickDetector then
                    local data = { ClickDetector = clickDetector, OriginalParent = glider }
                    clickDetector.Parent = tempPart
                    data.Event = clickDetector.MouseClick:Connect(function()
                        clickDetector.Parent = glider
                    end)
                    table.insert(detectors, data)
                end
                task.wait(10)
                for _, data in pairs(detectors) do
                    data.ClickDetector.Parent = data.OriginalParent
                    data.Event:Disconnect()
                end
            end
        end
    })
    
    -- // ========== FLY (MOBILE + PC) ==========
    local flyEnabled = false
    local flySpeed = 50
    local flyConnection = nil
    local flyBodyVelocity = nil
    local flyBodyGyro = nil
    local flyUp = false
    local flyDown = false
    
    local function createFly()
        local character = LocalPlayer.Character
        if not character then return end
        local rootPart = character:FindFirstChild('HumanoidRootPart')
        if not rootPart then return end
        flyBodyVelocity = Instance.new("BodyVelocity")
        flyBodyVelocity.MaxForce = Vector3.new(1/0, 1/0, 1/0)
        flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
        flyBodyVelocity.Parent = rootPart
        flyBodyGyro = Instance.new("BodyGyro")
        flyBodyGyro.MaxTorque = Vector3.new(1/0, 1/0, 1/0)
        flyBodyGyro.P = 10000
        flyBodyGyro.CFrame = rootPart.CFrame
        flyBodyGyro.Parent = rootPart
        local fakeSeat = Instance.new("VehicleSeat")
        fakeSeat.Name = "FakeFlySeat"
        fakeSeat.Parent = character
        fakeSeat:SetAttribute("IsFake", true)
        return true
    end
    
    local function destroyFly()
        if flyBodyVelocity then flyBodyVelocity:Destroy() end
        if flyBodyGyro then flyBodyGyro:Destroy() end
        if flyConnection then flyConnection:Disconnect() end
        flyBodyVelocity = nil
        flyBodyGyro = nil
        flyConnection = nil
        local character = LocalPlayer.Character
        if character then
            local fakeSeat = character:FindFirstChild("FakeFlySeat")
            if fakeSeat then fakeSeat:Destroy() end
        end
    end
    
    local function getMoveDirection()
        local moveDirection = Vector3.new(0, 0, 0)
        local camera = Workspace.CurrentCamera
        if not camera then return moveDirection end
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
        if flyUp then
            moveDirection = moveDirection + Vector3.new(0, 1, 0)
        end
        if flyDown then
            moveDirection = moveDirection + Vector3.new(0, -1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDirection = moveDirection + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            moveDirection = moveDirection + Vector3.new(0, -1, 0)
        end
        return moveDirection
    end
    
    local function toggleFly(enabled)
        flyEnabled = enabled
        if enabled then
            if createFly() then
                flyConnection = RunService.RenderStepped:Connect(function()
                    if not flyEnabled then return end
                    local character = LocalPlayer.Character
                    if not character then return end
                    local rootPart = character:FindFirstChild('HumanoidRootPart')
                    if not rootPart or not flyBodyVelocity or not flyBodyGyro then return end
                    local moveDirection = getMoveDirection()
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
                    local camera = Workspace.CurrentCamera
                    if camera then
                        flyBodyGyro.CFrame = CFrame.new(rootPart.Position, rootPart.Position + camera.CFrame.LookVector)
                    end
                end)
            end
        else
            destroyFly()
        end
    end
    
    FlyTab:CreateSection("FLY CONTROLS")
    FlyTab:CreateToggle({
        Name = "FLY (ZOOM BITCH)",
        CurrentValue = false,
        Callback = function(v) toggleFly(v) end
    })
    FlyTab:CreateSlider({
        Name = "FLY SPEED",
        Range = {10, 200},
        Increment = 5,
        Suffix = "Speed",
        CurrentValue = 50,
        Callback = function(v) flySpeed = v end
    })
    
    -- // FIXED: Mobile touch buttons without TouchStarted
    if isMobile then
        FlyTab:CreateSection("MOBILE CONTROLS")
        local function createTouchButton(text, position, callback)
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 80, 0, 80)
            button.Position = position
            button.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
            button.BackgroundTransparency = 0.3
            button.Text = text
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.GothamBold
            button.TextSize = 20
            button.Parent = game:GetService("CoreGui")
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(1, 0)
            corner.Parent = button
            
            -- // FIX: Only use MouseButton1 (works on mobile too)
            button.MouseButton1Down:Connect(function()
                callback(true)
            end)
            button.MouseButton1Up:Connect(function()
                callback(false)
            end)
            
            -- // Also handle touch with InputBegan (more reliable)
            local function onInputBegan(input)
                if input.UserInputType == Enum.UserInputType.Touch then
                    local pos = input.Position
                    local absPos = button.AbsolutePosition
                    local size = button.AbsoluteSize
                    if pos.X >= absPos.X and pos.X <= absPos.X + size.X and
                       pos.Y >= absPos.Y and pos.Y <= absPos.Y + size.Y then
                        callback(true)
                    end
                end
            end
            
            local function onInputEnded(input)
                if input.UserInputType == Enum.UserInputType.Touch then
                    callback(false)
                end
            end
            
            UserInputService.InputBegan:Connect(onInputBegan)
            UserInputService.InputEnded:Connect(onInputEnded)
        end
        
        createTouchButton("⬆", UDim2.new(0.85, 0, 0.5, -50), function(pressed) flyUp = pressed end)
        createTouchButton("⬇", UDim2.new(0.85, 0, 0.5, 50), function(pressed) flyDown = pressed end)
        
        FlyTab:CreateParagraph({
            Title = "TOUCH CONTROLS",
            Content = "⬆ Button = Fly Up\n⬇ Button = Fly Down\n(Corner of screen)"
        })
    else
        FlyTab:CreateParagraph({
            Title = "PC CONTROLS",
            Content = "WASD = Move\nSpace = Up\nShift = Down\nRightShift = Toggle UI"
        })
    end
    
    -- // ========== ESP ==========
    local espEnabled = false
    local tracersEnabled = false
    local boxesEnabled = false
    local namesEnabled = false
    local distanceEnabled = false
    local espObjects = {}
    local ESPUpdateConnection = nil
    
    local function clearESP()
        for _, obj in pairs(espObjects) do
            pcall(function()
                if obj.Line then obj.Line:Remove() end
                if obj.NameLabel then obj.NameLabel:Remove() end
                if obj.Box then obj.Box:Remove() end
                if obj.DistanceLabel then obj.DistanceLabel:Remove() end
            end)
        end
        espObjects = {}
    end
    
    local function updateESP()
        clearESP()
        if not espEnabled then return end
        local Camera = Workspace.CurrentCamera
        if not Camera then return end
        local character = LocalPlayer.Character
        local rootPart = character and character:FindFirstChild('HumanoidRootPart')
        local rootPos = rootPart and rootPart.Position
        if not rootPos then return end
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local char = player.Character
                local targetRoot = char:FindFirstChild('HumanoidRootPart')
                if targetRoot then
                    local targetPos = targetRoot.Position
                    local color = Color3.fromRGB(255, 255, 255)
                    if player.Team then
                        if player.Team.Name == "Criminals" or player.Team.Name == "Criminal" then
                            color = Color3.fromRGB(255, 50, 50)
                        elseif player.Team.Name == "Police" or player.Team.Name == "Prison" then
                            color = Color3.fromRGB(50, 150, 255)
                        end
                    end
                    local vector, onScreen = Camera:WorldToViewportPoint(targetPos)
                    local rootVector = Camera:WorldToViewportPoint(rootPos)
                    if onScreen and rootVector.Z > 0 and vector.Z > 0 then
                        if tracersEnabled then
                            local line = Drawing.new("Line")
                            line.Visible = true
                            line.From = Vector2.new(rootVector.X, rootVector.Y)
                            line.To = Vector2.new(vector.X, vector.Y)
                            line.Color = color
                            line.Thickness = 1.5
                            line.Transparency = 0.8
                            table.insert(espObjects, { Line = line })
                        end
                        if namesEnabled then
                            local text = Drawing.new("Text")
                            text.Visible = true
                            text.Position = Vector2.new(vector.X, vector.Y - 25)
                            text.Size = 16
                            text.Color = color
                            text.Center = true
                            text.Outline = true
                            text.OutlineColor = Color3.fromRGB(0, 0, 0)
                            text.Text = player.Name
                            table.insert(espObjects, { NameLabel = text })
                        end
                        if boxesEnabled then
                            local box = Drawing.new("Square")
                            box.Visible = true
                            box.Position = Vector2.new(vector.X - 20, vector.Y - 35)
                            box.Size = Vector2.new(40, 50)
                            box.Color = color
                            box.Thickness = 2
                            box.Transparency = 0.7
                            box.Filled = false
                            table.insert(espObjects, { Box = box })
                        end
                        if distanceEnabled then
                            local dist = (targetPos - rootPos).Magnitude
                            local distText = Drawing.new("Text")
                            distText.Visible = true
                            distText.Position = Vector2.new(vector.X, vector.Y + 20)
                            distText.Size = 14
                            distText.Color = Color3.fromRGB(255, 255, 255)
                            distText.Center = true
                            distText.Outline = true
                            distText.OutlineColor = Color3.fromRGB(0, 0, 0)
                            distText.Text = string.format("%.0fm", dist)
                            table.insert(espObjects, { DistanceLabel = distText })
                        end
                    end
                end
            end
        end
    end
    
    ESPTab:CreateSection("ESP TOGGLES")
    ESPTab:CreateToggle({
        Name = "ESP (WALLHACK BITCH)",
        CurrentValue = false,
        Callback = function(v)
            espEnabled = v
            if not v then
                clearESP()
                if ESPUpdateConnection then
                    ESPUpdateConnection:Disconnect()
                    ESPUpdateConnection = nil
                end
            else
                if not ESPUpdateConnection then
                    ESPUpdateConnection = RunService.RenderStepped:Connect(function()
                        updateESP()
                    end)
                end
            end
        end
    })
    ESPTab:CreateToggle({
        Name = "TRACERS (FOLLOW THAT BITCH)",
        CurrentValue = false,
        Callback = function(v)
            tracersEnabled = v
            if espEnabled then clearESP() end
        end
    })
    ESPTab:CreateToggle({
        Name = "BOXES (CAGE THAT BITCH)",
        CurrentValue = false,
        Callback = function(v)
            boxesEnabled = v
            if espEnabled then clearESP() end
        end
    })
    ESPTab:CreateToggle({
        Name = "NAMES (WHO THAT BITCH)",
        CurrentValue = false,
        Callback = function(v)
            namesEnabled = v
            if espEnabled then clearESP() end
        end
    })
    ESPTab:CreateToggle({
        Name = "DISTANCE (HOW FAR BITCH)",
        CurrentValue = false,
        Callback = function(v)
            distanceEnabled = v
            if espEnabled then clearESP() end
        end
    })
    
    -- // ========== MISC ==========
    MiscTab:CreateSection("MISC FEATURES")
    
    local infiniteJumpEnabled = false
    MiscTab:CreateToggle({
        Name = "INFINITE JUMP (JUMP FOREVER BITCH)",
        CurrentValue = false,
        Callback = function(v) infiniteJumpEnabled = v end
    })
    UserInputService.JumpRequest:Connect(function()
        if infiniteJumpEnabled and LocalPlayer.Character then
            local hum = LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
            if hum then hum:ChangeState('Jumping') end
        end
    end)
    
    local clickTPEnabled = false
    MiscTab:CreateToggle({
        Name = "CLICK TP (TELEPORT ON CLICK)",
        CurrentValue = false,
        Callback = function(v) clickTPEnabled = v end
    })
    UserInputService.InputBegan:Connect(function(input)
        if clickTPEnabled and input.UserInputType == Enum.UserInputType.MouseButton1 then
            local mouse = LocalPlayer:GetMouse()
            local pos = mouse.Hit.Position
            if LocalPlayer.Character then
                LocalPlayer.Character:MoveTo(pos)
            end
        end
    end)
    
    -- // ========== ROBBERIES (FULL) ==========
    -- // TOMB
    RobberiesTab:CreateSection("TOMB (FUCK THOSE SPIKES)")
    
    local spikeStorage = {}
    RobberiesTab:CreateToggle({
        Name = "REMOVE SPIKES (NO MORE PAIN)",
        CurrentValue = false,
        Callback = function(v)
            local spikeRoom = Workspace:FindFirstChild('RobberyTomb') and Workspace.RobberyTomb:FindFirstChild('SpikeRoom')
            local spikes = spikeRoom and spikeRoom:FindFirstChild('Spikes')
            if spikes then
                if v then
                    spikeStorage = {}
                    for _, model in pairs(spikes:GetChildren()) do
                        if model:IsA('Model') then
                            for _, tile in pairs(model:GetChildren()) do
                                if tile:IsA('Model') and tile.Name == 'Tile' then
                                    for _, spikeModel in pairs(tile:GetChildren()) do
                                        if spikeModel:IsA('Model') and spikeModel.Name == 'Model' then
                                            table.insert(spikeStorage, { spikeModel:Clone(), tile })
                                            spikeModel:Destroy()
                                        end
                                    end
                                end
                            end
                        end
                    end
                else
                    for _, data in pairs(spikeStorage) do
                        data[1].Parent = data[2]
                    end
                    spikeStorage = {}
                end
            end
        end
    })
    
    local dartStorage = {}
    RobberiesTab:CreateToggle({
        Name = "REMOVE DARTS (FUCK THOSE NEEDLES)",
        CurrentValue = false,
        Callback = function(v)
            local dartRoom = Workspace:FindFirstChild('RobberyTomb') and Workspace.RobberyTomb:FindFirstChild('DartRoom')
            local darts = dartRoom and dartRoom:FindFirstChild('Darts')
            if darts then
                if v then
                    dartStorage = {}
                    for _, dart in pairs(darts:GetChildren()) do
                        if dart:IsA('BasePart') then
                            table.insert(dartStorage, dart:Clone())
                            dart:Destroy()
                        end
                    end
                else
                    for _, dart in pairs(dartStorage) do
                        dart.Parent = darts
                    end
                    dartStorage = {}
                end
            end
        end
    })
    
    local plankStorage = {}
    local function savePlanks()
        local tomb = Workspace:FindFirstChild('RobberyTomb')
        local cart = tomb and tomb:FindFirstChild('Cart')
        local planks = cart and cart:FindFirstChild('Planks')
        if planks then
            table.insert(plankStorage, { model = planks:Clone(), parent = planks.Parent })
            planks:Destroy()
        end
    end
    local function restorePlanks()
        for _, data in pairs(plankStorage) do
            if data.model.Parent == nil then
                data.model.Parent = data.parent
            end
        end
        plankStorage = {}
    end
    RobberiesTab:CreateToggle({
        Name = "REMOVE PLANKS (NO MORE WALKING)",
        CurrentValue = false,
        Callback = function(v)
            if v then savePlanks() else restorePlanks() end
        end
    })
    
    local killModelStorage = {}
    local function saveKillModel()
        local tomb = Workspace:FindFirstChild('RobberyTomb')
        local kill = tomb and tomb:FindFirstChild('Kill')
        if kill then
            table.insert(killModelStorage, { model = kill:Clone(), parent = kill.Parent })
            kill:Destroy()
        end
    end
    local function restoreKillModel()
        for _, data in pairs(killModelStorage) do
            if data.model.Parent == nil then data.model.Parent = data.parent end
        end
        killModelStorage = {}
    end
    RobberiesTab:CreateToggle({
        Name = "REMOVE LAVA DAMAGE (NO MORE BURNING)",
        CurrentValue = false,
        Callback = function(v)
            if v then saveKillModel() else restoreKillModel() end
        end
    })
    
    -- // POWER PLANT
    RobberiesTab:CreateSection("POWER PLANT (FUCK LASERS)")
    local powerLasers = {}
    local function removePowerLasers(parent)
        for _, child in pairs(parent:GetChildren()) do
            if child:IsA('Model') and child.Name == 'Model' then
                local hasWire = false
                for _, desc in pairs(child:GetDescendants()) do
                    if desc:IsA('BasePart') and desc.Name == 'BarbedWire' then
                        hasWire = true
                        break
                    end
                end
                if hasWire then
                    table.insert(powerLasers, child:Clone())
                    child:Destroy()
                end
            else
                removePowerLasers(child)
            end
        end
    end
    RobberiesTab:CreateToggle({
        Name = "REMOVE LASERS (NO MORE ZAPPING)",
        CurrentValue = false,
        Callback = function(v)
            if v then
                removePowerLasers(Workspace)
            else
                for _, clone in pairs(powerLasers) do clone.Parent = Workspace end
                powerLasers = {}
            end
        end
    })
    
    -- // BANK
    RobberiesTab:CreateSection("BANK (REMOVE LASERS BITCH)")
    local bank1Lasers = {}
    local function removeBank1Lasers(parent)
        for _, child in pairs(parent:GetChildren()) do
            if child:IsA('Model') and child.Name == 'Lasers' then
                table.insert(bank1Lasers, child:Clone())
                child:Destroy()
            else
                removeBank1Lasers(child)
            end
        end
    end
    RobberiesTab:CreateToggle({
        Name = "REMOVE 1ST CITY BANK LASERS",
        CurrentValue = false,
        Callback = function(v)
            local bank = Workspace:FindFirstChild('Banks') and Workspace.Banks:FindFirstChild('Bank')
            if bank then
                if v then
                    removeBank1Lasers(bank)
                else
                    for _, laser in pairs(bank1Lasers) do laser.Parent = bank end
                    bank1Lasers = {}
                end
            end
        end
    })
    
    local bank2Lasers = {}
    local function removeBank2Lasers(parent)
        for _, child in pairs(parent:GetChildren()) do
            if child:IsA('Model') and child.Name == 'Lasers' then
                table.insert(bank2Lasers, child:Clone())
                child:Destroy()
            else
                removeBank2Lasers(child)
            end
        end
    end
    RobberiesTab:CreateToggle({
        Name = "REMOVE 2ND CITY BANK LASERS",
        CurrentValue = false,
        Callback = function(v)
            local bank2 = Workspace:FindFirstChild('Banks') and Workspace.Banks:FindFirstChild('Bank2')
            local layout = bank2 and bank2:FindFirstChild('Layout')
            if layout then
                if v then
                    removeBank2Lasers(layout)
                else
                    for _, laser in pairs(bank2Lasers) do laser.Parent = layout end
                    bank2Lasers = {}
                end
            end
        end
    })
    
    -- // CASINO
    RobberiesTab:CreateSection("CASINO (REMOVE LASERS)")
    local casinoModels = {}
    local function saveCasinoModels(parent, names)
        for _, child in pairs(parent:GetChildren()) do
            if child:IsA('Model') and table.find(names, child.Name) then
                casinoModels[child.Name] = child:Clone()
                child:Destroy()
            else
                saveCasinoModels(child, names)
            end
        end
    end
    local function restoreCasinoModels()
        for _, model in pairs(casinoModels) do model.Parent = Workspace end
        casinoModels = {}
    end
    RobberiesTab:CreateToggle({
        Name = "REMOVE CASINO LASERS",
        CurrentValue = false,
        Callback = function(v)
            if v then
                saveCasinoModels(Workspace, { 'Lasers', 'CamerasMoving', 'LaserCarousel', 'LasersMoving', 'VaultLaserControl' })
            else
                restoreCasinoModels()
            end
        end
    })
    
    -- // MUSEUM
    RobberiesTab:CreateSection("MUSEUM (REMOVE LASERS)")
    local museumLights = nil
    RobberiesTab:CreateToggle({
        Name = "REMOVE MUSEUM LASERS",
        CurrentValue = false,
        Callback = function(v)
            local museum = Workspace:FindFirstChild('Museum')
            local lights = museum and museum:FindFirstChild('Lights')
            if lights then
                if v then
                    museumLights = lights:Clone()
                    lights:Destroy()
                elseif museumLights then
                    museumLights.Parent = museum
                    museumLights = nil
                end
            end
        end
    })
    
    -- // MANSION
    RobberiesTab:CreateSection("MANSION (FUCK THOSE LASERS)")
    local barbedWires = {}
    local mansionLasers = {}
    local laserTraps = {}
    local guardsFolder = {}
    local shields = {}
    
    RobberiesTab:CreateToggle({
        Name = "REMOVE MANSION LASERS",
        CurrentValue = false,
        Callback = function(v)
            if v then
                local mansionDeco = Workspace:FindFirstChild('MansionDecorative')
                if mansionDeco then
                    for _, desc in pairs(mansionDeco:GetDescendants()) do
                        if desc:IsA('BasePart') and desc.Name == 'BarbedWire' then
                            table.insert(barbedWires, { part = desc:Clone(), parent = desc.Parent })
                            desc:Destroy()
                        end
                    end
                end
                for _, child in pairs(Workspace:GetChildren()) do
                    if child:IsA('BasePart') and child.Name == 'BarbedWire' then
                        table.insert(barbedWires, { part = child:Clone(), parent = child.Parent })
                        child:Destroy()
                    end
                end
                local mansionRob = Workspace:FindFirstChild('MansionRobbery')
                local lasers = mansionRob and mansionRob:FindFirstChild('Lasers')
                if lasers then
                    table.insert(mansionLasers, { model = lasers:Clone(), parent = lasers.Parent })
                    lasers:Destroy()
                end
            else
                for _, data in pairs(barbedWires) do if data.part.Parent == nil then data.part.Parent = data.parent end end
                barbedWires = {}
                for _, data in pairs(mansionLasers) do if data.model.Parent == nil then data.model.Parent = data.parent end end
                mansionLasers = {}
            end
        end
    })
    
    RobberiesTab:CreateToggle({
        Name = "REMOVE LASER TRAPS",
        CurrentValue = false,
        Callback = function(v)
            local mansionRob = Workspace:FindFirstChild('MansionRobbery')
            local traps = mansionRob and mansionRob:FindFirstChild('LaserTraps')
            if traps then
                if v then
                    table.insert(laserTraps, { model = traps:Clone(), parent = traps.Parent })
                    traps:Destroy()
                else
                    for _, data in pairs(laserTraps) do if data.model.Parent == nil then data.model.Parent = data.parent end end
                    laserTraps = {}
                end
            end
        end
    })
    
    RobberiesTab:CreateToggle({
        Name = "REMOVE MANSION NPCS",
        CurrentValue = false,
        Callback = function(v)
            local mansionRob = Workspace:FindFirstChild('MansionRobbery')
            local guards = mansionRob and mansionRob:FindFirstChild('GuardsFolder')
            if guards then
                if v then
                    table.insert(guardsFolder, { folder = guards:Clone(), parent = guards.Parent })
                    guards:Destroy()
                else
                    for _, data in pairs(guardsFolder) do if data.folder.Parent == nil then data.folder.Parent = data.parent end end
                    guardsFolder = {}
                end
            end
        end
    })
    
    RobberiesTab:CreateToggle({
        Name = "REMOVE CEO WALLS",
        CurrentValue = false,
        Callback = function(v)
            local mansionRob = Workspace:FindFirstChild('MansionRobbery')
            local sh = mansionRob and mansionRob:FindFirstChild('Shields')
            if sh then
                if v then
                    table.insert(shields, { model = sh:Clone(), parent = sh.Parent })
                    sh:Destroy()
                else
                    for _, data in pairs(shields) do if data.model.Parent == nil then data.model.Parent = data.parent end end
                    shields = {}
                end
            end
        end
    })
    
    -- // OIL RIG
    RobberiesTab:CreateSection("OIL RIG (REMOVE SHIT)")
    local oilGuards = {}
    local oilLasers = {}
    local oilTurrets = {}
    
    RobberiesTab:CreateToggle({
        Name = "REMOVE OIL RIG NPCS",
        CurrentValue = false,
        Callback = function(v)
            local oilRig = Workspace:FindFirstChild('OilRig')
            local guards = oilRig and oilRig:FindFirstChild('GuardsFolder')
            if guards then
                if v then
                    table.insert(oilGuards, { folder = guards:Clone(), parent = guards.Parent })
                    guards:Destroy()
                else
                    for _, data in pairs(oilGuards) do if data.folder.Parent == nil then data.folder.Parent = data.parent end end
                    oilGuards = {}
                end
            end
        end
    })
    
    RobberiesTab:CreateToggle({
        Name = "REMOVE OIL RIG LASERS",
        CurrentValue = false,
        Callback = function(v)
            local oilRig = Workspace:FindFirstChild('OilRig')
            local lasers = oilRig and oilRig:FindFirstChild('MovingLasers')
            if lasers then
                if v then
                    table.insert(oilLasers, { model = lasers:Clone(), parent = lasers.Parent })
                    lasers:Destroy()
                else
                    for _, data in pairs(oilLasers) do if data.model.Parent == nil then data.model.Parent = data.parent end end
                    oilLasers = {}
                end
            end
        end
    })
    
    RobberiesTab:CreateToggle({
        Name = "REMOVE OIL RIG TURRETS",
        CurrentValue = false,
        Callback = function(v)
            local oilRig = Workspace:FindFirstChild('OilRig')
            local turrets = oilRig and oilRig:FindFirstChild('Turrets')
            if turrets then
                if v then
                    table.insert(oilTurrets, { model = turrets:Clone(), parent = turrets.Parent })
                    turrets:Destroy()
                else
                    for _, data in pairs(oilTurrets) do if data.model.Parent == nil then data.model.Parent = data.parent end end
                    oilTurrets = {}
                end
            end
        end
    })
    
    -- // CARGO SHIP
    RobberiesTab:CreateSection("CARGO SHIP (REMOVE TURRETS)")
    local cargoTurrets = {}
    RobberiesTab:CreateToggle({
        Name = "REMOVE CARGO SHIP TURRETS",
        CurrentValue = false,
        Callback = function(v)
            local cargo = Workspace:FindFirstChild('CargoShip')
            if cargo then
                local back = cargo:FindFirstChild('TurretBack')
                local front = cargo:FindFirstChild('TurretFront')
                if back and front then
                    if v then
                        table.insert(cargoTurrets, { back = back:Clone(), front = front:Clone(), parent = back.Parent })
                        back:Destroy()
                        front:Destroy()
                    else
                        for _, data in pairs(cargoTurrets) do
                            if data.back.Parent == nil then data.back.Parent = data.parent end
                            if data.front.Parent == nil then data.front.Parent = data.parent end
                        end
                        cargoTurrets = {}
                    end
                end
            end
        end
    })
    
    -- // AIRDROP
    RobberiesTab:CreateSection("AIRDROP (REMOVE NPCS)")
    local dropNPCs = nil
    RobberiesTab:CreateToggle({
        Name = "REMOVE AIRDROP NPCS",
        CurrentValue = false,
        Callback = function(v)
            local drop = Workspace:FindFirstChild('Drop')
            local npcs = drop and drop:FindFirstChild('NPCs')
            if npcs then
                if v then
                    dropNPCs = npcs:Clone()
                    npcs:Destroy()
                elseif dropNPCs then
                    dropNPCs.Parent = drop
                    dropNPCs = nil
                end
            end
        end
    })
    
    -- // ========== FINAL NOTIFICATION ==========
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "ELITE HUB v1.0.0",
        Text = "LOADED YOU FUCKING BITCH - " .. memberCount .. " MEMBERS 🥀",
        Duration = 3
    })
    
    print("████████████████████████████████████████████████████████████")
    print("ELITE HUB v1.0.0 - " .. memberCount .. " MEMBERS 🥀")
    print("DISCORD: discord.gg/5RuMCxK3u6")
    print("████████████████████████████████████████████████████████████")
end