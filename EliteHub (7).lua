-- Elite Hub | discord.gg/EmsMsHZCVH

-- Loading Screen for Elite Hub
do
    local _LoadGui = Instance.new('ScreenGui')
    _LoadGui.Name = 'EliteHubLoading'
    _LoadGui.Parent = game:GetService('Players').LocalPlayer:WaitForChild('PlayerGui')
    _LoadGui.ResetOnSpawn = false
    _LoadGui.DisplayOrder = 999

    local _BG = Instance.new('Frame')
    _BG.Size = UDim2.new(1, 0, 1, 0)
    _BG.BackgroundColor3 = Color3.fromRGB(8, 8, 16)
    _BG.BorderSizePixel = 0
    _BG.Parent = _LoadGui

    local _GradTop = Instance.new('UIGradient')
    _GradTop.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 8, 16)),
    })
    _GradTop.Rotation = 90
    _GradTop.Parent = _BG

    local _Title = Instance.new('TextLabel')
    _Title.Size = UDim2.new(0.7, 0, 0.12, 0)
    _Title.Position = UDim2.new(0.15, 0, 0.32, 0)
    _Title.BackgroundTransparency = 1
    _Title.Text = 'Elite Hub'
    _Title.TextColor3 = Color3.fromRGB(255, 30, 30)
    _Title.TextScaled = true
    _Title.Font = Enum.Font.GothamBold
    _Title.Parent = _BG

    local _Sub = Instance.new('TextLabel')
    _Sub.Size = UDim2.new(0.6, 0, 0.05, 0)
    _Sub.Position = UDim2.new(0.2, 0, 0.46, 0)
    _Sub.BackgroundTransparency = 1
    _Sub.Text = 'discord.gg/EmsMsHZCVH'
    _Sub.TextColor3 = Color3.fromRGB(200, 50, 50)
    _Sub.TextScaled = true
    _Sub.Font = Enum.Font.Gotham
    _Sub.Parent = _BG

    local _BarBG = Instance.new('Frame')
    _BarBG.Size = UDim2.new(0.6, 0, 0.025, 0)
    _BarBG.Position = UDim2.new(0.2, 0, 0.56, 0)
    _BarBG.BackgroundColor3 = Color3.fromRGB(30, 10, 10)
    _BarBG.BorderSizePixel = 0
    _BarBG.Parent = _BG
    Instance.new('UICorner', _BarBG).CornerRadius = UDim.new(1, 0)

    local _Bar = Instance.new('Frame')
    _Bar.Size = UDim2.new(0, 0, 1, 0)
    _Bar.BackgroundColor3 = Color3.fromRGB(220, 30, 30)
    _Bar.BorderSizePixel = 0
    _Bar.Parent = _BarBG
    Instance.new('UICorner', _Bar).CornerRadius = UDim.new(1, 0)

    local _Pct = Instance.new('TextLabel')
    _Pct.Size = UDim2.new(0.6, 0, 0.04, 0)
    _Pct.Position = UDim2.new(0.2, 0, 0.60, 0)
    _Pct.BackgroundTransparency = 1
    _Pct.Text = '0%'
    _Pct.TextColor3 = Color3.fromRGB(255, 80, 80)
    _Pct.TextScaled = true
    _Pct.Font = Enum.Font.Gotham
    _Pct.Parent = _BG

    for i = 1, 100 do
        _Bar.Size = UDim2.new(i / 100, 0, 1, 0)
        _Pct.Text = i .. '%'
        task.wait(0.03)
    end
    task.wait(0.4)
    _LoadGui:Destroy()
end


local _PlaceId = game.PlaceId

if _PlaceId == 2753915549 then
    First_Sea = true
elseif _PlaceId == 4442272183 then
    Second_Sea = true
elseif _PlaceId == 7449423635 then
    Third_Sea = true
elseif _PlaceId == 13606098911 then
    Lol_Secret = true
else
    game:Shutdown()
end

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local _VScript = WindUI:CreateWindow({
    Title = "Elite Hub",
    Icon = "rbxassetid://0",
    Author = "Elite Hub",
    Folder = "EliteHub",
    Size = UDim2.fromOffset(550, 600),
    Transparent = true,
    Theme = "Dark",
})
local _Esp = _VScript:CreateTab('Esp', "home")
local _ScreenGui = Instance.new('ScreenGui')

_ScreenGui.Name = 'ScreenGui'
_ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild('PlayerGui')
_ScreenGui.ResetOnSpawn = false

local _TextButton = Instance.new('TextButton')

_TextButton.Name = 'Toggle'
_TextButton.Parent = _ScreenGui
_TextButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_TextButton.Position = UDim2.new(0, 0, 0.454706937, 0)
_TextButton.Size = UDim2.new(0, 90, 0, 38)
_TextButton.Font = Enum.Font.SourceSans
_TextButton.Text = 'Ui'
_TextButton.TextColor3 = Color3.fromRGB(244, 0, 0)
_TextButton.TextSize = 28
_TextButton.Draggable = true

_TextButton.MouseButton1Click:connect(function()
    u2:ToggleUI()
end)

local _UICorner = Instance.new('UICorner')

_UICorner.Name = 'Corner'
_UICorner.Parent = _TextButton

function UpdateIslandESP()
    local v8, v9, v10 = pairs(game:GetService('Workspace')._WorldOrigin.Locations:GetChildren())

    while true do
        local u11

        v10, u11 = v8(v9, v10)

        if v10 == nil then
            break
        end

        pcall(function()
            if IslandESP then
                if u11.Name ~= 'Sea' then
                    if u11:FindFirstChild('NameEsp') then
                        u11.NameEsp.TextLabel.Text = u11.Name .. '   \n' .. round((game:GetService('Players').LocalPlayer.Character.Head.Position - u11.Position).Magnitude / 3) .. ' Distance'
                    else
                        local _BillboardGui = Instance.new('BillboardGui', u11)

                        _BillboardGui.Name = 'NameEsp'
                        _BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui.Adornee = u11
                        _BillboardGui.AlwaysOnTop = true

                        local _TextLabel = Instance.new('TextLabel', _BillboardGui)

                        _TextLabel.Font = 'GothamBold'
                        _TextLabel.FontSize = 'Size14'
                        _TextLabel.TextWrapped = true
                        _TextLabel.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel.TextYAlignment = 'Top'
                        _TextLabel.BackgroundTransparency = 1
                        _TextLabel.TextStrokeTransparency = 0.5
                        _TextLabel.TextColor3 = Color3.fromRGB(7, 236, 240)
                    end
                end
            elseif u11:FindFirstChild('NameEsp') then
                u11:FindFirstChild('NameEsp'):Destroy()
            end
        end)
    end
end
function isnil(p14)
    return p14 == nil
end

local function u16(p15)
    return math.floor(tonumber(p15) + 0.5)
end

Number = math.random(1, 1000000)

function UpdatePlayerChams()
    local v17, v18, v19 = pairs(game:GetService('Players'):GetChildren())

    while true do
        local u20

        v19, u20 = v17(v18, v19)

        if v19 == nil then
            break
        end

        pcall(function()
            if not isnil(u20.Character) then
                if ESPPlayer then
                    if isnil(u20.Character.Head) or u20.Character.Head:FindFirstChild('NameEsp' .. Number) then
                        u20.Character.Head['NameEsp' .. Number].TextLabel.Text = u20.Name .. ' | ' .. u16((game:GetService('Players').LocalPlayer.Character.Head.Position - u20.Character.Head.Position).Magnitude / 3) .. ' Distance\nHealth : ' .. u16(u20.Character.Humanoid.Health * 100 / u20.Character.Humanoid.MaxHealth) .. '%'
                    else
                        local _BillboardGui2 = Instance.new('BillboardGui', u20.Character.Head)

                        _BillboardGui2.Name = 'NameEsp' .. Number
                        _BillboardGui2.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui2.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui2.Adornee = u20.Character.Head
                        _BillboardGui2.AlwaysOnTop = true

                        local _TextLabel2 = Instance.new('TextLabel', _BillboardGui2)

                        _TextLabel2.Font = Enum.Font.GothamSemibold
                        _TextLabel2.FontSize = 'Size14'
                        _TextLabel2.TextWrapped = true
                        _TextLabel2.Text = u20.Name .. ' \n' .. u16((game:GetService('Players').LocalPlayer.Character.Head.Position - u20.Character.Head.Position).Magnitude / 3) .. ' Distance'
                        _TextLabel2.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel2.TextYAlignment = 'Top'
                        _TextLabel2.BackgroundTransparency = 1
                        _TextLabel2.TextStrokeTransparency = 0.5

                        if u20.Team ~= game.Players.LocalPlayer.Team then
                            _TextLabel2.TextColor3 = Color3.new(255, 0, 0)
                        else
                            _TextLabel2.TextColor3 = Color3.new(0, 255, 0)
                        end
                    end
                elseif u20.Character.Head:FindFirstChild('NameEsp' .. Number) then
                    u20.Character.Head:FindFirstChild('NameEsp' .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateChestChams()
    local v23, v24, v25 = pairs(game.Workspace:GetChildren())

    while true do
        local u26

        v25, u26 = v23(v24, v25)

        if v25 == nil then
            break
        end

        pcall(function()
            if string.find(u26.Name, 'Chest') then
                if ChestESP then
                    if string.find(u26.Name, 'Chest') then
                        if u26:FindFirstChild('NameEsp' .. Number) then
                            u26['NameEsp' .. Number].TextLabel.Text = u26.Name .. '   \n' .. u16((game:GetService('Players').LocalPlayer.Character.Head.Position - u26.Position).Magnitude / 3) .. ' Distance'
                        else
                            local _BillboardGui3 = Instance.new('BillboardGui', u26)

                            _BillboardGui3.Name = 'NameEsp' .. Number
                            _BillboardGui3.ExtentsOffset = Vector3.new(0, 1, 0)
                            _BillboardGui3.Size = UDim2.new(1, 200, 1, 30)
                            _BillboardGui3.Adornee = u26
                            _BillboardGui3.AlwaysOnTop = true

                            local _TextLabel3 = Instance.new('TextLabel', _BillboardGui3)

                            _TextLabel3.Font = Enum.Font.GothamSemibold
                            _TextLabel3.FontSize = 'Size14'
                            _TextLabel3.TextWrapped = true
                            _TextLabel3.Size = UDim2.new(1, 0, 1, 0)
                            _TextLabel3.TextYAlignment = 'Top'
                            _TextLabel3.BackgroundTransparency = 1
                            _TextLabel3.TextStrokeTransparency = 0.5

                            if u26.Name == 'Chest1' then
                                _TextLabel3.TextColor3 = Color3.fromRGB(109, 109, 109)
                                _TextLabel3.Text = 'Chest 1' .. ' \n' .. u16((game:GetService('Players').LocalPlayer.Character.Head.Position - u26.Position).Magnitude / 3) .. ' Distance'
                            end
                            if u26.Name == 'Chest2' then
                                _TextLabel3.TextColor3 = Color3.fromRGB(173, 158, 21)
                                _TextLabel3.Text = 'Chest 2' .. ' \n' .. u16((game:GetService('Players').LocalPlayer.Character.Head.Position - u26.Position).Magnitude / 3) .. ' Distance'
                            end
                            if u26.Name == 'Chest3' then
                                _TextLabel3.TextColor3 = Color3.fromRGB(85, 255, 255)
                                _TextLabel3.Text = 'Chest 3' .. ' \n' .. u16((game:GetService('Players').LocalPlayer.Character.Head.Position - u26.Position).Magnitude / 3) .. ' Distance'
                            end
                        end
                    end
                elseif u26:FindFirstChild('NameEsp' .. Number) then
                    u26:FindFirstChild('NameEsp' .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateDevilChams()
    local v29, v30, v31 = pairs(game.Workspace:GetChildren())

    while true do
        local u32

        v31, u32 = v29(v30, v31)

        if v31 == nil then
            break
        end

        pcall(function()
            if DevilFruitESP then
                if string.find(u32.Name, 'Fruit') then
                    if u32.Handle:FindFirstChild('NameEsp' .. Number) then
                        u32.Handle['NameEsp' .. Number].TextLabel.Text = u32.Name .. '   \n' .. u16((game:GetService('Players').LocalPlayer.Character.Head.Position - u32.Handle.Position).Magnitude / 3) .. ' Distance'
                    else
                        local _BillboardGui4 = Instance.new('BillboardGui', u32.Handle)

                        _BillboardGui4.Name = 'NameEsp' .. Number
                        _BillboardGui4.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui4.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui4.Adornee = u32.Handle
                        _BillboardGui4.AlwaysOnTop = true

                        local _TextLabel4 = Instance.new('TextLabel', _BillboardGui4)

                        _TextLabel4.Font = Enum.Font.GothamSemibold
                        _TextLabel4.FontSize = 'Size14'
                        _TextLabel4.TextWrapped = true
                        _TextLabel4.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel4.TextYAlignment = 'Top'
                        _TextLabel4.BackgroundTransparency = 1
                        _TextLabel4.TextStrokeTransparency = 0.5
                        _TextLabel4.TextColor3 = Color3.fromRGB(255, 255, 255)
                        _TextLabel4.Text = u32.Name .. ' \n' .. u16((game:GetService('Players').LocalPlayer.Character.Head.Position - u32.Handle.Position).Magnitude / 3) .. ' Distance'
                    end
                end
            elseif u32.Handle:FindFirstChild('NameEsp' .. Number) then
                u32.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
            end
        end)
    end
end
function UpdateFlowerChams()
    local v35, v36, v37 = pairs(game.Workspace:GetChildren())

    while true do
        local u38

        v37, u38 = v35(v36, v37)

        if v37 == nil then
            break
        end

        pcall(function()
            if u38.Name == 'Flower2' or u38.Name == 'Flower1' then
                if FlowerESP then
                    if u38:FindFirstChild('NameEsp' .. Number) then
                        u38['NameEsp' .. Number].TextLabel.Text = u38.Name .. '   \n' .. u16((game:GetService('Players').LocalPlayer.Character.Head.Position - u38.Position).Magnitude / 3) .. ' Distance'
                    else
                        local _BillboardGui5 = Instance.new('BillboardGui', u38)

                        _BillboardGui5.Name = 'NameEsp' .. Number
                        _BillboardGui5.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui5.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui5.Adornee = u38
                        _BillboardGui5.AlwaysOnTop = true

                        local _TextLabel5 = Instance.new('TextLabel', _BillboardGui5)

                        _TextLabel5.Font = Enum.Font.GothamSemibold
                        _TextLabel5.FontSize = 'Size14'
                        _TextLabel5.TextWrapped = true
                        _TextLabel5.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel5.TextYAlignment = 'Top'
                        _TextLabel5.BackgroundTransparency = 1
                        _TextLabel5.TextStrokeTransparency = 0.5
                        _TextLabel5.TextColor3 = Color3.fromRGB(255, 0, 0)

                        if u38.Name == 'Flower1' then
                            _TextLabel5.Text = 'Blue Flower' .. ' \n' .. u16((game:GetService('Players').LocalPlayer.Character.Head.Position - u38.Position).Magnitude / 3) .. ' Distance'
                            _TextLabel5.TextColor3 = Color3.fromRGB(0, 0, 255)
                        end
                        if u38.Name == 'Flower2' then
                            _TextLabel5.Text = 'Red Flower' .. ' \n' .. u16((game:GetService('Players').LocalPlayer.Character.Head.Position - u38.Position).Magnitude / 3) .. ' Distance'
                            _TextLabel5.TextColor3 = Color3.fromRGB(255, 0, 0)
                        end
                    end
                elseif u38:FindFirstChild('NameEsp' .. Number) then
                    u38:FindFirstChild('NameEsp' .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateRealFruitChams()
    local v41, v42, v43 = pairs(game.Workspace.AppleSpawner:GetChildren())

    while true do
        local v44

        v43, v44 = v41(v42, v43)

        if v43 == nil then
            break
        end
        if v44:IsA('Tool') then
            if RealFruitESP then
                if v44.Handle:FindFirstChild('NameEsp' .. Number) then
                    v44.Handle['NameEsp' .. Number].TextLabel.Text = v44.Name .. ' ' .. u16((game:GetService('Players').LocalPlayer.Character.Head.Position - v44.Handle.Position).Magnitude / 3) .. ' Distance'
                else
                    local _BillboardGui6 = Instance.new('BillboardGui', v44.Handle)

                    _BillboardGui6.Name = 'NameEsp' .. Number
                    _BillboardGui6.ExtentsOffset = Vector3.new(0, 1, 0)
                    _BillboardGui6.Size = UDim2.new(1, 200, 1, 30)
                    _BillboardGui6.Adornee = v44.Handle
                    _BillboardGui6.AlwaysOnTop = true

                    local _TextLabel6 = Instance.new('TextLabel', _BillboardGui6)

                    _TextLabel6.Font = Enum.Font.GothamSemibold
                    _TextLabel6.FontSize = 'Size14'
                    _TextLabel6.TextWrapped = true
                    _TextLabel6.Size = UDim2.new(1, 0, 1, 0)
                    _TextLabel6.TextYAlignment = 'Top'
                    _TextLabel6.BackgroundTransparency = 1
                    _TextLabel6.TextStrokeTransparency = 0.5
                    _TextLabel6.TextColor3 = Color3.fromRGB(255, 0, 0)
                    _TextLabel6.Text = v44.Name .. ' \n' .. u16((game:GetService('Players').LocalPlayer.Character.Head.Position - v44.Handle.Position).Magnitude / 3) .. ' Distance'
                end
            elseif v44.Handle:FindFirstChild('NameEsp' .. Number) then
                v44.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
            end
        end
    end

    local v47, v48, v49 = pairs(game.Workspace.PineappleSpawner:GetChildren())

    while true do
        local v50

        v49, v50 = v47(v48, v49)

        if v49 == nil then
            break
        end
        if v50:IsA('Tool') then
            if RealFruitESP then
                if v50.Handle:FindFirstChild('NameEsp' .. Number) then
                    v50.Handle['NameEsp' .. Number].TextLabel.Text = v50.Name .. ' ' .. u16((game:GetService('Players').LocalPlayer.Character.Head.Position - v50.Handle.Position).Magnitude / 3) .. ' Distance'
                else
                    local _BillboardGui7 = Instance.new('BillboardGui', v50.Handle)

                    _BillboardGui7.Name = 'NameEsp' .. Number
                    _BillboardGui7.ExtentsOffset = Vector3.new(0, 1, 0)
                    _BillboardGui7.Size = UDim2.new(1, 200, 1, 30)
                    _BillboardGui7.Adornee = v50.Handle
                    _BillboardGui7.AlwaysOnTop = true

                    local _TextLabel7 = Instance.new('TextLabel', _BillboardGui7)

                    _TextLabel7.Font = Enum.Font.GothamSemibold
                    _TextLabel7.FontSize = 'Size14'
                    _TextLabel7.TextWrapped = true
                    _TextLabel7.Size = UDim2.new(1, 0, 1, 0)
                    _TextLabel7.TextYAlignment = 'Top'
                    _TextLabel7.BackgroundTransparency = 1
                    _TextLabel7.TextStrokeTransparency = 0.5
                    _TextLabel7.TextColor3 = Color3.fromRGB(255, 174, 0)
                    _TextLabel7.Text = v50.Name .. ' \n' .. u16((game:GetService('Players').LocalPlayer.Character.Head.Position - v50.Handle.Position).Magnitude / 3) .. ' Distance'
                end
            elseif v50.Handle:FindFirstChild('NameEsp' .. Number) then
                v50.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
            end
        end
    end

    local v53, v54, v55 = pairs(game.Workspace.BananaSpawner:GetChildren())

    while true do
        local v56

        v55, v56 = v53(v54, v55)

        if v55 == nil then
            break
        end
        if v56:IsA('Tool') then
            if RealFruitESP then
                if v56.Handle:FindFirstChild('NameEsp' .. Number) then
                    v56.Handle['NameEsp' .. Number].TextLabel.Text = v56.Name .. ' ' .. u16((game:GetService('Players').LocalPlayer.Character.Head.Position - v56.Handle.Position).Magnitude / 3) .. ' Distance'
                else
                    local _BillboardGui8 = Instance.new('BillboardGui', v56.Handle)

                    _BillboardGui8.Name = 'NameEsp' .. Number
                    _BillboardGui8.ExtentsOffset = Vector3.new(0, 1, 0)
                    _BillboardGui8.Size = UDim2.new(1, 200, 1, 30)
                    _BillboardGui8.Adornee = v56.Handle
                    _BillboardGui8.AlwaysOnTop = true

                    local _TextLabel8 = Instance.new('TextLabel', _BillboardGui8)

                    _TextLabel8.Font = Enum.Font.GothamSemibold
                    _TextLabel8.FontSize = 'Size14'
                    _TextLabel8.TextWrapped = true
                    _TextLabel8.Size = UDim2.new(1, 0, 1, 0)
                    _TextLabel8.TextYAlignment = 'Top'
                    _TextLabel8.BackgroundTransparency = 1
                    _TextLabel8.TextStrokeTransparency = 0.5
                    _TextLabel8.TextColor3 = Color3.fromRGB(251, 255, 0)
                    _TextLabel8.Text = v56.Name .. ' \n' .. u16((game:GetService('Players').LocalPlayer.Character.Head.Position - v56.Handle.Position).Magnitude / 3) .. ' Distance'
                end
            elseif v56.Handle:FindFirstChild('NameEsp' .. Number) then
                v56.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
            end
        end
    end
end
function UpdateIslandESP()
    local v59, v60, v61 = pairs(game:GetService('Workspace')._WorldOrigin.Locations:GetChildren())

    while true do
        local u62

        v61, u62 = v59(v60, v61)

        if v61 == nil then
            break
        end

        pcall(function()
            if IslandESP then
                if u62.Name ~= 'Sea' then
                    if u62:FindFirstChild('NameEsp') then
                        u62.NameEsp.TextLabel.Text = u62.Name .. '   \n' .. u16((game:GetService('Players').LocalPlayer.Character.Head.Position - u62.Position).Magnitude / 3) .. ' Distance'
                    else
                        local _BillboardGui9 = Instance.new('BillboardGui', u62)

                        _BillboardGui9.Name = 'NameEsp'
                        _BillboardGui9.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui9.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui9.Adornee = u62
                        _BillboardGui9.AlwaysOnTop = true

                        local _TextLabel9 = Instance.new('TextLabel', _BillboardGui9)

                        _TextLabel9.Font = 'GothamBold'
                        _TextLabel9.FontSize = 'Size14'
                        _TextLabel9.TextWrapped = true
                        _TextLabel9.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel9.TextYAlignment = 'Top'
                        _TextLabel9.BackgroundTransparency = 1
                        _TextLabel9.TextStrokeTransparency = 0.5
                        _TextLabel9.TextColor3 = Color3.fromRGB(7, 236, 240)
                    end
                end
            elseif u62:FindFirstChild('NameEsp') then
                u62:FindFirstChild('NameEsp'):Destroy()
            end
        end)
    end
end
function isnil(p65)
    return p65 == nil
end

local function u67(p66)
    return math.floor(tonumber(p66) + 0.5)
end

Number = math.random(1, 1000000)

function UpdatePlayerChams()
    local v68, v69, v70 = pairs(game:GetService('Players'):GetChildren())

    while true do
        local u71

        v70, u71 = v68(v69, v70)

        if v70 == nil then
            break
        end

        pcall(function()
            if not isnil(u71.Character) then
                if ESPPlayer then
                    if isnil(u71.Character.Head) or u71.Character.Head:FindFirstChild('NameEsp' .. Number) then
                        u71.Character.Head['NameEsp' .. Number].TextLabel.Text = u71.Name .. ' | ' .. u67((game:GetService('Players').LocalPlayer.Character.Head.Position - u71.Character.Head.Position).Magnitude / 3) .. ' Distance\nHealth : ' .. u67(u71.Character.Humanoid.Health * 100 / u71.Character.Humanoid.MaxHealth) .. '%'
                    else
                        local _BillboardGui10 = Instance.new('BillboardGui', u71.Character.Head)

                        _BillboardGui10.Name = 'NameEsp' .. Number
                        _BillboardGui10.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui10.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui10.Adornee = u71.Character.Head
                        _BillboardGui10.AlwaysOnTop = true

                        local _TextLabel10 = Instance.new('TextLabel', _BillboardGui10)

                        _TextLabel10.Font = Enum.Font.GothamSemibold
                        _TextLabel10.FontSize = 'Size14'
                        _TextLabel10.TextWrapped = true
                        _TextLabel10.Text = u71.Name .. ' \n' .. u67((game:GetService('Players').LocalPlayer.Character.Head.Position - u71.Character.Head.Position).Magnitude / 3) .. ' Distance'
                        _TextLabel10.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel10.TextYAlignment = 'Top'
                        _TextLabel10.BackgroundTransparency = 1
                        _TextLabel10.TextStrokeTransparency = 0.5

                        if u71.Team ~= game.Players.LocalPlayer.Team then
                            _TextLabel10.TextColor3 = Color3.new(255, 0, 0)
                        else
                            _TextLabel10.TextColor3 = Color3.new(0, 255, 0)
                        end
                    end
                elseif u71.Character.Head:FindFirstChild('NameEsp' .. Number) then
                    u71.Character.Head:FindFirstChild('NameEsp' .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateChestChams()
    local v74, v75, v76 = pairs(game.Workspace:GetChildren())

    while true do
        local u77

        v76, u77 = v74(v75, v76)

        if v76 == nil then
            break
        end

        pcall(function()
            if string.find(u77.Name, 'Chest') then
                if ChestESP then
                    if string.find(u77.Name, 'Chest') then
                        if u77:FindFirstChild('NameEsp' .. Number) then
                            u77['NameEsp' .. Number].TextLabel.Text = u77.Name .. '   \n' .. u67((game:GetService('Players').LocalPlayer.Character.Head.Position - u77.Position).Magnitude / 3) .. ' Distance'
                        else
                            local _BillboardGui11 = Instance.new('BillboardGui', u77)

                            _BillboardGui11.Name = 'NameEsp' .. Number
                            _BillboardGui11.ExtentsOffset = Vector3.new(0, 1, 0)
                            _BillboardGui11.Size = UDim2.new(1, 200, 1, 30)
                            _BillboardGui11.Adornee = u77
                            _BillboardGui11.AlwaysOnTop = true

                            local _TextLabel11 = Instance.new('TextLabel', _BillboardGui11)

                            _TextLabel11.Font = Enum.Font.GothamSemibold
                            _TextLabel11.FontSize = 'Size14'
                            _TextLabel11.TextWrapped = true
                            _TextLabel11.Size = UDim2.new(1, 0, 1, 0)
                            _TextLabel11.TextYAlignment = 'Top'
                            _TextLabel11.BackgroundTransparency = 1
                            _TextLabel11.TextStrokeTransparency = 0.5

                            if u77.Name == 'Chest1' then
                                _TextLabel11.TextColor3 = Color3.fromRGB(109, 109, 109)
                                _TextLabel11.Text = 'Chest 1' .. ' \n' .. u67((game:GetService('Players').LocalPlayer.Character.Head.Position - u77.Position).Magnitude / 3) .. ' Distance'
                            end
                            if u77.Name == 'Chest2' then
                                _TextLabel11.TextColor3 = Color3.fromRGB(173, 158, 21)
                                _TextLabel11.Text = 'Chest 2' .. ' \n' .. u67((game:GetService('Players').LocalPlayer.Character.Head.Position - u77.Position).Magnitude / 3) .. ' Distance'
                            end
                            if u77.Name == 'Chest3' then
                                _TextLabel11.TextColor3 = Color3.fromRGB(85, 255, 255)
                                _TextLabel11.Text = 'Chest 3' .. ' \n' .. u67((game:GetService('Players').LocalPlayer.Character.Head.Position - u77.Position).Magnitude / 3) .. ' Distance'
                            end
                        end
                    end
                elseif u77:FindFirstChild('NameEsp' .. Number) then
                    u77:FindFirstChild('NameEsp' .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateDevilChams()
    local v80, v81, v82 = pairs(game.Workspace:GetChildren())

    while true do
        local u83

        v82, u83 = v80(v81, v82)

        if v82 == nil then
            break
        end

        pcall(function()
            if DevilFruitESP then
                if string.find(u83.Name, 'Fruit') then
                    if u83.Handle:FindFirstChild('NameEsp' .. Number) then
                        u83.Handle['NameEsp' .. Number].TextLabel.Text = u83.Name .. '   \n' .. u67((game:GetService('Players').LocalPlayer.Character.Head.Position - u83.Handle.Position).Magnitude / 3) .. ' Distance'
                    else
                        local _BillboardGui12 = Instance.new('BillboardGui', u83.Handle)

                        _BillboardGui12.Name = 'NameEsp' .. Number
                        _BillboardGui12.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui12.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui12.Adornee = u83.Handle
                        _BillboardGui12.AlwaysOnTop = true

                        local _TextLabel12 = Instance.new('TextLabel', _BillboardGui12)

                        _TextLabel12.Font = Enum.Font.GothamSemibold
                        _TextLabel12.FontSize = 'Size14'
                        _TextLabel12.TextWrapped = true
                        _TextLabel12.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel12.TextYAlignment = 'Top'
                        _TextLabel12.BackgroundTransparency = 1
                        _TextLabel12.TextStrokeTransparency = 0.5
                        _TextLabel12.TextColor3 = Color3.fromRGB(255, 255, 255)
                        _TextLabel12.Text = u83.Name .. ' \n' .. u67((game:GetService('Players').LocalPlayer.Character.Head.Position - u83.Handle.Position).Magnitude / 3) .. ' Distance'
                    end
                end
            elseif u83.Handle:FindFirstChild('NameEsp' .. Number) then
                u83.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
            end
        end)
    end
end
function UpdateFlowerChams()
    local v86, v87, v88 = pairs(game.Workspace:GetChildren())

    while true do
        local u89

        v88, u89 = v86(v87, v88)

        if v88 == nil then
            break
        end

        pcall(function()
            if u89.Name == 'Flower2' or u89.Name == 'Flower1' then
                if FlowerESP then
                    if u89:FindFirstChild('NameEsp' .. Number) then
                        u89['NameEsp' .. Number].TextLabel.Text = u89.Name .. '   \n' .. u67((game:GetService('Players').LocalPlayer.Character.Head.Position - u89.Position).Magnitude / 3) .. ' Distance'
                    else
                        local _BillboardGui13 = Instance.new('BillboardGui', u89)

                        _BillboardGui13.Name = 'NameEsp' .. Number
                        _BillboardGui13.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui13.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui13.Adornee = u89
                        _BillboardGui13.AlwaysOnTop = true

                        local _TextLabel13 = Instance.new('TextLabel', _BillboardGui13)

                        _TextLabel13.Font = Enum.Font.GothamSemibold
                        _TextLabel13.FontSize = 'Size14'
                        _TextLabel13.TextWrapped = true
                        _TextLabel13.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel13.TextYAlignment = 'Top'
                        _TextLabel13.BackgroundTransparency = 1
                        _TextLabel13.TextStrokeTransparency = 0.5
                        _TextLabel13.TextColor3 = Color3.fromRGB(255, 0, 0)

                        if u89.Name == 'Flower1' then
                            _TextLabel13.Text = 'Blue Flower' .. ' \n' .. u67((game:GetService('Players').LocalPlayer.Character.Head.Position - u89.Position).Magnitude / 3) .. ' Distance'
                            _TextLabel13.TextColor3 = Color3.fromRGB(0, 0, 255)
                        end
                        if u89.Name == 'Flower2' then
                            _TextLabel13.Text = 'Red Flower' .. ' \n' .. u67((game:GetService('Players').LocalPlayer.Character.Head.Position - u89.Position).Magnitude / 3) .. ' Distance'
                            _TextLabel13.TextColor3 = Color3.fromRGB(255, 0, 0)
                        end
                    end
                elseif u89:FindFirstChild('NameEsp' .. Number) then
                    u89:FindFirstChild('NameEsp' .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateRealFruitChams()
    local v92, v93, v94 = pairs(game.Workspace.AppleSpawner:GetChildren())

    while true do
        local v95

        v94, v95 = v92(v93, v94)

        if v94 == nil then
            break
        end
        if v95:IsA('Tool') then
            if RealFruitESP then
                if v95.Handle:FindFirstChild('NameEsp' .. Number) then
                    v95.Handle['NameEsp' .. Number].TextLabel.Text = v95.Name .. ' ' .. u67((game:GetService('Players').LocalPlayer.Character.Head.Position - v95.Handle.Position).Magnitude / 3) .. ' Distance'
                else
                    local _BillboardGui14 = Instance.new('BillboardGui', v95.Handle)

                    _BillboardGui14.Name = 'NameEsp' .. Number
                    _BillboardGui14.ExtentsOffset = Vector3.new(0, 1, 0)
                    _BillboardGui14.Size = UDim2.new(1, 200, 1, 30)
                    _BillboardGui14.Adornee = v95.Handle
                    _BillboardGui14.AlwaysOnTop = true

                    local _TextLabel14 = Instance.new('TextLabel', _BillboardGui14)

                    _TextLabel14.Font = Enum.Font.GothamSemibold
                    _TextLabel14.FontSize = 'Size14'
                    _TextLabel14.TextWrapped = true
                    _TextLabel14.Size = UDim2.new(1, 0, 1, 0)
                    _TextLabel14.TextYAlignment = 'Top'
                    _TextLabel14.BackgroundTransparency = 1
                    _TextLabel14.TextStrokeTransparency = 0.5
                    _TextLabel14.TextColor3 = Color3.fromRGB(255, 0, 0)
                    _TextLabel14.Text = v95.Name .. ' \n' .. u67((game:GetService('Players').LocalPlayer.Character.Head.Position - v95.Handle.Position).Magnitude / 3) .. ' Distance'
                end
            elseif v95.Handle:FindFirstChild('NameEsp' .. Number) then
                v95.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
            end
        end
    end

    local v98, v99, v100 = pairs(game.Workspace.PineappleSpawner:GetChildren())

    while true do
        local v101

        v100, v101 = v98(v99, v100)

        if v100 == nil then
            break
        end
        if v101:IsA('Tool') then
            if RealFruitESP then
                if v101.Handle:FindFirstChild('NameEsp' .. Number) then
                    v101.Handle['NameEsp' .. Number].TextLabel.Text = v101.Name .. ' ' .. u67((game:GetService('Players').LocalPlayer.Character.Head.Position - v101.Handle.Position).Magnitude / 3) .. ' Distance'
                else
                    local _BillboardGui15 = Instance.new('BillboardGui', v101.Handle)

                    _BillboardGui15.Name = 'NameEsp' .. Number
                    _BillboardGui15.ExtentsOffset = Vector3.new(0, 1, 0)
                    _BillboardGui15.Size = UDim2.new(1, 200, 1, 30)
                    _BillboardGui15.Adornee = v101.Handle
                    _BillboardGui15.AlwaysOnTop = true

                    local _TextLabel15 = Instance.new('TextLabel', _BillboardGui15)

                    _TextLabel15.Font = Enum.Font.GothamSemibold
                    _TextLabel15.FontSize = 'Size14'
                    _TextLabel15.TextWrapped = true
                    _TextLabel15.Size = UDim2.new(1, 0, 1, 0)
                    _TextLabel15.TextYAlignment = 'Top'
                    _TextLabel15.BackgroundTransparency = 1
                    _TextLabel15.TextStrokeTransparency = 0.5
                    _TextLabel15.TextColor3 = Color3.fromRGB(255, 174, 0)
                    _TextLabel15.Text = v101.Name .. ' \n' .. u67((game:GetService('Players').LocalPlayer.Character.Head.Position - v101.Handle.Position).Magnitude / 3) .. ' Distance'
                end
            elseif v101.Handle:FindFirstChild('NameEsp' .. Number) then
                v101.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
            end
        end
    end

    local v104, v105, v106 = pairs(game.Workspace.BananaSpawner:GetChildren())

    while true do
        local v107

        v106, v107 = v104(v105, v106)

        if v106 == nil then
            break
        end
        if v107:IsA('Tool') then
            if RealFruitESP then
                if v107.Handle:FindFirstChild('NameEsp' .. Number) then
                    v107.Handle['NameEsp' .. Number].TextLabel.Text = v107.Name .. ' ' .. u67((game:GetService('Players').LocalPlayer.Character.Head.Position - v107.Handle.Position).Magnitude / 3) .. ' Distance'
                else
                    local _BillboardGui16 = Instance.new('BillboardGui', v107.Handle)

                    _BillboardGui16.Name = 'NameEsp' .. Number
                    _BillboardGui16.ExtentsOffset = Vector3.new(0, 1, 0)
                    _BillboardGui16.Size = UDim2.new(1, 200, 1, 30)
                    _BillboardGui16.Adornee = v107.Handle
                    _BillboardGui16.AlwaysOnTop = true

                    local _TextLabel16 = Instance.new('TextLabel', _BillboardGui16)

                    _TextLabel16.Font = Enum.Font.GothamSemibold
                    _TextLabel16.FontSize = 'Size14'
                    _TextLabel16.TextWrapped = true
                    _TextLabel16.Size = UDim2.new(1, 0, 1, 0)
                    _TextLabel16.TextYAlignment = 'Top'
                    _TextLabel16.BackgroundTransparency = 1
                    _TextLabel16.TextStrokeTransparency = 0.5
                    _TextLabel16.TextColor3 = Color3.fromRGB(251, 255, 0)
                    _TextLabel16.Text = v107.Name .. ' \n' .. u67((game:GetService('Players').LocalPlayer.Character.Head.Position - v107.Handle.Position).Magnitude / 3) .. ' Distance'
                end
            elseif v107.Handle:FindFirstChild('NameEsp' .. Number) then
                v107.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
            end
        end
    end
end

spawn(function()
    while wait() do
        pcall(function()
            if MobESP then
                local v110, v111, v112 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                while true do
                    local v113

                    v112, v113 = v110(v111, v112)

                    if v112 == nil then
                        break
                    end
                    if v113:FindFirstChild('HumanoidRootPart') then
                        if not v113:FindFirstChild('MobEap') then
                            local _BillboardGui17 = Instance.new('BillboardGui')
                            local _TextLabel17 = Instance.new('TextLabel')

                            _BillboardGui17.Parent = v113
                            _BillboardGui17.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            _BillboardGui17.Active = true
                            _BillboardGui17.Name = 'MobEap'
                            _BillboardGui17.AlwaysOnTop = true
                            _BillboardGui17.LightInfluence = 1
                            _BillboardGui17.Size = UDim2.new(0, 200, 0, 50)
                            _BillboardGui17.StudsOffset = Vector3.new(0, 2.5, 0)
                            _TextLabel17.Parent = _BillboardGui17
                            _TextLabel17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel17.BackgroundTransparency = 1
                            _TextLabel17.Size = UDim2.new(0, 200, 0, 50)
                            _TextLabel17.Font = Enum.Font.GothamBold
                            _TextLabel17.TextColor3 = Color3.fromRGB(7, 236, 240)
                            _TextLabel17.Text.Size = 35
                        end

                        local v116 = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v113.HumanoidRootPart.Position).Magnitude)

                        v113.MobEap.TextLabel.Text = v113.Name .. ' - ' .. v116 .. ' Distance'
                    end
                end
            else
                local v117, v118, v119 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                while true do
                    local v120

                    v119, v120 = v117(v118, v119)

                    if v119 == nil then
                        break
                    end
                    if v120:FindFirstChild('MobEap') then
                        v120.MobEap:Destroy()
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if SeaESP then
                local v121, v122, v123 = pairs(game:GetService('Workspace').SeaBeasts:GetChildren())

                while true do
                    local v124

                    v123, v124 = v121(v122, v123)

                    if v123 == nil then
                        break
                    end
                    if v124:FindFirstChild('HumanoidRootPart') then
                        if not v124:FindFirstChild('Seaesps') then
                            local _BillboardGui18 = Instance.new('BillboardGui')
                            local _TextLabel18 = Instance.new('TextLabel')

                            _BillboardGui18.Parent = v124
                            _BillboardGui18.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            _BillboardGui18.Active = true
                            _BillboardGui18.Name = 'Seaesps'
                            _BillboardGui18.AlwaysOnTop = true
                            _BillboardGui18.LightInfluence = 1
                            _BillboardGui18.Size = UDim2.new(0, 200, 0, 50)
                            _BillboardGui18.StudsOffset = Vector3.new(0, 2.5, 0)
                            _TextLabel18.Parent = _BillboardGui18
                            _TextLabel18.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel18.BackgroundTransparency = 1
                            _TextLabel18.Size = UDim2.new(0, 200, 0, 50)
                            _TextLabel18.Font = Enum.Font.GothamBold
                            _TextLabel18.TextColor3 = Color3.fromRGB(7, 236, 240)
                            _TextLabel18.Text.Size = 35
                        end

                        local v127 = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v124.HumanoidRootPart.Position).Magnitude)

                        v124.Seaesps.TextLabel.Text = v124.Name .. ' - ' .. v127 .. ' Distance'
                    end
                end
            else
                local v128, v129, v130 = pairs(game:GetService('Workspace').SeaBeasts:GetChildren())

                while true do
                    local v131

                    v130, v131 = v128(v129, v130)

                    if v130 == nil then
                        break
                    end
                    if v131:FindFirstChild('Seaesps') then
                        v131.Seaesps:Destroy()
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if NpcESP then
                local v132, v133, v134 = pairs(game:GetService('Workspace').NPCs:GetChildren())

                while true do
                    local v135

                    v134, v135 = v132(v133, v134)

                    if v134 == nil then
                        break
                    end
                    if v135:FindFirstChild('HumanoidRootPart') then
                        if not v135:FindFirstChild('NpcEspes') then
                            local _BillboardGui19 = Instance.new('BillboardGui')
                            local _TextLabel19 = Instance.new('TextLabel')

                            _BillboardGui19.Parent = v135
                            _BillboardGui19.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            _BillboardGui19.Active = true
                            _BillboardGui19.Name = 'NpcEspes'
                            _BillboardGui19.AlwaysOnTop = true
                            _BillboardGui19.LightInfluence = 1
                            _BillboardGui19.Size = UDim2.new(0, 200, 0, 50)
                            _BillboardGui19.StudsOffset = Vector3.new(0, 2.5, 0)
                            _TextLabel19.Parent = _BillboardGui19
                            _TextLabel19.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel19.BackgroundTransparency = 1
                            _TextLabel19.Size = UDim2.new(0, 200, 0, 50)
                            _TextLabel19.Font = Enum.Font.GothamBold
                            _TextLabel19.TextColor3 = Color3.fromRGB(7, 236, 240)
                            _TextLabel19.Text.Size = 35
                        end

                        local v138 = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v135.HumanoidRootPart.Position).Magnitude)

                        v135.NpcEspes.TextLabel.Text = v135.Name .. ' - ' .. v138 .. ' Distance'
                    end
                end
            else
                local v139, v140, v141 = pairs(game:GetService('Workspace').NPCs:GetChildren())

                while true do
                    local v142

                    v141, v142 = v139(v140, v141)

                    if v141 == nil then
                        break
                    end
                    if v142:FindFirstChild('NpcEspes') then
                        v142.NpcEspes:Destroy()
                    end
                end
            end
        end)
    end
end)

function isnil(p143)
    return p143 == nil
end

local function u145(p144)
    return math.floor(tonumber(p144) + 0.5)
end

Number = math.random(1, 1000000)

function UpdateIslandMirageESP()
    local v146, v147, v148 = pairs(game:GetService('Workspace')._WorldOrigin.Locations:GetChildren())

    while true do
        local u149

        v148, u149 = v146(v147, v148)

        if v148 == nil then
            break
        end

        pcall(function()
            if MirageIslandESP then
                if u149.Name == 'Mirage Island' then
                    if u149:FindFirstChild('NameEsp') then
                        u149.NameEsp.TextLabel.Text = u149.Name .. '   \n' .. u145((game:GetService('Players').LocalPlayer.Character.Head.Position - u149.Position).Magnitude / 3) .. ' M'
                    else
                        local _BillboardGui20 = Instance.new('BillboardGui', u149)

                        _BillboardGui20.Name = 'NameEsp'
                        _BillboardGui20.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui20.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui20.Adornee = u149
                        _BillboardGui20.AlwaysOnTop = true

                        local _TextLabel20 = Instance.new('TextLabel', _BillboardGui20)

                        _TextLabel20.Font = 'Code'
                        _TextLabel20.FontSize = 'Size14'
                        _TextLabel20.TextWrapped = true
                        _TextLabel20.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel20.TextYAlignment = 'Top'
                        _TextLabel20.BackgroundTransparency = 1
                        _TextLabel20.TextStrokeTransparency = 0.5
                        _TextLabel20.TextColor3 = Color3.fromRGB(80, 245, 245)
                    end
                end
            elseif u149:FindFirstChild('NameEsp') then
                u149:FindFirstChild('NameEsp'):Destroy()
            end
        end)
    end
end
function isnil(p152)
    return p152 == nil
end

local function u154(p153)
    return math.floor(tonumber(p153) + 0.5)
end

Number = math.random(1, 1000000)

function UpdateAfdESP()
    local v155, v156, v157 = pairs(game:GetService('Workspace').NPCs:GetChildren())

    while true do
        local u158

        v157, u158 = v155(v156, v157)

        if v157 == nil then
            break
        end

        pcall(function()
            if AfdESP then
                if u158.Name == 'Advanced Fruit Dealer' then
                    if u158:FindFirstChild('NameEsp') then
                        u158.NameEsp.TextLabel.Text = u158.Name .. '   \n' .. u154((game:GetService('Players').LocalPlayer.Character.Head.Position - u158.Position).Magnitude / 3) .. ' M'
                    else
                        local _BillboardGui21 = Instance.new('BillboardGui', u158)

                        _BillboardGui21.Name = 'NameEsp'
                        _BillboardGui21.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui21.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui21.Adornee = u158
                        _BillboardGui21.AlwaysOnTop = true

                        local _TextLabel21 = Instance.new('TextLabel', _BillboardGui21)

                        _TextLabel21.Font = 'Code'
                        _TextLabel21.FontSize = 'Size14'
                        _TextLabel21.TextWrapped = true
                        _TextLabel21.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel21.TextYAlignment = 'Top'
                        _TextLabel21.BackgroundTransparency = 1
                        _TextLabel21.TextStrokeTransparency = 0.5
                        _TextLabel21.TextColor3 = Color3.fromRGB(80, 245, 245)
                    end
                end
            elseif u158:FindFirstChild('NameEsp') then
                u158:FindFirstChild('NameEsp'):Destroy()
            end
        end)
    end
end
function UpdateAuraESP()
    local v161, v162, v163 = pairs(game:GetService('Workspace').NPCs:GetChildren())

    while true do
        local u164

        v163, u164 = v161(v162, v163)

        if v163 == nil then
            break
        end

        pcall(function()
            if AuraESP then
                if u164.Name == 'Master of Enhancement' then
                    if u164:FindFirstChild('NameEsp') then
                        u164.NameEsp.TextLabel.Text = u164.Name .. '   \n' .. u154((game:GetService('Players').LocalPlayer.Character.Head.Position - u164.Position).Magnitude / 3) .. ' M'
                    else
                        local _BillboardGui22 = Instance.new('BillboardGui', u164)

                        _BillboardGui22.Name = 'NameEsp'
                        _BillboardGui22.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui22.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui22.Adornee = u164
                        _BillboardGui22.AlwaysOnTop = true

                        local _TextLabel22 = Instance.new('TextLabel', _BillboardGui22)

                        _TextLabel22.Font = 'Code'
                        _TextLabel22.FontSize = 'Size14'
                        _TextLabel22.TextWrapped = true
                        _TextLabel22.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel22.TextYAlignment = 'Top'
                        _TextLabel22.BackgroundTransparency = 1
                        _TextLabel22.TextStrokeTransparency = 0.5
                        _TextLabel22.TextColor3 = Color3.fromRGB(80, 245, 245)
                    end
                end
            elseif u164:FindFirstChild('NameEsp') then
                u164:FindFirstChild('NameEsp'):Destroy()
            end
        end)
    end
end
function UpdateLSDESP()
    local v167, v168, v169 = pairs(game:GetService('Workspace').NPCs:GetChildren())

    while true do
        local u170

        v169, u170 = v167(v168, v169)

        if v169 == nil then
            break
        end

        pcall(function()
            if LADESP then
                if u170.Name == 'Legendary Sword Dealer' then
                    if u170:FindFirstChild('NameEsp') then
                        u170.NameEsp.TextLabel.Text = u170.Name .. '   \n' .. u154((game:GetService('Players').LocalPlayer.Character.Head.Position - u170.Position).Magnitude / 3) .. ' M'
                    else
                        local _BillboardGui23 = Instance.new('BillboardGui', u170)

                        _BillboardGui23.Name = 'NameEsp'
                        _BillboardGui23.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui23.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui23.Adornee = u170
                        _BillboardGui23.AlwaysOnTop = true

                        local _TextLabel23 = Instance.new('TextLabel', _BillboardGui23)

                        _TextLabel23.Font = 'Code'
                        _TextLabel23.FontSize = 'Size14'
                        _TextLabel23.TextWrapped = true
                        _TextLabel23.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel23.TextYAlignment = 'Top'
                        _TextLabel23.BackgroundTransparency = 1
                        _TextLabel23.TextStrokeTransparency = 0.5
                        _TextLabel23.TextColor3 = Color3.fromRGB(80, 245, 245)
                    end
                end
            elseif u170:FindFirstChild('NameEsp') then
                u170:FindFirstChild('NameEsp'):Destroy()
            end
        end)
    end
end
function UpdateGeaESP()
    local v173, v174, v175 = pairs(game:GetService('Workspace').Map.MysticIsland:GetChildren())

    while true do
        local u176

        v175, u176 = v173(v174, v175)

        if v175 == nil then
            break
        end

        pcall(function()
            if GearESP then
                if u176.Name == 'MeshPart' then
                    if u176:FindFirstChild('NameEsp') then
                        u176.NameEsp.TextLabel.Text = u176.Name .. '   \n' .. u154((game:GetService('Players').LocalPlayer.Character.Head.Position - u176.Position).Magnitude / 3) .. ' M'
                    else
                        local _BillboardGui24 = Instance.new('BillboardGui', u176)

                        _BillboardGui24.Name = 'NameEsp'
                        _BillboardGui24.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui24.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui24.Adornee = u176
                        _BillboardGui24.AlwaysOnTop = true

                        local _TextLabel24 = Instance.new('TextLabel', _BillboardGui24)

                        _TextLabel24.Font = 'Code'
                        _TextLabel24.FontSize = 'Size14'
                        _TextLabel24.TextWrapped = true
                        _TextLabel24.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel24.TextYAlignment = 'Top'
                        _TextLabel24.BackgroundTransparency = 1
                        _TextLabel24.TextStrokeTransparency = 0.5
                        _TextLabel24.TextColor3 = Color3.fromRGB(80, 245, 245)
                    end
                end
            elseif u176:FindFirstChild('NameEsp') then
                u176:FindFirstChild('NameEsp'):Destroy()
            end
        end)
    end
end
function TP2(p179)
    local _Magnitude = (p179.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude

    if _Magnitude >= 1 then
        Speed = 350
    end

    game:GetService('TweenService'):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(_Magnitude / Speed, Enum.EasingStyle.Linear), {CFrame = p179}):Play()

    if _G.CancelTween2 then
        game:GetService('TweenService'):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(_Magnitude / Speed, Enum.EasingStyle.Linear), {CFrame = p179}):Cancel()
    end

    _G.Clip2 = true

    wait(_Magnitude / Speed)

    _G.Clip2 = false
end
function Tween(p181)
    Distance = (p181.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude

    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
        game.Players.LocalPlayer.Character.Humanoid.Sit = true
    end

    pcall(function()
        local v182 = {CFrame = p181}

        tween = game:GetService('TweenService'):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Distance / 350, Enum.EasingStyle.Linear), v182)
    end)
    tween:Play()

    if Distance <= 350 then
        tween:Cancel()

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p181
    end
    if _G.StopTween == true then
        tween:Cancel()

        _G.Clip = false
    end
end
function TPB(p183)
    local _TweenService = game:service('TweenService')
    local v185 = TweenInfo.new((game:GetService('Workspace').Boats.MarineBrigade.VehicleSeat.CFrame.Position - p183.Position).Magnitude / 300, Enum.EasingStyle.Linear)

    tween = _TweenService:Create(game:GetService('Workspace').Boats.MarineBrigade.VehicleSeat, v185, {CFrame = p183})

    tween:Play()

    return {
        Stop = function(_)
            tween:Cancel()
        end,
    }
end
function TPP(p186)
    if game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Health > 0 and game:GetService('Players').LocalPlayer.Character:WaitForChild('Humanoid') then
        local _TweenService2 = game:service('TweenService')
        local v188 = TweenInfo.new((game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - p186.Position).Magnitude / 325, Enum.EasingStyle.Linear)

        tween = _TweenService2:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, v188, {CFrame = p186})

        tween:Play()

        return {
            Stop = function(_)
                tween:Cancel()
            end,
        }
    end

    tween:Cancel()

    repeat
        wait()
    until game:GetService('Players').LocalPlayer.Character:WaitForChild('Humanoid') and game:GetService('Players').LocalPlayer.Character:WaitForChild('Humanoid').Health > 0

    wait(7)
end
function PlayerTP()
    if game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Health > 0 and game:GetService('Players').LocalPlayer.Character:WaitForChild('Humanoid') then
        local _TweenService3 = game:service('TweenService')
        local v190 = TweenInfo.new((game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - CFgo.Position).Magnitude / 325, Enum.EasingStyle.Linear)

        tween = _TweenService3:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, v190, {CFrame = CFgo})

        tween:Play()

        return {
            Stop = function(_)
                tween:Cancel()
            end,
        }
    end

    tween:Cancel()

    repeat
        wait()
    until game:GetService('Players').LocalPlayer.Character:WaitForChild('Humanoid') and game:GetService('Players').LocalPlayer.Character:WaitForChild('Humanoid').Health > 0

    wait(7)
end

local v191 = {}
local u192

if Sea1 then
    u192 = {
        Vector3.new(-4652, 873, -1754),
        Vector3.new(-7895, 5547, -380),
        Vector3.new(61164, 5, 1820),
        Vector3.new(3865, 5, -1926),
    }
elseif Sea2 then
    u192 = {
        Vector3.new(-317, 331, 597),
        Vector3.new(2283, 15, 867),
        Vector3.new(923, 125, 32853),
        Vector3.new(-6509, 83, -133),
    }
else
    u192 = Sea3 and {
        Vector3.new(-12471, 374, -7551),
        Vector3.new(5756, 610, -282),
        Vector3.new(-5092, 315, -3130),
        Vector3.new(-12001, 332, -8861),
        Vector3.new(5319, 23, -93),
        Vector3.new(28286, 14897, 103),
    } or v191
end

function GetTPPos(p193)
    local _huge = math.huge
    local u195 = Vector3.new()

    table.foreach(u192, function(_, p196)
        if (p196 - p193).Magnitude <= _huge then
            _huge = (p196 - p193).Magnitude
            u195 = p196
        end
    end)

    return u195
end

local u197 = nil

local function _(p198)
    u197 = p198.p

    local _Character = Player.Character

    if _Character then
        _Character = Player.Character.PrimaryPart
    end
    if _Character then
        local _Magnitude2 = (_Character.Position - p198.p).Magnitude
        local v201 = GetTPPos(p198.p)

        if (_Character.Position - p198.p).Magnitude <= (p198.p - v201).Magnitude + 250 then
            if block then
                if _Magnitude2 <= 450 then
                    game:GetService('TweenService'):Create(block, TweenInfo.new(_Magnitude2 / tonumber(getgenv().TweenSpeed * 1.8), Enum.EasingStyle.Linear), {CFrame = p198}):Play()
                else
                    game:GetService('TweenService'):Create(block, TweenInfo.new(_Magnitude2 / getgenv().TweenSpeed, Enum.EasingStyle.Linear), {CFrame = p198}):Play()
                end
            end
        else
            _Character.CFrame = CFrame.new(v201)
            block.CFrame = CFrame.new(v201)
        end
    end
end

spawn(function()
    pcall(function()
        game:GetService('RunService').Stepped:Connect(function()
            if _G.AutoLevel or (_G.TeleportIsland or (_G.Factory or (_G.Auto_Bone or (_G.AutoRengoku or (_G.NeareastFarm or (_G.AutoElite or (_G.AutoBuyBoat or (_G.AutoW or (_G.AutoTerrorshark or (_G.farmpiranya or (_G.AutoSeaBeast or (_G.Autotushita or (_G.AutoYama or _G.AutoCdk))))))))))))) then
                local v202, v203, v204 = pairs(game:GetService('Players').LocalPlayer.Character:GetDescendants())

                while true do
                    local v205

                    v204, v205 = v202(v203, v204)

                    if v204 == nil then
                        break
                    end
                    if v205:IsA('BasePart') then
                        v205.CanCollide = false
                    end
                end
            end
        end)
    end)
end)

function CheckLevel()
    local _Value = game:GetService('Players').LocalPlayer.Data.Level.Value

    if First_Sea then
        if _Value == 1 or (_Value <= 9 or (SelectMonster == 'Bandit' or SelectArea == 'Jungle')) then
            Ms = 'Bandit'
            NameQuest = 'BanditQuest1'
            QuestLv = 1
            NameMon = 'Bandit'
            CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
            CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
        elseif _Value == 10 or (_Value <= 14 or (SelectMonster == 'Monkey' or SelectArea == 'Jungle')) then
            Ms = 'Monkey'
            NameQuest = 'JungleQuest'
            QuestLv = 1
            NameMon = 'Monkey'
            CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
        elseif _Value == 15 or (_Value <= 29 or (SelectMonster == 'Gorilla' or SelectArea == 'Jungle')) then
            Ms = 'Gorilla'
            NameQuest = 'JungleQuest'
            QuestLv = 2
            NameMon = 'Gorilla'
            CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
        elseif _Value == 30 or (_Value <= 39 or (SelectMonster == 'Pirate' or SelectArea == 'Buggy')) then
            Ms = 'Pirate'
            NameQuest = 'BuggyQuest1'
            QuestLv = 1
            NameMon = 'Pirate'
            CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
        elseif _Value == 40 or (_Value <= 59 or (SelectMonster == 'Brute' or SelectArea == 'Buggy')) then
            Ms = 'Brute'
            NameQuest = 'BuggyQuest1'
            QuestLv = 2
            NameMon = 'Brute'
            CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
        elseif _Value == 60 or (_Value <= 74 or (SelectMonster == 'Desert Bandit' or SelectArea == 'Desert')) then
            Ms = 'Desert Bandit'
            NameQuest = 'DesertQuest'
            QuestLv = 1
            NameMon = 'Desert Bandit'
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
        elseif _Value == 75 or (_Value <= 89 or (SelectMonster == 'Desert Officer' or SelectArea == 'Desert')) then
            Ms = 'Desert Officer'
            NameQuest = 'DesertQuest'
            QuestLv = 2
            NameMon = 'Desert Officer'
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
        elseif _Value == 90 or (_Value <= 99 or (SelectMonster == 'Snow Bandit' or SelectArea == 'Snow')) then
            Ms = 'Snow Bandit'
            NameQuest = 'SnowQuest'
            QuestLv = 1
            NameMon = 'Snow Bandit'
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
        elseif _Value == 100 or (_Value <= 119 or (SelectMonster == 'Snowman' or SelectArea == 'Snow')) then
            Ms = 'Snowman'
            NameQuest = 'SnowQuest'
            QuestLv = 2
            NameMon = 'Snowman'
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
        elseif _Value == 120 or (_Value <= 149 or (SelectMonster == 'Chief Petty Officer' or SelectArea == 'Marine')) then
            Ms = 'Chief Petty Officer'
            NameQuest = 'MarineQuest2'
            QuestLv = 1
            NameMon = 'Chief Petty Officer'
            CFrameQ = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
            CFrameMon = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
        elseif _Value == 150 or (_Value <= 174 or (SelectMonster == 'Sky Bandit' or SelectArea == 'Sky')) then
            Ms = 'Sky Bandit'
            NameQuest = 'SkyQuest'
            QuestLv = 1
            NameMon = 'Sky Bandit'
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
        elseif _Value == 175 or (_Value <= 189 or (SelectMonster == 'Dark Master' or SelectArea == 'Sky')) then
            Ms = 'Dark Master'
            NameQuest = 'SkyQuest'
            QuestLv = 2
            NameMon = 'Dark Master'
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
        elseif _Value == 190 or (_Value <= 209 or (SelectMonster == 'Prisoner' or SelectArea == 'Prison')) then
            Ms = 'Prisoner'
            NameQuest = 'PrisonerQuest'
            QuestLv = 1
            NameMon = 'Prisoner'
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
            CFrameMon = CFrame.new(4937.31885, 0.332031399, 649.574524, 0.694649816, 0, -0.719348073, 0, 1, 0, 0.719348073, 0, 0.694649816)
        elseif _Value == 210 or (_Value <= 249 or (SelectMonster == 'Dangerous Prisoner' or SelectArea == 'Prison')) then
            Ms = 'Dangerous Prisoner'
            NameQuest = 'PrisonerQuest'
            QuestLv = 2
            NameMon = 'Dangerous Prisoner'
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
            CFrameMon = CFrame.new(5099.6626, 0.351562679, 1055.7583, 0.898906827, 0, -0.438139856, 0, 1, 0, 0.438139856, 0, 0.898906827)
        elseif _Value == 250 or (_Value <= 274 or (SelectMonster == 'Toga Warrior' or SelectArea == 'Colosseum')) then
            Ms = 'Toga Warrior'
            NameQuest = 'ColosseumQuest'
            QuestLv = 1
            NameMon = 'Toga Warrior'
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
        elseif _Value == 275 or (_Value <= 299 or (SelectMonster == 'Gladiator' or SelectArea == 'Colosseum')) then
            Ms = 'Gladiator'
            NameQuest = 'ColosseumQuest'
            QuestLv = 2
            NameMon = 'Gladiator'
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1521.3740234375, 81.203170776367, -3066.3139648438)
        elseif _Value == 300 or (_Value <= 324 or (SelectMonster == 'Military Soldier' or SelectArea == 'Magma')) then
            Ms = 'Military Soldier'
            NameQuest = 'MagmaQuest'
            QuestLv = 1
            NameMon = 'Military Soldier'
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
        elseif _Value == 325 or (_Value <= 374 or (SelectMonster == 'Military Spy' or SelectArea == 'Magma')) then
            Ms = 'Military Spy'
            NameQuest = 'MagmaQuest'
            QuestLv = 2
            NameMon = 'Military Spy'
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5787.00293, 75.8262634, 8651.69922, 0.838590562, 0, -0.544762194, 0, 1, 0, 0.544762194, 0, 0.838590562)
        elseif _Value == 375 or (_Value <= 399 or (SelectMonster == 'Fishman Warrior' or SelectArea == 'Fishman')) then
            Ms = 'Fishman Warrior'
            NameQuest = 'FishmanQuest'
            QuestLv = 1
            NameMon = 'Fishman Warrior'
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)

            if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif _Value == 400 or (_Value <= 449 or (SelectMonster == 'Fishman Commando' or SelectArea == 'Fishman')) then
            Ms = 'Fishman Commando'
            NameQuest = 'FishmanQuest'
            QuestLv = 2
            NameMon = 'Fishman Commando'
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)

            if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif _Value == 450 or (_Value <= 474 or (SelectMonster == "God's Guard" or SelectArea == 'Sky Island')) then
            Ms = "God's Guard"
            NameQuest = 'SkyExp1Quest'
            QuestLv = 1
            NameMon = "God's Guard"
            CFrameQ = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
            CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)

            if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-4607.82275, 872.54248, -1667.55688))
            end
        elseif _Value == 475 or (_Value <= 524 or (SelectMonster == 'Shanda' or SelectArea == 'Sky Island')) then
            Ms = 'Shanda'
            NameQuest = 'SkyExp1Quest'
            QuestLv = 2
            NameMon = 'Shanda'
            CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
            CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)

            if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            end
        elseif _Value == 525 or (_Value <= 549 or (SelectMonster == 'Royal Squad' or SelectArea == 'Sky Island')) then
            Ms = 'Royal Squad'
            NameQuest = 'SkyExp2Quest'
            QuestLv = 1
            NameMon = 'Royal Squad'
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
        elseif _Value == 550 or (_Value <= 624 or (SelectMonster == 'Royal Soldier' or SelectArea == 'Sky Island')) then
            Ms = 'Royal Soldier'
            NameQuest = 'SkyExp2Quest'
            QuestLv = 2
            NameMon = 'Royal Soldier'
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
        elseif _Value == 625 or (_Value <= 649 or (SelectMonster == 'Galley Pirate' or SelectArea == 'Fountain')) then
            Ms = 'Galley Pirate'
            NameQuest = 'FountainQuest'
            QuestLv = 1
            NameMon = 'Galley Pirate'
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
        elseif _Value >= 650 or (SelectMonster == 'Galley Captain' or SelectArea == 'Fountain') then
            Ms = 'Galley Captain'
            NameQuest = 'FountainQuest'
            QuestLv = 2
            NameMon = 'Galley Captain'
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
        end
    end
    if Second_Sea then
        if _Value == 700 or (_Value <= 724 or (SelectMonster == 'Raider' or SelectArea == 'Area 1')) then
            Ms = 'Raider'
            NameQuest = 'Area1Quest'
            QuestLv = 1
            NameMon = 'Raider'
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
        elseif _Value == 725 or (_Value <= 774 or (SelectMonster == 'Mercenary' or SelectArea == 'Area 1')) then
            Ms = 'Mercenary'
            NameQuest = 'Area1Quest'
            QuestLv = 2
            NameMon = 'Mercenary'
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
        elseif _Value == 775 or (_Value <= 799 or (SelectMonster == 'Swan Pirate' or SelectArea == 'Area 2')) then
            Ms = 'Swan Pirate'
            NameQuest = 'Area2Quest'
            QuestLv = 1
            NameMon = 'Swan Pirate'
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
        elseif _Value == 800 or (_Value <= 874 or (SelectMonster == 'Factory Staff' or SelectArea == 'Area 2')) then
            Ms = 'Factory Staff'
            NameQuest = 'Area2Quest'
            QuestLv = 2
            NameMon = 'Factory Staff'
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
        elseif _Value == 875 or (_Value <= 899 or (SelectMonster == 'Marine Lieutenan' or SelectArea == 'Marine')) then
            Ms = 'Marine Lieutenant'
            NameQuest = 'MarineQuest3'
            QuestLv = 1
            NameMon = 'Marine Lieutenant'
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
        elseif _Value == 900 or (_Value <= 949 or (SelectMonster == 'Marine Captain' or SelectArea == 'Marine')) then
            Ms = 'Marine Captain'
            NameQuest = 'MarineQuest3'
            QuestLv = 2
            NameMon = 'Marine Captain'
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
        elseif _Value == 950 or (_Value <= 974 or (SelectMonster == 'Zombie' or SelectArea == 'Zombie')) then
            Ms = 'Zombie'
            NameQuest = 'ZombieQuest'
            QuestLv = 1
            NameMon = 'Zombie'
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
        elseif _Value == 975 or (_Value <= 999 or (SelectMonster == 'Vampire' or SelectArea == 'Zombie')) then
            Ms = 'Vampire'
            NameQuest = 'ZombieQuest'
            QuestLv = 2
            NameMon = 'Vampire'
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
        elseif _Value == 1000 or (_Value <= 1049 or (SelectMonster == 'Snow Trooper' or SelectArea == 'Snow Mountain')) then
            Ms = 'Snow Trooper'
            NameQuest = 'SnowMountainQuest'
            QuestLv = 1
            NameMon = 'Snow Trooper'
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
        elseif _Value == 1050 or (_Value <= 1099 or (SelectMonster == 'Winter Warrior' or SelectArea == 'Snow Mountain')) then
            Ms = 'Winter Warrior'
            NameQuest = 'SnowMountainQuest'
            QuestLv = 2
            NameMon = 'Winter Warrior'
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
        elseif _Value == 1100 or (_Value <= 1124 or (SelectMonster == 'Lab Subordinate' or SelectArea == 'Ice Fire')) then
            Ms = 'Lab Subordinate'
            NameQuest = 'IceSideQuest'
            QuestLv = 1
            NameMon = 'Lab Subordinate'
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
        elseif _Value == 1125 or (_Value <= 1174 or (SelectMonster == 'Horned Warrior' or SelectArea == 'Ice Fire')) then
            Ms = 'Horned Warrior'
            NameQuest = 'IceSideQuest'
            QuestLv = 2
            NameMon = 'Horned Warrior'
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)
        elseif _Value == 1175 or (_Value <= 1199 or (SelectMonster == 'Magma Ninja' or SelectArea == 'Ice Fire')) then
            Ms = 'Magma Ninja'
            NameQuest = 'FireSideQuest'
            QuestLv = 1
            NameMon = 'Magma Ninja'
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
        elseif _Value == 1200 or (_Value <= 1249 or (SelectMonster == 'Lava Pirate' or SelectArea == 'Ice Fire')) then
            Ms = 'Lava Pirate'
            NameQuest = 'FireSideQuest'
            QuestLv = 2
            NameMon = 'Lava Pirate'
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
        elseif _Value == 1250 or (_Value <= 1274 or (SelectMonster == 'Ship Deckhand' or SelectArea == 'Ship')) then
            Ms = 'Ship Deckhand'
            NameQuest = 'ShipQuest1'
            QuestLv = 1
            NameMon = 'Ship Deckhand'
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)

            if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif _Value == 1275 or (_Value <= 1299 or (SelectMonster == 'Ship Engineer' or SelectArea == 'Ship')) then
            Ms = 'Ship Engineer'
            NameQuest = 'ShipQuest1'
            QuestLv = 2
            NameMon = 'Ship Engineer'
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)

            if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif _Value == 1300 or (_Value <= 1324 or (SelectMonster == 'Ship Steward' or SelectArea == 'Ship')) then
            Ms = 'Ship Steward'
            NameQuest = 'ShipQuest2'
            QuestLv = 1
            NameMon = 'Ship Steward'
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)

            if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif _Value == 1325 or (_Value <= 1349 or (SelectMonster == 'Ship Officer' or SelectArea == 'Ship')) then
            Ms = 'Ship Officer'
            NameQuest = 'ShipQuest2'
            QuestLv = 2
            NameMon = 'Ship Officer'
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)

            if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif _Value == 1350 or (_Value <= 1374 or (SelectMonster == 'Arctic Warrior' or SelectArea == 'Frost')) then
            Ms = 'Arctic Warrior'
            NameQuest = 'FrostQuest'
            QuestLv = 1
            NameMon = 'Arctic Warrior'
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)

            if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
            end
        elseif _Value == 1375 or (_Value <= 1424 or (SelectMonster == 'Snow Lurker' or SelectArea == 'Frost')) then
            Ms = 'Snow Lurker'
            NameQuest = 'FrostQuest'
            QuestLv = 2
            NameMon = 'Snow Lurker'
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
        elseif _Value == 1425 or (_Value <= 1449 or (SelectMonster == 'Sea Soldier' or SelectArea == 'Forgotten')) then
            Ms = 'Sea Soldier'
            NameQuest = 'ForgottenQuest'
            QuestLv = 1
            NameMon = 'Sea Soldier'
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
        elseif _Value >= 1450 or (SelectMonster == 'Water Fighter' or SelectArea == 'Forgotten') then
            Ms = 'Water Fighter'
            NameQuest = 'ForgottenQuest'
            QuestLv = 2
            NameMon = 'Water Fighter'
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
        end
    end
    if Third_Sea then
        if _Value == 1500 or (_Value <= 1524 or (SelectMonster == 'Pirate Millionaire' or SelectArea == 'Pirate Port')) then
            Ms = 'Pirate Millionaire'
            NameQuest = 'PiratePortQuest'
            QuestLv = 1
            NameMon = 'Pirate Millionaire'
            CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
            CFrameMon = CFrame.new(-435.68109130859, 189.69866943359, 5551.0756835938)
        elseif _Value == 1525 or (_Value <= 1574 or (SelectMonster == 'Pistol Billionaire' or SelectArea == 'Pirate Port')) then
            Ms = 'Pistol Billionaire'
            NameQuest = 'PiratePortQuest'
            QuestLv = 2
            NameMon = 'Pistol Billionaire'
            CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
            CFrameMon = CFrame.new(-236.53652954102, 217.46676635742, 6006.0883789063)
        elseif _Value == 1575 or (_Value <= 1599 or (SelectMonster == 'Dragon Crew Warrior' or SelectArea == 'Amazon')) then
            Ms = 'Dragon Crew Warrior'
            NameQuest = 'AmazonQuest'
            QuestLv = 1
            NameMon = 'Dragon Crew Warrior'
            CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
            CFrameMon = CFrame.new(6301.9975585938, 104.77153015137, -1082.6075439453)
        elseif _Value == 1600 or (_Value <= 1624 or (SelectMonster == 'Dragon Crew Archer' or SelectArea == 'Amazon')) then
            Ms = 'Dragon Crew Archer'
            NameQuest = 'AmazonQuest'
            QuestLv = 2
            NameMon = 'Dragon Crew Archer'
            CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
            CFrameMon = CFrame.new(6831.1171875, 441.76708984375, 446.58615112305)
        elseif _Value == 1625 or (_Value <= 1649 or (SelectMonster == 'Female Islander' or SelectArea == 'Amazon')) then
            Ms = 'Female Islander'
            NameQuest = 'AmazonQuest2'
            QuestLv = 1
            NameMon = 'Female Islander'
            CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(5792.5166015625, 848.14392089844, 1084.1818847656)
        elseif _Value == 1650 or (_Value <= 1699 or (SelectMonster == 'Giant Islander' or SelectArea == 'Amazon')) then
            Ms = 'Giant Islander'
            NameQuest = 'AmazonQuest2'
            QuestLv = 2
            NameMon = 'Giant Islander'
            CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(5009.5068359375, 664.11071777344, -40.960144042969)
        elseif _Value == 1700 or (_Value <= 1724 or (SelectMonster == 'Marine Commodore' or SelectArea == 'Marine Tree')) then
            Ms = 'Marine Commodore'
            NameQuest = 'MarineTreeIsland'
            QuestLv = 1
            NameMon = 'Marine Commodore'
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
        elseif _Value == 1725 or (_Value <= 1774 or (SelectMonster == 'Marine Rear Admiral' or SelectArea == 'Marine Tree')) then
            Ms = 'Marine Rear Admiral'
            NameQuest = 'MarineTreeIsland'
            QuestLv = 2
            NameMon = 'Marine Rear Admiral'
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
        elseif _Value == 1775 or (_Value <= 1799 or (SelectMonster == 'Fishman Raider' or SelectArea == 'Deep Forest')) then
            Ms = 'Fishman Raider'
            NameQuest = 'DeepForestIsland3'
            QuestLv = 1
            NameMon = 'Fishman Raider'
            CFrameQ = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625)
            CFrameMon = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)
        elseif _Value == 1800 or (_Value <= 1824 or (SelectMonster == 'Fishman Captain' or SelectArea == 'Deep Forest')) then
            Ms = 'Fishman Captain'
            NameQuest = 'DeepForestIsland3'
            QuestLv = 2
            NameMon = 'Fishman Captain'
            CFrameQ = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875)
            CFrameMon = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
        elseif _Value == 1825 or (_Value <= 1849 or (SelectMonster == 'Forest Pirate' or SelectArea == 'Deep Forest')) then
            Ms = 'Forest Pirate'
            NameQuest = 'DeepForestIsland'
            QuestLv = 1
            NameMon = 'Forest Pirate'
            CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
            CFrameMon = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
        elseif _Value == 1850 or (_Value <= 1899 or (SelectMonster == 'Mythological Pirate' or SelectArea == 'Deep Forest')) then
            Ms = 'Mythological Pirate'
            NameQuest = 'DeepForestIsland'
            QuestLv = 2
            NameMon = 'Mythological Pirate'
            CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
            CFrameMon = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
        elseif _Value == 1900 or (_Value <= 1924 or (SelectMonster == 'Jungle Pirate' or SelectArea == 'Deep Forest')) then
            Ms = 'Jungle Pirate'
            NameQuest = 'DeepForestIsland2'
            QuestLv = 1
            NameMon = 'Jungle Pirate'
            CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
            CFrameMon = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
        elseif _Value == 1925 or (_Value <= 1974 or (SelectMonster == 'Musketeer Pirate' or SelectArea == 'Deep Forest')) then
            Ms = 'Musketeer Pirate'
            NameQuest = 'DeepForestIsland2'
            QuestLv = 2
            NameMon = 'Musketeer Pirate'
            CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
            CFrameMon = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
        elseif _Value == 1975 or (_Value <= 1999 or (SelectMonster == 'Reborn Skeleton' or SelectArea == 'Haunted Castle')) then
            Ms = 'Reborn Skeleton'
            NameQuest = 'HauntedQuest1'
            QuestLv = 1
            NameMon = 'Reborn Skeleton'
            CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-8, -0.999978542, 2.04920472e-8, 1, 4.51620679e-8, 0.999978542, -2.01955679e-8, -0.00655503059)
            CFrameMon = CFrame.new(-8761.77148, 183.431747, 6168.33301, 0.978073597, -0.000013950732, -0.208259016, -1.08073925e-6, 1, -0.0000720630269, 0.208259016, 0.0000707080399, 0.978073597)
        elseif _Value == 2000 or (_Value <= 2024 or (SelectMonster == 'Living Zombie' or SelectArea == 'Haunted Castle')) then
            Ms = 'Living Zombie'
            NameQuest = 'HauntedQuest1'
            QuestLv = 2
            NameMon = 'Living Zombie'
            CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-8, -0.999978542, 2.04920472e-8, 1, 4.51620679e-8, 0.999978542, -2.01955679e-8, -0.00655503059)
            CFrameMon = CFrame.new(-10103.7529, 238.565979, 6179.75977, 0.999474227, 2.7754714099999998e-8, 0.0324240364, -2.58006327e-8, 1, -6.06848474e-8, -0.0324240364, 5.98163865e-8, 0.999474227)
        elseif _Value == 2025 or (_Value <= 2049 or (SelectMonster == 'Demonic Soul' or SelectArea == 'Haunted Castle')) then
            Ms = 'Demonic Soul'
            NameQuest = 'HauntedQuest2'
            QuestLv = 1
            NameMon = 'Demonic Soul'
            CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
        elseif _Value == 2050 or (_Value <= 2074 or (SelectMonster == 'Posessed Mummy' or SelectArea == 'Haunted Castle')) then
            Ms = 'Posessed Mummy'
            NameQuest = 'HauntedQuest2'
            QuestLv = 2
            NameMon = 'Posessed Mummy'
            CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)
        elseif _Value == 2075 or (_Value <= 2099 or (SelectMonster == 'Peanut Scout' or SelectArea == 'Nut Island')) then
            Ms = 'Peanut Scout'
            NameQuest = 'NutsIslandQuest'
            QuestLv = 1
            NameMon = 'Peanut Scout'
            CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
        elseif _Value == 2100 or (_Value <= 2124 or (SelectMonster == 'Peanut President' or SelectArea == 'Nut Island')) then
            Ms = 'Peanut President'
            NameQuest = 'NutsIslandQuest'
            QuestLv = 2
            NameMon = 'Peanut President'
            CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
        elseif _Value == 2125 or (_Value <= 2149 or (SelectMonster == 'Ice Cream Chef' or SelectArea == 'Ice Cream Island')) then
            Ms = 'Ice Cream Chef'
            NameQuest = 'IceCreamIslandQuest'
            QuestLv = 1
            NameMon = 'Ice Cream Chef'
            CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, 0, -0.997525156, 0, 1.00000012, 0, 0.997525275, 0, -0.0703101456)
        elseif _Value == 2150 or (_Value <= 2199 or (SelectMonster == 'Ice Cream Commander' or SelectArea == 'Ice Cream Island')) then
            Ms = 'Ice Cream Commander'
            NameQuest = 'IceCreamIslandQuest'
            QuestLv = 2
            NameMon = 'Ice Cream Commander'
            CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, 0, -0.997525156, 0, 1.00000012, 0, 0.997525275, 0, -0.0703101456)
        elseif _Value == 2200 or (_Value <= 2224 or (SelectMonster == 'Cookie Crafter' or SelectArea == 'Cake Island')) then
            Ms = 'Cookie Crafter'
            NameQuest = 'CakeQuest1'
            QuestLv = 1
            NameMon = 'Cookie Crafter'
            CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
            CFrameMon = CFrame.new(-2321.71216, 36.699482, -12216.7871, -0.780074954, 0, 0.625686109, 0, 1, 0, -0.625686109, 0, -0.780074954)
        elseif _Value == 2225 or (_Value <= 2249 or (SelectMonster == 'Cake Guard' or SelectArea == 'Cake Island')) then
            Ms = 'Cake Guard'
            NameQuest = 'CakeQuest1'
            QuestLv = 2
            NameMon = 'Cake Guard'
            CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
            CFrameMon = CFrame.new(-1418.11011, 36.6718941, -12255.7324, 0.0677844882, 0, 0.997700036, 0, 1, 0, -0.997700036, 0, 0.0677844882)
        elseif _Value == 2250 or (_Value <= 2274 or (SelectMonster == 'Baking Staff' or SelectArea == 'Cake Island')) then
            Ms = 'Baking Staff'
            NameQuest = 'CakeQuest2'
            QuestLv = 1
            NameMon = 'Baking Staff'
            CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, 0, -0.308980465, 0, 1, 0, 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(-1980.43848, 36.6716766, -12983.8418, -0.254443765, 0, -0.967087567, 0, 1, 0, 0.967087567, 0, -0.254443765)
        elseif _Value == 2275 or (_Value <= 2299 or (SelectMonster == 'Head Baker' or SelectArea == 'Cake Island')) then
            Ms = 'Head Baker'
            NameQuest = 'CakeQuest2'
            QuestLv = 2
            NameMon = 'Head Baker'
            CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, 0, -0.308980465, 0, 1, 0, 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(-2251.5791, 52.2714615, -13033.3965, -0.991971016, 0, -0.126466095, 0, 1, 0, 0.126466095, 0, -0.991971016)
        elseif _Value == 2300 or (_Value <= 2324 or (SelectMonster == 'Cocoa Warrior' or SelectArea == 'Choco Island')) then
            Ms = 'Cocoa Warrior'
            NameQuest = 'ChocQuest1'
            QuestLv = 1
            NameMon = 'Cocoa Warrior'
            CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
            CFrameMon = CFrame.new(167.978516, 26.2254658, -12238.874, -0.939700961, 0, 0.341998369, 0, 1, 0, -0.341998369, 0, -0.939700961)
        elseif _Value == 2325 or (_Value <= 2349 or (SelectMonster == 'Chocolate Bar Battler' or SelectArea == 'Choco Island')) then
            Ms = 'Chocolate Bar Battler'
            NameQuest = 'ChocQuest1'
            QuestLv = 2
            NameMon = 'Chocolate Bar Battler'
            CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
            CFrameMon = CFrame.new(701.312073, 25.5824986, -12708.2148, -0.342042685, 0, -0.939684391, 0, 1, 0, 0.939684391, 0, -0.342042685)
        elseif _Value == 2350 or (_Value <= 2374 or (SelectMonster == 'Sweet Thief' or SelectArea == 'Choco Island')) then
            Ms = 'Sweet Thief'
            NameQuest = 'ChocQuest2'
            QuestLv = 1
            NameMon = 'Sweet Thief'
            CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
            CFrameMon = CFrame.new(-140.258301, 25.5824986, -12652.3115, 0.173624337, 0, -0.984811902, 0, 1, 0, 0.984811902, 0, 0.173624337)
        elseif _Value == 2375 or (_Value <= 2400 or (SelectMonster == 'Candy Rebel' or SelectArea == 'Choco Island')) then
            Ms = 'Candy Rebel'
            NameQuest = 'ChocQuest2'
            QuestLv = 2
            NameMon = 'Candy Rebel'
            CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
            CFrameMon = CFrame.new(47.9231453, 25.5824986, -13029.2402, -0.819156051, 0, -0.573571265, 0, 1, 0, 0.573571265, 0, -0.819156051)
        elseif _Value == 2400 or (_Value <= 2424 or (SelectMonster == 'Candy Pirate' or SelectArea == 'Candy Island')) then
            Ms = 'Candy Pirate'
            NameQuest = 'CandyQuest1'
            QuestLv = 1
            NameMon = 'Candy Pirate'
            CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
            CFrameMon = CFrame.new(-1437.56348, 17.1481285, -14385.6934, 0.173624337, 0, -0.984811902, 0, 1, 0, 0.984811902, 0, 0.173624337)
        elseif _Value == 2425 or (_Value <= 2449 or (SelectMonster == 'Snow Demon' or SelectArea == 'Candy Island')) then
            Ms = 'Snow Demon'
            NameQuest = 'CandyQuest1'
            QuestLv = 2
            NameMon = 'Snow Demon'
            CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
            CFrameMon = CFrame.new(-916.222656, 17.1481285, -14638.8125, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        elseif _Value == 2450 or (_Value <= 2474 or (SelectMonster == 'Isle Outlaw' or SelectArea == 'Tiki Outpost')) then
            Ms = 'Isle Outlaw'
            NameQuest = 'TikiQuest1'
            QuestLv = 1
            NameMon = 'Isle Outlaw'
            CFrameQ = CFrame.new(-16549.890625, 55.68635559082031, -179.91360473632813)
            CFrameMon = CFrame.new(-16162.8193359375, 11.6863374710083, -96.45481872558594)
        elseif _Value == 2475 or (_Value <= 2524 or (SelectMonster == 'Island Boy' or SelectArea == 'Tiki Outpost')) then
            Ms = 'Island Boy'
            NameQuest = 'TikiQuest1'
            QuestLv = 2
            NameMon = 'Island Boy'
            CFrameQ = CFrame.new(-16549.890625, 55.68635559082031, -179.91360473632813)
            CFrameMon = CFrame.new(-16912.130859375, 11.787443161010742, -133.0850830078125)
        elseif _Value >= 2525 or (SelectMonster == 'Isle Champion' or SelectArea == 'Tiki Outpost') then
            Ms = 'Isle Champion'
            NameQuest = 'TikiQuest2'
            QuestLv = 2
            NameMon = 'Isle Champion'
            CFrameQ = CFrame.new(-16542.447265625, 55.68632888793945, 1044.41650390625)
            CFrameMon = CFrame.new(-16848.94140625, 21.68633460998535, 1041.4490966796875)
        end
    end
end
function Click()
    if not getgenv().FastAttack then
        local v207 = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework)
        local v208 = debug.getupvalues(v207)[2]

        require(game.ReplicatedStorage.Util.CameraShaker):Stop()

        v208.activeController.attacking = false
        v208.activeController.timeToNextAttack = 0
        v208.activeController.hitboxMagnitude = 180

        game:GetService('VirtualUser'):CaptureController()
        game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
    end
end
function GetWeaponInventory(p209)
    local v210, v211, v212 = pairs(game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('getInventory'))

    while true do
        local v213

        v212, v213 = v210(v211, v212)

        if v212 == nil then
            break
        end
        if type(v213) == 'table' and (v213.Type == 'Sword' and v213.Name == p209) then
            return true
        end
    end

    return false
end
function AutoHaki()
    if not game:GetService('Players').LocalPlayer.Character:FindFirstChild('HasBuso') then
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Buso')
    end
end
function BTP(p214)
    repeat
        wait(0.5)
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p214

        task.wait()

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p214
    until (p214.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000
end
function BTP(p215)
    pcall(function()
        if (p215.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 and (not Auto_Raid and game.Players.LocalPlayer.Character.Humanoid.Health > 0) then
            if NQuest ~= 'FishmanQuest' then
                if Mon ~= "God's Guard" then
                    if NQuest ~= 'SkyExp1Quest' then
                        if NQuest ~= 'ShipQuest1' then
                            if NQuest ~= 'ShipQuest2' then
                                if NQuest ~= 'FrostQuest' then
                                    Mix_Farm = true

                                    repeat
                                        wait(0.5)

                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p215

                                        wait(0.05)
                                        game.Players.LocalPlayer.Character.Head:Destroy()

                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p215
                                    until (p215.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1500 and game.Players.LocalPlayer.Character.Humanoid.Health > 0

                                    wait()

                                    Mix_Farm = nil
                                else
                                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                                    wait()
                                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
                                end
                            else
                                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                                wait()
                                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                            end
                        else
                            Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                            wait()
                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                        end
                    else
                        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                        wait()
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                    end
                else
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                    wait()
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-4607.82275, 872.54248, -1667.55688))
                end
            else
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                wait()
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        end
    end)
end

local u216 = 0
local u217 = 60
local u218 = 0

function GetBladeHit()
    local v219 = debug.getupvalues(require(Player.PlayerScripts.CombatFramework))[2].activeController.blades[1]

    if not v219 then
        return v219
    end

    while v219.Parent ~= Player.Character do
        task.wait()

        v219 = v219.Parent
    end

    return v219
end
function AttackHit()
    local _ = debug.getupvalues(require(Player.PlayerScripts.CombatFramework))[2]

    for v220 = 1, 1 do
        local v221 = require(ReplicatedStorage.CombatFramework.RigLib).getBladeHits(Player.Character, {
            Player.Character.HumanoidRootPart,
        }, 60)
        local v222, v223, v224 = pairs(v221)
        local u225 = v220
        local v226 = {}
        local u227 = {}

        while true do
            local v228

            v224, v228 = v222(v223, v224)

            if v224 == nil then
                break
            end
            if v228.Parent:FindFirstChild('HumanoidRootPart') and not v226[v228.Parent] then
                table.insert(u227, v228.Parent.HumanoidRootPart)

                v226[v228.Parent] = true
            end
        end

        if #u227 > 0 then
            pcall(function()
                ReplicatedStorage.RigControllerEvent:FireServer('weaponChange', tostring(GetBladeHit()))
                ReplicatedStorage.RigControllerEvent:FireServer('hit', u227, u225, '')
            end)
        end
    end
end

local function u230()
    while getgenv().FastAttack do
        task.wait()
        pcall(function()
            local _activeController = debug.getupvalues(require(Player.PlayerScripts.CombatFramework))[2].activeController

            if _activeController.increment ~= 3 then
                _activeController.increment = 3
            end
            if _activeController.timeToNextAttack ~= 0 then
                _activeController.timeToNextAttack = 0
            end
            if _activeController.timeToNextBlock ~= 0 then
                _activeController.timeToNextBlock = 0
            end
            if _activeController.focusStart ~= 0 then
                _activeController.focusStart = 0
            end
            if _activeController.attacking ~= false then
                _activeController.attacking = false
            end
            if _activeController.blocking ~= false then
                _activeController.blocking = false
            end
            if _activeController.humanoid.AutoRotate ~= true then
                _activeController.humanoid.AutoRotate = true
            end
            if _activeController.currentAttackTrack ~= 0 then
                _activeController.currentAttackTrack = 0
            end

            sethiddenproperty(Player, 'SimulationRaxNerous', math.huge)
        end)
        task.spawn(AttackHit)
    end
end

function EquipTool(p231)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(p231) then
        local v232 = game.Players.LocalPlayer.Backpack:FindFirstChild(p231)

        wait(0.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v232)
    end
end
function GetWeaponInventory(p233)
    local v234, v235, v236 = pairs(game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('getInventory'))

    while true do
        local v237

        v236, v237 = v234(v235, v236)

        if v236 == nil then
            break
        end
        if type(v237) == 'table' and (v237.Type == 'Sword' and v237.Name == p233) then
            return true
        end
    end

    return false
end
function GetWeaponInventory(p238)
    local v239, v240, v241 = pairs(game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('getInventory'))

    while true do
        local v242

        v241, v242 = v239(v240, v241)

        if v241 == nil then
            break
        end
        if type(v242) == 'table' and (v242.Type == 'Melee' and v242.Name == p238) then
            return true
        end
    end

    return false
end

spawn(function()
    pcall(function()
        while task.wait() do
            local v243, v244, v245 = pairs(game:GetService('Players').LocalPlayer.Backpack:GetChildren())

            while true do
                local v246

                v245, v246 = v243(v244, v245)

                if v245 == nil then
                    break
                end
                if v246:IsA('Tool') and v246:FindFirstChild('RemoteFunctionShoot') then
                    CurrentEquipGun = v246.Name
                end
            end
        end
    end)
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.TeleportIsland or (_G.AutoBuyBoat or (AutoFarmAcient or (_G.AutoTerrorshark or (_G.farmpiranya or (_G.AutoSeaBeast or (_G.NeareastFarm or (AutoBartilo or (AutoFactory or (_G.AutoLevel or (_G.Clip2 or (_G.AutoBone or (_G.AutoBoss or (AutoFarmBossQuest or (AutoFarmMasGun or (AutoFarmMasDevilFruit or (AutoFarmSelectArea or (AutoSecondSea or (AutoThirdSea or (AutoDeathStep or (AutoSuperhuman or (AutoSharkman or (AutoElectricClaw or (AutoDragonTalon or (AutoGodhuman or (AutoRengoku or (AutoBuddySword or (AutoPole or (AutoHallowSycthe or (AutoCavander or (AutoTushita or (AutoDarkDagger or (_G.CakePrince or (_G.AutoElite or (AutoRainbowHaki or (AutoSaber or (AutoFarmKen or (AutoKenHop or (AutoKenV2 or (KillPlayerMelee or (KillPlayerGun or (KillPlayerFruit or (AutoDungeon or (AutoNextIsland or (AutoAdvanceDungeon or (Musketeer or (RipIndra or (Auto_Serpent_Bow or (AutoTorch or (AutoSoulGuitar or (Auto_Cursed_Dual_Katana or (_G.AutoMaterial or (Auto_Quest_Yama_1 or (Auto_Quest_Yama_2 or (Auto_Quest_Yama_3 or (Auto_Quest_Tushita_1 or (Auto_Quest_Tushita_2 or (Auto_Quest_Tushita_3 or (_G.Factory or (_G.SwanGlasses or (AutoBartilo or (AutoEvoRace or _G.Ecto))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) then
                if not game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:FindFirstChild('BodyClip') then
                    local _BodyVelocity = Instance.new('BodyVelocity')

                    _BodyVelocity.Name = 'BodyClip'
                    _BodyVelocity.Parent = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart
                    _BodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
                    _BodyVelocity.Velocity = Vector3.new(0, 0, 0)
                end
            else
                game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:FindFirstChild('BodyClip'):Destroy()
            end
        end)
    end
end)

local _Esp2 = _Esp:CreateSection('Esp...')

_Esp2:CreateToggle({Name = 'Esp Player', Description = 'ESP PLAYER', Default = false}, function(p249)
    ESPPlayer = p249

    UpdatePlayerChams()
end)
_Esp2:CreateToggle({Name = 'Esp Devil Fruit', Description = 'ESPFRUIT', Default = false}, function(p250)
    DevilFruitESP = p250

    while DevilFruitESP do
        wait()
        UpdateDevilChams()
    end
end)
_Esp2:CreateToggle({Name = 'Esp Island', Description = 'Esp Island', Default = false}, function(p251)
    IslandESP = p251

    while IslandESP do
        wait()
        UpdateIslandESP()
    end
end)
_Esp2:CreateToggle({Name = 'Esp Flower', Description = 'Esp Flower(SecondSea)', Default = false}, function(p252)
    FlowerESP = p252

    UpdateFlowerChams()
end)

if Third_Sea then
    _Esp2:CreateToggle({Name = 'Esp Gear', Description = '', Default = false}, function(p253)
        GearESP = p253

        UpdateGeaESP()
    end)
    _Esp2:CreateToggle({Name = 'Mirage Esp', Description = '', Default = false}, function(p254)
        MirageIslandESP = p254

        UpdateIslandMirageESP()
    end)
    _Esp2:CreateToggle({Name = 'RealFruits Esp', Description = '', Default = false}, function(p255)
        RealFruitESP = p255

        UpdateRealFruitChams()
    end)
end
if Second_Sea then
    _Esp2:CreateToggle({Name = 'ESP Legendary Sword Dealer', Description = '', Default = false}, function(p256)
        LADESP = p256

        UpdateLSDESP()
    end)
end

_Esp2:CreateLabel({Name = 'TweenToFruit'})
_Esp2:CreateToggle({Name = 'AutoTweenFruit', Description = '', Default = false}, function(p257)
    _G.Tweenfruit = p257
end)
spawn(function()
    while wait(0.1) do
        if _G.Tweenfruit then
            local v258, v259, v260 = pairs(game.Workspace:GetChildren())

            while true do
                local v261

                v260, v261 = v258(v259, v260)

                if v260 == nil then
                    break
                end
                if string.find(v261.Name, 'Fruit') then
                    TP2(v261.Handle.CFrame)
                end
            end
        end
    end
end)
_Esp2:CreateToggle({Name = 'Store Fruit', Description = '', Default = false}, function(p262)
    _G.AutoStoreFruit = p262
end)
spawn(function()
    while task.wait() do
        if _G.AutoStoreFruit then
            pcall(function()
                if _G.AutoStoreFruit then
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Bomb Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Bomb Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Bomb-Bomb', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Bomb Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Spike Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Spike Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Spike-Spike', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Spike Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Chop Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Chop Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Chop-Chop', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Chop Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Spring Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Spring Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Spring-Spring', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Spring Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Rocket Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Kilo Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Rocket-Rocket', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Kilo Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Smoke Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Smoke Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Smoke-Smoke', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Smoke Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Spin Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Spin Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Spin-Spin', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Spin Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Flame Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Flame Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Flame-Flame', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Flame Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Bird: Falcon Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Bird: Falcon Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Bird-Bird: Falcon', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Bird: Falcon Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Ice Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Ice Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Ice-Ice', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Ice Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Sand Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Sand Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Sand-Sand', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Sand Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Dark Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Dark Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Dark-Dark', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Dark Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Ghost Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Revive Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Ghost-Ghost', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Revive Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Diamond Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Diamond Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Diamond-Diamond', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Diamond Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Light Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Light Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Light-Light', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Light Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Love Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Love Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Love-Love', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Love Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Rubber Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Rubber Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Rubber-Rubber', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Rubber Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Barrier Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Barrier Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Barrier-Barrier', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Barrier Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Magma Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Magma Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Magma-Magma', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Magma Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Portal Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Door Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Door-Door', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Portal Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Quake Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Quake Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Quake-Quake', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Quake Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Human-Human: Buddha Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Human-Human: Buddha Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Human-Human: Buddha', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Human-Human: Buddha Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Spider Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Spider Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Spider-Spider', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Spider Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Bird: Phoenix Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Bird: Phoenix Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Bird-Bird: Phoenix', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Bird: Phoenix Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Rumble Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Rumble Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Rumble-Rumble', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Rumble Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Pain Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Paw Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Pain-Pain', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Paw Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Gravity Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Gravity Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Gravity-Gravity', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Gravity Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Dough Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Dough Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Dough-Dough', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Dough Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Shadow Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Shadow Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Shadow-Shadow', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Shadow Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Venom Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Venom Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Venom-Venom', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Venom Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Control Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Control Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Control-Control', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Control Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Spirit Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Soul Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Soul-Soul', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Spirit Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Dragon Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Dragon Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Dragon-Dragon', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Dragon Fruit'))

                        if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Leopard Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Leopard Fruit') then
                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Leopard-Leopard', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Leopard Fruit'))
                        end
                    end
                end
            end)
        end

        wait(0.3)
    end
end)
_Esp2:CreateToggle({Name = 'AutoRandomFruit', Description = '', Default = false}, function(p263)
    _G.Random_Auto = p263
end)
spawn(function()
    pcall(function()
        while wait(0.1) do
            if _G.Random_Auto then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Cousin', 'Buy')
            end
        end
    end)
end)
spawn(function()
    while wait(2) do
        if FlowerESP then
            UpdateFlowerChams()
        end
        if DevilFruitESP then
            UpdateDevilChams()
        end
        if ChestESP then
            UpdateChestChams()
        end
        if ESPPlayer then
            UpdatePlayerChams()
        end
        if RealFruitESP then
            UpdateRealFruitChams()
        end
        if GearESP then
            UpdateGeaESP()
        end
        if MirageIslandESP then
            UpdateIslandMirageESP()
        end
        if LADESP then
            UpdateLSDESP()
        end
        if RealFruitESP then
            UpdateRealFruitChams()
        end
    end
end)

if Second_Sea then
    local _Here = _VScript:CreateTab('Raid...', "home"):CreateSection('Here')

    _Here:CreateDropdown({Name = 'SelectChips', Description = '', Options = {
        'Flame',
        'Ice',
        'Quake',
        'Light',
        'Dark',
        'Spider',
        'Rumble',
        'Magma',
        'Buddha',
        'Sand',
        'Phoenix',
        'Dough',
    }}, function(p265)
        SelectChip = p265
    end)
    _Here:CreateToggle({Name = 'Buy Chip', Description = '', Default = false}, function(p266)
        _G.Auto_Buy_Chips_Dungeon = p266
    end)
    spawn(function()
        while wait() do
            if _G.Auto_Buy_Chips_Dungeon then
                pcall(function()
                    local v267 = {
                        'RaidsNpc',
                        'Select',
                        SelectChip,
                    }

                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack(v267))
                end)
            end
        end
    end)
    _Here:CreateToggle({Name = 'Auto Start Raid', Description = '', Default = false}, function(p268)
        _G.Auto_StartRaid = p268
    end)
    spawn(function()
        while wait(0.1) do
            pcall(function()
                if _G.Auto_StartRaid and game:GetService('Players').LocalPlayer.PlayerGui.Main.Timer.Visible == false and (not game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 1') and game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Special Microchip') or game:GetService('Players').LocalPlayer.Character:FindFirstChild('Special Microchip')) then
                    if Second_Sea then
                        fireclickdetector(game:GetService('Workspace').Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                    elseif Third_Sea then
                        fireclickdetector(game:GetService('Workspace').Map['Boat Castle'].RaidSummon2.Button.Main.ClickDetector)
                    end
                end
            end)
        end
    end)
    _Here:CreateToggle({Name = 'Kill Aura', Description = '', Default = false}, function(p269)
        KillAura = p269
    end)
    spawn(function()
        while wait() do
            if KillAura then
                pcall(function()
                    local v270, v271, v272 = pairs(game.Workspace.Enemies:GetDescendants())

                    while true do
                        local v273

                        v272, v273 = v270(v271, v272)

                        if v272 == nil then
                            break
                        end
                        if v273:FindFirstChild('Humanoid') and (v273:FindFirstChild('HumanoidRootPart') and v273.Humanoid.Health > 0) then
                            repeat
                                task.wait()
                                sethiddenproperty(game:GetService('Players').LocalPlayer, 'SimulationRadius', math.huge)

                                v273.Humanoid.Health = 0
                                v273.HumanoidRootPart.CanCollide = false
                            until not KillAura or (not v273.Parent or v273.Humanoid.Health <= 0)
                        end
                    end
                end)
            end
        end
    end)
    _Here:CreateToggle({Name = 'Auto Next Island', Description = '', Default = false}, function(p274)
        AutoNextIsland = p274
    end)
    spawn(function()
        while task.wait() do
            if AutoNextIsland then
                pcall(function()
                    if game:GetService('Players').LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                        if game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 5') then
                            Tween(game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 5').CFrame * CFrame.new(0, 70, 100))
                        elseif game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 4') then
                            Tween(game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 4').CFrame * CFrame.new(0, 70, 100))
                        elseif game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 3') then
                            Tween(game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 3').CFrame * CFrame.new(0, 70, 100))
                        elseif game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 2') then
                            Tween(game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 2').CFrame * CFrame.new(0, 70, 100))
                        elseif game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 1') then
                            Tween(game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 1').CFrame * CFrame.new(0, 70, 100))
                        end
                    end
                end)
            end
        end
    end)
    _Here:CreateToggle({Name = 'Auto Awake', Description = '', Default = false}, function(p275)
        AutoAwakenAbilities = p275
    end)
    spawn(function()
        while task.wait() do
            if AutoAwakenAbilities then
                pcall(function()
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Awakener', 'Awaken')
                end)
            end
        end
    end)
end
if Third_Sea then
    local _Here2 = _VScript:CreateTab('Raid...', "home"):CreateSection('Here')

    _Here2:CreateDropdown({Name = 'SelectChips', Description = '', Options = {
        'Flame',
        'Ice',
        'Quake',
        'Light',
        'Dark',
        'Spider',
        'Rumble',
        'Magma',
        'Buddha',
        'Sand',
        'Phoenix',
        'Dough',
    }}, function(p277)
        SelectChip = p277
    end)
    _Here2:CreateToggle({Name = 'Buy Chip', Description = '', Default = false}, function(p278)
        _G.Auto_Buy_Chips_Dungeon = p278
    end)
    spawn(function()
        while wait() do
            if _G.Auto_Buy_Chips_Dungeon then
                pcall(function()
                    local v279 = {
                        'RaidsNpc',
                        'Select',
                        SelectChip,
                    }

                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack(v279))
                end)
            end
        end
    end)
    _Here2:CreateToggle({Name = 'Auto Start Raid', Description = '', Default = false}, function(p280)
        _G.Auto_StartRaid = p280
    end)
    spawn(function()
        while wait(0.1) do
            pcall(function()
                if _G.Auto_StartRaid and game:GetService('Players').LocalPlayer.PlayerGui.Main.Timer.Visible == false and (not game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 1') and game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Special Microchip') or game:GetService('Players').LocalPlayer.Character:FindFirstChild('Special Microchip')) then
                    if Second_Sea then
                        fireclickdetector(game:GetService('Workspace').Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                    elseif Third_Sea then
                        fireclickdetector(game:GetService('Workspace').Map['Boat Castle'].RaidSummon2.Button.Main.ClickDetector)
                    end
                end
            end)
        end
    end)
    _Here2:CreateToggle({Name = 'Kill Aura', Description = '', Default = false}, function(p281)
        KillAura = p281
    end)
    spawn(function()
        while wait() do
            if KillAura then
                pcall(function()
                    local v282, v283, v284 = pairs(game.Workspace.Enemies:GetDescendants())

                    while true do
                        local v285

                        v284, v285 = v282(v283, v284)

                        if v284 == nil then
                            break
                        end
                        if v285:FindFirstChild('Humanoid') and (v285:FindFirstChild('HumanoidRootPart') and v285.Humanoid.Health > 0) then
                            repeat
                                task.wait()
                                sethiddenproperty(game:GetService('Players').LocalPlayer, 'SimulationRadius', math.huge)

                                v285.Humanoid.Health = 0
                                v285.HumanoidRootPart.CanCollide = false
                            until not KillAura or (not v285.Parent or v285.Humanoid.Health <= 0)
                        end
                    end
                end)
            end
        end
    end)
    _Here2:CreateToggle({Name = 'Auto Next Island', Description = '', Default = false}, function(p286)
        AutoNextIsland = p286
    end)
    spawn(function()
        while task.wait() do
            if AutoNextIsland then
                pcall(function()
                    if game:GetService('Players').LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                        if game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 5') then
                            Tween(game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 5').CFrame * CFrame.new(0, 70, 100))
                        elseif game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 4') then
                            Tween(game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 4').CFrame * CFrame.new(0, 70, 100))
                        elseif game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 3') then
                            Tween(game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 3').CFrame * CFrame.new(0, 70, 100))
                        elseif game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 2') then
                            Tween(game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 2').CFrame * CFrame.new(0, 70, 100))
                        elseif game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 1') then
                            Tween(game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 1').CFrame * CFrame.new(0, 70, 100))
                        end
                    end
                end)
            end
        end
    end)
    _Here2:CreateToggle({Name = 'Auto Awake', Description = '', Default = false}, function(p287)
        AutoAwakenAbilities = p287
    end)
    spawn(function()
        while task.wait() do
            if AutoAwakenAbilities then
                pcall(function()
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Awakener', 'Awaken')
                end)
            end
        end
    end)
end
if First_Sea then
    _VScript:CreateTab('Raid...', "home"):CreateSection('Here'):CreateLabel({Name = 'U need to go Second/Third Sea!'})
end

local _Here3 = _VScript:CreateTab('Farm...', "home"):CreateSection('Here')

_Here3:CreateDropdown({Name = 'SelectWeapon', Description = '', Options = {
    'Melee',
    'Sword',
    'Blox Fruit',
}}, function(p289)
    ChooseWeapon = p289
end)
task.spawn(function()
    while wait() do
        pcall(function()
            if ChooseWeapon ~= 'Melee' then
                if ChooseWeapon ~= 'Sword' then
                    if ChooseWeapon ~= ' Blox Fruit' then
                        local v290, v291, v292 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                        while true do
                            local v293

                            v292, v293 = v290(v291, v292)

                            if v292 == nil then
                                break
                            end
                            if v293.ToolTip == 'Melee' and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v293.Name)) then
                                SelectWeapon = v293.Name
                            end
                        end
                    else
                        local v294, v295, v296 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                        while true do
                            local v297

                            v296, v297 = v294(v295, v296)

                            if v296 == nil then
                                break
                            end
                            if v297.ToolTip == 'Blox Fruit' and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v297.Name)) then
                                SelectWeapon = v297.Name
                            end
                        end
                    end
                else
                    local v298, v299, v300 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                    while true do
                        local v301

                        v300, v301 = v298(v299, v300)

                        if v300 == nil then
                            break
                        end
                        if v301.ToolTip == 'Sword' and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v301.Name)) then
                            SelectWeapon = v301.Name
                        end
                    end
                end
            else
                local v302, v303, v304 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                while true do
                    local v305

                    v304, v305 = v302(v303, v304)

                    if v304 == nil then
                        break
                    end
                    if v305.ToolTip == 'Melee' and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v305.Name)) then
                        SelectWeapon = v305.Name
                    end
                end
            end
        end)
    end
end)
_Here3:CreateToggle({Name = 'Auto Farm Level', Description = '', Default = false}, function(p306)
    _G.AutoLevel = p306
end)
spawn(function()
    while task.wait() do
        if _G.AutoLevel then
            pcall(function()
                CheckLevel()

                if string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) and game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
                    if string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        local v307, v308, v309 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                        while true do
                            local v310

                            v309, v310 = v307(v308, v309)

                            if v309 == nil then
                                break
                            end
                            if v310:FindFirstChild('Humanoid') and (v310:FindFirstChild('HumanoidRootPart') and (v310.Humanoid.Health > 0 and v310.Name == Ms)) then
                                repeat
                                    game:GetService('RunService').Heartbeat:wait()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    Tween(v310.HumanoidRootPart.CFrame * CFrame.new(u216, u217, u218))

                                    v310.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v310.HumanoidRootPart.Transparency = 1
                                    v310.Humanoid.JumpPower = 0
                                    v310.Humanoid.WalkSpeed = 0
                                    v310.HumanoidRootPart.CanCollide = false
                                    FarmPos = v310.HumanoidRootPart.CFrame
                                    MonFarm = v310.Name

                                    Click()
                                until not _G.AutoLevel or (not v310.Parent or v310.Humanoid.Health <= 0) or (not game:GetService('Workspace').Enemies:FindFirstChild(v310.Name) or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false)
                            end
                        end

                        local v311, v312, v313 = pairs(game:GetService('Workspace')._WorldOrigin.EnemySpawns:GetChildren())

                        while true do
                            local v314

                            v313, v314 = v311(v312, v313)

                            if v313 == nil then
                                break
                            end
                            if string.find(v314.Name, NameMon) and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v314.Position).Magnitude >= 10 then
                                Tween(v314.CFrame * CFrame.new(u216, u217, u218))
                            end
                        end
                    end
                else
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('AbandonQuest')

                    if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQ.Position).Magnitude <= 2500 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQ.Position).Magnitude < 2500 then
                                Tween(CFrameQ)
                            end
                        else
                            BTP(CFrameQ)
                        end
                    else
                        Tween(CFrameQ)
                    end
                    if (CFrameQ.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StartQuest', NameQuest, QuestLv)
                    end
                end

                Tween(v.HumanoidRootPart.CFrame * Pos2)
            end)
        end
    end
end)
_Here3:CreateToggle({Name = 'Auto Farm Nearest', Description = '', Default = false}, function(p315)
    _G.NeareastFarm = p315
end)
spawn(function()
    while wait(0.1) do
        if _G.NeareastFarm then
            pcall(function()
                local v316, v317, v318 = pairs(game.Workspace.Enemies:GetChildren())

                while true do
                    local v319

                    v318, v319 = v316(v317, v318)

                    if v318 == nil then
                        break
                    end
                    if v319:FindFirstChild('Humanoid') and (v319:FindFirstChild('HumanoidRootPart') and (v319.Humanoid.Health > 0 and (v319.Name and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v319:FindFirstChild('HumanoidRootPart').Position).Magnitude <= 5000))) then
                        repeat
                            wait()
                            Click()

                            BringMob = true

                            AutoHaki()
                            EquipTool(SelectWeapon)
                            Tween(v319.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))

                            v319.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                            v319.HumanoidRootPart.Transparency = 1
                            v319.Humanoid.JumpPower = 0
                            v319.Humanoid.WalkSpeed = 0
                            v319.HumanoidRootPart.CanCollide = false
                            FarmPos = v319.HumanoidRootPart.CFrame
                            MonFarm = v319.Name
                        until not _G.NeareastFarm or (not v319.Parent or v319.Humanoid.Health <= 0) or not game.Workspace.Enemies:FindFirstChild(v319.Name)

                        BringMob = false
                    end
                end
            end)
        end
    end
end)

if Second_Sea then
    _Here3:CreateToggle({Name = 'Auto Bartilo Quest', Description = '', Default = false}, function(p320)
        _G.AutoBartilo = p320
    end)
    spawn(function()
        pcall(function()
            while wait(0.1) do
                if _G.AutoBartilo then
                    if game:GetService('Players').LocalPlayer.Data.Level.Value < 800 or game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BartiloQuestProgress', 'Bartilo') ~= 0 then
                        if game:GetService('Players').LocalPlayer.Data.Level.Value < 800 or game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BartiloQuestProgress', 'Bartilo') ~= 1 then
                            if game:GetService('Players').LocalPlayer.Data.Level.Value >= 800 and game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BartiloQuestProgress', 'Bartilo') == 2 then
                                repeat
                                    Tween(CFrame.new(-1850.49329, 13.1789551, 1750.89685))
                                    wait()
                                until not _G.AutoBartilo or (game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1850.49329, 13.1789551, 1750.89685)).Magnitude <= 10

                                wait(1)

                                repeat
                                    Tween(CFrame.new(-1858.87305, 19.3777466, 1712.01807))
                                    wait()
                                until not _G.AutoBartilo or (game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1858.87305, 19.3777466, 1712.01807)).Magnitude <= 10

                                wait(1)

                                repeat
                                    Tween(CFrame.new(-1803.94324, 16.5789185, 1750.89685))
                                    wait()
                                until not _G.AutoBartilo or (game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1803.94324, 16.5789185, 1750.89685)).Magnitude <= 10

                                wait(1)

                                repeat
                                    Tween(CFrame.new(-1858.55835, 16.8604317, 1724.79541))
                                    wait()
                                until not _G.AutoBartilo or (game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1858.55835, 16.8604317, 1724.79541)).Magnitude <= 10

                                wait(1)

                                repeat
                                    Tween(CFrame.new(-1869.54224, 15.987854, 1681.00659))
                                    wait()
                                until not _G.AutoBartilo or (game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1869.54224, 15.987854, 1681.00659)).Magnitude <= 10

                                wait(1)

                                repeat
                                    Tween(CFrame.new(-1800.0979, 16.4978027, 1684.52368))
                                    wait()
                                until not _G.AutoBartilo or (game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1800.0979, 16.4978027, 1684.52368)).Magnitude <= 10

                                wait(1)

                                repeat
                                    Tween(CFrame.new(-1819.26343, 14.795166, 1717.90625))
                                    wait()
                                until not _G.AutoBartilo or (game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1819.26343, 14.795166, 1717.90625)).Magnitude <= 10

                                wait(1)
                                Tween(CFrame.new(-1813.51843, 14.8604736, 1724.79541))
                                wait()

                                if _G.AutoBartilo and (game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1813.51843, 14.8604736, 1724.79541)).Magnitude > 10 then
                                    break
                                end
                            end
                        elseif game:GetService('Workspace').Enemies:FindFirstChild('Jeremy [Lv. 850] [Boss]') then
                            Ms = 'Jeremy [Lv. 850] [Boss]'

                            local v321, v322, v323 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                            while true do
                                local v324

                                v323, v324 = v321(v322, v323)

                                if v323 == nil then
                                    break
                                end
                                if v324.Name == Ms then
                                    OldCFrameBartlio = v324.HumanoidRootPart.CFrame

                                    repeat
                                        task.wait()
                                        sethiddenproperty(game:GetService('Players').LocalPlayer, 'SimulationRadius', math.huge)
                                        EquipWeapon(_G.SelectWeapon)
                                        AutoHaki()

                                        v324.HumanoidRootPart.Transparency = 1
                                        v324.HumanoidRootPart.CanCollide = false
                                        v324.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        v324.HumanoidRootPart.CFrame = OldCFrameBartlio

                                        Tween(v324.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                        game:GetService('VirtualUser'):CaptureController()
                                        game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game:GetService('Players').LocalPlayer, 'SimulationRadius', math.huge)
                                    until not v324.Parent or (v324.Humanoid.Health <= 0 or _G.AutoBartilo == false)
                                end
                            end
                        elseif game:GetService('ReplicatedStorage'):FindFirstChild('Jeremy [Lv. 850] [Boss]') then
                            repeat
                                Tween(CFrame.new(-456.28952, 73.0200958, 299.895966))
                                wait()
                            until not _G.AutoBartilo or (game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10

                            wait(1.1)
                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BartiloQuestProgress', 'Bartilo')
                            wait(1)

                            repeat
                                Tween(CFrame.new(2099.88159, 448.931, 648.997375))
                                wait()
                            until not _G.AutoBartilo or (game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10

                            wait(2)
                        else
                            repeat
                                Tween(CFrame.new(2099.88159, 448.931, 648.997375))
                                wait()
                            until not _G.AutoBartilo or (game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
                        end
                    elseif string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Swan Pirates') and (string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, '50') and game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible == true) then
                        if game:GetService('Workspace').Enemies:FindFirstChild('Swan Pirate [Lv. 775]') then
                            Ms = 'Swan Pirate [Lv. 775]'

                            local v325, v326, v327 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                            while true do
                                local u328

                                v327, u328 = v325(v326, v327)

                                if v327 == nil then
                                    break
                                end
                                if u328.Name == Ms then
                                    pcall(function()
                                        repeat
                                            task.wait()
                                            sethiddenproperty(game:GetService('Players').LocalPlayer, 'SimulationRadius', math.huge)
                                            EquipWeapon(SelectWeapon)
                                            AutoHaki()
                                            Click()

                                            u328.HumanoidRootPart.Transparency = 1
                                            u328.HumanoidRootPart.CanCollide = false
                                            u328.HumanoidRootPart.Size = Vector3.new(50, 50, 50)

                                            Tween(u328.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))

                                            PosMonBarto = u328.HumanoidRootPart.CFrame

                                            game:GetService('VirtualUser'):CaptureController()
                                            game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))

                                            AutoBartiloBring = true
                                        until not u328.Parent or (u328.Humanoid.Health <= 0 or _G.AutoBartilo == false) or game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible == false

                                        AutoBartiloBring = false
                                    end)
                                end
                            end
                        else
                            repeat
                                Tween(CFrame.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-8, -0.230443969, 2.67024713e-8, 1, 8.47491108e-8, 0.230443969, 7.63147128e-8, -0.973085582))
                                wait()
                            until not _G.AutoBartilo or (game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-8, -0.230443969, 2.67024713e-8, 1, 8.47491108e-8, 0.230443969, 7.63147128e-8, -0.973085582)).Magnitude <= 10
                        end
                    else
                        repeat
                            Tween(CFrame.new(-456.28952, 73.0200958, 299.895966))
                            wait()
                        until not _G.AutoBartilo or (game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10

                        wait(1.1)
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StartQuest', 'BartiloQuest', 1)
                    end
                end
            end
        end)
    end)
    _Here3:CreateToggle({Name = 'Auto Farm Factory', Description = '', Default = false}, function(p329)
        _G.Factory = p329
    end)
    spawn(function()
        while true do
            repeat
                if not wait() then
                    return
                end
            until _G.Factory

            if game.Workspace.Enemies:FindFirstChild('Core') then
                break
            end
            if game.ReplicatedStorage:FindFirstChild('Core') then
                repeat
                    Tween(CFrame.new(448.46756, 199.356781, -441.389252))
                    wait()
                until not _G.Factory or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude <= 10
            end
        end

        local v330, v331, v332 = pairs(game.Workspace.Enemies:GetChildren())

        if v333.Name == 'Core' and v333.Humanoid.Health > 0 then
        end

        local v333

        v332, v333 = v330(v331, v332)

        if v332 ~= nil then
        end

        wait(0.1)

        repeat
            Tween(CFrame.new(448.46756, 199.356781, -441.389252))
            wait()
        until not _G.Factory or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude <= 10

        EquipTool(SelectWeapon)
        AutoHaki()
        Tween(v333.HumanoidRootPart.CFrame * CFrame.new(u216, u217, u218))

        v333.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
        v333.HumanoidRootPart.Transparency = 1
        v333.Humanoid.JumpPower = 0
        v333.Humanoid.WalkSpeed = 0
        v333.HumanoidRootPart.CanCollide = false
        FarmPos = v333.HumanoidRootPart.CFrame
        MonFarm = v333.Name

        Click()

        if v333.Parent and (v333.Humanoid.Health > 0 and _G.Factory ~= false) then
        end
    end)
end

_Here3:CreateLabel({Name = 'Misc Farmable'})

if Third_Sea then
    _Here3:CreateToggle({Name = 'Auto Farm Bone', Description = '', Default = false}, function(p334)
        _G.Auto_Bone = p334
    end)
    spawn(function()
        while wait() do
            if _G.Auto_Bone then
                pcall(function()
                    if game:GetService('Workspace').Enemies:FindFirstChild('Reborn Skeleton') or (game:GetService('Workspace').Enemies:FindFirstChild('Living Zombie') or (game:GetService('Workspace').Enemies:FindFirstChild('Demonic Soul') or game:GetService('Workspace').Enemies:FindFirstChild('Posessed Mummy'))) then
                        local v335, v336, v337 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                        while true do
                            local v338

                            v337, v338 = v335(v336, v337)

                            if v337 == nil then
                                break
                            end
                            if (v338.Name == 'Reborn Skeleton' or (v338.Name == 'Living Zombie' or (v338.Name == 'Demonic Soul' or v338.Name == 'Posessed Mummy'))) and (v338:FindFirstChild('Humanoid') and (v338:FindFirstChild('HumanoidRootPart') and v338.Humanoid.Health > 0)) then
                                repeat
                                    task.wait()
                                    AutoHaki()
                                    Click()
                                    EquipTool(SelectWeapon)

                                    v338.HumanoidRootPart.CanCollide = false
                                    v338.Humanoid.WalkSpeed = 0
                                    v338.Head.CanCollide = false
                                    BringMob = true
                                    FarmPos = v338.HumanoidRootPart.CFrame
                                    MonFarm = v338.Name

                                    Tween(v338.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                until not _G.Auto_Bone or (not v338.Parent or v338.Humanoid.Health <= 0)
                            end
                        end
                    else
                        Tween(CFrame.new(-9466.72949, 171.162918, 6132.01514))

                        BringMob = true

                        local v339, v340, v341 = pairs(game:GetService('ReplicatedStorage'):GetChildren())

                        while true do
                            local v342

                            v341, v342 = v339(v340, v341)

                            if v341 == nil then
                                break
                            end
                            if v342.Name ~= 'Reborn Skeleton' then
                                if v342.Name ~= 'Living Zombie' then
                                    if v342.Name ~= 'Demonic Soul' then
                                        if v342.Name == 'Posessed Mummy' then
                                            Tween(v342.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                        end
                                    else
                                        Tween(v342.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                    end
                                else
                                    Tween(v342.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                end
                            else
                                Tween(v342.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                            end
                        end
                    end
                end)
            end
        end
    end)
    wait(0.1)
    _Here3:CreateToggle({Name = 'Auto Random Bone', Description = '', Default = false}, function(p343)
        _G.Auto_Random_Bone = p343
    end)
    spawn(function()
        pcall(function()
            while wait(0.1) do
                if _G.Auto_Random_Bone then
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Bones', 'Buy', 1, 1)
                end
            end
        end)
    end)

    if game:GetService('ReplicatedStorage').Effect.Container:FindFirstChild('Death') then
        game:GetService('ReplicatedStorage').Effect.Container.Death:Destroy()
    end
    if game:GetService('ReplicatedStorage').Effect.Container:FindFirstChild('Respawn') then
        game:GetService('ReplicatedStorage').Effect.Container.Respawn:Destroy()
    end

    _Here3:CreateToggle({Name = 'Auto Elite Hunter', Description = '', Default = false}, function(p344)
        _G.AutoElite = p344
    end)
    spawn(function()
        while task.wait() do
            if _G.AutoElite then
                pcall(function()
                    if game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible ~= true then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('EliteHunter')
                    elseif string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Diablo') or (string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Deandre') or string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Urban')) then
                        if game:GetService('Workspace').Enemies:FindFirstChild('Diablo') or (game:GetService('Workspace').Enemies:FindFirstChild('Deandre') or game:GetService('Workspace').Enemies:FindFirstChild('Urban')) then
                            local v345, v346, v347 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                            while true do
                                local v348

                                v347, v348 = v345(v346, v347)

                                if v347 == nil then
                                    break
                                end
                                if v348:FindFirstChild('Humanoid') and (v348:FindFirstChild('HumanoidRootPart') and v348.Humanoid.Health > 0) then
                                    if v348.Name == 'Diablo' or (v348.Name == 'Deandre' or v348.Name == 'Urban') then
                                        repeat
                                            task.wait()
                                            EquipTool(SelectWeapon)
                                            AutoHaki()
                                            Tween(v348.HumanoidRootPart.CFrame * Pos)

                                            MonsterPosition = v348.HumanoidRootPart.CFrame
                                            v348.HumanoidRootPart.CFrame = v348.HumanoidRootPart.CFrame
                                            v348.Humanoid.JumpPower = 0
                                            v348.Humanoid.WalkSpeed = 0
                                            v348.HumanoidRootPart.CanCollide = false

                                            Click()

                                            FarmPos = v348.HumanoidRootPart.CFrame
                                            MonFarm = v348.Name
                                            v348.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                            BringMobs = false
                                        until _G.AutoElite == false or (v348.Humanoid.Health <= 0 or not v348.Parent)
                                    end

                                    BringMobs = true
                                end
                            end
                        elseif BypassTP then
                            if game:GetService('ReplicatedStorage'):FindFirstChild('Diablo') then
                                BTP(game:GetService('ReplicatedStorage'):FindFirstChild('Diablo').HumanoidRootPart.CFrame * CFrame.new(u216, u217, u218))
                            elseif game:GetService('ReplicatedStorage'):FindFirstChild('Deandre') then
                                BTP(game:GetService('ReplicatedStorage'):FindFirstChild('Deandre').HumanoidRootPart.CFrame * CFrame.new(u216, u217, u218))
                            elseif game:GetService('ReplicatedStorage'):FindFirstChild('Urban') then
                                BTP(game:GetService('ReplicatedStorage'):FindFirstChild('Urban').HumanoidRootPart.CFrame * CFrame.new(u216, u217, u218))
                            end
                        elseif game:GetService('ReplicatedStorage'):FindFirstChild('Diablo') then
                            Tween(game:GetService('ReplicatedStorage'):FindFirstChild('Diablo').HumanoidRootPart.CFrame * CFrame.new(u216, u217, u218))
                        elseif game:GetService('ReplicatedStorage'):FindFirstChild('Deandre') then
                            Tween(game:GetService('ReplicatedStorage'):FindFirstChild('Deandre').HumanoidRootPart.CFrame * CFrame.new(u216, u217, u218))
                        elseif game:GetService('ReplicatedStorage'):FindFirstChild('Urban') then
                            Tween(game:GetService('ReplicatedStorage'):FindFirstChild('Urban').HumanoidRootPart.CFrame * CFrame.new(u216, u217, u218))
                        end
                    end
                end)
            end

            BirngMobs = true
        end
    end)

    if Second_Sea then
        _Here3:CreateToggle({Name = 'Auto Farm Ectoplasm', Description = '', Default = false}, function(p349)
            _G.Ecto = p349
        end)
        spawn(function()
            while wait(0.1) do
                pcall(function()
                    if _G.Ecto then
                        if game:GetService('Workspace').Enemies:FindFirstChild('Ship Deckhand') or (game:GetService('Workspace').Enemies:FindFirstChild('Ship Engineer') or (game:GetService('Workspace').Enemies:FindFirstChild('Ship Steward') or game:GetService('Workspace').Enemies:FindFirstChild('Ship Officer'))) then
                            local v350, v351, v352 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                            while true do
                                local v353

                                v352, v353 = v350(v351, v352)

                                if v352 == nil then
                                    break
                                end
                                if (v353.Name == 'Ship Steward' or (v353.Name == 'Ship Engineer' or (v353.Name == 'Ship Deckhand' or v353.Name == 'Ship Officer' and v353:FindFirstChild('Humanoid')))) and v353.Humanoid.Health > 0 then
                                    repeat
                                        game:GetService('RunService').Heartbeat:wait()
                                        AutoHaki()
                                        EquipTool(SelectWeapon)
                                        Tween(v353.HumanoidRootPart.CFrame * Pos)

                                        v353.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        v353.HumanoidRootPart.Transparency = 1
                                        v353.Humanoid.JumpPower = 0
                                        v353.Humanoid.WalkSpeed = 0
                                        v353.HumanoidRootPart.CanCollide = false
                                        FarmPos = v353.HumanoidRootPart.CFrame
                                        MonFarm = v353.Name

                                        Click()
                                    until _G.Ecto == false or (not v353.Parent or v353.Humanoid.Health == 0) or not game:GetService('Workspace').Enemies:FindFirstChild(v353.Name)
                                end
                            end
                        else
                            if (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                            end

                            Tween(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
                        end
                    end
                end)
            end
        end)
    end
end
if Third_Sea then
    _Here3:CreateToggle({Name = 'Auto Farm Cake Prince', Description = '', Default = false}, function(p354)
        _G.CakePrince = p354
    end)
    spawn(function()
        while task.wait() do
            if _G.CakePrince then
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer('CakePrinceSpawner')

                if game.ReplicatedStorage:FindFirstChild('Cake Prince') or game:GetService('Workspace').Enemies:FindFirstChild('Cake Prince') then
                    if game:GetService('Workspace').Enemies:FindFirstChild('Cake Prince') then
                        local v355, v356, v357 = pairs(game.Workspace.Enemies:GetChildren())

                        while true do
                            local v358

                            v357, v358 = v355(v356, v357)

                            if v357 == nil then
                                break
                            end
                            if _G.CakePrince and (v358.Name == 'Cake Prince' and (v358:FindFirstChild('HumanoidRootPart') and (v358:FindFirstChild('Humanoid') and v358.Humanoid.Health > 0))) then
                                repeat
                                    task.wait()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    Tween(v358.HumanoidRootPart.CFrame * Pos)

                                    v358.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v358.HumanoidRootPart.Transparency = 1
                                    v358.Humanoid.JumpPower = 0
                                    v358.Humanoid.WalkSpeed = 0
                                    v358.HumanoidRootPart.CanCollide = false
                                    FarmPos = v358.HumanoidRootPart.CFrame
                                    MonFarm = v358.Name

                                    game:GetService('VirtualUser'):CaptureController()
                                    game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672), workspace.CurrentCamera.CFrame)

                                    BringMobs = false
                                until not _G.CakePrince or (not v358.Parent or v358.Humanoid.Health <= 0)

                                BringMobs = true
                            end
                        end
                    elseif game:GetService('Workspace').Map.CakeLoaf.BigMirror.Other.Transparency == 0 and (CFrame.new(-1990.672607421875, 4532.99951171875, -14973.6748046875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 then
                        Tween(CFrame.new(-2151.82153, 149.315704, -12404.9053))

                        BirngMobs = true
                    end
                elseif game:GetService('Workspace').Enemies:FindFirstChild('Cookie Crafter') or (game:GetService('Workspace').Enemies:FindFirstChild('Cake Guard') or (game:GetService('Workspace').Enemies:FindFirstChild('Baking Staff') or game:GetService('Workspace').Enemies:FindFirstChild('Head Baker'))) then
                    local v359, v360, v361 = pairs(game.Workspace.Enemies:GetChildren())

                    while true do
                        local v362

                        v361, v362 = v359(v360, v361)

                        if v361 == nil then
                            break
                        end
                        if v362:FindFirstChild('Humanoid') and (v362:FindFirstChild('HumanoidRootPart') and (v362.Humanoid.Health > 0 and (v362.Name == 'Cookie Crafter' or (v362.Name == 'Cake Guard' or (v362.Name == 'Baking Staff' or v362.Name == 'Head Baker'))))) and (v362:FindFirstChild('HumanoidRootPart') and (v362:FindFirstChild('Humanoid') and v362.Humanoid.Health > 0)) then
                            repeat
                                task.wait()
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                Tween(v362.HumanoidRootPart.CFrame * Pos)

                                v362.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                v362.HumanoidRootPart.Transparency = 1
                                v362.Humanoid.JumpPower = 0
                                v362.Humanoid.WalkSpeed = 0
                                v362.HumanoidRootPart.CanCollide = false
                                FarmPos = v362.HumanoidRootPart.CFrame
                                MonFarm = v362.Name

                                game:GetService('VirtualUser'):CaptureController()
                                game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672), workspace.CurrentCamera.CFrame)
                            until not _G.CakePrince or (not v362.Parent or v362.Humanoid.Health <= 0)
                        end
                    end
                else
                    local v363 = CFrame.new(-2077, 252, -12373)

                    if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v363.Position).Magnitude <= 2000 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v363.Position).Magnitude < 2000 then
                                Tween(v363)
                            end
                        else
                            BTP(v363)
                            wait(3)
                        end
                    else
                        Tween(v.HumanoidRootPart.CFrame * Pos2)
                    end
                end
            end
        end
    end)
end
if Second_Sea then
    _Here3:CreateToggle({Name = 'Auto Buy Legendary Sword', Description = '', Default = false}, function(p364)
        _G.Auto_Buy_Legendary_Sword = p364
    end)
    spawn(function()
        while wait() do
            if _G.AutoBuyLegendarySword then
                pcall(function()
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                        'LegendarySwordDealer',
                        '1',
                    }))
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                        'LegendarySwordDealer',
                        '2',
                    }))
                end)
            end
        end
    end)
end
if Third_Sea then
    _Here3:CreateToggle({Name = 'AutoHolyTorch', Description = '', Default = false}, function(p365)
        _G.AutoHolyTorch = p365
    end)
    spawn(function()
        while wait() do
            if _G.AutoHolyTorch then
                pcall(function()
                    wait(1)
                    TP2(CFrame.new(-10752, 417, -9366))
                    wait(1)
                    TP2(CFrame.new(-11672, 334, -9474))
                    wait(1)
                    TP2(CFrame.new(-12132, 521, -10655))
                    wait(1)
                    TP2(CFrame.new(-13336, 486, -6985))
                    wait(1)
                    TP2(CFrame.new(-13489, 332, -7925))
                end)
            end
        end
    end)
end
if Third_Sea then
    _Here3:CreateToggle({Name = 'Auto Yama', Description = '', Default = false}, function(p366)
        _G.AutoYama = p366
    end)
    spawn(function()
        while wait() do
            if _G.AutoYama and game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('EliteHunter', 'Progress') >= 30 then
                wait(0.1)
                fireclickdetector(game:GetService('Workspace').Map.Waterfall.SealedKatana.Handle.ClickDetector)

                if not game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Yama') and _G.AutoYama then
                    break
                end
            end
        end
    end)
    _Here3:CreateToggle({Name = 'AutoTushita', Description = '', Default = false}, function(p367)
        _G.Autotushita = p367
    end)
    spawn(function()
        while wait() do
            if _G.Autotushita and Third_Sea then
                pcall(function()
                    if game:GetService('Workspace').Enemies:FindFirstChild('Longma [Lv. 2000] [Boss]') then
                        local v368, v369, v370 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                        while true do
                            local v371

                            v370, v371 = v368(v369, v370)

                            if v370 == nil then
                                break
                            end
                            if v371.Name == 'Longma [Lv. 2000] [Boss]' and (v371:FindFirstChild('Humanoid') and (v371:FindFirstChild('HumanoidRootPart') and v371.Humanoid.Health > 0)) then
                                repeat
                                    task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)

                                    v371.HumanoidRootPart.CanCollide = false
                                    v371.Humanoid.WalkSpeed = 0
                                    v371.HumanoidRootPart.Size = Vector3.new(50, 50, 50)

                                    Tween(v371.HumanoidRootPart.CFrame * CFrame.new(2, 40, 2))
                                    game:GetService('VirtualUser'):CaptureController()
                                    game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
                                    sethiddenproperty(game.Players.LocalPlayer, 'SimulationRadius', math.huge)
                                until not _G.Autotushita or (not v371.Parent or v371.Humanoid.Health <= 0)
                            end
                        end
                    else
                        Tween(CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125))

                        if game:GetService('ReplicatedStorage'):FindFirstChild('Longma [Lv. 2000] [Boss]') then
                            Tween(game:GetService('ReplicatedStorage'):FindFirstChild('Longma [Lv. 2000] [Boss]').HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.Autotushitahop then
                            Hop()
                        end
                    end
                end)
            end
        end
    end)
    _Here3:CreateToggle({Name = 'Auto Cursed Dual Katana', Description = '', Default = false}, function(p372)
        _G.AutoCdk = p372
    end)
    spawn(function()
        while wait() do
            pcall(function()
                if _G.AutoCdk then
                    if GetMaterial('Alucard Fragment') ~= 0 then
                        if GetMaterial('Alucard Fragment') ~= 1 then
                            if GetMaterial('Alucard Fragment') ~= 2 then
                                if GetMaterial('Alucard Fragment') ~= 3 then
                                    if GetMaterial('Alucard Fragment') ~= 4 then
                                        if GetMaterial('Alucard Fragment') ~= 5 then
                                            if GetMaterial('Alucard Fragment') == 6 then
                                                if game:GetService('Workspace').Enemies:FindFirstChild('Cursed Skeleton Boss [Lv. 2025] [Boss]') or game:GetService('Workspace').ReplicatedStorage:FindFirstChild('Cursed Skeleton Boss [Lv. 2025] [Boss]') then
                                                    Auto_Quest_Yama_1 = false
                                                    Auto_Quest_Yama_2 = false
                                                    Auto_Quest_Yama_3 = false
                                                    Auto_Quest_Tushita_1 = false
                                                    Auto_Quest_Tushita_2 = false
                                                    Auto_Quest_Tushita_3 = false

                                                    if game:GetService('Workspace').Enemies:FindFirstChild('Cursed Skeleton Boss [Lv. 2025] [Boss]') or game:GetService('Workspace').Enemies:FindFirstChild('Cursed Skeleton [Lv. 2200]') then
                                                        local v373, v374, v375 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                                                        while true do
                                                            local v376

                                                            v375, v376 = v373(v374, v375)

                                                            if v375 == nil then
                                                                break
                                                            end
                                                            if (v376.Name == 'Cursed Skeleton Boss [Lv. 2025] [Boss]' or v376.Name == 'Cursed Skeleton [Lv. 2200]') and v376.Humanoid.Health > 0 then
                                                                v376.HumanoidRootPart.CanCollide = false
                                                                v376.HumanoidRootPart.Size = Vector3.new(60, 60, 60)

                                                                Tween(v376.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                                                                game:GetService('VirtualUser'):CaptureController()
                                                                game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
                                                            end
                                                        end
                                                    end
                                                elseif (CFrame.new(-12361.7060546875, 603.3547973632813, -6550.5341796875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 100 then
                                                    Tween(CFrame.new(-12361.7060546875, 603.3547973632813, -6550.5341796875))
                                                else
                                                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Good')
                                                    wait(1)
                                                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Evil')
                                                    wait(1)
                                                    Tween(CFrame.new(-12361.7060546875, 603.3547973632813, -6550.5341796875))
                                                    wait(1.5)
                                                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 'E', false, game)
                                                    wait(1.5)
                                                    Tween(CFrame.new(-12253.5419921875, 598.8999633789063, -6546.8388671875))
                                                end
                                            end
                                        else
                                            Auto_Quest_Yama_1 = false
                                            Auto_Quest_Yama_2 = false
                                            Auto_Quest_Yama_3 = false
                                            Auto_Quest_Tushita_1 = false
                                            Auto_Quest_Tushita_2 = false
                                            Auto_Quest_Tushita_3 = true

                                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Good')
                                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'StartTrial', 'Good')
                                        end
                                    else
                                        Auto_Quest_Yama_1 = false
                                        Auto_Quest_Yama_2 = false
                                        Auto_Quest_Yama_3 = false
                                        Auto_Quest_Tushita_1 = false
                                        Auto_Quest_Tushita_2 = true
                                        Auto_Quest_Tushita_3 = false

                                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Good')
                                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'StartTrial', 'Good')
                                    end
                                else
                                    Auto_Quest_Yama_1 = false
                                    Auto_Quest_Yama_2 = false
                                    Auto_Quest_Yama_3 = false
                                    Auto_Quest_Tushita_1 = true
                                    Auto_Quest_Tushita_2 = false
                                    Auto_Quest_Tushita_3 = false

                                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Good')
                                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'StartTrial', 'Good')
                                end
                            else
                                Auto_Quest_Yama_1 = false
                                Auto_Quest_Yama_2 = false
                                Auto_Quest_Yama_3 = true
                                Auto_Quest_Tushita_1 = false
                                Auto_Quest_Tushita_2 = false
                                Auto_Quest_Tushita_3 = false

                                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Evil')
                                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'StartTrial', 'Evil')
                            end
                        else
                            Auto_Quest_Yama_1 = false
                            Auto_Quest_Yama_2 = true
                            Auto_Quest_Yama_3 = false
                            Auto_Quest_Tushita_1 = false
                            Auto_Quest_Tushita_2 = false
                            Auto_Quest_Tushita_3 = false

                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Evil')
                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'StartTrial', 'Evil')
                        end
                    else
                        Auto_Quest_Yama_1 = true
                        Auto_Quest_Yama_2 = false
                        Auto_Quest_Yama_3 = false
                        Auto_Quest_Tushita_1 = false
                        Auto_Quest_Tushita_2 = false
                        Auto_Quest_Tushita_3 = false

                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Evil')
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'StartTrial', 'Evil')
                    end
                end
            end)
        end
    end)
    spawn(function()
        while wait() do
            if Auto_Quest_Yama_1 then
                pcall(function()
                    if game:GetService('Workspace').Enemies:FindFirstChild('Mythological Pirate [Lv. 1850]') then
                        local v377, v378, v379 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                        while true do
                            local v380

                            v379, v380 = v377(v378, v379)

                            if v379 == nil then
                                break
                            end
                            if v380.Name == 'Mythological Pirate [Lv. 1850]' then
                                repeat
                                    wait()
                                    Tween(v380.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2))
                                until _G.AutoCdk == false or (Auto_Cursed_Dual_Katana == false or Auto_Quest_Yama_1 == false)

                                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'StartTrial', 'Evil')
                            end
                        end
                    else
                        Tween(CFrame.new(-13451.46484375, 543.712890625, -6961.0029296875))
                    end
                end)
            end
        end
    end)
    spawn(function()
        while wait() do
            pcall(function()
                if Auto_Quest_Yama_2 then
                    local v381, v382, v383 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                    while true do
                        local v384

                        v383, v384 = v381(v382, v383)

                        if v383 == nil then
                            break
                        end
                        if v384:FindFirstChild('HazeESP') then
                            v384.HazeESP.Size = UDim2.new(50, 50, 50, 50)
                            v384.HazeESP.MaxDistance = 'inf'
                        end
                    end

                    local v385, v386, v387 = pairs(game:GetService('ReplicatedStorage'):GetChildren())

                    while true do
                        local v388

                        v387, v388 = v385(v386, v387)

                        if v387 == nil then
                            break
                        end
                        if v388:FindFirstChild('HazeESP') then
                            v388.HazeESP.Size = UDim2.new(50, 50, 50, 50)
                            v388.HazeESP.MaxDistance = 'inf'
                        end
                    end
                end
            end)
        end
    end)
    spawn(function()
        while wait() do
            pcall(function()
                local v389, v390, v391 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                while true do
                    local v392

                    v391, v392 = v389(v390, v391)

                    if v391 == nil then
                        break
                    end
                    if Auto_Quest_Yama_2 and (v392:FindFirstChild('HazeESP') and (v392.HumanoidRootPart.Position - PosMonsEsp.Position).magnitude <= 300) then
                        v392.HumanoidRootPart.CFrame = PosMonsEsp
                        v392.HumanoidRootPart.CanCollide = false
                        v392.HumanoidRootPart.Size = Vector3.new(50, 50, 50)

                        if not v392.HumanoidRootPart:FindFirstChild('BodyVelocity') then
                            local _BodyVelocity2 = Instance.new('BodyVelocity', v392.HumanoidRootPart)

                            _BodyVelocity2.MaxForce = Vector3.new(1, 1, 1) * math.huge
                            _BodyVelocity2.Velocity = Vector3.new(0, 0, 0)
                        end
                    end
                end
            end)
        end
    end)
    spawn(function()
        while wait() do
            if Auto_Quest_Yama_2 then
                pcall(function()
                    local v394, v395, v396 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                    while true do
                        while true do
                            local v397

                            v396, v397 = v394(v395, v396)

                            if v396 == nil then
                                return
                            end
                            if v397:FindFirstChild('HazeESP') then
                                break
                            end

                            local v398, v399, v400 = pairs(game:GetService('ReplicatedStorage'):GetChildren())

                            while true do
                                local v401

                                v400, v401 = v398(v399, v400)

                                if v400 == nil then
                                    break
                                end
                                if v401:FindFirstChild('HazeESP') then
                                    if (v401.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
                                        Tween(v401.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                    else
                                        Tween(v401.HumanoidRootPart.CFrameMon * CFrame.new(0, 20, 0))
                                    end
                                end
                            end
                        end

                        wait()

                        if (v397.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
                            BringMob = true
                            u230 = true

                            if Auto_Buso and not game.Players.LocalPlayer.Character:FindFirstChild('HasBuso') then
                                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Buso')
                            end
                            if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Select_Weapon) then
                                wait()
                                EquipWeapon(_G.SelectWeapon)
                            end

                            PosMonsEsp = v397.HumanoidRootPart.CFrame

                            if not u230 then
                                game:GetService('VirtualUser'):CaptureController()
                                game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
                            end

                            v397.HumanoidRootPart.Size = Vector3.new(60, 60, 60)

                            if _G.Configs['Show Hitbox'] then
                                v397.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
                            else
                                v397.HumanoidRootPart.Transparency = 1
                            end

                            v397.Humanoid.JumpPower = 0
                            v397.Humanoid.WalkSpeed = 0
                            v397.HumanoidRootPart.CanCollide = false

                            v397.Humanoid:ChangeState(11)
                            Tween(v397.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                        else
                            Tween(y.HumanoidRootPart.CFrameMon * CFrame.new(0, 20, 0))
                        end
                        if Auto_Cursed_Dual_Katana ~= false and (Auto_Quest_Yama_2 ~= false and (v397.Parent and (v397.Humanoid.Health > 0 and v397:FindFirstChild('HazeESP')))) then
                        end
                    end
                end)
            end
        end
    end)
    spawn(function()
        while wait() do
            if Auto_Quest_Yama_3 then
                pcall(function()
                    if game.Players.LocalPlayer.Backpack:FindFirstChild('Hallow Essence') then
                        _G.Auto_Bone = false

                        Tween(game:GetService('Workspace').Map['Haunted Castle'].Summoner.Detection.CFrame)
                    end
                    if not game:GetService('Workspace').Map:FindFirstChild('HellDimension') then
                        if game:GetService('Workspace').Enemies:FindFirstChild('Soul Reaper [Lv. 2100] [Raid Boss]') or game.ReplicatedStorage:FindFirstChild('Soul Reaper [Lv. 2100] [Raid Boss]') then
                            if game:GetService('Workspace').Enemies:FindFirstChild('Soul Reaper [Lv. 2100] [Raid Boss]') then
                                local v402, v403, v404 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                                while true do
                                    local v405

                                    v404, v405 = v402(v403, v404)

                                    if v404 == nil then
                                        break
                                    end
                                    if v405.Name == 'Soul Reaper [Lv. 2100] [Raid Boss]' and v405.Humanoid.Health > 0 then
                                        repeat
                                            wait()
                                            Tween(v405.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2))
                                        until Auto_Cursed_Dual_Katana == false or Auto_Quest_Yama_3 == false or game:GetService('Workspace').Map:FindFirstChild('HellDimension')
                                    end
                                end
                            else
                                Tween(CFrame.new(-9570.033203125, 315.9346923828125, 6726.89306640625))
                            end
                        else
                            _G.Auto_Bone = true

                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Bones', 'Buy', 1, 1)
                        end

                        return
                    end

                    wait()

                    if not (game:GetService('Workspace').Enemies:FindFirstChild('Cursed Skeleton [Lv. 2200]') or (game:GetService('Workspace').Enemies:FindFirstChild('Cursed Skeleton [Lv. 2200] [Boss]') or game:GetService('Workspace').Enemies:FindFirstChild("Hell's Messenger [Lv. 2200] [Boss]"))) then
                        wait(5)
                        Tween(game:GetService('Workspace').Map.HellDimension.Torch1.CFrame)
                        wait(1.5)
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 'E', false, game)
                        wait(1.5)
                        Tween(game:GetService('Workspace').Map.HellDimension.Torch2.CFrame)
                        wait(1.5)
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 'E', false, game)
                        wait(1.5)
                        Tween(game:GetService('Workspace').Map.HellDimension.Torch3.CFrame)
                        wait(1.5)
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 'E', false, game)
                        wait(1.5)
                        Tween(game:GetService('Workspace').Map.HellDimension.Exit.CFrame)

                        if Auto_Cursed_Dual_Katana ~= false and (Auto_Quest_Yama_3 ~= false and GetMaterial('Alucard Fragment') ~= 3) then
                        end
                    end

                    local v406, v407, v408 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                    wait()

                    BringMob = true
                    u230 = true

                    if AutoHaki and not game.Players.LocalPlayer.Character:FindFirstChild('HasBuso') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Buso')
                    end
                    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Select_Weapon) then
                        wait()
                        EquipWeapon(_G.SelectWeapon)
                    end

                    PosMonsEsp = v409.HumanoidRootPart.CFrame

                    if not u230 then
                        game:GetService('VirtualUser'):CaptureController()
                        game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
                    end

                    v409.HumanoidRootPart.Size = Vector3.new(60, 60, 60)

                    if _G.Configs['Show Hitbox'] then
                        v409.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
                    else
                        v409.HumanoidRootPart.Transparency = 1
                    end

                    v409.Humanoid.JumpPower = 0
                    v409.Humanoid.WalkSpeed = 0
                    v409.HumanoidRootPart.CanCollide = false

                    v409.Humanoid:ChangeState(11)
                    Tween(v409.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))

                    if v409.Humanoid.Health > 0 and (v409.Parent and Auto_Quest_Yama_3 ~= false) then
                    end

                    local v409

                    v408, v409 = v406(v407, v408)

                    if v408 == nil then
                    end
                    if (v409.Name == 'Cursed Skeleton [Lv. 2200]' or (v409.Name == 'Cursed Skeleton [Lv. 2200] [Boss]' or v409.Name == "Hell's Messenger [Lv. 2200] [Boss]")) and v409.Humanoid.Health > 0 then
                    else
                    end
                end)
            end
        end
    end)
    spawn(function()
        while wait() do
            if Auto_Quest_Tushita_1 then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'BoatQuest', workspace.NPCs:FindFirstChild('Luxury Boat Dealer'))
            end
        end
    end)
    spawn(function()
        while wait() do
            if Auto_Quest_Tushita_1 then
                Tween(CFrame.new(-9546.990234375, 21.139892578125, 4686.1142578125))
                wait(5)
                Tween(CFrame.new(-6120.0576171875, 16.455780029296875, -2250.697265625))
                wait(5)
                Tween(CFrame.new(-9533.2392578125, 7.254445552825928, -8372.69921875))
            end
        end
    end)
    spawn(function()
        while wait() do
            if Auto_Quest_Tushita_2 then
                pcall(function()
                    if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
                        Tween(CFrame.new(-5545.1240234375, 313.800537109375, -2976.616455078125))
                    else
                        local v410, v411, v412 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                        while true do
                            local v413

                            v412, v413 = v410(v411, v412)

                            if v412 == nil then
                                break
                            end
                            if Auto_Quest_Tushita_2 and (v413:FindFirstChild('HumanoidRootPart') and (v413:FindFirstChild('Humanoid') and (v413.Humanoid.Health > 0 and (v413.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000))) then
                                repeat
                                    wait()

                                    v413.HumanoidRootPart.CanCollide = false
                                    v413.HumanoidRootPart.Size = Vector3.new(60, 60, 60)

                                    Tween(v413.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                                    game:GetService('VirtualUser'):CaptureController()
                                    game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
                                until v413.Humanoid.Health <= 0 or (not v413.Parent or Auto_Quest_Tushita_2 == false)
                            end
                        end
                    end
                end)
            end
        end
    end)
    spawn(function()
        while wait() do
            if Auto_Quest_Tushita_3 then
                pcall(function()
                    if not (game:GetService('Workspace').Enemies:FindFirstChild('Cake Queen [Lv. 2175] [Boss]') or game.ReplicatedStorage:FindFirstChild('Cake Queen [Lv. 2175] [Boss]')) then
                    end
                    if not game:GetService('Workspace').Enemies:FindFirstChild('Cake Queen [Lv. 2175] [Boss]') then
                        Tween(CFrame.new(-709.3132934570313, 381.6005859375, -11011.396484375))
                    end

                    local v414, v415, v416 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                    while true do
                        local v417

                        v416, v417 = v414(v415, v416)

                        if v416 == nil then
                        end
                        if v417.Name ~= 'Cake Queen [Lv. 2175] [Boss]' or v417.Humanoid.Health <= 0 then
                        end

                        repeat
                            wait()

                            if AutoHaki and not game.Players.LocalPlayer.Character:FindFirstChild('HasBuso') then
                                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Buso')
                            end
                            if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Select_Weapon) then
                                wait()
                                EquipWeapon(SelectWeapon)
                            end
                            if not u230 then
                                game:GetService('VirtualUser'):CaptureController()
                                game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
                            end

                            v417.HumanoidRootPart.Size = Vector3.new(60, 60, 60)

                            if _G.Configs['Show Hitbox'] then
                                v417.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
                            else
                                v417.HumanoidRootPart.Transparency = 1
                            end

                            v417.Humanoid.JumpPower = 0
                            v417.Humanoid.WalkSpeed = 0
                            v417.HumanoidRootPart.CanCollide = false

                            v417.Humanoid:ChangeState(11)
                            Tween(v417.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                        until Auto_Cursed_Dual_Katana == false or Auto_Quest_Tushita_3 == false or game:GetService('Workspace').Map:FindFirstChild('HeavenlyDimension')
                    end

                    if not game:GetService('Workspace').Map:FindFirstChild('HeavenlyDimension') then
                        hop()

                        return
                    end

                    local v418, v419 = v420(v421, v418)

                    if v418 == nil then
                    end
                    if v419.Name ~= 'Cursed Skeleton [Lv. 2200]' and (v419.Name ~= 'Cursed Skeleton [Lv. 2200] [Boss]' and v419.Name ~= "Heaven's Guardian [Lv. 2200] [Boss]") or v419.Humanoid.Health <= 0 then
                    end
                    if Auto_Cursed_Dual_Katana == false or (Auto_Quest_Tushita_3 == false or GetMaterial('Alucard Fragment') == 6) then
                    end
                    if true then
                    else
                    end

                    wait()

                    if not (game:GetService('Workspace').Enemies:FindFirstChild('Cursed Skeleton [Lv. 2200]') or (game:GetService('Workspace').Enemies:FindFirstChild('Cursed Skeleton [Lv. 2200] [Boss]') or game:GetService('Workspace').Enemies:FindFirstChild("Heaven's Guardian [Lv. 2200] [Boss]"))) then
                        wait(5)
                        Tween(game:GetService('Workspace').Map.HeavenlyDimension.Torch1.CFrame)
                        wait(1.5)
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 'E', false, game)
                        wait(1.5)
                        Tween(game:GetService('Workspace').Map.HeavenlyDimension.Torch2.CFrame)
                        wait(1.5)
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 'E', false, game)
                        wait(1.5)
                        Tween(game:GetService('Workspace').Map.HeavenlyDimension.Torch3.CFrame)
                        wait(1.5)
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 'E', false, game)
                        wait(1.5)
                        Tween(game:GetService('Workspace').Map.HeavenlyDimension.Exit.CFrame)
                    end

                    local v420, v421

                    v420, v421, v418 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                    wait()

                    if AutoHaki and not game.Players.LocalPlayer.Character:FindFirstChild('HasBuso') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Buso')
                    end
                    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Select_Weapon) then
                        wait()
                        EquipWeapon(SelectWeapon)
                    end
                    if not u230 then
                        game:GetService('VirtualUser'):CaptureController()
                        game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
                    end

                    v419.HumanoidRootPart.Size = Vector3.new(60, 60, 60)

                    if _G.Configs['Show Hitbox'] then
                        v419.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
                    else
                        v419.HumanoidRootPart.Transparency = 1
                    end

                    v419.Humanoid.JumpPower = 0
                    v419.Humanoid.WalkSpeed = 0
                    v419.HumanoidRootPart.CanCollide = false

                    v419.Humanoid:ChangeState(11)

                    if v419.Humanoid.Health <= 0 or (not v419.Parent or Auto_Quest_Tushita_3 == false) then
                    else
                    end
                end)
            end
        end
    end)
end
if Third_Sea then
    _Here3:CreateToggle({Name = 'Auto Rainbow Haki Quest', Description = '', Default = false}, function(p422)
        _G.Auto_Rainbow_Haki = p422
    end)
    spawn(function()
        pcall(function()
            while wait(0.1) do
                if _G.Auto_Rainbow_Haki then
                    if game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
                        if game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible ~= true or not string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Stone') then
                            if game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible ~= true or not string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Island Empress') then
                                if string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Kilo Admiral') then
                                    if game:GetService('Workspace').Enemies:FindFirstChild('Kilo Admiral [Lv. 1750] [Boss]') then
                                        local v423, v424, v425 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                                        while true do
                                            local v426

                                            v425, v426 = v423(v424, v425)

                                            if v425 == nil then
                                                break
                                            end
                                            if v426.Name == 'Kilo Admiral [Lv. 1750] [Boss]' then
                                                OldCFrameRainbow = v426.HumanoidRootPart.CFrame

                                                repeat
                                                    task.wait()
                                                    EquipWeapon(_G.SelectWeapon)
                                                    Tween(v426.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))

                                                    v426.HumanoidRootPart.CanCollide = false
                                                    v426.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                    v426.HumanoidRootPart.CFrame = OldCFrameRainbow

                                                    game:GetService('VirtualUser'):CaptureController()
                                                    game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
                                                    sethiddenproperty(game:GetService('Players').LocalPlayer, 'SimulationRadius', math.huge)
                                                until _G.Auto_Rainbow_Haki == false or (v426.Humanoid.Health <= 0 or not v426.Parent) or game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                            end
                                        end
                                    else
                                        Tween(CFrame.new(2877.61743, 423.558685, -7207.31006, -0.989591599, 0, -0.143904909, 0, 1.00000012, 0, 0.143904924, 0, -0.989591479))
                                    end
                                elseif string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Captain Elephant') then
                                    if game:GetService('Workspace').Enemies:FindFirstChild('Captain Elephant [Lv. 1875] [Boss]') then
                                        local v427, v428, v429 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                                        while true do
                                            local v430

                                            v429, v430 = v427(v428, v429)

                                            if v429 == nil then
                                                break
                                            end
                                            if v430.Name == 'Captain Elephant [Lv. 1875] [Boss]' then
                                                OldCFrameRainbow = v430.HumanoidRootPart.CFrame

                                                repeat
                                                    task.wait()
                                                    EquipWeapon(_G.SelectWeapon)
                                                    Tween(v430.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))

                                                    v430.HumanoidRootPart.CanCollide = false
                                                    v430.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                    v430.HumanoidRootPart.CFrame = OldCFrameRainbow

                                                    game:GetService('VirtualUser'):CaptureController()
                                                    game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
                                                    sethiddenproperty(game:GetService('Players').LocalPlayer, 'SimulationRadius', math.huge)
                                                until _G.Auto_Rainbow_Haki == false or (v430.Humanoid.Health <= 0 or not v430.Parent) or game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                            end
                                        end
                                    else
                                        Tween(CFrame.new(-13485.0283, 331.709259, -8012.4873, 0.714521289, 7.98849911e-8, 0.69961375, -1.02065748e-7, 1, -9.943830649999999e-9, -0.69961375, -6.430152410000001e-8, 0.714521289))
                                    end
                                elseif string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Beautiful Pirate') then
                                    if game:GetService('Workspace').Enemies:FindFirstChild('Beautiful Pirate [Lv. 1950] [Boss]') then
                                        local v431, v432, v433 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                                        while true do
                                            local v434

                                            v433, v434 = v431(v432, v433)

                                            if v433 == nil then
                                                break
                                            end
                                            if v434.Name == 'Beautiful Pirate [Lv. 1950] [Boss]' then
                                                OldCFrameRainbow = v434.HumanoidRootPart.CFrame

                                                repeat
                                                    task.wait()
                                                    EquipWeapon(_G.SelectWeapon)
                                                    Tween(v434.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))

                                                    v434.HumanoidRootPart.CanCollide = false
                                                    v434.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                    v434.HumanoidRootPart.CFrame = OldCFrameRainbow

                                                    game:GetService('VirtualUser'):CaptureController()
                                                    game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
                                                    sethiddenproperty(game:GetService('Players').LocalPlayer, 'SimulationRadius', math.huge)
                                                until _G.Auto_Rainbow_Haki == false or (v434.Humanoid.Health <= 0 or not v434.Parent) or game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                            end
                                        end
                                    else
                                        Tween(CFrame.new(5312.3598632813, 20.141201019287, -10.158538818359))
                                    end
                                else
                                    Tween(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))

                                    if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                                        wait(1.5)
                                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('HornedMan', 'Bet')
                                    end
                                end
                            elseif game:GetService('Workspace').Enemies:FindFirstChild('Island Empress [Lv. 1675] [Boss]') then
                                local v435, v436, v437 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                                while true do
                                    local v438

                                    v437, v438 = v435(v436, v437)

                                    if v437 == nil then
                                        break
                                    end
                                    if v438.Name == 'Island Empress [Lv. 1675] [Boss]' then
                                        OldCFrameRainbow = v438.HumanoidRootPart.CFrame

                                        repeat
                                            task.wait()
                                            EquipWeapon(_G.SelectWeapon)
                                            Tween(v438.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))

                                            v438.HumanoidRootPart.CanCollide = false
                                            v438.HumanoidRootPart.CFrame = OldCFrameRainbow
                                            v438.HumanoidRootPart.Size = Vector3.new(50, 50, 50)

                                            game:GetService('VirtualUser'):CaptureController()
                                            game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
                                            sethiddenproperty(game:GetService('Players').LocalPlayer, 'SimulationRadius', math.huge)
                                        until _G.Auto_Rainbow_Haki == false or (v438.Humanoid.Health <= 0 or not v438.Parent) or game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    end
                                end
                            else
                                Tween(CFrame.new(5713.98877, 601.922974, 202.751251, -0.101080291, 0, -0.994878292, 0, 1, 0, 0.994878292, 0, -0.101080291))
                            end
                        elseif game:GetService('Workspace').Enemies:FindFirstChild('Stone [Lv. 1550] [Boss]') then
                            local v439, v440, v441 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                            while true do
                                local v442

                                v441, v442 = v439(v440, v441)

                                if v441 == nil then
                                    break
                                end
                                if v442.Name == 'Stone [Lv. 1550] [Boss]' then
                                    OldCFrameRainbow = v442.HumanoidRootPart.CFrame

                                    repeat
                                        task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        Tween(v442.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))

                                        v442.HumanoidRootPart.CanCollide = false
                                        v442.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        v442.HumanoidRootPart.Size = Vector3.new(50, 50, 50)

                                        game:GetService('VirtualUser'):CaptureController()
                                        game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game:GetService('Players').LocalPlayer, 'SimulationRadius', math.huge)
                                    until _G.Auto_Rainbow_Haki == false or (v442.Humanoid.Health <= 0 or not v442.Parent) or game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            Tween(CFrame.new(-1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699, 0.805107772, 0.0000203251839, 0.805323839, 0.592835128, -0.999732077, -0.0137055516, 0.0186523199))
                        end
                    else
                        Tween(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))

                        if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                            wait(1.5)
                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('HornedMan', 'Bet')
                        end
                    end
                end
            end
        end)
    end)
end

_Here3:CreateLabel({Name = 'Bosses'})

if First_Sea then
    tableBoss = {
        'The Gorilla King',
        'Bobby',
        'Yeti',
        'Mob Leader',
        'Vice Admiral',
        'Warden',
        'Chief Warden',
        'Swan',
        'Magma Admiral',
        'Fishman Lord',
        'Wysper',
        'Thunder God',
        'Cyborg',
        'Saber Expert',
    }
elseif Second_Sea then
    tableBoss = {
        'Diamond',
        'Jeremy',
        'Fajita',
        'Don Swan',
        'Smoke Admiral',
        'Cursed Captain',
        'Darkbeard',
        'Order',
        'Awakened Ice Admiral',
        'Tide Keeper',
    }
elseif Third_Sea then
    tableBoss = {
        'Stone',
        'Island Empress',
        'Kilo Admiral',
        'Captain Elephant',
        'Beautiful Pirate',
        'rip_indra True Form',
        'Longma',
        'Soul Reaper',
        'Cake Queen',
    }
end

_Here3:CreateDropdown({Name = 'SelectBoss', Description = '', Options = tableBoss}, function(p443)
    _G.SelectBoss = p443
end)
_Here3:CreateToggle({Name = 'Kill Selected Boss', Description = '', Default = false}, function(p444)
    _G.AutoBoss = p444
end)
spawn(function()
    while wait() do
        if _G.AutoBoss and BypassTP then
            pcall(function()
                if game:GetService('Workspace').Enemies:FindFirstChild(_G.SelectBoss) then
                    local v445, v446, v447 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                    while true do
                        local v448

                        v447, v448 = v445(v446, v447)

                        if v447 == nil then
                            break
                        end
                        if v448.Name == _G.SelectBoss and (v448:FindFirstChild('Humanoid') and (v448:FindFirstChild('HumanoidRootPart') and v448.Humanoid.Health > 0)) then
                            repeat
                                task.wait()
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                Click()

                                v448.HumanoidRootPart.CanCollide = false
                                v448.Humanoid.WalkSpeed = 0
                                v448.HumanoidRootPart.Size = Vector3.new(80, 80, 80)

                                Tween(v448.HumanoidRootPart.CFrame * Pos)

                                BringMobs = false

                                sethiddenproperty(game:GetService('Players').LocalPlayer, 'SimulationRadius', math.huge)
                            until not _G.AutoBoss or (not v448.Parent or v448.Humanoid.Health <= 0)
                        end

                        BringMobs = true
                    end
                elseif game.ReplicatedStorage:FindFirstChild(_G.SelectBoss) then
                    if (game.ReplicatedStorage:FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 1500 then
                        BTP(game.ReplicatedStorage:FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame)
                    else
                        Tween(game.ReplicatedStorage:FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame)
                    end

                    BringMobs = true
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.AutoBoss and not BypassTP then
            pcall(function()
                if game:GetService('Workspace').Enemies:FindFirstChild(_G.SelectBoss) then
                    local v449, v450, v451 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                    while true do
                        local v452

                        v451, v452 = v449(v450, v451)

                        if v451 == nil then
                            break
                        end
                        if v452.Name == _G.SelectBoss then
                            if v452:FindFirstChild('Humanoid') and (v452:FindFirstChild('HumanoidRootPart') and v452.Humanoid.Health > 0) then
                                repeat
                                    task.wait()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    Click()

                                    v452.HumanoidRootPart.CanCollide = false
                                    v452.Humanoid.WalkSpeed = 0
                                    v452.HumanoidRootPart.Size = Vector3.new(80, 80, 80)

                                    Tween(v452.HumanoidRootPart.CFrame * Pos)

                                    BringMobs = false
                                until not _G.AutoBoss or (not v452.Parent or v452.Humanoid.Health <= 0)
                            end

                            BringMobs = true
                        end
                    end
                elseif game:GetService('ReplicatedStorage'):FindFirstChild(_G.SelectBoss) then
                    Tween(game:GetService('ReplicatedStorage'):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                end
            end)

            BringMobs = true
        end
    end
end)
_Here3:CreateLabel({Name = 'Mastery'})
_Here3:CreateDropdown({Name = 'Farm Mode', Description = '', Options = {
    'Level',
    'Near Mobs',
}}, function(p453)
    TypeMastery = p453
end)
_Here3:CreateToggle({Name = 'Auto BF Mastery', Description = '', Default = false}, function(p454)
    AutoFarmMasDevilFruit = p454
end)
_Here3:CreateToggle({Name = 'Auto Gun Mastery', Description = '', Default = false}, function(p455)
    AutoFarmMasGun = p455
end)
_Here3:CreateSlider({Name = 'Health %', Description = 'Health for mastery', Min = 0, Max = 100, Default = 0, Increment = 1}, function(p456)
    KillPercent = p456
end)
spawn(function()
    while task.wait(0.1) do
        if AutoFarmMasGun and TypeMastery == 'Level' then
            pcall(function()
                CheckLevel()

                if not string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('AbandonQuest')
                    Tween(CFrameQ)

                    if (CFrameQ.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StartQuest', NameQuest, QuestLv)
                    end
                end
                if not string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) and game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible ~= true then
                    return
                end

                local v457, v458, v459 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                while true do
                    local v460

                    v459, v460 = v457(v458, v459)

                    if v459 == nil then
                        UseSkillGun = false

                        Tween(CFrameQ)
                    end
                    if v460:FindFirstChild('Humanoid') and (v460:FindFirstChild('HumanoidRootPart') and v460.Name == Ms) then
                        if true then
                            game:GetService('RunService').Heartbeat:wait()

                            if v460.Humanoid.Health > v460.Humanoid.MaxHealth * KillPercent / 100 then
                                UseSkillGun = false

                                AutoHaki()
                                EquipTool(SelectWeapon)
                                Click()
                                Tween(v460.HumanoidRootPart.CFrame * CFrame.new(u216, u217, u218))

                                v460.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                v460.HumanoidRootPart.Transparency = 1
                                v460.Humanoid.JumpPower = 0
                                v460.Humanoid.WalkSpeed = 0
                                v460.HumanoidRootPart.CanCollide = false

                                Click()

                                FarmPos = v460.HumanoidRootPart.CFrame
                                MonFarm = v460.Name
                            else
                                EquipTool(CurrentEquipGun)

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v460.HumanoidRootPart.CFrame * Pos
                                game:GetService('Players').LocalPlayer.Character[CurrentEquipGun].Cooldown.Value = 0
                                UseSkillGun = true
                            end
                        end
                        if AutoFarmMasGun and (v460.Parent and v460.Humanoid.Health > 0) and (game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible ~= false and (game:GetService('Workspace').Enemies:FindFirstChild(v460.Name) and not TypeMastery ~= 'Queat')) then
                        end

                        UseSkillGun = false
                    end
                end
            end)
        elseif AutoFarmMasGun and TypeMastery == 'No Quest' then
            pcall(function()
                if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMon.Position).Magnitude <= 2000 then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMon.Position).Magnitude < 2000 then
                            Tween(CFrameMon)
                        end
                    else
                        BTP(CFrameMon)
                    end
                else
                    Tween(CFrameMon)
                end

                CheckLevel()

                if not game.Workspace.Enemies:FindFirstChild(Ms) then
                    UseSkillGun = false

                    Tween(CFrameMon)

                    return
                end

                local v461, v462, v463 = pairs(game.Workspace.Enemies:GetChildren())
                local v464

                v463, v464 = v461(v462, v463)

                if v463 == nil then
                end
                if v464.Name ~= Ms or not (v464:FindFirstChild('Humanoid') and v464:FindFirstChild('HumanoidRootPart')) then
                else
                end
                if true then
                    game:GetService('RunService').Heartbeat:wait()

                    if v464.Humanoid.Health > v464.Humanoid.MaxHealth * KillPercent / 100 then
                        UseSkillGun = false

                        AutoHaki()
                        EquipTool(SelectWeapon)
                        Tween(v464.HumanoidRootPart.CFrame * CFrame.new(u216, u217, u218))

                        v464.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                        v464.HumanoidRootPart.Transparency = 1
                        v464.Humanoid.JumpPower = 0
                        v464.Humanoid.WalkSpeed = 0
                        v464.HumanoidRootPart.CanCollide = false
                        FarmPos = v464.HumanoidRootPart.CFrame
                        MonFarm = v464.Name
                    else
                        EquipTool(CurrentEquipGun)

                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v464.HumanoidRootPart.CFrame * Pos
                        game:GetService('Players').LocalPlayer.Character[CurrentEquipGun].Cooldown.Value = 0
                        UseSkillGun = true
                    end
                end
                if AutoFarmMasGun and (v464.Parent and v464.Humanoid.Health > 0) and (game:GetService('Workspace').Enemies:FindFirstChild(v464.Name) and not TypeMastery ~= 'No Quest') then
                end
            end)
        elseif AutoFarmMasGun and TypeMastery == 'Near Mobs' then
            pcall(function()
                local v465, v466, v467 = pairs(game.Workspace.Enemies:GetChildren())

                while true do
                    local v468

                    v467, v468 = v465(v466, v467)

                    if v467 == nil then
                        return
                    end
                    if v468.Name and (v468:FindFirstChild('Humanoid') and (v468:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v468:FindFirstChild('HumanoidRootPart').Position).Magnitude <= 2000)) then
                        repeat
                            if true then
                                game:GetService('RunService').Heartbeat:wait()

                                if v468.Humanoid.Health > v468.Humanoid.MaxHealth * KillPercent / 100 then
                                    UseSkillGun = false

                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    Tween(v468.HumanoidRootPart.CFrame * CFrame.new(u216, u217, u218))

                                    v468.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                    v468.HumanoidRootPart.Transparency = 1
                                    v468.Humanoid.JumpPower = 0
                                    v468.Humanoid.WalkSpeed = 0
                                    v468.HumanoidRootPart.CanCollide = false

                                    Click()

                                    FarmPos = v468.HumanoidRootPart.CFrame
                                    MonFarm = v468.Name

                                    Click()
                                else
                                    EquipTool(CurrentEquipGun)

                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v468.HumanoidRootPart.CFrame * Pos
                                    game:GetService('Players').LocalPlayer.Character[CurrentEquipGun].Cooldown.Value = 0
                                    UseSkillGun = true
                                end
                            end
                        until not AutoFarmMasGun or (not MasteryType == 'Near Mobs' or (not v468.Parent or (v468.Humanoid.Health <= 0 or not TypeMastery == 'Near Mobs')))

                        UseSkillGun = false
                    end
                end
            end)
        elseif AutoFarmMasGun and TypeMastery == 'Boss' then
            if game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
                if game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    pcall(function()
                        CheckBossQuest()

                        if not game:GetService('Workspace').Enemies:FindFirstChild(SelectBoss) then
                            UseSkillGun = false

                            Tween(game:GetService('ReplicatedStorage'):FindFirstChild(SelectBoss).HumanoidRootPart.CFrame * CFrame.new(u216, u217, u218))

                            return
                        end

                        local v469, v470, v471 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                        if true then
                            game:GetService('RunService').Heartbeat:wait()

                            if v472.Humanoid.Health > v472.Humanoid.MaxHealth * KillPercent / 100 then
                                UseSkillGun = false

                                AutoHaki()
                                EquipTool(SelectWeapon)
                                Tween(v472.HumanoidRootPart.CFrame * CFrame.new(u216, u217, u218))

                                v472.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                v472.HumanoidRootPart.Transparency = 1
                                v472.Humanoid.JumpPower = 0
                                v472.Humanoid.WalkSpeed = 0
                                v472.HumanoidRootPart.CanCollide = false
                                FarmPos = v472.HumanoidRootPart.CFrame
                                MonFarm = v472.Name
                            else
                                EquipTool(CurrentEquipGun)
                                Tween(v472.HumanoidRootPart.CFrame * CFrame.new(u216, u217, u218))

                                game:GetService('Players').LocalPlayer.Character[CurrentEquipGun].Cooldown.Value = 0
                                UseSkillGun = true
                            end
                        end
                        if AutoFarmMasGun and (not TypeMastery ~= 'Boss' and (v472.Parent and (v472.Humanoid.Health > 0 and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible ~= false))) and game:GetService('Workspace').Enemies:FindFirstChild(v472.Name) then
                        end

                        local v472

                        v471, v472 = v469(v470, v471)

                        if v471 == nil then
                        end
                        if v472.Name ~= selectBoss or not (v472:FindFirstChild('Humanoid') and v472:FindFirstChild('HumanoidRootPart')) then
                        else
                        end
                    end)
                end
            else
                CheckLevel()

                if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQBoss.Position).Magnitude <= 2000 then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQBoss.Position).Magnitude < 2000 then
                            Tween(CFrameQBoss)
                        end
                    else
                        BTP(CFrameQBoss)
                        wait(3)
                    end
                else
                    Tween(CFrameQBoss)
                end
                if (CFrameQBoss.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StartQuest', NameQuestBoss, QuestLvBoss)
                end
            end
        end
    end
end)
spawn(function()
    game:GetService('RunService').RenderStepped:Connect(function()
        if UseSkillGun then
            pcall(function()
                local v473, v474, v475 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                while true do
                    local v476

                    v475, v476 = v473(v474, v475)

                    if v475 == nil then
                        break
                    end
                    if v476.Name == MonFarm then
                        game:GetService('Players').LocalPlayer.Character[CurrentEquipGun].RemoteFunctionShoot:InvokeServer(v476.HumanoidRootPart.Position, v476.HumanoidRootPart)
                        ClickCamera()
                    end
                end
            end)
        end
    end)
end)
spawn(function()
    while wait(1) do
        if UseSkillGun then
            pcall(function()
                CheckLevel()

                local v477, v478, v479 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                while true do
                    local v480

                    v479, v480 = v477(v478, v479)

                    if v479 == nil then
                        break
                    end
                    if SkillZ then
                        local v481 = {
                            FarmPosMasteryGun.Position,
                        }

                        game:GetService('Players').LocalPlayer.Character[game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Tool').Name].RemoteEvent:FireServer(unpack(v481))
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 'Z', false, game)
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 'Z', false, game)
                    end
                    if SkillX then
                        local v482 = {
                            FarmPosMasteryGun.Position,
                        }

                        game:GetService('Players').LocalPlayer.Character[game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Tool').Name].RemoteEvent:FireServer(unpack(v482))
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 'X', false, game)
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 'X', false, game)
                    end
                end
            end)
        end
    end
end)
spawn(function()
    pcall(function()
        game:GetService('RunService').RenderStepped:Connect(function()
            if UseSkillGun then
                local v483 = {
                    FarmPosMasteryGun.Position,
                }

                game:GetService('Players').LocalPlayer.Character[game:GetService('Players').LocalPlayer.Data.Gun.Value].RemoteEvent:FireServer(unpack(v483))
            end
        end)
    end)
end)
spawn(function()
    while task.wait(1) do
        if _G.UseSkill then
            pcall(function()
                if not _G.UseSkill then
                    return
                end

                local v484, v485, v486 = pairs(game:GetService('Workspace').Enemies:GetChildren())
                local v487

                v486, v487 = v484(v485, v486)

                if v486 == nil then
                end
                if v487.Name ~= MonFarm or (not v487:FindFirstChild('Humanoid') or (not v487:FindFirstChild('HumanoidRootPart') or v487.Humanoid.Health > v487.Humanoid.MaxHealth * KillPercent / 100)) then
                end

                game:GetService('RunService').Heartbeat:wait()
                EquipTool(game.Players.LocalPlayer.Data.DevilFruit.Value)
                Tween(v487.HumanoidRootPart.CFrame * CFrame.new(u216, u217, u218))

                PositionSkillMasteryDevilFruit = v487.HumanoidRootPart.Position

                if game:GetService('Players').LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                    game:GetService('Players').LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).MousePos.Value = PositionSkillMasteryDevilFruit

                    local _Value2 = game:GetService('Players').LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value

                    if SkillZ and 1 <= _Value2 then
                        game:service('VirtualInputManager'):SendKeyEvent(true, 'Z', false, game)
                        wait(0.1)
                        game:service('VirtualInputManager'):SendKeyEvent(false, 'Z', false, game)
                    end
                    if SkillX and 2 <= _Value2 then
                        game:service('VirtualInputManager'):SendKeyEvent(true, 'X', false, game)
                        wait(0.2)
                        game:service('VirtualInputManager'):SendKeyEvent(false, 'X', false, game)
                    end
                    if SkillC and 3 <= _Value2 then
                        game:service('VirtualInputManager'):SendKeyEvent(true, 'C', false, game)
                        wait(0.3)
                        game:service('VirtualInputManager'):SendKeyEvent(false, 'C', false, game)
                    end
                    if SkillV and 4 <= _Value2 then
                        game:service('VirtualInputManager'):SendKeyEvent(true, 'V', false, game)
                        wait(0.4)
                        game:service('VirtualInputManager'):SendKeyEvent(false, 'V', false, game)
                    end
                    if SkillF and 5 <= _Value2 then
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 'F', false, game)
                        wait(0.5)
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 'F', false, game)
                    end
                end
                if AutoFarmMasDevilFruit and (_G.UseSkill and v487.Humanoid.Health ~= 0) then
                else
                end
            end)
        end
    end
end)
spawn(function()
    while task.wait(0.1) do
        if AutoFarmMasDevilFruit and TypeMastery == 'Level' then
            pcall(function()
                CheckLevel(SelectMonster)

                if not string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('AbandonQuest')

                    if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQ.Position).Magnitude <= 2500 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQ.Position).Magnitude < 2500 then
                                Tween(CFrameQ)
                            end
                        else
                            BTP(CFrameQ)
                            wait(0.2)
                        end
                    else
                        Tween(CFrameQ)
                    end
                    if (CFrameQ.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StartQuest', NameQuest, QuestLv)
                    end
                end
                if not string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) and game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible ~= true then
                    return
                end

                local v489, v490, v491 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                while true do
                    local v492

                    v491, v492 = v489(v490, v491)

                    if v491 == nil then
                        _G.UseSkill = false

                        Tween(Q)
                    end
                    if v492:FindFirstChild('Humanoid') and (v492:FindFirstChild('HumanoidRootPart') and v492.Name == Ms) then
                        if true then
                            game:GetService('RunService').Heartbeat:wait()

                            if v492.Humanoid.Health > v492.Humanoid.MaxHealth * KillPercent / 100 then
                                _G.UseSkill = false

                                AutoHaki()
                                EquipTool(SelectWeapon)
                                Click()
                                Tween(v492.HumanoidRootPart.CFrame * CFrame.new(u216, u217, u218))

                                v492.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                v492.HumanoidRootPart.Transparency = 1
                                v492.Humanoid.JumpPower = 0
                                v492.Humanoid.WalkSpeed = 0
                                v492.HumanoidRootPart.CanCollide = false

                                Click()

                                FarmPos = v492.HumanoidRootPart.CFrame
                                MonFarm = v492.Name
                            else
                                _G.UseSkill = true
                            end
                        end
                        if AutoFarmMasDevilFruit and (v492.Parent and v492.Humanoid.Health ~= 0) and (game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible ~= false and (game:GetService('Workspace').Enemies:FindFirstChild(v492.Name) and not TypeMastery ~= 'Level')) then
                        end

                        _G.UseSkill = false
                    end
                end
            end)
        elseif AutoFarmMasDevilFruit and TypeMastery == 'No Quest' then
            pcall(function()
                CheckLevel()

                if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMon.Position).Magnitude <= 2000 then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMon.Position).Magnitude < 2000 then
                            Tween(CFrameMon)
                        end
                    else
                        BTP(CFrameMon)
                    end
                else
                    Tween(CFrameMon)
                end
                if not game.Workspace.Enemies:FindFirstChild(Ms) then
                    _G.UseSkill = false

                    Tween(CFrameMon)

                    return
                end

                local v493, v494, v495 = pairs(game.Workspace.Enemies:GetChildren())

                if true then
                    game:GetService('RunService').Heartbeat:wait()

                    if v496.Humanoid.Health > v496.Humanoid.MaxHealth * KillPercent / 100 then
                        _G.UseSkill = false

                        AutoHaki()
                        EquipTool(SelectWeapon)
                        Tween(v496.HumanoidRootPart.CFrame * CFrame.new(u216, u217, u218))

                        v496.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                        v496.HumanoidRootPart.Transparency = 1
                        v496.Humanoid.JumpPower = 0
                        v496.Humanoid.WalkSpeed = 0
                        v496.HumanoidRootPart.CanCollide = false
                        FarmPos = v496.HumanoidRootPart.CFrame
                        MonFarm = v496.Name
                    else
                        _G.UseSkill = true
                    end
                end
                if AutoFarmMasDevilFruit and (v496.Parent and v496.Humanoid.Health ~= 0) and (game:GetService('Workspace').Enemies:FindFirstChild(v496.Name) and not TypeMastery ~= 'No Quest') then
                else
                end

                _G.UseSkill = false

                local v496

                v495, v496 = v493(v494, v495)

                if v495 == nil then
                end
                if v496.Name ~= Ms or not (v496:FindFirstChild('Humanoid') and v496:FindFirstChild('HumanoidRootPart')) then
                else
                end
            end)
        elseif AutoFarmMasDevilFruit and TypeMastery == 'Near Mobs' then
            pcall(function()
                local v497, v498, v499 = pairs(game.Workspace.Enemies:GetChildren())

                while true do
                    local v500

                    v499, v500 = v497(v498, v499)

                    if v499 == nil then
                        return
                    end
                    if v500.Name and (v500:FindFirstChild('Humanoid') and (v500:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v500:FindFirstChild('HumanoidRootPart').Position).Magnitude <= 2000)) then
                        repeat
                            if true then
                                game:GetService('RunService').Heartbeat:wait()

                                if v500.Humanoid.Health > v500.Humanoid.MaxHealth * KillPercent / 100 then
                                    _G.UseSkill = false

                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    Tween(v500.HumanoidRootPart.CFrame * CFrame.new(u216, u217, u218))

                                    v500.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                    v500.HumanoidRootPart.Transparency = 1
                                    v500.Humanoid.JumpPower = 0
                                    v500.Humanoid.WalkSpeed = 0
                                    v500.HumanoidRootPart.CanCollide = false
                                    FarmPos = v500.HumanoidRootPart.CFrame
                                    MonFarm = v500.Name

                                    Click()
                                else
                                    _G.UseSkill = true
                                end
                            end
                        until not AutoFarmMasDevilFruit or (not MasteryType == 'Nearest' or (not v500.Parent or (v500.Humanoid.Health == 0 or not TypeMastery == 'Nearest')))

                        _G.UseSkill = false
                    end
                end
            end)
        elseif AutoFarmMasDevilFruit and TypeMastery == 'Boss' then
            if game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
                if game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    pcall(function()
                        CheckBossQuest()

                        if not game:GetService('Workspace').Enemies:FindFirstChild(SelectBoss) then
                            _G.UseSkill = false

                            Tween(game:GetService('ReplicatedStorage'):FindFirstChild(SelectBoss).HumanoidRootPart.CFrame * PosY)

                            return
                        end

                        local v501, v502, v503 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                        if true then
                            game:GetService('RunService').Heartbeat:wait()

                            if v504.Humanoid.Health > v504.Humanoid.MaxHealth * KillPercent / 100 then
                                _G.UseSkill = false

                                AutoHaki()
                                EquipTool(SelectWeapon)
                                Tween(v504.HumanoidRootPart.CFrame * CFrame.new(u216, u217, u218))

                                v504.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                v504.HumanoidRootPart.Transparency = 1
                                v504.Humanoid.JumpPower = 0
                                v504.Humanoid.WalkSpeed = 0
                                v504.HumanoidRootPart.CanCollide = false
                                FarmPos = v504.HumanoidRootPart.CFrame
                                MonFarm = v504.Name
                            else
                                _G.UseSkill = true
                            end
                        end
                        if AutoFarmMasDevilFruit and (not TypeMastery ~= 'Boss' and (v504.Parent and (v504.Humanoid.Health ~= 0 and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible ~= false))) and game:GetService('Workspace').Enemies:FindFirstChild(v504.Name) then
                        end

                        local v504

                        v503, v504 = v501(v502, v503)

                        if v503 == nil then
                        end
                        if v504.Name ~= selectBoss or not (v504:FindFirstChild('Humanoid') and v504:FindFirstChild('HumanoidRootPart')) then
                        else
                        end
                    end)
                end
            else
                CheckBossQuest()

                if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQBoss.Position).Magnitude <= 2000 then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQBoss.Position).Magnitude < 2000 then
                            Tween(CFrameQBoss)
                        end
                    else
                        BTP(CFrameQBoss)
                        wait(3)
                    end
                else
                    Tween(CFrameQBoss)
                end
                if (CFrameQBoss.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StartQuest', NameQuestBoss, QuestLvBoss)
                end
            end
        end
    end
end)

local _Here4 = _VScript:CreateTab('Teleport...', "home"):CreateSection('Here')

_Here4:CreateButton({Name = 'First Sea', Description = ''}, function()
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('TravelMain')
end)
_Here4:CreateButton({Name = 'Second Sea', Description = ''}, function()
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('TravelDressrosa')
end)
_Here4:CreateButton({Name = 'Third Sea', Description = ''}, function()
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('TravelZou')
end)

if First_Sea then
    IslandList = {
        'WindMill',
        'Marine',
        'Middle Town',
        'Jungle',
        'Pirate Village',
        'Desert',
        'Snow Island',
        'MarineFord',
        'Colosseum',
        'Sky Island 1',
        'Sky Island 2',
        'Sky Island 3',
        'Prison',
        'Magma Village',
        'Under Water Island',
        'Fountain City',
        'Shank Room',
        'Mob Island',
    }
elseif Second_Sea then
    IslandList = {
        'The Cafe',
        'Frist Spot',
        'Dark Area',
        'Flamingo Mansion',
        'Flamingo Room',
        'Green Zone',
        'Factory',
        'Colossuim',
        'Zombie Island',
        'Two Snow Mountain',
        'Punk Hazard',
        'Cursed Ship',
        'Ice Castle',
        'Forgotten Island',
        'Ussop Island',
        'Mini Sky Island',
    }
elseif Third_Sea then
    IslandList = {
        'Mansion',
        'Port Town',
        'Great Tree',
        'Castle On The Sea',
        'MiniSky',
        'Hydra Island',
        'Floating Turtle',
        'Haunted Castle',
        'Ice Cream Island',
        'Peanut Island',
        'Cake Island',
        'Cocoa Island',
        'Candy Island',
    }
end

_Here4:CreateDropdown({Name = 'SelectIsland', Description = '', Options = IslandList}, function(p506)
    _G.SelectIsland = p506
end)
_Here4:CreateToggle({Name = 'TeleportToIsland', Description = '', Default = false}, function(p507)
    _G.TeleportIsland = p507

    if _G.TeleportIsland ~= true then
        return
    else
        while true do
            if true then
                wait()

                if _G.SelectIsland ~= 'WindMill' then
                    if _G.SelectIsland ~= 'Marine' then
                        if _G.SelectIsland ~= 'Middle Town' then
                            if _G.SelectIsland ~= 'Jungle' then
                                if _G.SelectIsland ~= 'Pirate Village' then
                                    if _G.SelectIsland ~= 'Desert' then
                                        if _G.SelectIsland ~= 'Snow Island' then
                                            if _G.SelectIsland ~= 'MarineFord' then
                                                if _G.SelectIsland ~= 'Colosseum' then
                                                    if _G.SelectIsland ~= 'Sky Island 1' then
                                                        if _G.SelectIsland ~= 'Sky Island 2' then
                                                            if _G.SelectIsland ~= 'Sky Island 3' then
                                                                if _G.SelectIsland ~= 'Prison' then
                                                                    if _G.SelectIsland ~= 'Magma Village' then
                                                                        if _G.SelectIsland ~= 'Under Water Island' then
                                                                            if _G.SelectIsland ~= 'Fountain City' then
                                                                                if _G.SelectIsland ~= 'Shank Room' then
                                                                                    if _G.SelectIsland ~= 'Mob Island' then
                                                                                        if _G.SelectIsland ~= 'The Cafe' then
                                                                                            if _G.SelectIsland ~= 'Frist Spot' then
                                                                                                if _G.SelectIsland ~= 'Dark Area' then
                                                                                                    if _G.SelectIsland ~= 'Flamingo Mansion' then
                                                                                                        if _G.SelectIsland ~= 'Flamingo Room' then
                                                                                                            if _G.SelectIsland ~= 'Green Zone' then
                                                                                                                if _G.SelectIsland ~= 'Factory' then
                                                                                                                    if _G.SelectIsland ~= 'Colossuim' then
                                                                                                                        if _G.SelectIsland ~= 'Zombie Island' then
                                                                                                                            if _G.SelectIsland ~= 'Two Snow Mountain' then
                                                                                                                                if _G.SelectIsland ~= 'Punk Hazard' then
                                                                                                                                    if _G.SelectIsland ~= 'Cursed Ship' then
                                                                                                                                        if _G.SelectIsland ~= 'Ice Castle' then
                                                                                                                                            if _G.SelectIsland ~= 'Forgotten Island' then
                                                                                                                                                if _G.SelectIsland ~= 'Ussop Island' then
                                                                                                                                                    if _G.SelectIsland ~= 'Mini Sky Island' then
                                                                                                                                                        if _G.SelectIsland ~= 'Great Tree' then
                                                                                                                                                            if _G.SelectIsland ~= 'Castle On The Sea' then
                                                                                                                                                                if _G.SelectIsland ~= 'MiniSky' then
                                                                                                                                                                    if _G.SelectIsland ~= 'Port Town' then
                                                                                                                                                                        if _G.SelectIsland ~= 'Hydra Island' then
                                                                                                                                                                            if _G.SelectIsland ~= 'Floating Turtle' then
                                                                                                                                                                                if _G.SelectIsland ~= 'Mansion' then
                                                                                                                                                                                    if _G.SelectIsland ~= 'Haunted Castle' then
                                                                                                                                                                                        if _G.SelectIsland ~= 'Ice Cream Island' then
                                                                                                                                                                                            if _G.SelectIsland ~= 'Peanut Island' then
                                                                                                                                                                                                if _G.SelectIsland ~= 'Cake Island' then
                                                                                                                                                                                                    if _G.SelectIsland ~= 'Cocoa Island' then
                                                                                                                                                                                                        if _G.SelectIsland == 'Candy Island' then
                                                                                                                                                                                                            Tween(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
                                                                                                                                                                                                        end
                                                                                                                                                                                                    else
                                                                                                                                                                                                        Tween(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
                                                                                                                                                                                                    end
                                                                                                                                                                                                else
                                                                                                                                                                                                    Tween(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
                                                                                                                                                                                                end
                                                                                                                                                                                            else
                                                                                                                                                                                                Tween(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
                                                                                                                                                                                            end
                                                                                                                                                                                        else
                                                                                                                                                                                            Tween(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
                                                                                                                                                                                        end
                                                                                                                                                                                    else
                                                                                                                                                                                        Tween(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
                                                                                                                                                                                    end
                                                                                                                                                                                else
                                                                                                                                                                                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
                                                                                                                                                                                end
                                                                                                                                                                            else
                                                                                                                                                                                Tween(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
                                                                                                                                                                            end
                                                                                                                                                                        else
                                                                                                                                                                            Tween(CFrame.new(5228.8842773438, 604.23400878906, 345.0400390625))
                                                                                                                                                                        end
                                                                                                                                                                    else
                                                                                                                                                                        Tween(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
                                                                                                                                                                    end
                                                                                                                                                                else
                                                                                                                                                                    Tween(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
                                                                                                                                                                end
                                                                                                                                                            else
                                                                                                                                                                BTPZ(CFrame.new(-5075.50927734375, 314.5155029296875, -3150.0224609375))
                                                                                                                                                            end
                                                                                                                                                        else
                                                                                                                                                            Tween(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
                                                                                                                                                        end
                                                                                                                                                    else
                                                                                                                                                        Tween(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
                                                                                                                                                    end
                                                                                                                                                else
                                                                                                                                                    Tween(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
                                                                                                                                                end
                                                                                                                                            else
                                                                                                                                                Tween(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
                                                                                                                                            end
                                                                                                                                        else
                                                                                                                                            Tween(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
                                                                                                                                        end
                                                                                                                                    else
                                                                                                                                        Tween(CFrame.new(923.40197753906, 125.05712890625, 32885.875))
                                                                                                                                    end
                                                                                                                                else
                                                                                                                                    Tween(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
                                                                                                                                end
                                                                                                                            else
                                                                                                                                Tween(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
                                                                                                                            end
                                                                                                                        else
                                                                                                                            Tween(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
                                                                                                                        end
                                                                                                                    else
                                                                                                                        Tween(CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
                                                                                                                    end
                                                                                                                else
                                                                                                                    Tween(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
                                                                                                                end
                                                                                                            else
                                                                                                                Tween(CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
                                                                                                            end
                                                                                                        else
                                                                                                            Tween(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
                                                                                                        end
                                                                                                    else
                                                                                                        Tween(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
                                                                                                    end
                                                                                                else
                                                                                                    Tween(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
                                                                                                end
                                                                                            else
                                                                                                Tween(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
                                                                                            end
                                                                                        else
                                                                                            Tween(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
                                                                                        end
                                                                                    else
                                                                                        Tween(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
                                                                                    end
                                                                                else
                                                                                    Tween(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
                                                                                end
                                                                            else
                                                                                Tween(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
                                                                            end
                                                                        else
                                                                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                                                                        end
                                                                    else
                                                                        Tween(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
                                                                    end
                                                                else
                                                                    Tween(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
                                                                end
                                                            else
                                                                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                                                            end
                                                        else
                                                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-4607.82275, 872.54248, -1667.55688))
                                                        end
                                                    else
                                                        Tween(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
                                                    end
                                                else
                                                    Tween(CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
                                                end
                                            else
                                                Tween(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
                                            end
                                        else
                                            Tween(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
                                        end
                                    else
                                        Tween(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
                                    end
                                else
                                    Tween(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
                                end
                            else
                                Tween(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
                            end
                        else
                            Tween(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
                        end
                    else
                        Tween(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
                    end
                else
                    Tween(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
                end
            end
            if not _G.TeleportIsland then
            end
        end
    end
end)

function BTPZ(p508)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p508

    task.wait()

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p508
end

local _here = _VScript:CreateTab('Stats...', "home"):CreateSection('here')

_here:CreateToggle({Name = 'Auto Melee Stats', Description = '', Default = false}, function(p510)
    _G.Auto_Stats_Melee = p510
end)
_here:CreateToggle({Name = 'Auto Defense Stats', Description = '', Default = false}, function(p511)
    _G.Auto_Stats_Defense = p511
end)
_here:CreateToggle({Name = 'Auto Sword Stats', Description = '', Default = false}, function(p512)
    _G.Auto_Stats_Sword = p512
end)
_here:CreateToggle({Name = 'Auto Gun Stats', Description = '', Default = false}, function(p513)
    _G.Auto_Stats_Gun = p513
end)
_here:CreateToggle({Name = 'Auto Fruit Stats', Description = '', Default = false}, function(p514)
    _G.Auto_Stats_Devil_Fruit = p514
end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Devil_Fruit then
            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                'AddPoint',
                'Demon Fruit',
                3,
            }))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Gun then
            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                'AddPoint',
                'Gun',
                3,
            }))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Sword then
            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                'AddPoint',
                'Sword',
                3,
            }))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Defense then
            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                'AddPoint',
                'Defense',
                3,
            }))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Melee then
            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                'AddPoint',
                'Melee',
                3,
            }))
        end
    end
end)

local _Here5 = _VScript:CreateTab('Misc...', "home"):CreateSection('Here')

_Here5:CreateToggle({Name = 'Walk On Water (Recommend)', Description = 'if you using autofarm turn on Walk on water.', Default = false}, function(p516)
    getgenv().WalkOnWater = p516

    task.spawn(function()
        local _Map = workspace:WaitForChild('Map', 9000000000)

        while getgenv().WalkOnWater do
            task.wait(0.1)

            _Map:WaitForChild('WaterBase-Plane', 9000000000).Size = Vector3.new(1000, 113, 1000)
        end

        _Map:WaitForChild('WaterBase-Plane', 9000000000).Size = Vector3.new(1000, 80, 1000)
    end)
end)
_Here5:CreateToggle({Name = 'Anti AFK', Description = '', Default = false}, function(p518)
    getgenv().AntiAFK = p518

    task.spawn(function()
        while getgenv().AntiAFK do
            VirtualUser:CaptureController()
            VirtualUser:ClickButton1(Vector2.new(math.huge, math.huge))
            task.wait(600)
        end
    end)
end)
_Here5:CreateButton({Name = 'Fps unlocker', Description = ''}, function()
    print(loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinGithubUsers/KevinGithubUsers/main/FPSUnlocker', true))())
end)
_Here5:CreateLabel({Name = 'Ui'})
_Here5:CreateButton({Name = 'Fruit Shop', Description = ''}, function()
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('GetFruits')

    game:GetService('Players').LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
end)
_Here5:CreateButton({Name = 'Colour Haki', Description = ''}, function()
    game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
end)
_Here5:CreateButton({Name = 'Title', Description = ''}, function()
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
        'getTitles',
    }))

    game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
end)
_Here5:CreateLabel({Name = 'BackToEliteHub'})
_Here5:CreateButton({Name = 'Go back to VScript Universal?', Description = ''}, function()
    print(loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinGithubUsers/KevinGithubUsers/main/VScript', true))())
end)

local _here2 = _VScript:CreateTab('Player...', "home"):CreateSection('here')
local v520, v521, v522 = pairs(game:GetService('Players'):GetChildren())
local u523 = {}

while true do
    local v524

    v522, v524 = v520(v521, v522)

    if v522 == nil then
        break
    end

    table.insert(u523, v524.Name)
end

_here2:CreateDropdown({Name = 'SelectPlayer', Description = '', Options = u523}, function(p525)
    _G.SelectPly = p525
end)
_here2:CreateButton({Name = 'Refresh Dropdown', Description = 'Refresh player list'}, function()
    u523 = {}

    SelectedPly:Clear()

    local v526, v527, v528 = pairs(game:GetService('Players'):GetChildren())

    while true do
        local v529

        v528, v529 = v526(v527, v528)

        if v528 == nil then
            break
        end

        SelectedPly:Add(v529.Name)
    end
end)
_here2:CreateToggle({Name = 'Teleport To Player', Description = '', Default = false}, function(p530)
    _G.TeleportPly = p530

    pcall(function()
        if _G.TeleportPly then
            repeat
                Tween(game:GetService('Players')[_G.SelectPly].Character.HumanoidRootPart.CFrame)
                wait()
            until _G.TeleportPly == false
        end
    end)
end)
_here2:CreateToggle({Name = 'Spectate Player', Description = '', Default = false}, function(p531)
    SpectatePlys = p531

    local _ = game:GetService('Players').LocalPlayer.Character.Humanoid

    game:GetService('Players'):FindFirstChild(_G.SelectPly)

    repeat
        wait(0.1)

        game:GetService('Workspace').Camera.CameraSubject = game:GetService('Players'):FindFirstChild(_G.SelectPly).Character.Humanoid
    until SpectatePlys == false

    game:GetService('Workspace').Camera.CameraSubject = game:GetService('Players').LocalPlayer.Character.Humanoid
end)

local _here3 = _VScript:CreateTab('RaceV4...', "home"):CreateSection('here')

if First_Sea then
    _here3:CreateLabel({Name = 'Need to go Sea 3!'})
elseif Second_Sea then
    _here3:CreateLabel({Name = 'Need to go Sea 3!'})
elseif Third_Sea then
    _here3:CreateToggle({Name = 'FullMoon Notification', Description = '', Default = false}, function(p533)
        _G.Notif = p533
    end)
    spawn(function()
        pcall(function()
            while wait(120) do
                if not _G.Notif then
                    if game:GetService('Lighting').Sky.MoonTextureId ~= 'http://www.roblox.com/asset/?id=9709149431' then
                        if game:GetService('Lighting').Sky.MoonTextureId ~= 'http://www.roblox.com/asset/?id=9709149052' then
                            if game:GetService('Lighting').Sky.MoonTextureId ~= 'http://www.roblox.com/asset/?id=9709143733' then
                                if game:GetService('Lighting').Sky.MoonTextureId ~= 'http://www.roblox.com/asset/?id=9709150401' then
                                    if game:GetService('Lighting').Sky.MoonTextureId ~= 'http://www.roblox.com/asset/?id=9709149680' then
                                        if game:GetService('Lighting').Sky.MoonTextureId == 'http://www.roblox.com/asset/?id=9709149680' then
                                            game:GetService('StarterGui'):SetCore('SendNotification', {
                                                Icon = 'rbxassetid://18234477667',
                                                Title = '',
                                                Text = '\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}: Full Moon 0%',
                                            })
                                        end
                                    else
                                        game:GetService('StarterGui'):SetCore('SendNotification', {
                                            Icon = 'rbxassetid://18234477667',
                                            Title = '',
                                            Text = '\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}: Full Moon 15%',
                                        })
                                    end
                                else
                                    game:GetService('StarterGui'):SetCore('SendNotification', {
                                        Icon = 'rbxassetid://18234477667',
                                        Title = '',
                                        Text = '\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd} : Full Moon 25%',
                                    })
                                end
                            else
                                game:GetService('StarterGui'):SetCore('SendNotification', {
                                    Icon = 'rbxassetid://18234477667',
                                    Title = '',
                                    Text = '\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd} : Full Moon 50%',
                                })
                            end
                        else
                            game:GetService('StarterGui'):SetCore('SendNotification', {
                                Icon = 'rbxassetid://18234477667',
                                Title = '',
                                Text = '\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd} : Full Moon 75%',
                            })
                        end
                    else
                        game:GetService('StarterGui'):SetCore('SendNotification', {
                            Icon = 'rbxassetid://18234477667',
                            Title = '',
                            Text = '\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd} : Full Moon 100%',
                        })
                    end
                end
            end
        end)
    end)
    _here3:CreateButton({Name = 'TweenToTempleOftime', Description = ''}, function()
        game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
    end)
    _here3:CreateButton({Name = 'Lever Pull', Description = ''}, function()
        TP2(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
    end)
    _here3:CreateButton({Name = 'Ancient One', Description = ''}, function()
        TP2(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
    end)
    _here3:CreateLabel({Name = 'RaceV4(Beta)'})
    _here3:CreateButton({Name = 'Race Door', Description = ''}, function()
        Game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)

        wait(0.1)

        Game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)

        wait(0.1)

        Game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)

        wait(0.1)

        Game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)

        wait(0.5)

        if game:GetService('Players').LocalPlayer.Data.Race.Value ~= 'Human' then
            if game:GetService('Players').LocalPlayer.Data.Race.Value ~= 'Skypiea' then
                if game:GetService('Players').LocalPlayer.Data.Race.Value ~= 'Fishman' then
                    if game:GetService('Players').LocalPlayer.Data.Race.Value ~= 'Cyborg' then
                        if game:GetService('Players').LocalPlayer.Data.Race.Value ~= 'Ghoul' then
                            if game:GetService('Players').LocalPlayer.Data.Race.Value == 'Mink' then
                                TP2(CFrame.new(29012.341796875, 14890.9755859375, -380.1492614746094))
                            end
                        else
                            TP2(CFrame.new(28674.244140625, 14890.6767578125, 445.4310607910156))
                        end
                    else
                        TP2(CFrame.new(28502.681640625, 14895.9755859375, -423.7279357910156))
                    end
                else
                    TP2(CFrame.new(28231.17578125, 14890.9755859375, -211.64173889160156))
                end
            else
                TP2(CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375))
            end
        else
            TP2(CFrame.new(29221.822265625, 14890.9755859375, -205.99114990234375))
        end
    end)
    _here3:CreateToggle({Name = 'Auto [ Human / Ghoul ] Trial', Description = '', Default = false}, function(p534)
        KillAura = p534
    end)
    _here3:CreateToggle({Name = 'Auto Trial', Description = '', Default = false}, function(p535)
        _G.AutoQuestRace = p535
    end)
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoQuestRace then
                    if game:GetService('Players').LocalPlayer.Data.Race.Value ~= 'Human' then
                        if game:GetService('Players').LocalPlayer.Data.Race.Value ~= 'Skypiea' then
                            if game:GetService('Players').LocalPlayer.Data.Race.Value ~= 'Fishman' then
                                if game:GetService('Players').LocalPlayer.Data.Race.Value ~= 'Cyborg' then
                                    if game:GetService('Players').LocalPlayer.Data.Race.Value ~= 'Ghoul' then
                                        if game:GetService('Players').LocalPlayer.Data.Race.Value == 'Mink' then
                                            local v536, v537, v538 = pairs(game:GetService('Workspace'):GetDescendants())

                                            while true do
                                                local v539

                                                v538, v539 = v536(v537, v538)

                                                if v538 == nil then
                                                    break
                                                end
                                                if v539.Name == 'StartPoint' then
                                                    Tween(v539.CFrame * CFrame.new(0, 10, 0))
                                                end
                                            end
                                        end
                                    else
                                        local v540, v541, v542 = pairs(game.Workspace.Enemies:GetDescendants())

                                        while true do
                                            local u543

                                            v542, u543 = v540(v541, v542)

                                            if v542 == nil then
                                                break
                                            end
                                            if u543:FindFirstChild('Humanoid') and (u543:FindFirstChild('HumanoidRootPart') and u543.Humanoid.Health > 0) then
                                                pcall(function()
                                                    repeat
                                                        wait(0.1)

                                                        u543.Humanoid.Health = 0
                                                        u543.HumanoidRootPart.CanCollide = false

                                                        sethiddenproperty(game.Players.LocalPlayer, 'SimulationRadius', math.huge)
                                                    until not _G.AutoQuestRace or (not u543.Parent or u543.Humanoid.Health <= 0)
                                                end)
                                            end
                                        end
                                    end
                                else
                                    Tween(CFrame.new(28654, 14898.7832, -30, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                                end
                            else
                                local v544, v545, v546 = pairs(game:GetService('Workspace').SeaBeasts.SeaBeast1:GetDescendants())

                                while true do
                                    local v547

                                    v546, v547 = v544(v545, v546)

                                    if v546 == nil then
                                        break
                                    end
                                    if v547.Name == 'HumanoidRootPart' then
                                        Tween(v547.CFrame * Pos)

                                        local v548, v549, v550 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                                        while true do
                                            local v551

                                            v550, v551 = v548(v549, v550)

                                            if v550 == nil then
                                                break
                                            end
                                            if v551:IsA('Tool') and v551.ToolTip == 'Melee' then
                                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v551)
                                            end
                                        end

                                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        wait(0.2)
                                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        wait(0.2)
                                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)

                                        local v552, v553, v554 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                                        while true do
                                            local v555

                                            v554, v555 = v552(v553, v554)

                                            if v554 == nil then
                                                break
                                            end
                                            if v555:IsA('Tool') and v555.ToolTip == 'Blox Fruit' then
                                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v555)
                                            end
                                        end

                                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        wait(0.2)
                                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        wait(0.2)
                                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        wait(0.5)

                                        local v556, v557, v558 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                                        while true do
                                            local v559

                                            v558, v559 = v556(v557, v558)

                                            if v558 == nil then
                                                break
                                            end
                                            if v559:IsA('Tool') and v559.ToolTip == 'Sword' then
                                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v559)
                                            end
                                        end

                                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        wait(0.2)
                                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        wait(0.2)
                                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        wait(0.5)

                                        local v560, v561, v562 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                                        while true do
                                            local v563

                                            v562, v563 = v560(v561, v562)

                                            if v562 == nil then
                                                break
                                            end
                                            if v563:IsA('Tool') and v563.ToolTip == 'Gun' then
                                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v563)
                                            end
                                        end

                                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        wait(0.2)
                                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        wait(0.2)
                                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    end
                                end
                            end
                        else
                            local v564, v565, v566 = pairs(game:GetService('Workspace').Map.SkyTrial.Model:GetDescendants())

                            while true do
                                local v567

                                v566, v567 = v564(v565, v566)

                                if v566 == nil then
                                    break
                                end
                                if v567.Name == 'snowisland_Cylinder.081' then
                                    Tween(v567.CFrame * CFrame.new(0, 0, 0))
                                end
                            end
                        end
                    else
                        local v568, v569, v570 = pairs(game.Workspace.Enemies:GetDescendants())

                        while true do
                            local u571

                            v570, u571 = v568(v569, v570)

                            if v570 == nil then
                                break
                            end
                            if u571:FindFirstChild('Humanoid') and (u571:FindFirstChild('HumanoidRootPart') and u571.Humanoid.Health > 0) then
                                pcall(function()
                                    repeat
                                        wait(0.1)

                                        u571.Humanoid.Health = 0
                                        u571.HumanoidRootPart.CanCollide = false

                                        sethiddenproperty(game.Players.LocalPlayer, 'SimulationRadius', math.huge)
                                    until not _G.AutoQuestRace or (not u571.Parent or u571.Humanoid.Health <= 0)
                                end)
                            end
                        end
                    end
                end
            end
        end)
    end)
    _here3:CreateLabel({Name = 'Misc RaceV4'})
    _here3:CreateToggle({Name = 'Auto Ancient Quest', Description = '', Default = false}, function(p572)
        AutoFarmAcient = p572
    end)

    local u573 = CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875)

    spawn(function()
        while wait() do
            if AutoFarmAcient then
                pcall(function()
                    if game:GetService('Workspace').Enemies:FindFirstChild('Cocoa Warrior') or (game:GetService('Workspace').Enemies:FindFirstChild('Chocolate Bar Battler') or (game:GetService('Workspace').Enemies:FindFirstChild('Sweet Thief') or game:GetService('Workspace').Enemies:FindFirstChild('Candy Rebel'))) then
                        local v574, v575, v576 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                        while true do
                            local v577

                            v576, v577 = v574(v575, v576)

                            if v576 == nil then
                                break
                            end
                            if (v577.Name == 'Cocoa Warrior' or (v577.Name == 'Chocolate Bar Battler' or (v577.Name == 'Sweet Thief' or v577.Name == 'Candy Rebel'))) and (v577:FindFirstChild('Humanoid') and (v577:FindFirstChild('HumanoidRootPart') and v577.Humanoid.Health > 0)) then
                                repeat
                                    task.wait()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)

                                    BringAcient = true
                                    v577.HumanoidRootPart.CanCollide = false
                                    v577.Humanoid.WalkSpeed = 0
                                    v577.Head.CanCollide = false
                                    FarmPos = v577.HumanoidRootPart.CFrame

                                    Tween(v577.HumanoidRootPart.CFrame * Pos)
                                    Click()
                                until not AutoFarmAcient or (not v577.Parent or v577.Humanoid.Health <= 0)

                                BringAcient = false
                            end
                        end
                    else
                        if BypassTP then
                            BTP(u573)
                        else
                            Tween(u573)
                        end

                        local v578, v579, v580 = pairs(game:GetService('ReplicatedStorage'):GetChildren())

                        while true do
                            local v581

                            v580, v581 = v578(v579, v580)

                            if v580 == nil then
                                break
                            end
                            if v581.Name ~= 'Cocoa Warrior' then
                                if v581.Name ~= 'Chocolate Bar Battler' then
                                    if v581.Name ~= 'Sweet Thief' then
                                        if v581.Name == 'Candy Rebel' then
                                            Tween(v581.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                        end
                                    else
                                        Tween(v581.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                    end
                                else
                                    Tween(v581.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                end
                            else
                                Tween(v581.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                            end
                        end
                    end
                end)
            end
        end
    end)
    spawn(function()
        pcall(function()
            while wait() do
                if AutoFarmAcient and game.Players.LocalPlayer.Character.RaceTransformed.Value == false then
                    AutoFarmAcient = true
                end
            end
        end)
    end)
    spawn(function()
        while wait() do
            pcall(function()
                if AutoFarmAcient then
                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 'Y', false, game)
                    wait(0.1)
                    game:GetService('VirtualInputManager'):SendKeyEvent(false, 'Y', false, game)
                end
            end)
        end
    end)
end

local _here4 = _VScript:CreateTab('Shop...', "home"):CreateSection('here')

_here4:CreateLabel({Name = 'Shop'})
_here4:CreateButton({Name = 'Refund Stats', Description = '?'}, function()
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BlackbeardReward', 'Refund', '1')
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BlackbeardReward', 'Refund', '2')
end)
_here4:CreateButton({Name = 'Reroll Race', Description = '?'}, function()
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BlackbeardReward', 'Reroll', '1')
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BlackbeardReward', 'Reroll', '2')
end)
_here4:CreateLabel({Name = 'Fighting Styles'})
_here4:CreateButton({Name = 'Black Leg', Description = '?'}, function()
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyBlackLeg')
end)
_here4:CreateButton({Name = 'Electro', Description = '?'}, function()
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyElectro')
end)
_here4:CreateButton({Name = 'Fishman Karate', Description = '?'}, function()
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyFishmanKarate')
end)
_here4:CreateButton({Name = 'Dragon Claw', Description = '?'}, function()
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BlackbeardReward', 'DragonClaw', '1')
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BlackbeardReward', 'DragonClaw', '2')
end)
_here4:CreateButton({Name = 'Superhuman', Description = '?'}, function()
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuySuperhuman')
end)
_here4:CreateButton({Name = 'Death Step', Description = '?'}, function()
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyDeathStep')
end)
_here4:CreateButton({Name = 'Sharkman Karate', Description = '?'}, function()
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuySharkmanKarate', true)
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuySharkmanKarate')
end)
_here4:CreateButton({Name = 'Electric Claw', Description = '?'}, function()
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyElectricClaw')
end)
_here4:CreateButton({Name = 'Dragon Talon', Description = '?'}, function()
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyDragonTalon')
end)
_here4:CreateButton({Name = 'Godhuman', Description = '?'}, function()
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyGodhuman')
end)
_here4:CreateButton({Name = 'SanguineArt', Description = '?'}, function()
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuySanguineArt')
end)

if Third_Sea then
    local _here5 = _VScript:CreateTab('Sea...', "home"):CreateSection('here')

    _here5:CreateToggle({Name = 'Auto Buy Boat', Description = '', Default = false}, function(p584)
        _G.AutoBuyBoat = p584
    end)
    task.spawn(function()
        while wait() do
            pcall(function()
                if _G.AutoBuyBoat then
                    if game:GetService('Workspace').SeaBeasts:FindFirstChild('SeaBeast1') then
                        if game:GetService('Workspace').SeaBeasts:FindFirstChild('SeaBeast1') then
                            local v585, v586, v587 = pairs(game:GetService('Workspace').SeaBeasts:GetChildren())

                            while true do
                                local v588

                                v587, v588 = v585(v586, v587)

                                if v587 == nil then
                                    break
                                end
                                if v588:FindFirstChild('HumanoidRootPart') then
                                    repeat
                                        wait()

                                        game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Sit = false

                                        TPP(v588.HumanoidRootPart.CFrame * CFrame.new(0, 500, 0))
                                        EquipAllWeapon()

                                        AutoSkill = true
                                        AimBotSkillPosition = v588.HumanoidRootPart
                                        Skillaimbot = true
                                    until not v588:FindFirstChild('HumanoidRootPart') or _G.AutoBuyBoat == false

                                    AutoSkill = false
                                    Skillaimbot = false
                                end
                            end
                        end
                    elseif game:GetService('Workspace').Boats:FindFirstChild('PirateBrigade') then
                        if game:GetService('Workspace').Boats:FindFirstChild('PirateBrigade') then
                            local v589, v590, v591 = pairs(game:GetService('Workspace').Boats:GetChildren())

                            while true do
                                local v592

                                v591, v592 = v589(v590, v591)

                                if v591 == nil then
                                    break
                                end
                                if v592.Name == 'PirateBrigade' and v592:FindFirstChild('VehicleSeat') then
                                    repeat
                                        wait()

                                        game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Sit = false

                                        TPP(v592.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                                    until not game:GetService('Workspace').Boats:FindFirstChild('PirateBrigade') or _G.AutoBuyBoat == false
                                end
                            end
                        end
                    else
                        if not game:GetService('Workspace').Boats:FindFirstChild('PirateBasic') then
                            if not game:GetService('Workspace').Boats:FindFirstChild('PirateBrigade') then
                                buyb = TPP(CFrame.new(-4513.90087890625, 16.76398277282715, -2658.820556640625))

                                if (CFrame.new(-4513.90087890625, 16.76398277282715, -2658.820556640625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                    if buyb then
                                        buyb:Stop()
                                    end

                                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                                        'BuyBoat',
                                        'PirateBrigade',
                                    }))
                                end
                            end
                            if not game:GetService('Workspace').Boats:FindFirstChild('PirateBrigade') then
                            end
                            if game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Sit == false then
                                TPP(game:GetService('Workspace').Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                            end
                            if game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Sit ~= true then
                            end

                            wait()

                            if (game:GetService('Workspace').Boats.PirateBrigade.VehicleSeat.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                TPB(CFrame.new(35.04552459716797, 17.750778198242188, 4819.267578125))
                            end
                            if game:GetService('Workspace').SeaBeasts:FindFirstChild('SeaBeast1') or _G.AutoBuyBoat == false then
                            end
                        end
                        if game:GetService('Workspace').Boats:FindFirstChild('PirateBrigade') then
                            local v593, v594, v595 = pairs(game:GetService('Workspace').Boats:GetChildren())

                            while true do
                                local v596

                                v595, v596 = v593(v594, v595)

                                if v595 == nil then
                                    break
                                end
                                if v596.Name == 'PirateBrigade' and v596:FindFirstChild('VehicleSeat') then
                                    repeat
                                        wait()

                                        game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Sit = false

                                        TPP(v596.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                                    until not game:GetService('Workspace').Boats:FindFirstChild('PirateBrigade') or _G.AutoBuyBoat == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
    _here5:CreateToggle({Name = 'Auto Press W', Description = '', Default = false}, function(p597)
        _G.AutoW = p597
    end)
    spawn(function()
        while wait() do
            pcall(function()
                if _G.AutoW then
                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 'W', false, game)
                end
            end)
        end
    end)
    _here5:CreateToggle({Name = 'Auto Kill Terrorshark', Description = '', Default = false}, function(p598)
        _G.AutoTerrorshark = p598
    end)
    spawn(function()
        while wait() do
            if _G.AutoTerrorshark then
                pcall(function()
                    if game:GetService('Workspace').Enemies:FindFirstChild('Terrorshark') then
                        local v599, v600, v601 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                        while true do
                            local v602

                            v601, v602 = v599(v600, v601)

                            if v601 == nil then
                                break
                            end
                            if v602.Name == 'Terrorshark' and (v602:FindFirstChild('Humanoid') and (v602:FindFirstChild('HumanoidRootPart') and v602.Humanoid.Health > 0)) then
                                repeat
                                    task.wait()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)

                                    v602.HumanoidRootPart.CanCollide = false
                                    v602.Humanoid.WalkSpeed = 0
                                    v602.HumanoidRootPart.Size = Vector3.new(50, 50, 50)

                                    Click()
                                    Tween(v602.HumanoidRootPart.CFrame * CFrame.new(u216, u217, u218))
                                until not _G.AutoTerrorshark or (not v602.Parent or v602.Humanoid.Health <= 0)
                            end
                        end
                    elseif game:GetService('ReplicatedStorage'):FindFirstChild('Terrorshark') then
                        Tween(game:GetService('ReplicatedStorage'):FindFirstChild('Terrorshark').HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    end
                end)
            end
        end
    end)
    _here5:CreateToggle({Name = 'Auto Kill Piranha', Description = '', Default = false}, function(p603)
        _G.farmpiranya = p603
    end)
    spawn(function()
        while wait() do
            if _G.farmpiranya then
                pcall(function()
                    if game:GetService('Workspace').Enemies:FindFirstChild('Piranha') then
                        local v604, v605, v606 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                        while true do
                            local v607

                            v606, v607 = v604(v605, v606)

                            if v606 == nil then
                                break
                            end
                            if v607.Name == 'Piranha' and (v607:FindFirstChild('Humanoid') and (v607:FindFirstChild('HumanoidRootPart') and v607.Humanoid.Health > 0)) then
                                repeat
                                    task.wait()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)

                                    v607.HumanoidRootPart.CanCollide = false
                                    v607.Humanoid.WalkSpeed = 0
                                    v607.HumanoidRootPart.Size = Vector3.new(50, 50, 50)

                                    Click()
                                    Tween(v607.HumanoidRootPart.CFrame * CFrame.new(u216, u217, u218))
                                until not _G.farmpiranya or (not v607.Parent or v607.Humanoid.Health <= 0)
                            end
                        end
                    elseif game:GetService('ReplicatedStorage'):FindFirstChild('Piranha') then
                        Tween(game:GetService('ReplicatedStorage'):FindFirstChild('Piranha').HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    end
                end)
            end
        end
    end)
    _here5:CreateToggle({Name = 'Auto Sea Beast', Description = '', Default = false}, function(p608)
        _G.AutoSeaBeast = p608
    end)

    local v609 = getrawmetatable(game)
    local ___namecall = v609.__namecall

    setreadonly(v609, false)

    v609.__namecall = newcclosure(function(...)
        local v611 = getnamecallmethod()
        local v612 = {...}

        if tostring(v611) ~= 'FireServer' or (tostring(v612[1]) ~= 'RemoteEvent' or (tostring(v612[2]) == 'true' or (tostring(v612[2]) == 'false' or not Skillaimbot))) then
            return ___namecall(...)
        end

        v612[2] = AimBotSkillPosition

        return ___namecall(unpack(v612))
    end)
    Skillz = true
    Skillx = true
    Skillc = true
    Skillv = true

    spawn(function()
        while wait() do
            pcall(function()
                if AutoSkill then
                    if Skillz then
                        game:service('VirtualInputManager'):SendKeyEvent(true, 'Z', false, game)
                        wait(0.1)
                        game:service('VirtualInputManager'):SendKeyEvent(false, 'Z', false, game)
                    end
                    if Skillx then
                        game:service('VirtualInputManager'):SendKeyEvent(true, 'X', false, game)
                        wait(0.1)
                        game:service('VirtualInputManager'):SendKeyEvent(false, 'X', false, game)
                    end
                    if Skillc then
                        game:service('VirtualInputManager'):SendKeyEvent(true, 'C', false, game)
                        wait(0.1)
                        game:service('VirtualInputManager'):SendKeyEvent(false, 'C', false, game)
                    end
                    if Skillv then
                        game:service('VirtualInputManager'):SendKeyEvent(true, 'V', false, game)
                        wait(0.1)
                        game:service('VirtualInputManager'):SendKeyEvent(false, 'V', false, game)
                    end
                end
            end)
        end
    end)
    task.spawn(function()
        while wait() do
            pcall(function()
                if _G.AutoSeaBeast then
                    if game:GetService('Workspace').SeaBeasts:FindFirstChild('SeaBeast1') then
                        if game:GetService('Workspace').SeaBeasts:FindFirstChild('SeaBeast1') then
                            local v613, v614, v615 = pairs(game:GetService('Workspace').SeaBeasts:GetChildren())

                            while true do
                                local v616

                                v615, v616 = v613(v614, v615)

                                if v615 == nil then
                                    break
                                end
                                if v616:FindFirstChild('HumanoidRootPart') then
                                    repeat
                                        wait()

                                        game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Sit = false

                                        TPP(v616.HumanoidRootPart.CFrame * CFrame.new(0, 500, 0))
                                        EquipAllWeapon()

                                        AutoSkill = true
                                        AimBotSkillPosition = v616.HumanoidRootPart
                                        Skillaimbot = true
                                    until not v616:FindFirstChild('HumanoidRootPart') or _G.AutoSeaBeast == false

                                    AutoSkill = false
                                    Skillaimbot = false
                                end
                            end
                        end
                    elseif game:GetService('Workspace').Boats:FindFirstChild('PirateBrigade') then
                        if game:GetService('Workspace').Boats:FindFirstChild('PirateBrigade') then
                            local v617, v618, v619 = pairs(game:GetService('Workspace').Boats:GetChildren())

                            while true do
                                local v620

                                v619, v620 = v617(v618, v619)

                                if v619 == nil then
                                    break
                                end
                                if v620.Name == 'PirateBrigade' and v620:FindFirstChild('VehicleSeat') then
                                    repeat
                                        wait()

                                        game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Sit = false

                                        TPP(v620.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                                    until not game:GetService('Workspace').Boats:FindFirstChild('PirateBrigade') or _G.AutoSeaBeast == false
                                end
                            end
                        end
                    else
                        if not game:GetService('Workspace').Boats:FindFirstChild('PirateBasic') then
                            if not game:GetService('Workspace').Boats:FindFirstChild('PirateBrigade') then
                                buyb = TPP(CFrame.new(-4513.90087890625, 16.76398277282715, -2658.820556640625))

                                if (CFrame.new(-4513.90087890625, 16.76398277282715, -2658.820556640625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                    if buyb then
                                        buyb:Stop()
                                    end

                                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                                        'BuyBoat',
                                        'PirateBrigade',
                                    }))
                                end
                            end
                            if not game:GetService('Workspace').Boats:FindFirstChild('PirateBrigade') then
                            end
                            if game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Sit == false then
                                TPP(game:GetService('Workspace').Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                            end
                            if game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Sit ~= true then
                            end

                            while true do
                                wait()

                                if (game:GetService('Workspace').Boats.PirateBrigade.VehicleSeat.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                    TPB(CFrame.new(35.04552459716797, 17.750778198242188, 4819.267578125))
                                end
                                if game:GetService('Workspace').SeaBeasts:FindFirstChild('SeaBeast1') or _G.AutoSeaBeast == false then
                                end
                            end
                        end
                        if game:GetService('Workspace').Boats:FindFirstChild('PirateBrigade') then
                            local v621, v622, v623 = pairs(game:GetService('Workspace').Boats:GetChildren())

                            while true do
                                local v624

                                v623, v624 = v621(v622, v623)

                                if v623 == nil then
                                    break
                                end
                                if v624.Name == 'PirateBrigade' and v624:FindFirstChild('VehicleSeat') then
                                    repeat
                                        wait()

                                        game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Sit = false

                                        TPP(v624.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                                    until not game:GetService('Workspace').Boats:FindFirstChild('PirateBrigade') or _G.AutoSeaBeast == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
end

_VScript:CreateTab('?', "home"):CreateSection('here')
