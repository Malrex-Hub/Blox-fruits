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
local TeleportService = game:GetService("TeleportService")
local isMobile = UserInputService.TouchEnabled

-- // ========== HARDCODED MEMBER COUNT ==========
local memberCount = "9,175"

-- // ========== 24 THEMES (FIXED STRUCTURE) ==========
local currentTheme = "Dark"
local Themes = {
    ["Dark"] = {
        TextColor = Color3.fromRGB(240, 240, 240),
        Background = Color3.fromRGB(25, 25, 25),
        Topbar = Color3.fromRGB(34, 34, 34),
        Shadow = Color3.fromRGB(20, 20, 20),
        NotificationBackground = Color3.fromRGB(20, 20, 20),
        NotificationActionsBackground = Color3.fromRGB(230, 230, 230),
        TabBackground = Color3.fromRGB(80, 80, 80),
        TabStroke = Color3.fromRGB(85, 85, 85),
        TabBackgroundSelected = Color3.fromRGB(210, 210, 210),
        TabTextColor = Color3.fromRGB(240, 240, 240),
        SelectedTabTextColor = Color3.fromRGB(50, 50, 50),
        ElementBackground = Color3.fromRGB(35, 35, 35),
        ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
        SecondaryElementBackground = Color3.fromRGB(25, 25, 25),
        ElementStroke = Color3.fromRGB(50, 50, 50),
        SecondaryElementStroke = Color3.fromRGB(40, 40, 40),
        SliderBackground = Color3.fromRGB(50, 138, 220),
        SliderProgress = Color3.fromRGB(50, 138, 220),
        SliderStroke = Color3.fromRGB(58, 163, 255),
        ToggleBackground = Color3.fromRGB(30, 30, 30),
        ToggleEnabled = Color3.fromRGB(0, 146, 214),
        ToggleDisabled = Color3.fromRGB(100, 100, 100),
        ToggleEnabledStroke = Color3.fromRGB(0, 170, 255),
        ToggleDisabledStroke = Color3.fromRGB(125, 125, 125),
        ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100),
        ToggleDisabledOuterStroke = Color3.fromRGB(65, 65, 65),
        DropdownSelected = Color3.fromRGB(40, 40, 40),
        DropdownUnselected = Color3.fromRGB(30, 30, 30),
        InputBackground = Color3.fromRGB(30, 30, 30),
        InputStroke = Color3.fromRGB(65, 65, 65),
        PlaceholderColor = Color3.fromRGB(178, 178, 178)
    },
    ["Marcus Purple"] = {
        TextColor = Color3.fromRGB(230, 200, 255),
        Background = Color3.fromRGB(20, 10, 30),
        Topbar = Color3.fromRGB(40, 20, 60),
        Shadow = Color3.fromRGB(15, 8, 25),
        NotificationBackground = Color3.fromRGB(40, 20, 60),
        NotificationActionsBackground = Color3.fromRGB(150, 0, 255),
        TabBackground = Color3.fromRGB(60, 30, 90),
        TabStroke = Color3.fromRGB(80, 40, 120),
        TabBackgroundSelected = Color3.fromRGB(150, 0, 255),
        TabTextColor = Color3.fromRGB(200, 150, 255),
        SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
        ElementBackground = Color3.fromRGB(35, 18, 50),
        ElementBackgroundHover = Color3.fromRGB(50, 25, 75),
        SecondaryElementBackground = Color3.fromRGB(25, 12, 40),
        ElementStroke = Color3.fromRGB(80, 40, 120),
        SecondaryElementStroke = Color3.fromRGB(60, 30, 90),
        SliderBackground = Color3.fromRGB(150, 0, 255),
        SliderProgress = Color3.fromRGB(150, 0, 255),
        SliderStroke = Color3.fromRGB(180, 50, 255),
        ToggleBackground = Color3.fromRGB(30, 15, 45),
        ToggleEnabled = Color3.fromRGB(150, 0, 255),
        ToggleDisabled = Color3.fromRGB(80, 40, 100),
        ToggleEnabledStroke = Color3.fromRGB(180, 50, 255),
        ToggleDisabledStroke = Color3.fromRGB(100, 60, 120),
        ToggleEnabledOuterStroke = Color3.fromRGB(120, 0, 200),
        ToggleDisabledOuterStroke = Color3.fromRGB(60, 30, 80),
        DropdownSelected = Color3.fromRGB(60, 30, 90),
        DropdownUnselected = Color3.fromRGB(35, 18, 50),
        InputBackground = Color3.fromRGB(30, 15, 45),
        InputStroke = Color3.fromRGB(80, 40, 120),
        PlaceholderColor = Color3.fromRGB(150, 100, 200)
    },
    ["Blood Red"] = {
        TextColor = Color3.fromRGB(255, 200, 200),
        Background = Color3.fromRGB(30, 8, 8),
        Topbar = Color3.fromRGB(50, 12, 12),
        Shadow = Color3.fromRGB(20, 5, 5),
        NotificationBackground = Color3.fromRGB(50, 12, 12),
        NotificationActionsBackground = Color3.fromRGB(200, 0, 0),
        TabBackground = Color3.fromRGB(80, 20, 20),
        TabStroke = Color3.fromRGB(120, 30, 30),
        TabBackgroundSelected = Color3.fromRGB(200, 0, 0),
        TabTextColor = Color3.fromRGB(255, 180, 180),
        SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
        ElementBackground = Color3.fromRGB(45, 12, 12),
        ElementBackgroundHover = Color3.fromRGB(65, 18, 18),
        SecondaryElementBackground = Color3.fromRGB(35, 8, 8),
        ElementStroke = Color3.fromRGB(120, 30, 30),
        SecondaryElementStroke = Color3.fromRGB(80, 20, 20),
        SliderBackground = Color3.fromRGB(200, 0, 0),
        SliderProgress = Color3.fromRGB(200, 0, 0),
        SliderStroke = Color3.fromRGB(255, 50, 50),
        ToggleBackground = Color3.fromRGB(40, 10, 10),
        ToggleEnabled = Color3.fromRGB(200, 0, 0),
        ToggleDisabled = Color3.fromRGB(100, 30, 30),
        ToggleEnabledStroke = Color3.fromRGB(255, 50, 50),
        ToggleDisabledStroke = Color3.fromRGB(130, 40, 40),
        ToggleEnabledOuterStroke = Color3.fromRGB(150, 0, 0),
        ToggleDisabledOuterStroke = Color3.fromRGB(70, 20, 20),
        DropdownSelected = Color3.fromRGB(80, 20, 20),
        DropdownUnselected = Color3.fromRGB(45, 12, 12),
        InputBackground = Color3.fromRGB(40, 10, 10),
        InputStroke = Color3.fromRGB(120, 30, 30),
        PlaceholderColor = Color3.fromRGB(200, 100, 100)
    },
    ["Neon Blue"] = {
        TextColor = Color3.fromRGB(150, 200, 255),
        Background = Color3.fromRGB(8, 8, 35),
        Topbar = Color3.fromRGB(12, 12, 55),
        Shadow = Color3.fromRGB(5, 5, 25),
        NotificationBackground = Color3.fromRGB(12, 12, 55),
        NotificationActionsBackground = Color3.fromRGB(0, 100, 255),
        TabBackground = Color3.fromRGB(20, 20, 80),
        TabStroke = Color3.fromRGB(30, 30, 120),
        TabBackgroundSelected = Color3.fromRGB(0, 100, 255),
        TabTextColor = Color3.fromRGB(150, 200, 255),
        SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
        ElementBackground = Color3.fromRGB(15, 15, 50),
        ElementBackgroundHover = Color3.fromRGB(25, 25, 75),
        SecondaryElementBackground = Color3.fromRGB(10, 10, 40),
        ElementStroke = Color3.fromRGB(30, 30, 120),
        SecondaryElementStroke = Color3.fromRGB(20, 20, 80),
        SliderBackground = Color3.fromRGB(0, 100, 255),
        SliderProgress = Color3.fromRGB(0, 100, 255),
        SliderStroke = Color3.fromRGB(50, 150, 255),
        ToggleBackground = Color3.fromRGB(12, 12, 50),
        ToggleEnabled = Color3.fromRGB(0, 100, 255),
        ToggleDisabled = Color3.fromRGB(40, 40, 100),
        ToggleEnabledStroke = Color3.fromRGB(50, 150, 255),
        ToggleDisabledStroke = Color3.fromRGB(60, 60, 130),
        ToggleEnabledOuterStroke = Color3.fromRGB(0, 80, 200),
        ToggleDisabledOuterStroke = Color3.fromRGB(30, 30, 80),
        DropdownSelected = Color3.fromRGB(20, 20, 80),
        DropdownUnselected = Color3.fromRGB(15, 15, 50),
        InputBackground = Color3.fromRGB(12, 12, 50),
        InputStroke = Color3.fromRGB(30, 30, 120),
        PlaceholderColor = Color3.fromRGB(100, 150, 220)
    },
    ["Purple Haze"] = {
        TextColor = Color3.fromRGB(200, 150, 255),
        Background = Color3.fromRGB(25, 8, 35),
        Topbar = Color3.fromRGB(40, 12, 55),
        Shadow = Color3.fromRGB(18, 5, 25),
        NotificationBackground = Color3.fromRGB(40, 12, 55),
        NotificationActionsBackground = Color3.fromRGB(150, 0, 255),
        TabBackground = Color3.fromRGB(60, 20, 85),
        TabStroke = Color3.fromRGB(80, 30, 120),
        TabBackgroundSelected = Color3.fromRGB(150, 0, 255),
        TabTextColor = Color3.fromRGB(200, 150, 255),
        SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
        ElementBackground = Color3.fromRGB(35, 12, 50),
        ElementBackgroundHover = Color3.fromRGB(50, 18, 75),
        SecondaryElementBackground = Color3.fromRGB(28, 8, 40),
        ElementStroke = Color3.fromRGB(80, 30, 120),
        SecondaryElementStroke = Color3.fromRGB(60, 20, 85),
        SliderBackground = Color3.fromRGB(150, 0, 255),
        SliderProgress = Color3.fromRGB(150, 0, 255),
        SliderStroke = Color3.fromRGB(180, 50, 255),
        ToggleBackground = Color3.fromRGB(30, 10, 45),
        ToggleEnabled = Color3.fromRGB(150, 0, 255),
        ToggleDisabled = Color3.fromRGB(80, 30, 100),
        ToggleEnabledStroke = Color3.fromRGB(180, 50, 255),
        ToggleDisabledStroke = Color3.fromRGB(100, 40, 120),
        ToggleEnabledOuterStroke = Color3.fromRGB(120, 0, 200),
        ToggleDisabledOuterStroke = Color3.fromRGB(60, 20, 80),
        DropdownSelected = Color3.fromRGB(60, 20, 85),
        DropdownUnselected = Color3.fromRGB(35, 12, 50),
        InputBackground = Color3.fromRGB(30, 10, 45),
        InputStroke = Color3.fromRGB(80, 30, 120),
        PlaceholderColor = Color3.fromRGB(150, 100, 200)
    },
    ["Matrix Green"] = {
        TextColor = Color3.fromRGB(100, 255, 100),
        Background = Color3.fromRGB(8, 25, 8),
        Topbar = Color3.fromRGB(12, 40, 12),
        Shadow = Color3.fromRGB(5, 18, 5),
        NotificationBackground = Color3.fromRGB(12, 40, 12),
        NotificationActionsBackground = Color3.fromRGB(0, 200, 0),
        TabBackground = Color3.fromRGB(20, 65, 20),
        TabStroke = Color3.fromRGB(30, 100, 30),
        TabBackgroundSelected = Color3.fromRGB(0, 200, 0),
        TabTextColor = Color3.fromRGB(100, 255, 100),
        SelectedTabTextColor = Color3.fromRGB(0, 0, 0),
        ElementBackground = Color3.fromRGB(12, 40, 12),
        ElementBackgroundHover = Color3.fromRGB(18, 60, 18),
        SecondaryElementBackground = Color3.fromRGB(8, 30, 8),
        ElementStroke = Color3.fromRGB(30, 100, 30),
        SecondaryElementStroke = Color3.fromRGB(20, 65, 20),
        SliderBackground = Color3.fromRGB(0, 200, 0),
        SliderProgress = Color3.fromRGB(0, 200, 0),
        SliderStroke = Color3.fromRGB(50, 255, 50),
        ToggleBackground = Color3.fromRGB(10, 35, 10),
        ToggleEnabled = Color3.fromRGB(0, 200, 0),
        ToggleDisabled = Color3.fromRGB(40, 100, 40),
        ToggleEnabledStroke = Color3.fromRGB(50, 255, 50),
        ToggleDisabledStroke = Color3.fromRGB(60, 130, 60),
        ToggleEnabledOuterStroke = Color3.fromRGB(0, 150, 0),
        ToggleDisabledOuterStroke = Color3.fromRGB(30, 70, 30),
        DropdownSelected = Color3.fromRGB(20, 65, 20),
        DropdownUnselected = Color3.fromRGB(12, 40, 12),
        InputBackground = Color3.fromRGB(10, 35, 10),
        InputStroke = Color3.fromRGB(30, 100, 30),
        PlaceholderColor = Color3.fromRGB(80, 200, 80)
    },
    ["Gold"] = {
        TextColor = Color3.fromRGB(255, 215, 100),
        Background = Color3.fromRGB(35, 30, 8),
        Topbar = Color3.fromRGB(55, 45, 12),
        Shadow = Color3.fromRGB(25, 20, 5),
        NotificationBackground = Color3.fromRGB(55, 45, 12),
        NotificationActionsBackground = Color3.fromRGB(255, 200, 0),
        TabBackground = Color3.fromRGB(85, 70, 20),
        TabStroke = Color3.fromRGB(120, 100, 30),
        TabBackgroundSelected = Color3.fromRGB(255, 200, 0),
        TabTextColor = Color3.fromRGB(255, 215, 100),
        SelectedTabTextColor = Color3.fromRGB(0, 0, 0),
        ElementBackground = Color3.fromRGB(45, 38, 12),
        ElementBackgroundHover = Color3.fromRGB(65, 55, 18),
        SecondaryElementBackground = Color3.fromRGB(35, 28, 8),
        ElementStroke = Color3.fromRGB(120, 100, 30),
        SecondaryElementStroke = Color3.fromRGB(85, 70, 20),
        SliderBackground = Color3.fromRGB(255, 200, 0),
        SliderProgress = Color3.fromRGB(255, 200, 0),
        SliderStroke = Color3.fromRGB(255, 220, 50),
        ToggleBackground = Color3.fromRGB(40, 33, 10),
        ToggleEnabled = Color3.fromRGB(255, 200, 0),
        ToggleDisabled = Color3.fromRGB(100, 80, 30),
        ToggleEnabledStroke = Color3.fromRGB(255, 220, 50),
        ToggleDisabledStroke = Color3.fromRGB(130, 100, 40),
        ToggleEnabledOuterStroke = Color3.fromRGB(200, 150, 0),
        ToggleDisabledOuterStroke = Color3.fromRGB(70, 55, 20),
        DropdownSelected = Color3.fromRGB(85, 70, 20),
        DropdownUnselected = Color3.fromRGB(45, 38, 12),
        InputBackground = Color3.fromRGB(40, 33, 10),
        InputStroke = Color3.fromRGB(120, 100, 30),
        PlaceholderColor = Color3.fromRGB(200, 170, 80)
    },
    ["Cotton Candy"] = {
        TextColor = Color3.fromRGB(255, 200, 255),
        Background = Color3.fromRGB(35, 15, 35),
        Topbar = Color3.fromRGB(55, 25, 55),
        Shadow = Color3.fromRGB(25, 10, 25),
        NotificationBackground = Color3.fromRGB(55, 25, 55),
        NotificationActionsBackground = Color3.fromRGB(255, 100, 200),
        TabBackground = Color3.fromRGB(80, 35, 80),
        TabStroke = Color3.fromRGB(120, 50, 120),
        TabBackgroundSelected = Color3.fromRGB(255, 100, 200),
        TabTextColor = Color3.fromRGB(255, 200, 255),
        SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
        ElementBackground = Color3.fromRGB(50, 20, 50),
        ElementBackgroundHover = Color3.fromRGB(75, 30, 75),
        SecondaryElementBackground = Color3.fromRGB(40, 15, 40),
        ElementStroke = Color3.fromRGB(120, 50, 120),
        SecondaryElementStroke = Color3.fromRGB(80, 35, 80),
        SliderBackground = Color3.fromRGB(255, 100, 200),
        SliderProgress = Color3.fromRGB(255, 100, 200),
        SliderStroke = Color3.fromRGB(255, 150, 220),
        ToggleBackground = Color3.fromRGB(45, 18, 45),
        ToggleEnabled = Color3.fromRGB(255, 100, 200),
        ToggleDisabled = Color3.fromRGB(100, 50, 100),
        ToggleEnabledStroke = Color3.fromRGB(255, 150, 220),
        ToggleDisabledStroke = Color3.fromRGB(130, 65, 130),
        ToggleEnabledOuterStroke = Color3.fromRGB(200, 60, 150),
        ToggleDisabledOuterStroke = Color3.fromRGB(70, 35, 70),
        DropdownSelected = Color3.fromRGB(80, 35, 80),
        DropdownUnselected = Color3.fromRGB(50, 20, 50),
        InputBackground = Color3.fromRGB(45, 18, 45),
        InputStroke = Color3.fromRGB(120, 50, 120),
        PlaceholderColor = Color3.fromRGB(220, 150, 220)
    },
    ["Ocean"] = {
        TextColor = Color3.fromRGB(150, 220, 255),
        Background = Color3.fromRGB(8, 20, 35),
        Topbar = Color3.fromRGB(12, 30, 55),
        Shadow = Color3.fromRGB(5, 15, 25),
        NotificationBackground = Color3.fromRGB(12, 30, 55),
        NotificationActionsBackground = Color3.fromRGB(50, 180, 255),
        TabBackground = Color3.fromRGB(20, 50, 85),
        TabStroke = Color3.fromRGB(30, 70, 120),
        TabBackgroundSelected = Color3.fromRGB(50, 180, 255),
        TabTextColor = Color3.fromRGB(150, 220, 255),
        SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
        ElementBackground = Color3.fromRGB(15, 35, 55),
        ElementBackgroundHover = Color3.fromRGB(25, 50, 75),
        SecondaryElementBackground = Color3.fromRGB(10, 25, 45),
        ElementStroke = Color3.fromRGB(30, 70, 120),
        SecondaryElementStroke = Color3.fromRGB(20, 50, 85),
        SliderBackground = Color3.fromRGB(50, 180, 255),
        SliderProgress = Color3.fromRGB(50, 180, 255),
        SliderStroke = Color3.fromRGB(80, 210, 255),
        ToggleBackground = Color3.fromRGB(12, 30, 50),
        ToggleEnabled = Color3.fromRGB(50, 180, 255),
        ToggleDisabled = Color3.fromRGB(50, 80, 120),
        ToggleEnabledStroke = Color3.fromRGB(80, 210, 255),
        ToggleDisabledStroke = Color3.fromRGB(70, 100, 140),
        ToggleEnabledOuterStroke = Color3.fromRGB(30, 140, 200),
        ToggleDisabledOuterStroke = Color3.fromRGB(35, 55, 85),
        DropdownSelected = Color3.fromRGB(20, 50, 85),
        DropdownUnselected = Color3.fromRGB(15, 35, 55),
        InputBackground = Color3.fromRGB(12, 30, 50),
        InputStroke = Color3.fromRGB(30, 70, 120),
        PlaceholderColor = Color3.fromRGB(130, 190, 230)
    },
    ["Sunset"] = {
        TextColor = Color3.fromRGB(255, 200, 150),
        Background = Color3.fromRGB(35, 15, 8),
        Topbar = Color3.fromRGB(55, 25, 12),
        Shadow = Color3.fromRGB(25, 10, 5),
        NotificationBackground = Color3.fromRGB(55, 25, 12),
        NotificationActionsBackground = Color3.fromRGB(255, 150, 50),
        TabBackground = Color3.fromRGB(85, 40, 20),
        TabStroke = Color3.fromRGB(120, 60, 30),
        TabBackgroundSelected = Color3.fromRGB(255, 150, 50),
        TabTextColor = Color3.fromRGB(255, 200, 150),
        SelectedTabTextColor = Color3.fromRGB(0, 0, 0),
        ElementBackground = Color3.fromRGB(50, 22, 12),
        ElementBackgroundHover = Color3.fromRGB(75, 35, 18),
        SecondaryElementBackground = Color3.fromRGB(40, 18, 8),
        ElementStroke = Color3.fromRGB(120, 60, 30),
        SecondaryElementStroke = Color3.fromRGB(85, 40, 20),
        SliderBackground = Color3.fromRGB(255, 150, 50),
        SliderProgress = Color3.fromRGB(255, 150, 50),
        SliderStroke = Color3.fromRGB(255, 180, 80),
        ToggleBackground = Color3.fromRGB(45, 20, 10),
        ToggleEnabled = Color3.fromRGB(255, 150, 50),
        ToggleDisabled = Color3.fromRGB(110, 60, 30),
        ToggleEnabledStroke = Color3.fromRGB(255, 180, 80),
        ToggleDisabledStroke = Color3.fromRGB(140, 80, 40),
        ToggleEnabledOuterStroke = Color3.fromRGB(200, 110, 30),
        ToggleDisabledOuterStroke = Color3.fromRGB(80, 40, 20),
        DropdownSelected = Color3.fromRGB(85, 40, 20),
        DropdownUnselected = Color3.fromRGB(50, 22, 12),
        InputBackground = Color3.fromRGB(45, 20, 10),
        InputStroke = Color3.fromRGB(120, 60, 30),
        PlaceholderColor = Color3.fromRGB(220, 170, 120)
    },
    ["Lava"] = {
        TextColor = Color3.fromRGB(255, 150, 50),
        Background = Color3.fromRGB(30, 8, 0),
        Topbar = Color3.fromRGB(55, 15, 0),
        Shadow = Color3.fromRGB(20, 5, 0),
        NotificationBackground = Color3.fromRGB(55, 15, 0),
        NotificationActionsBackground = Color3.fromRGB(255, 100, 0),
        TabBackground = Color3.fromRGB(85, 25, 0),
        TabStroke = Color3.fromRGB(130, 40, 0),
        TabBackgroundSelected = Color3.fromRGB(255, 100, 0),
        TabTextColor = Color3.fromRGB(255, 150, 50),
        SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
        ElementBackground = Color3.fromRGB(45, 12, 0),
        ElementBackgroundHover = Color3.fromRGB(65, 18, 0),
        SecondaryElementBackground = Color3.fromRGB(35, 8, 0),
        ElementStroke = Color3.fromRGB(130, 40, 0),
        SecondaryElementStroke = Color3.fromRGB(85, 25, 0),
        SliderBackground = Color3.fromRGB(255, 100, 0),
        SliderProgress = Color3.fromRGB(255, 100, 0),
        SliderStroke = Color3.fromRGB(255, 150, 50),
        ToggleBackground = Color3.fromRGB(40, 10, 0),
        ToggleEnabled = Color3.fromRGB(255, 100, 0),
        ToggleDisabled = Color3.fromRGB(100, 30, 0),
        ToggleEnabledStroke = Color3.fromRGB(255, 150, 50),
        ToggleDisabledStroke = Color3.fromRGB(130, 45, 0),
        ToggleEnabledOuterStroke = Color3.fromRGB(200, 70, 0),
        ToggleDisabledOuterStroke = Color3.fromRGB(70, 20, 0),
        DropdownSelected = Color3.fromRGB(85, 25, 0),
        DropdownUnselected = Color3.fromRGB(45, 12, 0),
        InputBackground = Color3.fromRGB(40, 10, 0),
        InputStroke = Color3.fromRGB(130, 40, 0),
        PlaceholderColor = Color3.fromRGB(220, 120, 50)
    },
    ["Ice"] = {
        TextColor = Color3.fromRGB(200, 230, 255),
        Background = Color3.fromRGB(15, 20, 30),
        Topbar = Color3.fromRGB(25, 35, 50),
        Shadow = Color3.fromRGB(10, 15, 22),
        NotificationBackground = Color3.fromRGB(25, 35, 50),
        NotificationActionsBackground = Color3.fromRGB(100, 200, 255),
        TabBackground = Color3.fromRGB(40, 60, 85),
        TabStroke = Color3.fromRGB(60, 85, 120),
        TabBackgroundSelected = Color3.fromRGB(100, 200, 255),
        TabTextColor = Color3.fromRGB(200, 230, 255),
        SelectedTabTextColor = Color3.fromRGB(0, 0, 0),
        ElementBackground = Color3.fromRGB(22, 32, 48),
        ElementBackgroundHover = Color3.fromRGB(35, 50, 72),
        SecondaryElementBackground = Color3.fromRGB(18, 25, 38),
        ElementStroke = Color3.fromRGB(60, 85, 120),
        SecondaryElementStroke = Color3.fromRGB(40, 60, 85),
        SliderBackground = Color3.fromRGB(100, 200, 255),
        SliderProgress = Color3.fromRGB(100, 200, 255),
        SliderStroke = Color3.fromRGB(150, 220, 255),
        ToggleBackground = Color3.fromRGB(20, 30, 45),
        ToggleEnabled = Color3.fromRGB(100, 200, 255),
        ToggleDisabled = Color3.fromRGB(60, 80, 110),
        ToggleEnabledStroke = Color3.fromRGB(150, 220, 255),
        ToggleDisabledStroke = Color3.fromRGB(80, 100, 130),
        ToggleEnabledOuterStroke = Color3.fromRGB(70, 160, 200),
        ToggleDisabledOuterStroke = Color3.fromRGB(45, 60, 80),
        DropdownSelected = Color3.fromRGB(40, 60, 85),
        DropdownUnselected = Color3.fromRGB(22, 32, 48),
        InputBackground = Color3.fromRGB(20, 30, 45),
        InputStroke = Color3.fromRGB(60, 85, 120),
        PlaceholderColor = Color3.fromRGB(160, 200, 230)
    },
    ["Forest"] = {
        TextColor = Color3.fromRGB(180, 230, 180),
        Background = Color3.fromRGB(10, 25, 10),
        Topbar = Color3.fromRGB(18, 45, 18),
        Shadow = Color3.fromRGB(8, 18, 8),
        NotificationBackground = Color3.fromRGB(18, 45, 18),
        NotificationActionsBackground = Color3.fromRGB(80, 200, 80),
        TabBackground = Color3.fromRGB(30, 75, 30),
        TabStroke = Color3.fromRGB(45, 110, 45),
        TabBackgroundSelected = Color3.fromRGB(80, 200, 80),
        TabTextColor = Color3.fromRGB(180, 230, 180),
        SelectedTabTextColor = Color3.fromRGB(0, 0, 0),
        ElementBackground = Color3.fromRGB(15, 38, 15),
        ElementBackgroundHover = Color3.fromRGB(22, 55, 22),
        SecondaryElementBackground = Color3.fromRGB(10, 28, 10),
        ElementStroke = Color3.fromRGB(45, 110, 45),
        SecondaryElementStroke = Color3.fromRGB(30, 75, 30),
        SliderBackground = Color3.fromRGB(80, 200, 80),
        SliderProgress = Color3.fromRGB(80, 200, 80),
        SliderStroke = Color3.fromRGB(120, 230, 120),
        ToggleBackground = Color3.fromRGB(12, 35, 12),
        ToggleEnabled = Color3.fromRGB(80, 200, 80),
        ToggleDisabled = Color3.fromRGB(50, 100, 50),
        ToggleEnabledStroke = Color3.fromRGB(120, 230, 120),
        ToggleDisabledStroke = Color3.fromRGB(70, 130, 70),
        ToggleEnabledOuterStroke = Color3.fromRGB(60, 160, 60),
        ToggleDisabledOuterStroke = Color3.fromRGB(35, 70, 35),
        DropdownSelected = Color3.fromRGB(30, 75, 30),
        DropdownUnselected = Color3.fromRGB(15, 38, 15),
        InputBackground = Color3.fromRGB(12, 35, 12),
        InputStroke = Color3.fromRGB(45, 110, 45),
        PlaceholderColor = Color3.fromRGB(140, 200, 140)
    },
    ["Midnight"] = {
        TextColor = Color3.fromRGB(180, 180, 220),
        Background = Color3.fromRGB(8, 8, 18),
        Topbar = Color3.fromRGB(15, 15, 35),
        Shadow = Color3.fromRGB(5, 5, 12),
        NotificationBackground = Color3.fromRGB(15, 15, 35),
        NotificationActionsBackground = Color3.fromRGB(100, 100, 200),
        TabBackground = Color3.fromRGB(25, 25, 55),
        TabStroke = Color3.fromRGB(40, 40, 85),
        TabBackgroundSelected = Color3.fromRGB(100, 100, 200),
        TabTextColor = Color3.fromRGB(180, 180, 220),
        SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
        ElementBackground = Color3.fromRGB(12, 12, 28),
        ElementBackgroundHover = Color3.fromRGB(18, 18, 42),
        SecondaryElementBackground = Color3.fromRGB(8, 8, 22),
        ElementStroke = Color3.fromRGB(40, 40, 85),
        SecondaryElementStroke = Color3.fromRGB(25, 25, 55),
        SliderBackground = Color3.fromRGB(100, 100, 200),
        SliderProgress = Color3.fromRGB(100, 100, 200),
        SliderStroke = Color3.fromRGB(140, 140, 230),
        ToggleBackground = Color3.fromRGB(10, 10, 25),
        ToggleEnabled = Color3.fromRGB(100, 100, 200),
        ToggleDisabled = Color3.fromRGB(50, 50, 100),
        ToggleEnabledStroke = Color3.fromRGB(140, 140, 230),
        ToggleDisabledStroke = Color3.fromRGB(70, 70, 130),
        ToggleEnabledOuterStroke = Color3.fromRGB(80, 80, 160),
        ToggleDisabledOuterStroke = Color3.fromRGB(35, 35, 70),
        DropdownSelected = Color3.fromRGB(25, 25, 55),
        DropdownUnselected = Color3.fromRGB(12, 12, 28),
        InputBackground = Color3.fromRGB(10, 10, 25),
        InputStroke = Color3.fromRGB(40, 40, 85),
        PlaceholderColor = Color3.fromRGB(140, 140, 180)
    }
}

-- // ========== APPLY THEME FUNCTION ==========
local function applyTheme(themeName)
    local theme = Themes[themeName]
    if not theme then return end
    currentTheme = themeName
    
    pcall(function()
        if Window and Window.ModifyTheme then
            Window:ModifyTheme(theme)
        end
    end)
    
    StarterGui:SetCore("SendNotification", {
        Title = "ELITE HUB",
        Text = "Theme changed to: " .. themeName .. " 🥀",
        Duration = 2
    })
end

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
    
    task.wait(1)
    
    Window = Rayfield:CreateWindow({
        Name = "ELITE HUB | JAILBREAK 🥀",
        Icon = 0,
        LoadingTitle = "ELITE HUB",
        LoadingSubtitle = "by marcus",
        Theme = "Default",
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
    
    task.wait(0.5)
    
    local MainTab = Window:CreateTab("MAIN (FUCK SHIT UP)")
    local ESPTab = Window:CreateTab("ESP (SEE BITCHES)")
    local AimbotTab = Window:CreateTab("AIMBOT (HEADSHOT BITCH)")
    local MiscTab = Window:CreateTab("MISC (EXTRA SHIT)")
    local FlyTab = Window:CreateTab("FLY (ZOOM BITCH)")
    local SpeedTab = Window:CreateTab("SPEED (GOTTA GO FAST)")
    local ThemesTab = Window:CreateTab("THEMES (STYLE BITCH)")
    local RobberiesTab = Window:CreateTab("ROBBERIES (STEAL THAT SHIT)")
    local SettingsTab = Window:CreateTab("SETTINGS (CONFIGURE BITCH)")
    
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
        Content = "Dark\nMarcus Purple\nBlood Red\nNeon Blue\nPurple Haze\nMatrix Green\nGold\nCotton Candy\nOcean\nSunset\nLava\nIce\nForest\nMidnight"
    })
    
    -- // Apply default theme after window loads
    task.spawn(function()
        task.wait(1)
        applyTheme("Dark")
    end)
    
    -- // ========== AIMBOT ==========
    local aimbotEnabled = false
    local aimbotFOV = 80
    local teamCheck = false
    local killCheck = false
    local wallCheck = false
    local targetPart = "Head"
    local aimbotCircle = nil
    
    local function createAimbotCircle()
        if aimbotCircle then
            aimbotCircle.Visible = false
            aimbotCircle:Remove()
            aimbotCircle = nil
        end
        aimbotCircle = Drawing.new("Circle")
        aimbotCircle.Thickness = 1.5
        aimbotCircle.Color = Color3.fromRGB(255, 255, 255)
        aimbotCircle.Filled = false
        aimbotCircle.Visible = false
    end
    
    local function getClosestPlayer()
        local camera = Workspace.CurrentCamera
        if not camera then return end
        
        local viewportSize = camera.ViewportSize
        local center = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
        local closest = nil
        local closestDist = aimbotFOV
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local char = player.Character
                if char then
                    if teamCheck and player.Team == LocalPlayer.Team then
                        continue
                    end
                    
                    if killCheck then
                        local hum = char:FindFirstChildOfClass("Humanoid")
                        if hum and hum.Health <= 0 then
                            continue
                        end
                    end
                    
                    if wallCheck then
                        local part = char:FindFirstChild(targetPart) or char:FindFirstChild("HumanoidRootPart")
                        if part then
                            local ray = Ray.new(camera.CFrame.Position, (part.Position - camera.CFrame.Position).Unit * 500)
                            local hit = Workspace:FindPartOnRay(ray, LocalPlayer.Character)
                            if hit and not hit:IsDescendantOf(char) then
                                continue
                            end
                        end
                    end
                    
                    local target = char:FindFirstChild(targetPart) or char:FindFirstChild("HumanoidRootPart")
                    if target then
                        local screenPos, onScreen = camera:WorldToViewportPoint(target.Position)
                        if onScreen then
                            local dist = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
                            if dist < closestDist then
                                closestDist = dist
                                closest = {player = player, part = target}
                            end
                        end
                    end
                end
            end
        end
        
        return closest
    end
    
    local function aimbotRender()
        if not aimbotEnabled then return end
        
        local camera = Workspace.CurrentCamera
        if not camera then return end
        
        local viewportSize = camera.ViewportSize
        local center = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
        
        if aimbotCircle then
            aimbotCircle.Position = center
            aimbotCircle.Radius = aimbotFOV
            aimbotCircle.Visible = true
        end
        
        local target = getClosestPlayer()
        if target then
            local screenPos = camera:WorldToViewportPoint(target.part.Position)
            if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
                local newPos = Vector2.new(screenPos.X, screenPos.Y)
                UserInputService:SetMouseLocation(newPos.X, newPos.Y)
            end
        end
    end
    
    local function toggleAimbot()
        aimbotEnabled = not aimbotEnabled
        if aimbotEnabled then
            if not aimbotCircle then
                createAimbotCircle()
            end
            RunService:BindToRenderStep("AimbotRender", Enum.RenderPriority.Camera.Value + 1, aimbotRender)
            StarterGui:SetCore("SendNotification", {
                Title = "ELITE HUB",
                Text = "Aimbot ENABLED 🥀",
                Duration = 2
            })
        else
            if aimbotCircle then
                aimbotCircle.Visible = false
            end
            RunService:UnbindFromRenderStep("AimbotRender")
            StarterGui:SetCore("SendNotification", {
                Title = "ELITE HUB",
                Text = "Aimbot DISABLED",
                Duration = 2
            })
        end
    end
    
    -- // AIMBOT TAB
    AimbotTab:CreateSection("AIMBOT CONTROLS")
    
    AimbotTab:CreateToggle({
        Name = "AIMBOT (HEADSHOT BITCH)",
        CurrentValue = false,
        Callback = function(v)
            if v then
                if not aimbotEnabled then toggleAimbot() end
            else
                if aimbotEnabled then toggleAimbot() end
            end
        end
    })
    
    AimbotTab:CreateSlider({
        Name = "AIMBOT FOV",
        Range = {10, 200},
        Increment = 5,
        Suffix = "FOV",
        CurrentValue = 80,
        Callback = function(v)
            aimbotFOV = v
            if aimbotCircle then
                aimbotCircle.Radius = v
            end
        end
    })
    
    AimbotTab:CreateToggle({
        Name = "TEAM CHECK",
        CurrentValue = false,
        Callback = function(v)
            teamCheck = v
        end
    })
    
    AimbotTab:CreateToggle({
        Name = "KILL CHECK",
        CurrentValue = false,
        Callback = function(v)
            killCheck = v
        end
    })
    
    AimbotTab:CreateToggle({
        Name = "WALL CHECK",
        CurrentValue = false,
        Callback = function(v)
            wallCheck = v
        end
    })
    
    AimbotTab:CreateDropdown({
        Name = "TARGET PART",
        Options = {"Head", "Torso", "HumanoidRootPart", "LeftLeg", "RightLeg"},
        CurrentOption = "Head",
        Callback = function(v)
            targetPart = v
        end
    })
    
    AimbotTab:CreateParagraph({
        Title = "CONTROLS",
        Content = "Hold Right Click to aim at target\nAimbot only works when holding right click"
    })
    
    -- // ========== ANTI-SEAT ==========
    local antiSeatEnabled = false
    local antiSeatConnections = {}
    local antiSeatCharacterConnection = nil
    
    local function setupAntiSeat(character)
        if not antiSeatEnabled then return end
        
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.Sit = false
        
        local connections = {}
        
        local function handleBadState(newState)
            if newState == Enum.HumanoidStateType.Ragdoll or 
               newState == Enum.HumanoidStateType.FallingDown or 
               newState == Enum.HumanoidStateType.PlatformStanding or
               newState == Enum.HumanoidStateType.Seated then
                humanoid.Sit = false
                humanoid.PlatformStand = false
                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                if character:FindFirstChild("HumanoidRootPart") then
                    character.HumanoidRootPart.Anchored = false
                end
                return true
            end
            return false
        end
        
        handleBadState(humanoid:GetState())
        
        table.insert(connections, humanoid.StateChanged:Connect(function(_, newState)
            handleBadState(newState)
        end))
        
        for _, seat in pairs(Workspace:GetDescendants()) do
            if seat:IsA("Seat") then
                table.insert(connections, seat:GetPropertyChangedSignal("Occupant"):Connect(function()
                    if seat.Occupant == humanoid then
                        task.wait(0.01)
                        humanoid.Sit = false
                        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                    end
                end))
            end
        end
        
        table.insert(connections, humanoid.Died:Connect(function()
            for _, conn in ipairs(connections) do
                conn:Disconnect()
            end
            connections = {}
        end))
        
        antiSeatConnections = connections
    end
    
    local function toggleAntiSeat(enabled)
        antiSeatEnabled = enabled
        
        if enabled then
            for _, conn in ipairs(antiSeatConnections) do
                pcall(function() conn:Disconnect() end)
            end
            antiSeatConnections = {}
            
            if antiSeatCharacterConnection then
                antiSeatCharacterConnection:Disconnect()
                antiSeatCharacterConnection = nil
            end
            
            if LocalPlayer.Character then
                setupAntiSeat(LocalPlayer.Character)
            end
            antiSeatCharacterConnection = LocalPlayer.CharacterAdded:Connect(setupAntiSeat)
            
            StarterGui:SetCore("SendNotification", {
                Title = "ELITE HUB",
                Text = "Anti-Seat ENABLED 🥀",
                Duration = 2
            })
        else
            for _, conn in ipairs(antiSeatConnections) do
                pcall(function() conn:Disconnect() end)
            end
            antiSeatConnections = {}
            
            if antiSeatCharacterConnection then
                antiSeatCharacterConnection:Disconnect()
                antiSeatCharacterConnection = nil
            end
            
            StarterGui:SetCore("SendNotification", {
                Title = "ELITE HUB",
                Text = "Anti-Seat DISABLED",
                Duration = 2
            })
        end
    end
    
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
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
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
    
    -- // ========== ANTI-SEAT ==========
    MiscTab:CreateSection("ANTI-SEAT / ANTI-STUN")
    
    MiscTab:CreateToggle({
        Name = "ANTI-SEAT (STOP BEING STUCK)",
        CurrentValue = false,
        Callback = function(v)
            toggleAntiSeat(v)
        end
    })
    
    MiscTab:CreateParagraph({
        Title = "WHAT IT DOES",
        Content = "Prevents you from being stuck in:\n- Seats\n- Ragdoll\n- Falling Down\n- Platform Standing\n- Any stun state"
    })
    
    -- // ========== SETTINGS TAB ==========
    SettingsTab:CreateSection("ELITE HUB SETTINGS")
    
    SettingsTab:CreateParagraph({
        Title = "VERSION",
        Content = "v1.0.0"
    })
    
    SettingsTab:CreateParagraph({
        Title = "MEMBER COUNT",
        Content = memberCount .. " Members 🥀"
    })
    
    SettingsTab:CreateParagraph({
        Title = "DISCORD",
        Content = "discord.gg/5RuMCxK3u6"
    })
    
    SettingsTab:CreateParagraph({
        Title = "CREDITS",
        Content = "Made by marcus"
    })
    
    SettingsTab:CreateButton({
        Name = "COPY DISCORD LINK",
        Callback = function()
            setclipboard("https://discord.gg/5RuMCxK3u6")
            StarterGui:SetCore("SendNotification", {
                Title = "ELITE HUB",
                Text = "Discord link copied!",
                Duration = 2
            })
        end
    })
    
    SettingsTab:CreateButton({
        Name = "REJOIN GAME",
        Callback = function()
            pcall(function()
                TeleportService:Teleport(game.PlaceId, LocalPlayer)
            end)
        end
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

-- // ========== LOAD ==========
loadMain()