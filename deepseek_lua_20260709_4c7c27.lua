-- // ========== ELITE HUB v1.0.0 ==========
-- // discord.gg/5RuMCxK3u6
-- // FUCK YOU IF YOU STEAL THIS SHIT - 9,175 MEMBERS 🥀
-- // by marcus

-- // ========== SERVICES ==========
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local isMobile = UserInputService.TouchEnabled

-- // ========== HARDCODED MEMBER COUNT ==========
local memberCount = "9,175"

-- // ========== THEME SYSTEM ==========
local currentTheme = "Dark"
local Themes = {
    ["Dark"] = {
        Background = Color3.fromRGB(36, 36, 37),
        Header = Color3.fromRGB(46, 46, 47),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(46, 204, 113),
        ScrollBar = Color3.fromRGB(78, 78, 79)
    },
    ["Marcus Purple"] = {
        Background = Color3.fromRGB(20, 10, 30),
        Header = Color3.fromRGB(40, 20, 60),
        Text = Color3.fromRGB(200, 150, 255),
        Accent = Color3.fromRGB(150, 0, 255),
        ScrollBar = Color3.fromRGB(80, 40, 120)
    },
    ["Blood Red"] = {
        Background = Color3.fromRGB(40, 10, 10),
        Header = Color3.fromRGB(60, 15, 15),
        Text = Color3.fromRGB(255, 200, 200),
        Accent = Color3.fromRGB(255, 0, 0),
        ScrollBar = Color3.fromRGB(100, 25, 25)
    },
    ["Neon Blue"] = {
        Background = Color3.fromRGB(10, 10, 40),
        Header = Color3.fromRGB(15, 15, 60),
        Text = Color3.fromRGB(150, 200, 255),
        Accent = Color3.fromRGB(0, 150, 255),
        ScrollBar = Color3.fromRGB(25, 25, 100)
    },
    ["Purple Haze"] = {
        Background = Color3.fromRGB(30, 10, 40),
        Header = Color3.fromRGB(45, 15, 60),
        Text = Color3.fromRGB(200, 150, 255),
        Accent = Color3.fromRGB(150, 0, 255),
        ScrollBar = Color3.fromRGB(75, 25, 100)
    },
    ["Matrix Green"] = {
        Background = Color3.fromRGB(10, 30, 10),
        Header = Color3.fromRGB(15, 45, 15),
        Text = Color3.fromRGB(100, 255, 100),
        Accent = Color3.fromRGB(0, 255, 0),
        ScrollBar = Color3.fromRGB(25, 75, 25)
    },
    ["Gold"] = {
        Background = Color3.fromRGB(40, 35, 10),
        Header = Color3.fromRGB(60, 50, 15),
        Text = Color3.fromRGB(255, 215, 100),
        Accent = Color3.fromRGB(255, 200, 0),
        ScrollBar = Color3.fromRGB(100, 85, 25)
    },
    ["Cotton Candy"] = {
        Background = Color3.fromRGB(40, 20, 40),
        Header = Color3.fromRGB(60, 30, 60),
        Text = Color3.fromRGB(255, 150, 255),
        Accent = Color3.fromRGB(255, 100, 255),
        ScrollBar = Color3.fromRGB(100, 50, 100)
    },
    ["Ocean"] = {
        Background = Color3.fromRGB(10, 20, 40),
        Header = Color3.fromRGB(15, 30, 60),
        Text = Color3.fromRGB(100, 200, 255),
        Accent = Color3.fromRGB(0, 150, 255),
        ScrollBar = Color3.fromRGB(25, 50, 100)
    },
    ["Sunset"] = {
        Background = Color3.fromRGB(40, 20, 10),
        Header = Color3.fromRGB(60, 30, 15),
        Text = Color3.fromRGB(255, 200, 150),
        Accent = Color3.fromRGB(255, 150, 50),
        ScrollBar = Color3.fromRGB(100, 50, 25)
    }
}

-- // ========== FIXED APPLY THEME ==========
local function applyTheme(themeName)
    local theme = Themes[themeName]
    if not theme then return end
    currentTheme = themeName
    
    pcall(function()
        if Window and Window.Frame then
            Window.Frame.BackgroundColor3 = theme.Background
            
            local header = Window.Frame:FindFirstChild("Header")
            if header then
                header.BackgroundColor3 = theme.Header
            end
            
            for _, v in pairs(Window.Frame:GetDescendants()) do
                if v:IsA("TextButton") or v:IsA("TextLabel") then
                    if v.Name == "Accent" or v.Name == "Toggle" then
                        pcall(function() v.BackgroundColor3 = theme.Accent end)
                    end
                end
                if v:IsA("Frame") and v.Name == "SliderFill" then
                    pcall(function() v.BackgroundColor3 = theme.Accent end)
                end
            end
        end
    end)
    
    StarterGui:SetCore("SendNotification", {
        Title = "ELITE HUB",
        Text = "Theme changed to: " .. themeName .. " 🥀",
        Duration = 2
    })
end

-- // ========== LOADING SCREEN ==========
local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "EliteHubLoading"
loadingGui.Parent = CoreGui
loadingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
loadingGui.ResetOnSpawn = false

local loadingBg = Instance.new("Frame")
loadingBg.Size = UDim2.new(1, 0, 1, 0)
loadingBg.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
loadingBg.Parent = loadingGui

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

TweenService:Create(barFill, TweenInfo.new(0.3), {Size = UDim2.new(1, 0, 1, 0)}):Play()
progressText.Text = "100%"
task.wait(0.3)

local fadeTween = TweenService:Create(loadingBg, TweenInfo.new(0.4), {BackgroundTransparency = 1})
fadeTween:Play()
fadeTween.Completed:Connect(function()
    loadingGui:Destroy()
    if gradientConnection then gradientConnection:Disconnect() end
    task.wait(0.1)
    loadMain()
end)

-- // ========== DISCORD NOTIFICATION ==========
local discordGui = Instance.new("ScreenGui")
discordGui.Name = "EliteHubDiscord"
discordGui.Parent = CoreGui

local discordFrame = Instance.new("Frame")
discordFrame.Size = UDim2.new(0, 360, 0, 160)
discordFrame.Position = UDim2.new(0.5, -180, 0.5, -80)
discordFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
discordFrame.BackgroundTransparency = 0
discordFrame.BorderSizePixel = 0
discordFrame.Parent = discordGui

local discordCorner = Instance.new("UICorner")
discordCorner.CornerRadius = UDim.new(0, 12)
discordCorner.Parent = discordFrame

local discordTitle = Instance.new("TextLabel")
discordTitle.Size = UDim2.new(1, 0, 0, 45)
discordTitle.Position = UDim2.new(0, 0, 0, 10)
discordTitle.BackgroundTransparency = 1
discordTitle.Text = "🔞 ELITE HUB 🔞"
discordTitle.TextColor3 = Color3.fromRGB(255, 66, 105)
discordTitle.Font = Enum.Font.GothamBold
discordTitle.TextSize = 28
discordTitle.Parent = discordFrame

local discordMsg = Instance.new("TextLabel")
discordMsg.Size = UDim2.new(1, -30, 0, 40)
discordMsg.Position = UDim2.new(0, 15, 0, 60)
discordMsg.BackgroundTransparency = 1
discordMsg.Text = "JOIN DISCORD YOU BITCH 🥀\ndiscord.gg/5RuMCxK3u6"
discordMsg.TextColor3 = Color3.fromRGB(180, 180, 200)
discordMsg.Font = Enum.Font.Gotham
discordMsg.TextSize = 12
discordMsg.TextWrapped = true
discordMsg.Parent = discordFrame

local joinBtn = Instance.new("TextButton")
joinBtn.Size = UDim2.new(0, 140, 0, 35)
joinBtn.Position = UDim2.new(0.5, -150, 0, 115)
joinBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
joinBtn.Text = "YES JOIN (COPY LINK)"
joinBtn.TextColor3 = Color3.new(1, 1, 1)
joinBtn.Font = Enum.Font.GothamBold
joinBtn.TextSize = 12
joinBtn.Parent = discordFrame

local skipDiscordBtn = Instance.new("TextButton")
skipDiscordBtn.Size = UDim2.new(0, 140, 0, 35)
skipDiscordBtn.Position = UDim2.new(0.5, 10, 0, 115)
skipDiscordBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
skipDiscordBtn.Text = "NO (FUCK OFF)"
skipDiscordBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
skipDiscordBtn.Font = Enum.Font.GothamBold
skipDiscordBtn.TextSize = 12
skipDiscordBtn.Parent = discordFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 6)
btnCorner.Parent = joinBtn

local btnCorner2 = Instance.new("UICorner")
btnCorner2.CornerRadius = UDim.new(0, 6)
btnCorner2.Parent = skipDiscordBtn

joinBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/5RuMCxK3u6")
    discordGui:Destroy()
end)

skipDiscordBtn.MouseButton1Click:Connect(function()
    discordGui:Destroy()
    StarterGui:SetCore("SendNotification", {
        Title = "ELITE HUB",
        Text = "You're a dumbass for not joining but whatever 🥀",
        Duration = 3
    })
end)

repeat task.wait() until not discordGui.Parent

-- // ========== MAIN FUNCTION ==========
function loadMain()
    local success, Rayfield = pcall(function()
        return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    end)
    
    if not success or not Rayfield then
        StarterGui:SetCore("SendNotification", {
            Title = "ELITE HUB",
            Text = "Rayfield failed to load! Retrying...",
            Duration = 3
        })
        task.wait(2)
        return loadMain()
    end
    
    task.wait(0.5)
    
    Window = Rayfield:CreateWindow({
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
    
    task.wait(0.3)
    
    local MainTab = Window:CreateTab("MAIN (FUCK SHIT UP)")
    local ESPTab = Window:CreateTab("ESP (SEE BITCHES)")
    local MiscTab = Window:CreateTab("MISC (EXTRA SHIT)")
    local FlyTab = Window:CreateTab("FLY (ZOOM BITCH)")
    local SpeedTab = Window:CreateTab("SPEED (GOTTA GO FAST)")
    local ThemesTab = Window:CreateTab("THEMES (STYLE BITCH)")
    local RobberiesTab = Window:CreateTab("ROBBERIES (STEAL THAT SHIT)")
    
    -- // ========== BREAK VELOCITY ==========
    local function breakVelocity()
        if not LocalPlayer.Character then return end
        local V3 = Vector3.new(0, 0, 0)
        for _, v in ipairs(LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Velocity = V3
                v.RotVelocity = V3
            end
        end
    end
    
    -- // ========== THEMES TAB ==========
    ThemesTab:CreateSection("SELECT THEME")
    
    local themeOptions = {}
    for name, _ in pairs(Themes) do
        table.insert(themeOptions, name)
    end
    
    ThemesTab:CreateDropdown({
        Name = "THEME SELECTOR",
        Options = themeOptions,
        CurrentOption = "Dark",
        Callback = function(v)
            applyTheme(v)
        end
    })
    
    ThemesTab:CreateParagraph({
        Title = "AVAILABLE THEMES",
        Content = "Dark\nMarcus Purple\nBlood Red\nNeon Blue\nPurple Haze\nMatrix Green\nGold\nCotton Candy\nOcean\nSunset"
    })
    
    -- // ========== IY FLY ==========
    local FLYING = false
    local iyflyspeed = 20
    local flyKeyDown = nil
    local flyKeyUp = nil
    
    local function sFLY()
        local plr = LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if not humanoid then
            repeat task.wait() until char:FindFirstChildOfClass("Humanoid")
            humanoid = char:FindFirstChildOfClass("Humanoid")
        end

        if flyKeyDown or flyKeyUp then
            flyKeyDown:Disconnect()
            flyKeyUp:Disconnect()
        end

        local T = char:FindFirstChild("HumanoidRootPart")
        if not T then return end
        
        local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
        local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
        local SPEED = 0

        local function FLY()
            FLYING = true
            local BG = Instance.new('BodyGyro')
            local BV = Instance.new('BodyVelocity')
            BG.P = 9e4
            BG.Parent = T
            BV.Parent = T
            BG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            BG.CFrame = T.CFrame
            BV.Velocity = Vector3.new(0, 0, 0)
            BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            task.spawn(function()
                repeat task.wait()
                    local camera = Workspace.CurrentCamera
                    if humanoid then
                        humanoid.PlatformStand = true
                    end

                    if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                        SPEED = 50
                    elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
                        SPEED = 0
                    end
                    if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
                        BV.Velocity = ((camera.CFrame.LookVector * (CONTROL.F + CONTROL.B)) + ((camera.CFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - camera.CFrame.p)) * SPEED
                        lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                    elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
                        BV.Velocity = ((camera.CFrame.LookVector * (lCONTROL.F + lCONTROL.B)) + ((camera.CFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - camera.CFrame.p)) * SPEED
                    else
                        BV.Velocity = Vector3.new(0, 0, 0)
                    end
                    BG.CFrame = camera.CFrame
                until not FLYING
                CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
                lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
                SPEED = 0
                BG:Destroy()
                BV:Destroy()

                if humanoid then humanoid.PlatformStand = false end
            end)
        end

        flyKeyDown = UserInputService.InputBegan:Connect(function(input, processed)
            if processed then return end
            if input.KeyCode == Enum.KeyCode.W then
                CONTROL.F = iyflyspeed
            elseif input.KeyCode == Enum.KeyCode.S then
                CONTROL.B = -iyflyspeed
            elseif input.KeyCode == Enum.KeyCode.A then
                CONTROL.L = -iyflyspeed
            elseif input.KeyCode == Enum.KeyCode.D then
                CONTROL.R = iyflyspeed
            elseif input.KeyCode == Enum.KeyCode.E then
                CONTROL.Q = iyflyspeed*2
            elseif input.KeyCode == Enum.KeyCode.Q then
                CONTROL.E = -iyflyspeed*2
            end
            pcall(function() Workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
        end)

        flyKeyUp = UserInputService.InputEnded:Connect(function(input, processed)
            if processed then return end
            if input.KeyCode == Enum.KeyCode.W then
                CONTROL.F = 0
            elseif input.KeyCode == Enum.KeyCode.S then
                CONTROL.B = 0
            elseif input.KeyCode == Enum.KeyCode.A then
                CONTROL.L = 0
            elseif input.KeyCode == Enum.KeyCode.D then
                CONTROL.R = 0
            elseif input.KeyCode == Enum.KeyCode.E then
                CONTROL.Q = 0
            elseif input.KeyCode == Enum.KeyCode.Q then
                CONTROL.E = 0
            end
        end)
        FLY()
    end

    local function NOFLY()
        FLYING = false
        if flyKeyDown or flyKeyUp then 
            flyKeyDown:Disconnect() 
            flyKeyUp:Disconnect() 
        end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
            LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
        end
        pcall(function() Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
    end
    
    -- // ========== IY ESP ==========
    local espEnabled = false
    local espTransparency = 0.3
    
    function ESP(plr, logic)
        task.spawn(function()
            for i,v in pairs(CoreGui:GetChildren()) do
                if v.Name == plr.Name..'_ESP' then
                    v:Destroy()
                end
            end
            wait()
            if plr.Character and plr.Name ~= LocalPlayer.Name and not CoreGui:FindFirstChild(plr.Name..'_ESP') then
                local ESPholder = Instance.new("Folder")
                ESPholder.Name = plr.Name..'_ESP'
                ESPholder.Parent = CoreGui
                repeat wait(1) until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid")
                for b,n in pairs (plr.Character:GetChildren()) do
                    if (n:IsA("BasePart")) then
                        local a = Instance.new("BoxHandleAdornment")
                        a.Name = plr.Name
                        a.Parent = ESPholder
                        a.Adornee = n
                        a.AlwaysOnTop = true
                        a.ZIndex = 10
                        a.Size = n.Size
                        a.Transparency = espTransparency
                        if logic == true then
                            a.Color = BrickColor.new(plr.TeamColor == LocalPlayer.TeamColor and "Bright green" or "Bright red")
                        else
                            a.Color = plr.TeamColor
                        end
                    end
                end
                if plr.Character and plr.Character:FindFirstChild('Head') then
                    local BillboardGui = Instance.new("BillboardGui")
                    local TextLabel = Instance.new("TextLabel")
                    BillboardGui.Adornee = plr.Character.Head
                    BillboardGui.Name = plr.Name
                    BillboardGui.Parent = ESPholder
                    BillboardGui.Size = UDim2.new(0, 100, 0, 150)
                    BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
                    BillboardGui.AlwaysOnTop = true
                    TextLabel.Parent = BillboardGui
                    TextLabel.BackgroundTransparency = 1
                    TextLabel.Position = UDim2.new(0, 0, 0, -50)
                    TextLabel.Size = UDim2.new(0, 100, 0, 100)
                    TextLabel.Font = Enum.Font.SourceSansSemibold
                    TextLabel.TextSize = 20
                    TextLabel.TextColor3 = Color3.new(1, 1, 1)
                    TextLabel.TextStrokeTransparency = 0
                    TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
                    TextLabel.Text = 'Name: '..plr.Name
                    TextLabel.ZIndex = 10
                    local espLoopFunc
                    local teamChange
                    local addedFunc
                    addedFunc = plr.CharacterAdded:Connect(function()
                        if espEnabled then
                            espLoopFunc:Disconnect()
                            teamChange:Disconnect()
                            ESPholder:Destroy()
                            repeat wait(1) until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid")
                            ESP(plr, logic)
                            addedFunc:Disconnect()
                        else
                            teamChange:Disconnect()
                            addedFunc:Disconnect()
                        end
                    end)
                    teamChange = plr:GetPropertyChangedSignal("TeamColor"):Connect(function()
                        if espEnabled then
                            espLoopFunc:Disconnect()
                            addedFunc:Disconnect()
                            ESPholder:Destroy()
                            repeat wait(1) until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid")
                            ESP(plr, logic)
                            teamChange:Disconnect()
                        else
                            teamChange:Disconnect()
                        end
                    end)
                    local function espLoop()
                        if CoreGui:FindFirstChild(plr.Name..'_ESP') then
                            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                                local pos = math.floor((LocalPlayer.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude)
                                local health = math.floor(plr.Character:FindFirstChildOfClass('Humanoid').Health)
                                TextLabel.Text = 'Name: '..plr.Name..' | Health: '..health..' | Studs: '..pos
                            end
                        else
                            teamChange:Disconnect()
                            addedFunc:Disconnect()
                            espLoopFunc:Disconnect()
                        end
                    end
                    espLoopFunc = RunService.RenderStepped:Connect(espLoop)
                end
            end
        end)
    end
    
    function toggleESP()
        espEnabled = not espEnabled
        if espEnabled then
            for i,v in pairs(Players:GetPlayers()) do
                if v.Name ~= LocalPlayer.Name then
                    ESP(v)
                end
            end
        else
            for i,c in pairs(CoreGui:GetChildren()) do
                if string.sub(c.Name, -4) == '_ESP' then
                    c:Destroy()
                end
            end
        end
    end
    
    -- // ========== ANTI-CHEAT BYPASS SPEED ==========
    local speedEnabled = false
    local speedValue = 50
    local speedMethod = 4
    local speedConnection = nil
    local tpwalkConnection = nil
    local spoofConnection = nil
    
    local function stopSpeed()
        speedEnabled = false
        if speedConnection then speedConnection:Disconnect() end
        if tpwalkConnection then tpwalkConnection:Disconnect() end
        if spoofConnection then spoofConnection:Disconnect() end
        speedConnection = nil
        tpwalkConnection = nil
        spoofConnection = nil
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
        end
    end
    
    local function startSpeed()
        if speedMethod == 1 then
            speedConnection = RunService.RenderStepped:Connect(function()
                if LocalPlayer.Character then
                    local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if hum and hum.WalkSpeed ~= speedValue then
                        hum.WalkSpeed = speedValue
                    end
                end
            end)
        elseif speedMethod == 2 then
            spoofConnection = RunService.RenderStepped:Connect(function()
                if LocalPlayer.Character then
                    local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if hum then hum.WalkSpeed = speedValue end
                end
            end)
        elseif speedMethod == 3 then
            local tpSpeed = speedValue / 2
            tpwalkConnection = RunService.Heartbeat:Connect(function(deltaTime)
                local char = LocalPlayer.Character
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                local root = char and char:FindFirstChild("HumanoidRootPart")
                if char and hum and root and hum.MoveDirection.Magnitude > 0 then
                    char:TranslateBy(hum.MoveDirection * tpSpeed * deltaTime * 10)
                    if hum.WalkSpeed ~= 16 then hum.WalkSpeed = 16 end
                    root.Velocity = Vector3.new(0, 0, 0)
                end
            end)
        elseif speedMethod == 4 then
            speedConnection = RunService.RenderStepped:Connect(function()
                if LocalPlayer.Character then
                    local root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if root and hum and hum.MoveDirection.Magnitude > 0 then
                        root.Velocity = hum.MoveDirection * speedValue
                        if hum.WalkSpeed ~= 16 then hum.WalkSpeed = 16 end
                    end
                end
            end)
        elseif speedMethod == 5 then
            local cfSpeed = speedValue / 10
            speedConnection = RunService.RenderStepped:Connect(function()
                if LocalPlayer.Character then
                    local root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if root and hum and hum.MoveDirection.Magnitude > 0 then
                        root.CFrame = root.CFrame + (hum.MoveDirection * cfSpeed)
                        root.Velocity = Vector3.new(0, 0, 0)
                        if hum.WalkSpeed ~= 16 then hum.WalkSpeed = 16 end
                    end
                end
            end)
        elseif speedMethod == 6 then
            local hSpeed = speedValue
            local counter = 0
            speedConnection = RunService.RenderStepped:Connect(function()
                if LocalPlayer.Character then
                    local root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if root and hum and hum.MoveDirection.Magnitude > 0 then
                        counter = counter + 1
                        if counter % 2 == 0 then
                            root.Velocity = hum.MoveDirection * hSpeed
                        else
                            root.CFrame = root.CFrame + (hum.MoveDirection * (hSpeed / 10))
                        end
                        if hum.WalkSpeed ~= 16 then hum.WalkSpeed = 16 end
                    end
                end
            end)
        end
    end
    
    local function toggleSpeed()
        speedEnabled = not speedEnabled
        if speedEnabled then
            startSpeed()
        else
            stopSpeed()
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
            breakVelocity()
        end)
        StarterGui:SetCore("SendNotification", {
            Title = "ELITE HUB",
            Text = "Teleport Tool given! Click to teleport.",
            Duration = 2
        })
    end
    
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
    
    MainTab:CreateButton({
        Name = "GIVE TELEPORT TOOL",
        Callback = giveTeleportTool
    })
    
    MainTab:CreateButton({
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
        end
    })
    
    -- // ========== FLY TAB ==========
    FlyTab:CreateSection("FLY CONTROLS")
    FlyTab:CreateToggle({
        Name = "FLY (ZOOM BITCH)",
        CurrentValue = false,
        Callback = function(v)
            if v then sFLY() else NOFLY() end
        end
    })
    FlyTab:CreateSlider({
        Name = "FLY SPEED",
        Range = {10, 200},
        Increment = 5,
        Suffix = "Speed",
        CurrentValue = 20,
        Callback = function(v)
            iyflyspeed = v
        end
    })
    FlyTab:CreateParagraph({
        Title = "CONTROLS",
        Content = "WASD = Move\nSpace = Up\nShift = Down\nQ/E = Up/Down faster\nRightShift = Toggle UI"
    })
    
    -- // ========== ESP TAB ==========
    ESPTab:CreateSection("ESP TOGGLES")
    ESPTab:CreateToggle({
        Name = "ESP (WALLHACK BITCH)",
        CurrentValue = false,
        Callback = function(v)
            if v then
                if not espEnabled then toggleESP() end
            else
                if espEnabled then toggleESP() end
            end
        end
    })
    ESPTab:CreateSlider({
        Name = "ESP TRANSPARENCY",
        Range = {0, 1},
        Increment = 0.05,
        Suffix = "Transparency",
        CurrentValue = 0.3,
        Callback = function(v)
            espTransparency = v
            if espEnabled then
                toggleESP()
                task.wait(0.5)
                toggleESP()
            end
        end
    })
    
    -- // ========== SPEED TAB ==========
    SpeedTab:CreateSection("SPEED HACK (ULTIMATE BYPASS)")
    SpeedTab:CreateToggle({
        Name = "SPEED HACK (ZOOM BITCH)",
        CurrentValue = false,
        Callback = function(v)
            if v then toggleSpeed() else stopSpeed() end
        end
    })
    SpeedTab:CreateSlider({
        Name = "SPEED VALUE",
        Range = {16, 250},
        Increment = 1,
        Suffix = "Speed",
        CurrentValue = 50,
        Callback = function(v)
            speedValue = v
            if speedEnabled then
                stopSpeed()
                task.wait(0.1)
                startSpeed()
            end
        end
    })
    SpeedTab:CreateDropdown({
        Name = "BYPASS METHOD",
        Options = {
            "Loop Speed (Basic)",
            "Spoof Speed (Bypass)",
            "TP Walk (Bypass)",
            "Velocity Speed (Best Bypass)",
            "CFrame Speed (Ultimate Bypass)",
            "Hybrid Speed (Mega Bypass)"
        },
        CurrentOption = "Velocity Speed (Best Bypass)",
        Callback = function(v)
            if v == "Loop Speed (Basic)" then speedMethod = 1
            elseif v == "Spoof Speed (Bypass)" then speedMethod = 2
            elseif v == "TP Walk (Bypass)" then speedMethod = 3
            elseif v == "Velocity Speed (Best Bypass)" then speedMethod = 4
            elseif v == "CFrame Speed (Ultimate Bypass)" then speedMethod = 5
            elseif v == "Hybrid Speed (Mega Bypass)" then speedMethod = 6
            end
            if speedEnabled then
                stopSpeed()
                task.wait(0.1)
                startSpeed()
            end
        end
    })
    SpeedTab:CreateParagraph({
        Title = "BYPASS METHODS",
        Content = "Loop Speed: Basic speed hack\nSpoof Speed: Hides your WalkSpeed\nTP Walk: Teleports instead of walking\nVelocity Speed: Uses velocity (best bypass)\nCFrame Speed: Uses CFrame (ultimate)\nHybrid Speed: Combines multiple bypasses"
    })
    
    -- // ========== MISC ==========
    MiscTab:CreateSection("MISC FEATURES")
    
    local infiniteJumpEnabled = false
    MiscTab:CreateToggle({
        Name = "INFINITE JUMP (JUMP FOREVER BITCH)",
        CurrentValue = false,
        Callback = function(v)
            infiniteJumpEnabled = v
        end
    })
    UserInputService.JumpRequest:Connect(function()
        if infiniteJumpEnabled and LocalPlayer.Character then
            local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum:ChangeState('Jumping') end
        end
    end)
    
    local clickTPEnabled = false
    MiscTab:CreateToggle({
        Name = "CLICK TP (TELEPORT ON CLICK)",
        CurrentValue = false,
        Callback = function(v)
            clickTPEnabled = v
        end
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
    
    MiscTab:CreateButton({
        Name = "BREAK VELOCITY",
        Callback = breakVelocity
    })
    
    -- // ========== ROBBERIES ==========
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
    
    -- // ========== FINAL ==========
    StarterGui:SetCore("SendNotification", {
        Title = "ELITE HUB v1.0.0",
        Text = "LOADED YOU FUCKING BITCH - " .. memberCount .. " MEMBERS 🥀",
        Duration = 3
    })
    
    print("████████████████████████████████████████████████████████████")
    print("ELITE HUB v1.0.0 - " .. memberCount .. " MEMBERS 🥀")
    print("DISCORD: discord.gg/5RuMCxK3u6")
    print("by marcus")
    print("████████████████████████████████████████████████████████████")
end