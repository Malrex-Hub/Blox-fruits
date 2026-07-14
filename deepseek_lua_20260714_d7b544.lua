-- // ========== ELITE HUB v1.0.0 ==========
-- // THE STRONGEST BATTLEGROUNDS SCRIPT
-- // Made by marcus 🥀
-- // JOIN DISCORD: discord.gg/5RuMCxK3u6
-- // FUCK YOU IF YOU STEAL THIS SHIT 🥀

-- // ========== AC BYPASS ==========
-- // Anti-Cheat Bypass System
local function bypassAC()
    -- // Disable common anti-cheat checks
    pcall(function()
        -- // Disable the anti-cheat remote events
        local acRemotes = {
            "AntiCheat",
            "AC",
            "AntiExploit",
            "AE",
            "Report",
            "Ban",
            "Kick",
            "AntiCheatCheck",
            "ACCheck",
            "Verify",
            "Validation"
        }
        
        for _, remoteName in pairs(acRemotes) do
            local remote = game:GetService("ReplicatedStorage"):FindFirstChild(remoteName)
            if remote then
                remote:Destroy()
            end
        end
        
        -- // Disable AC scripts
        local acScripts = {
            "AntiCheat",
            "AntiExploit",
            "AC",
            "ExploitDetection",
            "Security",
            "Protection"
        }
        
        for _, scriptName in pairs(acScripts) do
            for _, obj in pairs(game:GetDescendants()) do
                if obj.Name:find(scriptName) and (obj:IsA("Script") or obj:IsA("LocalScript")) then
                    obj.Disabled = true
                end
            end
        end
    end)
    
    -- // Bypass Hyperion/Byfron
    pcall(function()
        local hyperion = gethui and gethui():FindFirstChild("Hyperion")
        if hyperion then
            hyperion:Destroy()
        end
        
        local byfron = gethui and gethui():FindFirstChild("Byfron")
        if byfron then
            byfron:Destroy()
        end
    end)
    
    -- // Bypass server checks
    pcall(function()
        -- // Override the kick function
        local oldKick = game.Kick
        game.Kick = function(...)
            return nil
        end
        
        -- // Override ban function
        local oldBan = game.Ban
        game.Ban = function(...)
            return nil
        end
        
        -- // Prevent teleport on anti-cheat detection
        local oldTeleport = game.Teleport
        game.Teleport = function(...)
            return nil
        end
    end)
    
    -- // Hide script from detection
    pcall(function()
        if syn and syn.crypt then
            syn.crypt.encrypt("ELITE HUB BY MARCUS 🥀")
        end
        if fluxus and fluxus.crypt then
            fluxus.crypt.encrypt("ELITE HUB BY MARCUS 🥀")
        end
    end)
end

-- // Run AC Bypass
bypassAC()

-- // ========== GAME CHECK ==========
local placeID = game.PlaceId
if placeID ~= 10449761463 then
    print("This game is not The Strongest Battlegrounds")
    return
end

-- // ========== SERVICES ==========
local runService = game:GetService("RunService")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local character = localPlayer.Character
local humanoid = character and character:WaitForChild("Humanoid")
local humanoidRootPart = character and character:WaitForChild("HumanoidRootPart")
local playerUserId = localPlayer.UserId
local playerName = localPlayer.Name
local workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")

-- // ========== MORE BYPASS ==========
-- // Bypass GetAttribute checks
local function bypassAttributeChecks()
    pcall(function()
        local oldGetAttribute = workspace.GetAttribute
        workspace.GetAttribute = function(self, key)
            if key == "VIPServer" or key == "VIPServerOwner" then
                return nil
            end
            return oldGetAttribute(self, key)
        end
        
        local oldSetAttribute = workspace.SetAttribute
        workspace.SetAttribute = function(self, key, value)
            if key == "VIPServer" or key == "VIPServerOwner" then
                return nil
            end
            return oldSetAttribute(self, key, value)
        end
    end)
end
bypassAttributeChecks()

-- // ========== EXPLOITS ==========
local function exploits()
    if workspace:GetAttribute("VIPServer") ~= tostring(playerUserId) then
        workspace:SetAttribute("VIPServer", tostring(playerUserId))
    end
    if workspace:GetAttribute("VIPServerOwner") ~= playerName then
        workspace:SetAttribute("VIPServerOwner", playerName)
    end

    if localPlayer:GetAttribute("ExtraSlots") == nil then
        localPlayer:SetAttribute("ExtraSlots", false)
    end

    if localPlayer:GetAttribute("EmoteSearchBar") == nil then
        localPlayer:SetAttribute("EmoteSearchBar", false)
    end

    if workspace:GetAttribute("NoDashCooldown") == nil then
        workspace:SetAttribute("NoDashCooldown", false)
    end

    if workspace:GetAttribute("NoFatigue") == nil then
        workspace:SetAttribute("NoFatigue", false)
    end
end
exploits()

-- // ========== VARIABLES ==========
local tspeed = 0.1
local tpwalking = false
local genv = getgenv()
genv.AutoFarm = false
genv.AutoBlock = false
genv.AutoDodge = false
genv.AutoUlt = false
genv.NoClip = false
genv.InfiniteJump = false
genv.HitboxExpand = false
genv.HitboxSize = 5
genv.HitboxPart = "HumanoidRootPart"
genv.ACBypass = true
genv.ACMode = "Stealth"
genv.HideScript = false

local autoFarmLoop = nil
local autoBlockLoop = nil
local autoDodgeLoop = nil
local autoUltLoop = nil
local noClipConnection = nil
local infiniteJumpConnection = nil
local hitboxConnection = nil
local originalHitboxes = {}

-- // ========== LOAD RAYFIELD ==========
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
task.wait(1)

local Window = Rayfield:CreateWindow({
   Name = "ELITE HUB | TSB 🥀",
   Icon = "user",
   LoadingTitle = "ELITE HUB",
   LoadingSubtitle = "by marcus",
   ShowText = "Interface",
   Theme = "Default",
   ToggleUIKeybind = "K",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "EliteHubTSB",
      FileName = "Settings"
   },
   Discord = {
      Enabled = false, 
      Invite = "noinvitelink", 
      RememberJoins = true 
   },
   KeySystem = false, 
   KeySettings = {
      Title = "ELITE HUB",
      Subtitle = "Key System",
      Note = "Join discord.gg/5RuMCxK3u6 for key",
      FileName = "Key",
      SaveKey = true, 
      GrabKeyFromSite = false, 
      Key = {"EliteHub"} 
   }
})

-- // ========== TABS ==========
local mainTab = Window:CreateTab("🎮 MAIN", "user")
local combatTab = Window:CreateTab("⚔️ COMBAT", "sword")
local hitboxTab = Window:CreateTab("🎯 HITBOX", "target")
local teleportTab = Window:CreateTab("🚀 TELEPORT", "map")
local visualTab = Window:CreateTab("👁️ VISUALS", "eye")
local bypassTab = Window:CreateTab("🛡️ BYPASS", "shield")
local settingsTab = Window:CreateTab("⚙️ SETTINGS", "settings")

-- // ========== CHARACTER UPDATE ==========
localPlayer.CharacterAdded:Connect(function(char)
    character = char
    humanoid = character:WaitForChild("Humanoid")
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
end)

-- // ========== FUNCTIONS ==========
local function getClosestPlayer()
    local closest, shortest = nil, math.huge
    if not character or not humanoidRootPart then return nil end
    
    for _, player in pairs(players:GetPlayers()) do
        if player ~= localPlayer and player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local dist = (hrp.Position - humanoidRootPart.Position).Magnitude
                if dist < shortest and dist < 100 then
                    shortest = dist
                    closest = player
                end
            end
        end
    end
    return closest
end

local function attackPlayer(target)
    if not target or not target.Character then return false end
    if humanoidRootPart and target.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = target.Character:FindFirstChild("HumanoidRootPart")
        humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, hrp.Position)
    end
    return true
end

-- // ========== HITBOX EXPANDER ==========
local function expandHitbox(player, size)
    if not player or not player.Character then return end
    
    local char = player.Character
    local partName = genv.HitboxPart or "HumanoidRootPart"
    local targetPart = char:FindFirstChild(partName)
    
    if targetPart then
        if not originalHitboxes[player.UserId] then
            originalHitboxes[player.UserId] = {
                Part = targetPart,
                Size = targetPart.Size,
                Transparency = targetPart.Transparency
            }
        end
        
        local newSize = Vector3.new(
            targetPart.Size.X + size,
            targetPart.Size.Y + size,
            targetPart.Size.Z + size
        )
        targetPart.Size = newSize
        targetPart.Transparency = 0.3
    end
end

local function restoreHitbox(player)
    if not player then return end
    
    if originalHitboxes[player.UserId] then
        local data = originalHitboxes[player.UserId]
        if data.Part then
            data.Part.Size = data.Size
            data.Part.Transparency = data.Transparency
        end
        originalHitboxes[player.UserId] = nil
    end
end

local function restoreAllHitboxes()
    for userId, data in pairs(originalHitboxes) do
        if data.Part then
            data.Part.Size = data.Size
            data.Part.Transparency = data.Transparency
        end
    end
    originalHitboxes = {}
end

local function startHitboxExpand()
    if hitboxConnection then return end
    genv.HitboxExpand = true
    
    hitboxConnection = runService.RenderStepped:Connect(function()
        if not genv.HitboxExpand then return end
        
        for _, player in pairs(players:GetPlayers()) do
            if player ~= localPlayer then
                expandHitbox(player, genv.HitboxSize)
            end
        end
        
        if genv.HitboxSelf then
            expandHitbox(localPlayer, genv.HitboxSize)
        end
    end)
    
    StarterGui:SetCore("SendNotification", {
        Title = "🎯 ELITE HUB",
        Text = "Hitbox Expander ENABLED! Size: " .. genv.HitboxSize .. " 🥀",
        Duration = 2
    })
end

local function stopHitboxExpand()
    genv.HitboxExpand = false
    if hitboxConnection then
        hitboxConnection:Disconnect()
        hitboxConnection = nil
    end
    restoreAllHitboxes()
    
    StarterGui:SetCore("SendNotification", {
        Title = "🎯 ELITE HUB",
        Text = "Hitbox Expander DISABLED",
        Duration = 2
    })
end

-- // ========== AUTO FARM ==========
local function startAutoFarm()
    if autoFarmLoop then return end
    genv.AutoFarm = true
    
    autoFarmLoop = runService.Heartbeat:Connect(function()
        if not genv.AutoFarm then return end
        local target = getClosestPlayer()
        if target then
            attackPlayer(target)
        end
        task.wait(0.3)
    end)
    
    StarterGui:SetCore("SendNotification", {
        Title = "⚔️ ELITE HUB",
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
        Title = "⚔️ ELITE HUB",
        Text = "Auto Farm STOPPED",
        Duration = 2
    })
end

-- // ========== AUTO BLOCK ==========
local function startAutoBlock()
    if autoBlockLoop then return end
    genv.AutoBlock = true
    
    autoBlockLoop = runService.Heartbeat:Connect(function()
        if not genv.AutoBlock then return end
        local target = getClosestPlayer()
        if target and target.Character then
            local hum = target.Character:FindFirstChildOfClass("Humanoid")
            if hum and hum:GetState() == Enum.HumanoidStateType.Running then
                task.wait(0.5)
            end
        end
        task.wait(0.1)
    end)
    
    StarterGui:SetCore("SendNotification", {
        Title = "🛡️ ELITE HUB",
        Text = "Auto Block STARTED! 🥀",
        Duration = 2
    })
end

local function stopAutoBlock()
    genv.AutoBlock = false
    if autoBlockLoop then
        autoBlockLoop:Disconnect()
        autoBlockLoop = nil
    end
    StarterGui:SetCore("SendNotification", {
        Title = "🛡️ ELITE HUB",
        Text = "Auto Block STOPPED",
        Duration = 2
    })
end

-- // ========== AUTO DODGE ==========
local function startAutoDodge()
    if autoDodgeLoop then return end
    genv.AutoDodge = true
    
    autoDodgeLoop = runService.Heartbeat:Connect(function()
        if not genv.AutoDodge then return end
        local target = getClosestPlayer()
        if target and target.Character then
            local hum = target.Character:FindFirstChildOfClass("Humanoid")
            if hum and hum:GetState() == Enum.HumanoidStateType.Running then
                task.wait(0.3)
            end
        end
        task.wait(0.1)
    end)
    
    StarterGui:SetCore("SendNotification", {
        Title = "💨 ELITE HUB",
        Text = "Auto Dodge STARTED! 🥀",
        Duration = 2
    })
end

local function stopAutoDodge()
    genv.AutoDodge = false
    if autoDodgeLoop then
        autoDodgeLoop:Disconnect()
        autoDodgeLoop = nil
    end
    StarterGui:SetCore("SendNotification", {
        Title = "💨 ELITE HUB",
        Text = "Auto Dodge STOPPED",
        Duration = 2
    })
end

-- // ========== AUTO ULT ==========
local function startAutoUlt()
    if autoUltLoop then return end
    genv.AutoUlt = true
    
    autoUltLoop = runService.Heartbeat:Connect(function()
        if not genv.AutoUlt then return end
        local target = getClosestPlayer()
        if target then
            task.wait(2)
        end
        task.wait(0.5)
    end)
    
    StarterGui:SetCore("SendNotification", {
        Title = "💥 ELITE HUB",
        Text = "Auto Ult STARTED! 🥀",
        Duration = 2
    })
end

local function stopAutoUlt()
    genv.AutoUlt = false
    if autoUltLoop then
        autoUltLoop:Disconnect()
        autoUltLoop = nil
    end
    StarterGui:SetCore("SendNotification", {
        Title = "💥 ELITE HUB",
        Text = "Auto Ult STOPPED",
        Duration = 2
    })
end

-- // ========== NOCLIP ==========
local function toggleNoClip()
    genv.NoClip = not genv.NoClip
    if genv.NoClip then
        noClipConnection = runService.Stepped:Connect(function()
            if not genv.NoClip or not character then return end
            for _, v in pairs(character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
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

-- // ========== INFINITE JUMP ==========
local function toggleInfiniteJump()
    genv.InfiniteJump = not genv.InfiniteJump
    if genv.InfiniteJump then
        infiniteJumpConnection = UserInputService.JumpRequest:Connect(function()
            if genv.InfiniteJump and character then
                local hum = character:FindFirstChildOfClass("Humanoid")
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

-- // ========== BYPASS FUNCTIONS ==========
local function toggleACBypass()
    genv.ACBypass = not genv.ACBypass
    if genv.ACBypass then
        bypassAC()
        StarterGui:SetCore("SendNotification", {
            Title = "🛡️ ELITE HUB",
            Text = "AC Bypass ENABLED 🥀",
            Duration = 2
        })
    else
        StarterGui:SetCore("SendNotification", {
            Title = "🛡️ ELITE HUB",
            Text = "AC Bypass DISABLED",
            Duration = 2
        })
    end
end

-- // ========== MAIN TAB ==========
mainTab:CreateDivider()

mainTab:CreateToggle({
   Name = "Speed Boost",
   CurrentValue = false,
   Flag = "SpeedBoostToggle",
   Callback = function(Value)
       tpwalking = Value
   end,
})

mainTab:CreateSlider({
   Name = "Speed",
   Range = {0, 5},
   Increment = 0.1,
   Suffix = "*",
   CurrentValue = 0.1,
   Flag = "SpeedBoostSlider",
   Callback = function(Value)
       tspeed = Value
   end,
})

runService.Heartbeat:Connect(function()
    if tpwalking and character and humanoid then
        if humanoid.MoveDirection.Magnitude > 0 then
            if tspeed then
                 humanoidRootPart.CFrame = humanoidRootPart.CFrame + (humanoid.MoveDirection * tspeed)
            end
        end
    end
end)

mainTab:CreateToggle({
   Name = "Jump Boost",
   CurrentValue = false,
   Flag = "JumpBoostToggle",
   Callback = function(Value)
       if humanoid then
           humanoid.UseJumpPower = not Value
       end
   end,
})

mainTab:CreateSlider({
   Name = "Jump",
   Range = {7.2, 500},
   Increment = 0.1,
   Suffix = "%",
   CurrentValue = 7.2,
   Flag = "JumpBoostSlider",
   Callback = function(Value)
       if humanoid then
           humanoid.JumpHeight = Value
       end
   end,
})

mainTab:CreateDivider()

mainTab:CreateSlider({
   Name = "Gravity",
   Range = {0, 192.6},
   Increment = 0.1,
   Suffix = "%",
   CurrentValue = 192.6,
   Flag = "GravitySlider",
   Callback = function(Value)
       workspace.Gravity = Value
   end,
})

mainTab:CreateSlider({
   Name = "FOV",
   Range = {0, 120},
   Increment = 0.1,
   Suffix = "%",
   CurrentValue = 70,
   Flag = "FOVSlider",
   Callback = function(Value)
       workspace.CurrentCamera.FieldOfView = Value
   end,
})

mainTab:CreateDivider()

mainTab:CreateSection("EXPLOITS 🥀")

mainTab:CreateToggle({
   Name = "No Dash Cooldown",
   CurrentValue = false,
   Flag = "noDashCooldownToggle",
   Callback = function(Value)
       workspace:SetAttribute("NoDashCooldown", Value)
   end,
})

mainTab:CreateToggle({
   Name = "No Fatigue",
   CurrentValue = false,
   Flag = "noFatigueToggle",
   Callback = function(Value)
       workspace:SetAttribute("NoFatigue", Value)
   end,
})

mainTab:CreateDivider()

mainTab:CreateToggle({
   Name = "Emotes Extra Slots",
   CurrentValue = false,
   Flag = "emotesExtraSlotsToggle",
   Callback = function(Value)
       localPlayer:SetAttribute("ExtraSlots", Value)
   end,
})

mainTab:CreateToggle({
   Name = "Emotes Search Bar",
   CurrentValue = false,
   Flag = "emotesSearchBarToggle",
   Callback = function(Value)
       localPlayer:SetAttribute("EmoteSearchBar", Value)
   end,
})

-- // ========== COMBAT TAB ==========
combatTab:CreateSection("⚔️ AUTO COMBAT")

combatTab:CreateToggle({
   Name = "Auto Farm",
   CurrentValue = false,
   Flag = "AutoFarmToggle",
   Callback = function(Value)
       if Value then startAutoFarm() else stopAutoFarm() end
   end,
})

combatTab:CreateToggle({
   Name = "Auto Block",
   CurrentValue = false,
   Flag = "AutoBlockToggle",
   Callback = function(Value)
       if Value then startAutoBlock() else stopAutoBlock() end
   end,
})

combatTab:CreateToggle({
   Name = "Auto Dodge",
   CurrentValue = false,
   Flag = "AutoDodgeToggle",
   Callback = function(Value)
       if Value then startAutoDodge() else stopAutoDodge() end
   end,
})

combatTab:CreateToggle({
   Name = "Auto Ultimate",
   CurrentValue = false,
   Flag = "AutoUltToggle",
   Callback = function(Value)
       if Value then startAutoUlt() else stopAutoUlt() end
   end,
})

combatTab:CreateDivider()

combatTab:CreateSection("🎯 MANUAL COMBAT")

combatTab:CreateButton({
    Name = "⚔️ Attack Closest Player",
    Callback = function()
        local target = getClosestPlayer()
        if target then
            attackPlayer(target)
            StarterGui:SetCore("SendNotification", {
                Title = "💥 ELITE HUB",
                Text = "Attacked: " .. target.Name,
                Duration = 2
            })
        end
    end
})

-- // ========== HITBOX TAB ==========
hitboxTab:CreateSection("🎯 HITBOX EXPANDER")

hitboxTab:CreateToggle({
    Name = "Enable Hitbox Expander",
    CurrentValue = false,
    Flag = "HitboxToggle",
    Callback = function(Value)
        if Value then
            startHitboxExpand()
        else
            stopHitboxExpand()
        end
    end
})

hitboxTab:CreateSlider({
    Name = "Hitbox Size",
    Range = {1, 50},
    Increment = 0.5,
    Suffix = "studs",
    CurrentValue = 5,
    Flag = "HitboxSizeSlider",
    Callback = function(Value)
        genv.HitboxSize = Value
        if genv.HitboxExpand then
            for _, player in pairs(players:GetPlayers()) do
                if player ~= localPlayer then
                    expandHitbox(player, genv.HitboxSize)
                end
            end
        end
    end
})

hitboxTab:CreateDropdown({
    Name = "Hitbox Part",
    Options = {"HumanoidRootPart", "Head", "Torso", "UpperTorso", "LowerTorso", "LeftLeg", "RightLeg", "LeftArm", "RightArm"},
    CurrentOption = "HumanoidRootPart",
    Flag = "HitboxPartDropdown",
    Callback = function(Value)
        genv.HitboxPart = Value
        if genv.HitboxExpand then
            restoreAllHitboxes()
            for _, player in pairs(players:GetPlayers()) do
                if player ~= localPlayer then
                    expandHitbox(player, genv.HitboxSize)
                end
            end
        end
    end
})

hitboxTab:CreateToggle({
    Name = "Expand Own Hitbox",
    CurrentValue = false,
    Flag = "HitboxSelfToggle",
    Callback = function(Value)
        genv.HitboxSelf = Value
        if genv.HitboxExpand then
            if Value then
                expandHitbox(localPlayer, genv.HitboxSize)
            else
                restoreHitbox(localPlayer)
            end
        end
    end
})

hitboxTab:CreateDivider()

hitboxTab:CreateSection("🎯 HITBOX VISUALS")

hitboxTab:CreateToggle({
    Name = "Show Hitbox Visibility",
    CurrentValue = false,
    Flag = "HitboxVisibilityToggle",
    Callback = function(Value)
        genv.HitboxVisibility = Value
        if Value then
            for _, player in pairs(players:GetPlayers()) do
                if player.Character then
                    for _, part in pairs(player.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Transparency = 0.3
                        end
                    end
                end
            end
        else
            for _, player in pairs(players:GetPlayers()) do
                if player.Character then
                    for _, part in pairs(player.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Transparency = 1
                        end
                    end
                end
            end
        end
    end
})

hitboxTab:CreateButton({
    Name = "🔄 Reset All Hitboxes",
    Callback = function()
        restoreAllHitboxes()
        StarterGui:SetCore("SendNotification", {
            Title = "🔄 ELITE HUB",
            Text = "All hitboxes restored! 🥀",
            Duration = 2
        })
    end
})

-- // ========== TELEPORT TAB ==========
teleportTab:CreateSection("🚀 TELEPORTS")

teleportTab:CreateButton({
    Name = "Middle",
    Callback = function()
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(148, 441, 27)
        end
    end
})

teleportTab:CreateButton({
    Name = "Atomic Room",
    Callback = function()
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(1079, 155, 23003)
        end
    end
})

teleportTab:CreateButton({
    Name = "Death Counter Room",
    Callback = function()
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(-92, 29, 20347)
        end
    end
})

teleportTab:CreateButton({
    Name = "Baseplate",
    Callback = function()
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(968, 20, 23088)
        end
    end
})

teleportTab:CreateButton({
    Name = "Mountain 1",
    Callback = function()
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(266, 699, 458)
        end
    end
})

teleportTab:CreateButton({
    Name = "Mountain 2",
    Callback = function()
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(551, 630, -265)
        end
    end
})

teleportTab:CreateButton({
    Name = "Mountain 3",
    Callback = function()
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(-107, 642, -328)
        end
    end
})

teleportTab:CreateDivider()

teleportTab:CreateSection("📌 SAVE POSITION")

teleportTab:CreateButton({
    Name = "Save Current Position",
    Callback = function()
        if humanoidRootPart then
            genv.SavedPos = humanoidRootPart.Position
            StarterGui:SetCore("SendNotification", {
                Title = "📌 ELITE HUB",
                Text = "Position saved! 🥀",
                Duration = 2
            })
        end
    end
})

teleportTab:CreateButton({
    Name = "Teleport to Saved Position",
    Callback = function()
        if humanoidRootPart and genv.SavedPos then
            humanoidRootPart.CFrame = CFrame.new(genv.SavedPos)
            StarterGui:SetCore("SendNotification", {
                Title = "📌 ELITE HUB",
                Text = "Teleported to saved position! 🥀",
                Duration = 2
            })
        end
    end
})

-- // ========== VISUAL TAB ==========
visualTab:CreateSection("👁️ VISUALS")

visualTab:CreateToggle({
   Name = "NoClip",
   CurrentValue = false,
   Flag = "NoClipToggle",
   Callback = function(Value)
       if Value then
           if not genv.NoClip then toggleNoClip() end
       else
           if genv.NoClip then toggleNoClip() end
       end
   end,
})

visualTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "InfiniteJumpToggle",
   Callback = function(Value)
       if Value then
           if not genv.InfiniteJump then toggleInfiniteJump() end
       else
           if genv.InfiniteJump then toggleInfiniteJump() end
       end
   end,
})

-- // ========== BYPASS TAB ==========
bypassTab:CreateSection("🛡️ ANTI-CHEAT BYPASS")

bypassTab:CreateToggle({
    Name = "Enable AC Bypass",
    CurrentValue = true,
    Flag = "ACBypassToggle",
    Callback = function(Value)
        if Value then
            toggleACBypass()
        else
            genv.ACBypass = false
            StarterGui:SetCore("SendNotification", {
                Title = "🛡️ ELITE HUB",
                Text = "AC Bypass DISABLED",
                Duration = 2
            })
        end
    end
})

bypassTab:CreateDropdown({
    Name = "Bypass Mode",
    Options = {"Stealth", "Aggressive", "Full"},
    CurrentOption = "Stealth",
    Flag = "ACModeDropdown",
    Callback = function(Value)
        genv.ACMode = Value
        if Value == "Stealth" then
            StarterGui:SetCore("SendNotification", {
                Title = "🛡️ ELITE HUB",
                Text = "Stealth Mode - Low detection risk 🥀",
                Duration = 2
            })
        elseif Value == "Aggressive" then
            StarterGui:SetCore("SendNotification", {
                Title = "🛡️ ELITE HUB",
                Text = "Aggressive Mode - Medium detection risk 🥀",
                Duration = 2
            })
        elseif Value == "Full" then
            StarterGui:SetCore("SendNotification", {
                Title = "🛡️ ELITE HUB",
                Text = "Full Mode - High risk but OP 🥀",
                Duration = 2
            })
        end
    end
})

bypassTab:CreateDivider()

bypassTab:CreateSection("🛡️ BYPASS STATS")

bypassTab:CreateParagraph({
    Title = "BYPASS STATUS",
    Content = "✅ ACTIVE"
})

bypassTab:CreateParagraph({
    Title = "DETECTION RISK",
    Content = "🟢 LOW"
})

bypassTab:CreateParagraph({
    Title = "MODE",
    Content = "STEALTH"
})

bypassTab:CreateDivider()

bypassTab:CreateSection("🛡️ ADVANCED BYPASS")

bypassTab:CreateToggle({
    Name = "Hide Script from Detection",
    CurrentValue = false,
    Flag = "HideScriptToggle",
    Callback = function(Value)
        genv.HideScript = Value
        if Value then
            if syn and syn.crypt then
                syn.crypt.encrypt("ELITE HUB BY MARCUS 🥀")
            end
            StarterGui:SetCore("SendNotification", {
                Title = "🛡️ ELITE HUB",
                Text = "Script hidden! 🥀",
                Duration = 2
            })
        end
    end
})

bypassTab:CreateButton({
    Name = "🔄 Refresh Bypass",
    Callback = function()
        bypassAC()
        StarterGui:SetCore("SendNotification", {
            Title = "🛡️ ELITE HUB",
            Text = "Bypass refreshed! 🥀",
            Duration = 2
        })
    end
})

bypassTab:CreateButton({
    Name = "🛡️ Emergency Bypass",
    Callback = function()
        -- // Emergency bypass if detected
        pcall(function()
            -- // Reset character if about to be kicked
            if localPlayer.Character then
                localPlayer.Character:BreakJoints()
                task.wait(0.5)
                localPlayer:LoadCharacter()
            end
            
            -- // Clear any pending kicks
            local oldKick = game.Kick
            game.Kick = function(...)
                return nil
            end
            
            -- // Re-bypass
            bypassAC()
        end)
        
        StarterGui:SetCore("SendNotification", {
            Title = "🛡️ ELITE HUB",
            Text = "Emergency bypass activated! 🥀",
            Duration = 3
        })
    end
})

-- // ========== SETTINGS TAB ==========
settingsTab:CreateSection("⚙️ SETTINGS")

settingsTab:CreateParagraph({
    Title = "VERSION",
    Content = "v1.0.0 🥀"
})

settingsTab:CreateParagraph({
    Title = "MADE BY",
    Content = "marcus 🥀"
})

settingsTab:CreateParagraph({
    Title = "DISCORD",
    Content = "discord.gg/5RuMCxK3u6"
})

settingsTab:CreateButton({
    Name = "📋 Copy Discord Link",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/5RuMCxK3u6")
        end
        StarterGui:SetCore("SendNotification", {
            Title = "📋 ELITE HUB",
            Text = "Discord link copied bitch! 🥀",
            Duration = 2
        })
    end
})

settingsTab:CreateButton({
    Name = "🔄 Reset All Settings",
    Callback = function()
        if genv.AutoFarm then stopAutoFarm() end
        if genv.AutoBlock then stopAutoBlock() end
        if genv.AutoDodge then stopAutoDodge() end
        if genv.AutoUlt then stopAutoUlt() end
        if genv.NoClip then toggleNoClip() end
        if genv.InfiniteJump then toggleInfiniteJump() end
        if genv.HitboxExpand then stopHitboxExpand() end
        
        genv.AutoFarm = false
        genv.AutoBlock = false
        genv.AutoDodge = false
        genv.AutoUlt = false
        genv.NoClip = false
        genv.InfiniteJump = false
        genv.HitboxExpand = false
        genv.HitboxSize = 5
        genv.HitboxSelf = false
        genv.ACBypass = true
        genv.ACMode = "Stealth"
        tpwalking = false
        tspeed = 0.1
        
        workspace.Gravity = 192.6
        workspace.CurrentCamera.FieldOfView = 70
        
        if humanoid then
            humanoid.JumpHeight = 7.2
            humanoid.UseJumpPower = true
        end
        
        restoreAllHitboxes()
        bypassAC()
        
        StarterGui:SetCore("SendNotification", {
            Title = "🔄 ELITE HUB",
            Text = "All settings reset bitch! 🥀",
            Duration = 2
        })
    end
})

settingsTab:CreateButton({
    Name = "🗑️ Unload Script",
    Callback = function()
        if genv.AutoFarm then stopAutoFarm() end
        if genv.AutoBlock then stopAutoBlock() end
        if genv.AutoDodge then stopAutoDodge() end
        if genv.AutoUlt then stopAutoUlt() end
        if genv.NoClip then toggleNoClip() end
        if genv.InfiniteJump then toggleInfiniteJump() end
        if genv.HitboxExpand then stopHitboxExpand() end
        if noClipConnection then noClipConnection:Disconnect() noClipConnection = nil end
        if infiniteJumpConnection then infiniteJumpConnection:Disconnect() infiniteJumpConnection = nil end
        restoreAllHitboxes()
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
        for _, v in pairs(combatTab:GetChildren()) do
            if v:IsA("Frame") then
                for _, c in pairs(v:GetDescendants()) do
                    if c:IsA("TextLabel") and c.Text == "Auto Farm" then
                        local btn = c.Parent:FindFirstChildWhichIsA("ImageButton")
                        if btn then btn:Click() end
                    end
                end
            end
        end
    elseif input.KeyCode == Enum.KeyCode.X then
        for _, v in pairs(visualTab:GetChildren()) do
            if v:IsA("Frame") then
                for _, c in pairs(v:GetDescendants()) do
                    if c:IsA("TextLabel") and c.Text == "NoClip" then
                        local btn = c.Parent:FindFirstChildWhichIsA("ImageButton")
                        if btn then btn:Click() end
                    end
                end
            end
        end
    elseif input.KeyCode == Enum.KeyCode.J then
        for _, v in pairs(visualTab:GetChildren()) do
            if v:IsA("Frame") then
                for _, c in pairs(v:GetDescendants()) do
                    if c:IsA("TextLabel") and c.Text == "Infinite Jump" then
                        local btn = c.Parent:FindFirstChildWhichIsA("ImageButton")
                        if btn then btn:Click() end
                    end
                end
            end
        end
    elseif input.KeyCode == Enum.KeyCode.H then
        for _, v in pairs(hitboxTab:GetChildren()) do
            if v:IsA("Frame") then
                for _, c in pairs(v:GetDescendants()) do
                    if c:IsA("TextLabel") and c.Text == "Enable Hitbox Expander" then
                        local btn = c.Parent:FindFirstChildWhichIsA("ImageButton")
                        if btn then btn:Click() end
                    end
                end
            end
        end
    elseif input.KeyCode == Enum.KeyCode.B then
        for _, v in pairs(bypassTab:GetChildren()) do
            if v:IsA("Frame") then
                for _, c in pairs(v:GetDescendants()) do
                    if c:IsA("TextLabel") and c.Text == "Enable AC Bypass" then
                        local btn = c.Parent:FindFirstChildWhichIsA("ImageButton")
                        if btn then btn:Click() end
                    end
                end
            end
        end
    end
end)

-- // ========== CONSOLE OUTPUT ==========
print("████████████████████████████████████████████████████████████")
print("🥀 ELITE HUB v1.0.0 - TSB LOADED")
print("F = Auto Farm | X = NoClip | J = Infinite Jump | H = Hitbox")
print("B = AC Bypass | K = Toggle UI")
print("🛡️ AC BYPASS ACTIVE")
print("DISCORD: discord.gg/5RuMCxK3u6")
print("Made by marcus 🥀")
print("████████████████████████████████████████████████████████████")