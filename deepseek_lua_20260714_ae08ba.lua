--[[
    ELITE HUB - Unified Loader v1.0.2
    Made by marcus 🥀
    Discord: discord.gg/5RuMCxK3u6
    FUCK YOU IF YOU STEAL THIS SHIT
    NO DUPLICATE LOADERS - POLSEC SHIT REMOVED
]]

-- ==================================================================--
--[[ SERVICES ]]
-- ==================================================================--
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local MarketplaceService = game:GetService("MarketplaceService")
local LP = Players.LocalPlayer
local PlaceId = game.PlaceId
local VERSION = "v1.0.2"

-- ==================================================================--
--[[ GAME DETECTION ]]
-- ==================================================================--
local GAMES = {
    -- Blox Fruits
    [2753915549] = {n="Blox Fruits - Sea 1", s="https://api.getpolsec.com/scripts/hosted/da57eeccfe53f974a3be59705c30a5a6bc761c73fcb6db9d9577f5003332d884.lua"},
    [4442272183] = {n="Blox Fruits - Sea 2", s="https://api.getpolsec.com/scripts/hosted/da57eeccfe53f974a3be59705c30a5a6bc761c73fcb6db9d9577f5003332d884.lua"},
    [7449423635] = {n="Blox Fruits - Sea 3", s="https://api.getpolsec.com/scripts/hosted/da57eeccfe53f974a3be59705c30a5a6bc761c73fcb6db9d9577f5003332d884.lua"},
    
    -- Jailbreak
    [2357880327] = {n="Jailbreak", s="https://api.getpolsec.com/scripts/hosted/dcf21cda4da9fb3f6dc9eb45b39450f114dc17c6d2410cdb8d122c8052d48568.lua"},
    [6068495032] = {n="Jailbreak (Beta)", s="https://api.getpolsec.com/scripts/hosted/dcf21cda4da9fb3f6dc9eb45b39450f114dc17c6d2410cdb8d122c8052d48568.lua"},
    [12949233651] = {n="Jailbreak (New)", s="https://api.getpolsec.com/scripts/hosted/dcf21cda4da9fb3f6dc9eb45b39450f114dc17c6d2410cdb8d122c8052d48568.lua"},
    
    -- Grow a Garden 2
    [97598239454123] = {n="Grow a Garden 2", s="https://api.getpolsec.com/scripts/hosted/1bc7ac5a8c52b76dd0bac09419e400d7ed9a1b224aecd0e77485cf0e532834ab.lua"},
    
    -- The Strongest Battlegrounds
    [13164477922] = {n="The Strongest Battlegrounds", s="https://api.getpolsec.com/scripts/hosted/f32976dcfa2e0371117f671a4cf1d69cc2e8502884363e89ed04d1607e69f11a.lua"},
}

local gameData = GAMES[PlaceId]

-- Auto-detect by name if not found by ID
if not gameData then
    pcall(function()
        local info = MarketplaceService:GetProductInfo(PlaceId)
        local name = string.lower(info.Name)
        
        if name:find("blox fruits") or name:find("bloxfruit") then
            gameData = {n="Blox Fruits (Auto)", s="https://api.getpolsec.com/scripts/hosted/da57eeccfe53f974a3be59705c30a5a6bc761c73fcb6db9d9577f5003332d884.lua"}
        elseif name:find("jailbreak") then
            gameData = {n="Jailbreak (Auto)", s="https://api.getpolsec.com/scripts/hosted/dcf21cda4da9fb3f6dc9eb45b39450f114dc17c6d2410cdb8d122c8052d48568.lua"}
        elseif name:find("grow a garden") or name:find("growagarden") then
            gameData = {n="Grow a Garden 2 (Auto)", s="https://api.getpolsec.com/scripts/hosted/1bc7ac5a8c52b76dd0bac09419e400d7ed9a1b224aecd0e77485cf0e532834ab.lua"}
        elseif name:find("strongest battlegrounds") or name:find("tsb") then
            gameData = {n="The Strongest Battlegrounds (Auto)", s="https://api.getpolsec.com/scripts/hosted/f32976dcfa2e0371117f671a4cf1d69cc2e8502884363e89ed04d1607e69f11a.lua"}
        end
    end)
end

-- If no game found, kick player
if not gameData then
    LP:Kick("ELITE HUB: Unsupported Game!\nPlace ID: " .. PlaceId .. "\nJoin our Discord for support!")
    return
end

-- ==================================================================--
--[[ CONFIGURATION ]]
-- ==================================================================--
local Config = {
    HubName = "ELITE HUB",
    Subtitle = "v" .. VERSION .. " | by marcus 🥀",
    LogoLetter = "E",
    LoadTime = 5,
    ScriptToLoad = gameData.s,
    GameName = gameData.n,

    Messages = {
        "Connecting to Elite Servers...",
        "Authenticating...",
        "Loading Assets...",
        "Configuring Environment...",
        "Building Interface...",
        "Finalizing..."
    },
    Tips = {
        "Join our Discord: discord.gg/5RuMCxK3u6",
        "Made by marcus - Don't steal this shit!",
        "ELITE HUB v" .. VERSION .. " - Fully Loaded",
        "Fuck you if you steal this 🥀"
    },

    Sounds = {
        Open = "rbxassetid/913363037",
        Update = "rbxassetid/6823769213",
        Success = "rbxassetid/10895847421",
        Failure = "rbxassetid/142642633",
        TipPing = "rbxassetid/5151558373"
    },

    IntroAnimationTime = 0.6,
    OutroAnimationTime = 0.3,

    Theme = {
        Primary = Color3.fromRGB(50, 150, 255),
        Secondary = Color3.fromRGB(30, 100, 200),
        Background = Color3.fromRGB(10, 12, 25),
        BackgroundGradient = Color3.fromRGB(20, 25, 45),
        Text = Color3.fromRGB(255, 255, 255),
        MutedText = Color3.fromRGB(150, 180, 220),
        ProgressBackground = Color3.fromRGB(30, 40, 70),
        Failure = Color3.fromRGB(255, 80, 80),
        SuccessFlash = Color3.fromRGB(100, 200, 255)
    },

    Fonts = {
        Main = Enum.Font.GothamBold,
        Secondary = Enum.Font.Gotham,
        Code = Enum.Font.Code
    }
}

-- ==================================================================--
--[[ SOUND SETUP ]]
-- ==================================================================--
local SoundPlayer = {}
for name, id in pairs(Config.Sounds) do
    if id and id ~= "" then
        local sound = Instance.new("Sound")
        sound.SoundId = id
        sound.Parent = SoundService
        SoundPlayer[name] = sound
    end
end

local function PlaySound(name)
    if SoundPlayer[name] then
        pcall(function() SoundPlayer[name]:Play() end)
    end
end

-- ==================================================================--
--[[ UI CREATION ]]
-- ==================================================================--
local blur = Instance.new("BlurEffect", game:GetService("Lighting"))
blur.Size = 0
blur.Enabled = true

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EliteHubLoader"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder = 999
screenGui.Parent = CoreGui

-- Main Container
local container = Instance.new("Frame")
container.Name = "Container"
container.AnchorPoint = Vector2.new(0.5, 0.5)
container.Size = UDim2.new(0, 0, 0, 0)
container.Position = UDim2.new(0.5, 0, 0.5, 0)
container.BackgroundColor3 = Config.Theme.Background
container.BorderSizePixel = 0
container.BackgroundTransparency = 0
container.Parent = screenGui

Instance.new("UICorner", container).CornerRadius = UDim.new(0, 20)

local containerGradient = Instance.new("UIGradient", container)
containerGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Config.Theme.Background),
    ColorSequenceKeypoint.new(1, Config.Theme.BackgroundGradient)
}
containerGradient.Rotation = 90

local borderStroke = Instance.new("UIStroke", container)
borderStroke.Color = Config.Theme.Primary
borderStroke.Thickness = 3
borderStroke.Transparency = 0.2
borderStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- ==================================================================--
--[[ CLOSE BUTTON ]]
-- ==================================================================--
local closeButton = Instance.new("TextButton", container)
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 10)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
closeButton.BackgroundTransparency = 0.8
closeButton.Text = "✕"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 18
closeButton.Font = Enum.Font.GothamBold
closeButton.BorderSizePixel = 0
closeButton.ZIndex = 10

local closeCorner = Instance.new("UICorner", closeButton)
closeCorner.CornerRadius = UDim.new(1, 0)

closeButton.MouseEnter:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.2,
        BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    }):Play()
end)

closeButton.MouseLeave:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.8,
        BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    }):Play()
end)

-- ==================================================================--
--[[ DESTROY FUNCTIONS ]]
-- ==================================================================--
local function destroyLoader()
    pcall(function()
        if screenGui then
            screenGui.Enabled = false
            screenGui:Destroy()
        end
        if blur then
            blur:Destroy()
        end
    end)
end

local function fadeOutAndDestroy()
    pcall(function()
        if screenGui then
            screenGui.Enabled = false
        end
    end)
    
    pcall(function()
        TweenService:Create(blur, TweenInfo.new(0.2), {Size = 0}):Play()
    end)
    
    pcall(function()
        TweenService:Create(container, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            BackgroundTransparency = 1
        }):Play()
    end)
    
    for _, child in ipairs(container:GetDescendants()) do
        pcall(function()
            if child:IsA("TextLabel") then
                TweenService:Create(child, TweenInfo.new(0.15), {TextTransparency = 1}):Play()
            elseif child:IsA("Frame") then
                TweenService:Create(child, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
            elseif child:IsA("UIStroke") then
                TweenService:Create(child, TweenInfo.new(0.15), {Transparency = 1}):Play()
            end
        end)
    end
    
    pcall(function()
        TweenService:Create(container, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0)
        }):Play()
    end)
    
    task.wait(0.3)
    destroyLoader()
end

closeButton.MouseButton1Click:Connect(function()
    PlaySound("Failure")
    StarterGui:SetCore("SendNotification", {
        Title = "ELITE HUB",
        Text = "Loader closed manually! 🥀",
        Duration = 2
    })
    fadeOutAndDestroy()
end)

-- ==================================================================--
--[[ UI ELEMENTS ]]
-- ==================================================================--
local logoCircle = Instance.new("Frame", container)
logoCircle.Name = "Logo"
logoCircle.AnchorPoint = Vector2.new(0.5, 0)
logoCircle.Size = UDim2.new(0, 70, 0, 70)
logoCircle.Position = UDim2.new(0.5, 0, 0, 25)
logoCircle.BackgroundColor3 = Config.Theme.Primary
logoCircle.BorderSizePixel = 0
logoCircle.ClipsDescendants = true
Instance.new("UICorner", logoCircle).CornerRadius = UDim.new(0, 15)

local logoInner = Instance.new("Frame", logoCircle)
logoInner.AnchorPoint = Vector2.new(0.5, 0.5)
logoInner.Size = UDim2.new(0, 58, 0, 58)
logoInner.Position = UDim2.new(0.5, 0, 0.5, 0)
logoInner.BackgroundColor3 = Config.Theme.Background
logoInner.BorderSizePixel = 0
Instance.new("UICorner", logoInner).CornerRadius = UDim.new(0, 12)

local logoText = Instance.new("TextLabel", logoInner)
logoText.Size = UDim2.new(1, 0, 1, 0)
logoText.BackgroundTransparency = 1
logoText.Text = Config.LogoLetter
logoText.TextColor3 = Config.Theme.Primary
logoText.TextSize = 36
logoText.Font = Config.Fonts.Main

local title = Instance.new("TextLabel", container)
title.Size = UDim2.new(1, -40, 0, 35)
title.Position = UDim2.new(0, 20, 0, 105)
title.BackgroundTransparency = 1
title.Text = Config.HubName
title.TextColor3 = Config.Theme.Text
title.TextSize = 28
title.Font = Config.Fonts.Main
title.TextXAlignment = Enum.TextXAlignment.Center

local gameLabel = Instance.new("TextLabel", container)
gameLabel.Size = UDim2.new(1, -40, 0, 16)
gameLabel.Position = UDim2.new(0, 20, 0, 140)
gameLabel.BackgroundTransparency = 1
gameLabel.Text = "🎯 " .. Config.GameName
gameLabel.TextColor3 = Color3.fromRGB(100, 255, 150)
gameLabel.TextSize = 11
gameLabel.Font = Config.Fonts.Secondary
gameLabel.TextXAlignment = Enum.TextXAlignment.Center
gameLabel.Parent = container

local versionText = Instance.new("TextLabel", container)
versionText.Size = UDim2.new(1, -40, 0, 16)
versionText.Position = UDim2.new(0, 20, 0, 156)
versionText.BackgroundTransparency = 1
versionText.Text = Config.Subtitle
versionText.TextColor3 = Config.Theme.MutedText
versionText.TextSize = 12
versionText.Font = Config.Fonts.Secondary
versionText.TextXAlignment = Enum.TextXAlignment.Center
versionText.Parent = container

local progressBg = Instance.new("Frame", container)
progressBg.Name = "progressBg"
progressBg.Size = UDim2.new(1, -60, 0, 7)
progressBg.Position = UDim2.new(0, 30, 0, 185)
progressBg.BackgroundColor3 = Config.Theme.ProgressBackground
progressBg.BorderSizePixel = 0
Instance.new("UICorner", progressBg).CornerRadius = UDim.new(1, 0)

local successGlowStroke = Instance.new("UIStroke", progressBg)
successGlowStroke.Color = Config.Theme.SuccessFlash
successGlowStroke.Thickness = 4
successGlowStroke.Transparency = 1

local progressFill = Instance.new("Frame", progressBg)
progressFill.Name = "progressFill"
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.BackgroundColor3 = Config.Theme.Primary
progressFill.BorderSizePixel = 0
progressFill.ClipsDescendants = true
Instance.new("UICorner", progressFill).CornerRadius = UDim.new(1, 0)

Instance.new("UIGradient", progressFill).Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Config.Theme.Primary),
    ColorSequenceKeypoint.new(1, Config.Theme.Secondary)
}

local progressShine = Instance.new("Frame", progressFill)
progressShine.Name = "progressShine"
progressShine.Size = UDim2.new(0.4, 0, 1, 0)
progressShine.Position = UDim2.new(-1, 0, 0, 0)
progressShine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
progressShine.BackgroundTransparency = 0.6
progressShine.BorderSizePixel = 0
Instance.new("UICorner", progressShine).CornerRadius = UDim.new(1, 0)

Instance.new("UIGradient", progressShine).Transparency = NumberSequence.new{
    NumberSequenceKeypoint.new(0, 1),
    NumberSequenceKeypoint.new(0.5, 0.2),
    NumberSequenceKeypoint.new(1, 1)
}

local progressShimmer = Instance.new("UIGradient", progressFill)
progressShimmer.Rotation = 90
progressShimmer.Offset = Vector2.new(0, -1)
progressShimmer.Transparency = NumberSequence.new{
    NumberSequenceKeypoint.new(0, 1),
    NumberSequenceKeypoint.new(0.4, 0.8),
    NumberSequenceKeypoint.new(0.5, 0.7),
    NumberSequenceKeypoint.new(0.6, 0.8),
    NumberSequenceKeypoint.new(1, 1)
}

local percentText = Instance.new("TextLabel", container)
percentText.Size = UDim2.new(0, 100, 0, 28)
percentText.Position = UDim2.new(0.5, -50, 0, 202)
percentText.BackgroundTransparency = 1
percentText.Text = "0%"
percentText.TextColor3 = Config.Theme.Primary
percentText.TextSize = 20
percentText.Font = Config.Fonts.Main

local statusText = Instance.new("TextLabel", container)
statusText.Size = UDim2.new(1, -40, 0, 20)
statusText.Position = UDim2.new(0, 20, 0, 240)
statusText.BackgroundTransparency = 1
statusText.Text = "Initializing..."
statusText.TextColor3 = Config.Theme.MutedText
statusText.TextSize = 12
statusText.Font = Config.Fonts.Code
statusText.TextXAlignment = Enum.TextXAlignment.Center

-- ==================================================================--
--[[ CORE FUNCTIONS ]]
-- ==================================================================--
local currentPercent = 0

local function updateProgress(target, duration)
    local startPercent = currentPercent
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
    local fillTween = TweenService:Create(progressFill, tweenInfo, {Size = UDim2.new(target / 100, 0, 1, 0)})
    fillTween:Play()
    
    local tempNumber = Instance.new("NumberValue")
    tempNumber.Value = startPercent
    local textTween = TweenService:Create(tempNumber, tweenInfo, {Value = target})
    textTween:Play()
    
    local connection
    connection = tempNumber.Changed:Connect(function()
        local newPercent = math.clamp(tempNumber.Value, 0, 100)
        percentText.Text = math.floor(newPercent) .. "%"
        currentPercent = newPercent
        if newPercent >= target then
            tempNumber:Destroy()
            connection:Disconnect()
        end
    end)
end

local tipDebounce = false
local function updateStatus(text, instant)
    if instant then statusText.Text = text; return end

    if not tipDebounce and #Config.Tips > 0 and math.random() < 0.3 then
        tipDebounce = true
        local textToRestore = text
        task.spawn(function()
            task.wait(1.5)
            PlaySound("TipPing")
            
            local originalPosition = statusText.Position
            local slideDownOffset = UDim2.new(originalPosition.X.Scale, originalPosition.X.Offset, originalPosition.Y.Scale, originalPosition.Y.Offset + 10)
            local slideUpOffset = UDim2.new(originalPosition.X.Scale, originalPosition.X.Offset, originalPosition.Y.Scale, originalPosition.Y.Offset - 10)
            
            local outTween = TweenService:Create(statusText, TweenInfo.new(0.25), {TextTransparency = 1})
            outTween:Play()
            outTween.Completed:Wait()

            statusText.Text = Config.Tips[math.random(1, #Config.Tips)]
            statusText.Position = slideDownOffset
            
            local inTween = TweenService:Create(statusText, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                TextTransparency = 0,
                Position = originalPosition
            })
            inTween:Play()
            inTween.Completed:Wait()

            task.wait(3)

            local outTween2 = TweenService:Create(statusText, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                TextTransparency = 1,
                Position = slideUpOffset
            })
            outTween2:Play()
            outTween2.Completed:Wait()

            statusText.Text = textToRestore
            statusText.Position = originalPosition
            local inTween2 = TweenService:Create(statusText, TweenInfo.new(0.25), {TextTransparency = 0})
            inTween2:Play()
            
            task.wait(3)
            tipDebounce = false
        end)
    end

    PlaySound("Update")
    local outTween = TweenService:Create(statusText, TweenInfo.new(0.15), {TextTransparency = 1})
    outTween:Play()
    outTween.Completed:Wait()
    statusText.Text = text
    local inTween = TweenService:Create(statusText, TweenInfo.new(0.15), {TextTransparency = 0})
    inTween:Play()
end

local function displayFatalError(errorMessage)
    updateStatus(errorMessage, true)
    PlaySound("Failure")
    
    TweenService:Create(borderStroke, TweenInfo.new(0.3), {Color = Config.Theme.Failure}):Play()
    TweenService:Create(progressFill, TweenInfo.new(0.3), {BackgroundColor3 = Config.Theme.Failure}):Play()
    percentText.TextColor3 = Config.Theme.Failure
end

-- ==================================================================--
--[[ MAIN EXECUTION ]]
-- ==================================================================--

-- Hide all elements initially
for _, child in ipairs(container:GetDescendants()) do
    if child:IsA("TextLabel") then
        child.TextTransparency = 1
    elseif child:IsA("Frame") then
        child.BackgroundTransparency = 1
    elseif child:IsA("UIStroke") then
        child.Transparency = 1
    end
end

-- Intro Animation
PlaySound("Open")
TweenService:Create(blur, TweenInfo.new(Config.IntroAnimationTime), {Size = 12}):Play()
local introTween = TweenService:Create(container, TweenInfo.new(Config.IntroAnimationTime, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 420, 0, 270)
})
introTween:Play()
introTween.Completed:Wait()

-- Fade in elements
for _, child in ipairs(container:GetDescendants()) do
    if child:IsA("TextLabel") then
        TweenService:Create(child, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
    elseif child:IsA("Frame") then
        local targetTransparency = (child.Name == "progressShine") and 0.6 or 0
        TweenService:Create(child, TweenInfo.new(0.4), {BackgroundTransparency = targetTransparency}):Play()
    elseif child:IsA("UIStroke") then
        local targetTransparency = (child == successGlowStroke) and 1 or 0.2
        TweenService:Create(child, TweenInfo.new(0.4), {Transparency = targetTransparency}):Play()
    end
    task.wait(0.02)
end

-- Check if script URL is valid
if not Config.ScriptToLoad or Config.ScriptToLoad == "" then
    displayFatalError("FATAL: No script URL found!")
    return
end

-- Start loading
local loadingFinished = false

-- Shine Loop
task.spawn(function()
    while container.Parent and not loadingFinished do
        progressShine.Position = UDim2.new(-0.4, 0, 0, 0)
        TweenService:Create(progressShine, TweenInfo.new(1.5, Enum.EasingStyle.Linear), {Position = UDim2.new(1.4, 0, 0, 0)}):Play()
        task.wait(2)
    end
end)

-- Shimmer Loop
task.spawn(function()
    while container.Parent and not loadingFinished do
        progressShimmer.Offset = Vector2.new(0, -1)
        TweenService:Create(progressShimmer, TweenInfo.new(1, Enum.EasingStyle.Linear), {Offset = Vector2.new(0, 1)}):Play()
        task.wait(1)
    end
end)

-- Main Loading Sequence
task.spawn(function()
    local stepDuration = Config.LoadTime / #Config.Messages
    for i, msg in ipairs(Config.Messages) do
        updateStatus(msg, false)
        updateProgress((i / #Config.Messages) * 100, stepDuration * 0.9)
        task.wait(stepDuration)
    end
    
    loadingFinished = true
    TweenService:Create(progressShine, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    updateStatus("Loading " .. Config.GameName .. "...", true)

    -- DESTROY LOADER BEFORE LOADING THE SCRIPT
    destroyLoader()
    task.wait(0.1)
    
    -- Now load the script
    local success, result = pcall(function()
        loadstring(game:HttpGet(Config.ScriptToLoad))()
    end)
    
    if success then
        PlaySound("Success")
        print("✅ ELITE HUB LOADED: " .. Config.GameName)
    else
        StarterGui:SetCore("SendNotification", {
            Title = "ELITE HUB ERROR",
            Text = "Script failed to load!",
            Duration = 5
        })
        warn("[ELITE HUB] Critical Error: Script failed to load.", result)
    end
end)

-- ==================================================================--
--[[ SAFETY: Force destroy after 12 seconds ]]
-- ==================================================================--
task.delay(12, function()
    destroyLoader()
end)

-- ==================================================================--
--[[ PRINT ]]
-- ==================================================================--
print("████████████████████████████████████████████████████████████")
print("🚀 ELITE HUB " .. VERSION .. " LOADED")
print("📍 Game: " .. (gameData and gameData.n or "Unknown"))
print("🆔 Place ID: " .. PlaceId)
print("📱 Discord: discord.gg/5RuMCxK3u6")
print("💀 Made by marcus - FUCK YOU IF YOU STEAL THIS")
print("████████████████████████████████████████████████████████████")