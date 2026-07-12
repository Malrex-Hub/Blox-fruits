-- // ========== ELITE LOADER v1.0.2 ==========
-- // Made by marcus
-- // JOIN DISCORD: discord.gg/5RuMCxK3u6
-- // FUCK YOU IF YOU STEAL THIS SHIT 🥀

-- // ========== SERVICES ==========
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local MarketplaceService = game:GetService("MarketplaceService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")

-- // ========== VERSION ==========
local VERSION = "v1.0.2"

-- // ========== PLACE ID DETECTION ==========
local PlaceId = game.PlaceId

-- // ========== SUPPORTED GAMES ==========
local SUPPORTED_GAMES = {
    [2357880327] = {name = "Jailbreak", script = "https://api.getpolsec.com/scripts/hosted/dcf21cda4da9fb3f6dc9eb45b39450f114dc17c6d2410cdb8d122c8052d48568.lua"},
    [6068495032] = {name = "Jailbreak (Beta)", script = "https://api.getpolsec.com/scripts/hosted/dcf21cda4da9fb3f6dc9eb45b39450f114dc17c6d2410cdb8d122c8052d48568.lua"},
    [12949233651] = {name = "Jailbreak (New)", script = "https://api.getpolsec.com/scripts/hosted/dcf21cda4da9fb3f6dc9eb45b39450f114dc17c6d2410cdb8d122c8052d48568.lua"},
    [2753915549] = {name = "Blox Fruits - Sea 1", script = "https://api.getpolsec.com/scripts/hosted/da57eeccfe53f974a3be59705c30a5a6bc761c73fcb6db9d9577f5003332d884.lua"},
    [4442272183] = {name = "Blox Fruits - Sea 2", script = "https://api.getpolsec.com/scripts/hosted/da57eeccfe53f974a3be59705c30a5a6bc761c73fcb6db9d9577f5003332d884.lua"},
    [7449423635] = {name = "Blox Fruits - Sea 3", script = "https://api.getpolsec.com/scripts/hosted/da57eeccfe53f974a3be59705c30a5a6bc761c73fcb6db9d9577f5003332d884.lua"},
    [97598239454123] = {name = "Grow a Garden 2", script = "https://api.getpolsec.com/scripts/hosted/1bc7ac5a8c52b76dd0bac09419e400d7ed9a1b224aecd0e77485cf0e532834ab.lua"},
    [142823291] = {name = "Murder Mystery 2", script = "https://api.getpolsec.com/scripts/hosted/YOUR_MM2_SCRIPT_URL_HERE.lua"},
    [13164477922] = {name = "The Strongest Battlegrounds", script = "https://api.getpolsec.com/scripts/hosted/f32976dcfa2e0371117f671a4cf1d69cc2e8502884363e89ed04d1607e69f11a.lua"}
}

-- // ========== DETECT GAME ==========
local gameData = SUPPORTED_GAMES[PlaceId]

if not gameData then
    pcall(function()
        local info = MarketplaceService:GetProductInfo(PlaceId)
        local name = string.lower(info.Name)
        if string.find(name, "jailbreak") then
            gameData = SUPPORTED_GAMES[2357880327]
            gameData.name = "Jailbreak (Auto-Detected)"
        elseif string.find(name, "blox fruits") or string.find(name, "bloxfruit") then
            gameData = SUPPORTED_GAMES[2753915549]
            gameData.name = "Blox Fruits (Auto-Detected)"
        elseif string.find(name, "grow a garden") or string.find(name, "growagarden") then
            gameData = SUPPORTED_GAMES[97598239454123]
            gameData.name = "Grow a Garden 2 (Auto-Detected)"
        elseif string.find(name, "murder mystery") or string.find(name, "mm2") then
            gameData = SUPPORTED_GAMES[142823291]
            gameData.name = "Murder Mystery 2 (Auto-Detected)"
        elseif string.find(name, "strongest battlegrounds") or string.find(name, "tsb") then
            gameData = SUPPORTED_GAMES[13164477922]
            gameData.name = "The Strongest Battlegrounds (Auto-Detected)"
        end
    end)
end

-- // KICK IF UNSUPPORTED
if not gameData then
    local fart = Instance.new("Sound")
    fart.SoundId = "rbxassetid://7151367512"
    fart.Volume = 10
    fart.Parent = SoundService
    fart:Play()
    
    StarterGui:SetCore("SendNotification", {
        Title = "💨 ELITE LOADER",
        Text = "UNSUPPORTED GAME: " .. PlaceId .. "\nFART SOUND FOR YOUR DUMBASS 💨",
        Duration = 5
    })
    task.wait(3)
    LocalPlayer:Kick("💨 UNSUPPORTED GAME - PLACE ID: " .. PlaceId .. "\nFUCK OFF BITCH 💨")
    return
end

-- // ========== UPDATE LOG PROMPT ==========
local function showUpdateLog()
    local logGui = Instance.new("ScreenGui")
    logGui.Name = "UpdateLog"
    logGui.Parent = CoreGui
    logGui.ResetOnSpawn = false
    logGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bg.BackgroundTransparency = 0.6
    bg.Parent = logGui

    local card = Instance.new("Frame")
    card.Size = UDim2.new(0, 480, 0, 360)
    card.Position = UDim2.new(0.5, -240, 0.5, -180)
    card.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
    card.BackgroundTransparency = 0.1
    card.BorderSizePixel = 0
    card.ClipsDescendants = true
    card.Parent = bg

    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 16)
    cardCorner.Parent = card

    local glowBorder = Instance.new("Frame")
    glowBorder.Size = UDim2.new(1, 6, 1, 6)
    glowBorder.Position = UDim2.new(0, -3, 0, -3)
    glowBorder.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
    glowBorder.BackgroundTransparency = 0.8
    glowBorder.BorderSizePixel = 0
    glowBorder.Parent = card

    local glowCorner = Instance.new("UICorner")
    glowCorner.CornerRadius = UDim.new(0, 19)
    glowCorner.Parent = glowBorder

    TweenService:Create(glowBorder, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        BackgroundTransparency = 0.5
    }):Play()

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Position = UDim2.new(0, 0, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "📋 UPDATE LOG"
    title.TextColor3 = Color3.fromRGB(100, 200, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 24
    title.TextScaled = true
    title.Parent = card

    local versionBadge = Instance.new("TextLabel")
    versionBadge.Size = UDim2.new(0, 80, 0, 24)
    versionBadge.Position = UDim2.new(0.5, -40, 0, 50)
    versionBadge.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
    versionBadge.BackgroundTransparency = 0.3
    versionBadge.Text = VERSION
    versionBadge.TextColor3 = Color3.fromRGB(200, 220, 255)
    versionBadge.Font = Enum.Font.GothamBold
    versionBadge.TextSize = 13
    versionBadge.Parent = card

    local vCorner = Instance.new("UICorner")
    vCorner.CornerRadius = UDim.new(1, 0)
    vCorner.Parent = versionBadge

    local logText = Instance.new("TextLabel")
    logText.Size = UDim2.new(1, -40, 0, 210)
    logText.Position = UDim2.new(0, 20, 0, 85)
    logText.BackgroundTransparency = 1
    logText.Text = [[
╔═══════════════════════════════════════╗
║        🔥 ELITE LOADER v1.0.2        ║
╠═══════════════════════════════════════╣
║  ✅ FIXED: Loading screen destroy     ║
║  ✅ FIXED: Loader not closing         ║
║  ✅ ADDED: The Strongest Battlegrounds║
║  ✅ ADDED: TSB Place ID Detection     ║
║  ✅ IMPROVED: Cleaner Modern UI       ║
║  ✅ IMPROVED: Glass morphism design   ║
║  ✅ IMPROVED: Animated gradient bg    ║
║  ✅ IMPROVED: Progress bar glow       ║
║  ✅ ADDED: Update log prompt          ║
║  ✅ ADDED: Discord button on UI       ║
║  ✅ FIXED: PolSec GUI detection       ║
╚═══════════════════════════════════════╝
]]
    logText.TextColor3 = Color3.fromRGB(180, 200, 230)
    logText.Font = Enum.Font.Gotham
    logText.TextSize = 12
    logText.TextXAlignment = Enum.TextXAlignment.Left
    logText.TextYAlignment = Enum.TextYAlignment.Top
    logText.TextWrapped = true
    logText.Parent = card

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 120, 0, 35)
    closeBtn.Position = UDim2.new(0.5, -60, 1, -45)
    closeBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
    closeBtn.BackgroundTransparency = 0.3
    closeBtn.Text = "✅ GOT IT"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 14
    closeBtn.Parent = card

    local cCorner = Instance.new("UICorner")
    cCorner.CornerRadius = UDim.new(0, 8)
    cCorner.Parent = closeBtn

    closeBtn.MouseEnter:Connect(function()
        TweenService:Create(closeBtn, TweenInfo.new(0.2), {BackgroundTransparency = 0.1}):Play()
    end)
    closeBtn.MouseLeave:Connect(function()
        TweenService:Create(closeBtn, TweenInfo.new(0.2), {BackgroundTransparency = 0.3}):Play()
    end)

    closeBtn.MouseButton1Click:Connect(function()
        TweenService:Create(card, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -240, 0.5, 1000)}):Play()
        task.wait(0.3)
        logGui:Destroy()
    end)

    card.Position = UDim2.new(0.5, -240, 0.5, -300)
    TweenService:Create(card, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, -240, 0.5, -180)
    }):Play()
end

-- // ========== SHOW UPDATE LOG ==========
task.spawn(function()
    task.wait(0.5)
    showUpdateLog()
end)

-- // ========== LOADING SCREEN ==========
local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "EliteLoader"
loadingGui.Parent = CoreGui
loadingGui.ResetOnSpawn = false
loadingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(8, 8, 16)
bg.Parent = loadingGui

local bgGradient = Instance.new("UIGradient")
bgGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 10, 30)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(20, 30, 80)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 30))
})
bgGradient.Rotation = 0
bgGradient.Parent = bg

local bgConnection = RunService.RenderStepped:Connect(function()
    bgGradient.Rotation = (bgGradient.Rotation or 0) + 0.15
end)

local orb = Instance.new("Frame")
orb.Size = UDim2.new(0, 300, 0, 300)
orb.Position = UDim2.new(0.5, -150, 0.3, -150)
orb.BackgroundColor3 = Color3.fromRGB(50, 100, 255)
orb.BackgroundTransparency = 0.9
orb.BorderSizePixel = 0
orb.Parent = bg

local orbCorner = Instance.new("UICorner")
orbCorner.CornerRadius = UDim.new(1, 0)
orbCorner.Parent = orb

TweenService:Create(orb, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
    Size = UDim2.new(0, 350, 0, 350),
    BackgroundTransparency = 0.85
}):Play()

local card = Instance.new("Frame")
card.Size = UDim2.new(0, 420, 0, 280)
card.Position = UDim2.new(0.5, -210, 0.5, -140)
card.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
card.BackgroundTransparency = 0.2
card.BorderSizePixel = 0
card.ClipsDescendants = true
card.Parent = bg

local cardCorner = Instance.new("UICorner")
cardCorner.CornerRadius = UDim.new(0, 20)
cardCorner.Parent = card

local glassBorder = Instance.new("Frame")
glassBorder.Size = UDim2.new(1, 2, 1, 2)
glassBorder.Position = UDim2.new(0, -1, 0, -1)
glassBorder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
glassBorder.BackgroundTransparency = 0.9
glassBorder.BorderSizePixel = 0
glassBorder.Parent = card

local glassCorner = Instance.new("UICorner")
glassCorner.CornerRadius = UDim.new(0, 21)
glassCorner.Parent = glassBorder

local glowBorder = Instance.new("Frame")
glowBorder.Size = UDim2.new(1, 8, 1, 8)
glowBorder.Position = UDim2.new(0, -4, 0, -4)
glowBorder.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
glowBorder.BackgroundTransparency = 0.85
glowBorder.BorderSizePixel = 0
glowBorder.Parent = card

local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(0, 24)
glowCorner.Parent = glowBorder

TweenService:Create(glowBorder, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
    BackgroundTransparency = 0.7
}):Play()

local icon = Instance.new("TextLabel")
icon.Size = UDim2.new(0, 70, 0, 70)
icon.Position = UDim2.new(0.5, -35, 0, 20)
icon.BackgroundTransparency = 1
icon.Text = "⚡"
icon.TextColor3 = Color3.fromRGB(100, 200, 255)
icon.Font = Enum.Font.GothamBold
icon.TextSize = 50
icon.TextScaled = true
icon.Parent = card

TweenService:Create(icon, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
    TextScaled = true,
    Size = UDim2.new(0, 75, 0, 75)
}):Play()

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.Position = UDim2.new(0, 0, 0, 90)
title.BackgroundTransparency = 1
title.Text = "ELITE LOADER"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 30
title.TextScaled = true
title.Parent = card

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 20)
subtitle.Position = UDim2.new(0, 0, 0, 122)
subtitle.BackgroundTransparency = 1
subtitle.Text = "by marcus 🥀"
subtitle.TextColor3 = Color3.fromRGB(150, 180, 220)
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 14
subtitle.TextXAlignment = Enum.TextXAlignment.Center
subtitle.Parent = card

local gameIcon = Instance.new("TextLabel")
gameIcon.Size = UDim2.new(0, 20, 0, 20)
gameIcon.Position = UDim2.new(0, 30, 0, 152)
gameIcon.BackgroundTransparency = 1
gameIcon.Text = "🎯"
gameIcon.TextColor3 = Color3.fromRGB(100, 255, 150)
gameIcon.Font = Enum.Font.Gotham
gameIcon.TextSize = 14
gameIcon.Parent = card

local gameLabel = Instance.new("TextLabel")
gameLabel.Size = UDim2.new(1, -60, 0, 20)
gameLabel.Position = UDim2.new(0, 55, 0, 152)
gameLabel.BackgroundTransparency = 1
gameLabel.Text = gameData.name
gameLabel.TextColor3 = Color3.fromRGB(100, 255, 150)
gameLabel.Font = Enum.Font.GothamBold
gameLabel.TextSize = 13
gameLabel.TextXAlignment = Enum.TextXAlignment.Left
gameLabel.Parent = card

local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0.85, 0, 0, 6)
barBg.Position = UDim2.new(0.075, 0, 0, 185)
barBg.BackgroundColor3 = Color3.fromRGB(30, 40, 70)
barBg.BorderSizePixel = 0
barBg.Parent = card

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(1, 0)
barCorner.Parent = barBg

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
barFill.BorderSizePixel = 0
barFill.Parent = barBg

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(1, 0)
fillCorner.Parent = barFill

local barGlow = Instance.new("Frame")
barGlow.Size = UDim2.new(0.85, 0, 0, 12)
barGlow.Position = UDim2.new(0.075, 0, 0, 182)
barGlow.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
barGlow.BackgroundTransparency = 0.85
barGlow.BorderSizePixel = 0
barGlow.Parent = card

local glowCorner2 = Instance.new("UICorner")
glowCorner2.CornerRadius = UDim.new(1, 0)
glowCorner2.Parent = barGlow

local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1, 0, 0, 18)
statusText.Position = UDim2.new(0, 0, 0, 202)
statusText.BackgroundTransparency = 1
statusText.Text = "🚀 INITIALIZING..."
statusText.TextColor3 = Color3.fromRGB(150, 180, 220)
statusText.Font = Enum.Font.Gotham
statusText.TextSize = 11
statusText.TextXAlignment = Enum.TextXAlignment.Center
statusText.Parent = card

local version = Instance.new("TextLabel")
version.Size = UDim2.new(0, 80, 0, 20)
version.Position = UDim2.new(1, -90, 1, -28)
version.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
version.BackgroundTransparency = 0.3
version.Text = VERSION
version.TextColor3 = Color3.fromRGB(200, 220, 255)
version.Font = Enum.Font.GothamBold
version.TextSize = 11
version.Parent = card

local versionCorner = Instance.new("UICorner")
versionCorner.CornerRadius = UDim.new(1, 0)
versionCorner.Parent = version

local madeBy = Instance.new("TextLabel")
madeBy.Size = UDim2.new(0, 80, 0, 20)
madeBy.Position = UDim2.new(0, 10, 1, -28)
madeBy.BackgroundTransparency = 1
madeBy.Text = "⚡ marcus"
madeBy.TextColor3 = Color3.fromRGB(100, 130, 180)
madeBy.Font = Enum.Font.Gotham
madeBy.TextSize = 10
madeBy.TextXAlignment = Enum.TextXAlignment.Left
madeBy.Parent = card

local discordBtn = Instance.new("TextButton")
discordBtn.Size = UDim2.new(0, 100, 0, 28)
discordBtn.Position = UDim2.new(0.5, -50, 1, -30)
discordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
discordBtn.BackgroundTransparency = 0.3
discordBtn.Text = "💬 DISCORD"
discordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
discordBtn.Font = Enum.Font.GothamBold
discordBtn.TextSize = 11
discordBtn.Parent = card

local dCorner = Instance.new("UICorner")
dCorner.CornerRadius = UDim.new(0, 8)
dCorner.Parent = discordBtn

discordBtn.MouseEnter:Connect(function()
    TweenService:Create(discordBtn, TweenInfo.new(0.2), {BackgroundTransparency = 0.1}):Play()
end)
discordBtn.MouseLeave:Connect(function()
    TweenService:Create(discordBtn, TweenInfo.new(0.2), {BackgroundTransparency = 0.3}):Play()
end)

discordBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/5RuMCxK3u6")
    StarterGui:SetCore("SendNotification", {
        Title = "💬 ELITE LOADER",
        Text = "Discord link copied bitch! 🥀",
        Duration = 2
    })
end)

-- // ========== LOADING ANIMATION ==========
local function updateProgress(progress, text)
    TweenService:Create(barFill, TweenInfo.new(0.3), {Size = UDim2.new(progress / 100, 0, 1, 0)}):Play()
    TweenService:Create(barGlow, TweenInfo.new(0.3), {Size = UDim2.new(progress / 100, 0, 1, 0)}):Play()
    if text then statusText.Text = text end
end

-- // ========== LOAD SCRIPT ==========
local scriptLoaded = false
local loaderDestroyed = false

local function destroyLoader()
    if loaderDestroyed then return end
    loaderDestroyed = true
    pcall(function()
        loadingGui:Destroy()
        if bgConnection then bgConnection:Disconnect() end
    end)
    print("✅ Loader destroyed")
end

local function loadGameScript()
    if scriptLoaded then return end
    scriptLoaded = true
    
    updateProgress(30, "🔓 LOADING " .. string.upper(gameData.name) .. "...")
    task.wait(0.5)
    
    updateProgress(60, "⚡ INJECTING SCRIPT...")
    task.wait(0.3)
    
    local success, err = pcall(function()
        loadstring(game:HttpGet(gameData.script))()
    end)
    
    if success then
        updateProgress(100, "✅ " .. string.upper(gameData.name) .. " LOADED! 🥀")
        StarterGui:SetCore("SendNotification", {
            Title = "🚀 ELITE LOADER " .. VERSION,
            Text = gameData.name .. " loaded bitch! 🥀",
            Duration = 3
        })
    else
        updateProgress(100, "❌ FAILED: " .. tostring(err))
        StarterGui:SetCore("SendNotification", {
            Title = "❌ LOAD FAILED",
            Text = "Error: " .. tostring(err),
            Duration = 5
        })
    end
    
    task.wait(0.8)
    
    -- // FADE OUT LOADING SCREEN
    local fade = TweenService:Create(loadingGui, TweenInfo.new(0.6), {BackgroundTransparency = 1})
    fade:Play()
    fade.Completed:Connect(function()
        destroyLoader()
    end)
    
    -- // SAFETY: Force destroy after 2 seconds if fade fails
    task.delay(2, function()
        if not loaderDestroyed then
            destroyLoader()
        end
    end)
end

task.spawn(loadGameScript)

-- // Watch for PolSec GUI
task.spawn(function()
    while not loaderDestroyed do
        task.wait(0.5)
        for _, gui in pairs(CoreGui:GetChildren()) do
            if gui:IsA("ScreenGui") and gui ~= loadingGui then
                local name = gui.Name:lower()
                if name:find("polsec") or name:find("key") or name:find("menu") or name:find("gui") then
                    for _, child in pairs(gui:GetDescendants()) do
                        if child:IsA("TextLabel") or child:IsA("TextButton") then
                            if child.Text and (child.Text:find("PolSec") or child.Text:find("KEY") or child.Text:find("trial")) then
                                destroyLoader()
                                return
                            end
                        end
                    end
                end
            end
        end
    end
end)

print("████████████████████████████████████████████████████████████")
print("🚀 ELITE LOADER " .. VERSION .. " LOADED")
print("GAME: " .. gameData.name)
print("PLACE ID: " .. PlaceId)
print("DISCORD: discord.gg/5RuMCxK3u6")
print("by marcus")
print("████████████████████████████████████████████████████████████")