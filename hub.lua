--// 🩸 SUKUNA HUB v6.2 - SUPREMO FIX + MOBILE SAFE
--// Roblox Studio | PC + Mobile
--// LocalScript em StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local camera = workspace.CurrentCamera

local VirtualUser = nil
pcall(function() VirtualUser = game:GetService("VirtualUser") end)
local VirtualInputManager = nil
pcall(function() VirtualInputManager = game:GetService("VirtualInputManager") end)

-- ================= CORES =================
local RED = Color3.fromRGB(255, 25, 50)
local BLACK = Color3.fromRGB(12, 12, 16)
local WHITE = Color3.fromRGB(245, 245, 245)
local GREEN = Color3.fromRGB(80, 220, 100)
local YELLOW = Color3.fromRGB(255, 200, 60)
local PURPLE = Color3.fromRGB(180, 80, 255)
local CYAN = Color3.fromRGB(80, 220, 255)
local GOJO_IMAGE = "rbxassetid://120415054741416"

local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

for _, n in ipairs({"SukunaHubV30", "SukunaHubV40", "SukunaHubV50", "SukunaHubV60", "SukunaHubV61", "SukunaHubV62"}) do
    local o = playerGui:FindFirstChild(n)
    if o then o:Destroy() end
end

-- ================= GUI =================
local gui = Instance.new("ScreenGui")
gui.Name = "SukunaHubV62"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 999
gui.Parent = playerGui

-- ================= OPEN BUTTON =================
local openButton = Instance.new("TextButton")
openButton.Size = UDim2.fromOffset(52, 52)
openButton.Position = UDim2.new(0, 12, 0.5, -26)
openButton.BackgroundColor3 = BLACK
openButton.Text = "🩸"
openButton.TextSize = 27
openButton.TextColor3 = RED
openButton.Parent = gui
Instance.new("UICorner", openButton).CornerRadius = UDim.new(1, 0)
local openStroke = Instance.new("UIStroke")
openStroke.Color = RED
openStroke.Thickness = 2
openStroke.Parent = openButton

-- ================= PANEL (adaptativo mobile) =================
local PANEL_W = isMobile and 320 or 340
local PANEL_H = isMobile and 400 or 420

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(PANEL_W, PANEL_H)
main.Position = UDim2.new(0.5, -PANEL_W/2, 0.5, -PANEL_H/2)
main.BackgroundColor3 = BLACK
main.BorderSizePixel = 0
main.Parent = gui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)
local mainStroke = Instance.new("UIStroke")
mainStroke.Color = RED
mainStroke.Thickness = 1.5
mainStroke.Parent = main

-- ================= HEADER =================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 62)
header.BackgroundColor3 = Color3.fromRGB(22, 8, 12)
header.BorderSizePixel = 0
header.Parent = main
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 12)

local gojo = Instance.new("ImageLabel")
gojo.Size = UDim2.fromOffset(46, 46)
gojo.Position = UDim2.fromOffset(8, 8)
gojo.BackgroundTransparency = 1
gojo.Image = GOJO_IMAGE
gojo.ScaleType = Enum.ScaleType.Crop
gojo.Parent = header
Instance.new("UICorner", gojo).CornerRadius = UDim.new(1, 0)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -105, 0, 28)
title.Position = UDim2.fromOffset(62, 8)
title.BackgroundTransparency = 1
title.Text = "SUKUNA HUB"
title.TextColor3 = RED
title.Font = Enum.Font.GothamBold
title.TextSize = 17
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -105, 0, 18)
subtitle.Position = UDim2.fromOffset(63, 34)
subtitle.BackgroundTransparency = 1
subtitle.Text = "v6.2 • SUPREMO MOBILE FIX"
subtitle.TextColor3 = YELLOW
subtitle.Font = Enum.Font.GothamBold
subtitle.TextSize = 9
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = header

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(28, 28)
close.Position = UDim2.new(1, -34, 0, 6)
close.BackgroundColor3 = RED
close.Text = "×"
close.TextColor3 = WHITE
close.TextSize = 21
close.Font = Enum.Font.GothamBold
close.Parent = header
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 7)

-- ================= TABS =================
local tabsFrame = Instance.new("Frame")
tabsFrame.Size = UDim2.new(1, -12, 0, 120)
tabsFrame.Position = UDim2.fromOffset(6, 66)
tabsFrame.BackgroundTransparency = 1
tabsFrame.Parent = main

local tabLayout = Instance.new("UIGridLayout")
tabLayout.CellSize = UDim2.fromOffset(54, 26)
tabLayout.CellPadding = UDim2.fromOffset(3, 4)
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Parent = tabsFrame

local content = Instance.new("ScrollingFrame")
content.Size = UDim2.new(1, -16, 1, -200)
content.Position = UDim2.fromOffset(8, 192)
content.BackgroundColor3 = Color3.fromRGB(18, 18, 23)
content.BorderSizePixel = 0
content.ScrollBarThickness = 3
content.ScrollBarImageColor3 = RED
content.CanvasSize = UDim2.new(0, 0, 0, 1000)
content.Parent = main
Instance.new("UICorner", content).CornerRadius = UDim.new(0, 8)

local contentPadding = Instance.new("UIPadding")
contentPadding.PaddingTop = UDim.new(0, 7)
contentPadding.PaddingLeft = UDim.new(0, 7)
contentPadding.PaddingRight = UDim.new(0, 7)
contentPadding.PaddingBottom = UDim.new(0, 7)
contentPadding.Parent = content

local list = Instance.new("UIListLayout")
list.Padding = UDim.new(0, 6)
list.SortOrder = Enum.SortOrder.LayoutOrder
list.Parent = content

list:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    content.CanvasSize = UDim2.new(0, 0, 0, list.AbsoluteContentSize.Y + 20)
end)

-- ================= CONFIG =================
local Config = {
    Speed = 16, Jump = 50, InfiniteJump = false,
    Sprint = false, SprintKey = Enum.KeyCode.LeftControl, SprintSpeed = 45,
    DashKey = Enum.KeyCode.X, DashPower = 120,
    Gravity = 196.2,
    Fly = false, FlySpeed = 60,
    Noclip = false,
    ESP = false, ESPTeamCheck = true, ESPNames = true,
    ESPHealth = true, ESPDistance = true, ESPBox = false,
    ESPTracer = false, ESPColor = RED,
    ESPThroughWalls = true,
    Aim = false, AimKey = Enum.KeyCode.Q, AimPart = "Head",
    AimDistance = 300, AimSpeed = 0.25, AimTeamCheck = true,
    AimVisible = true, Wallbang = false, FOV = 180, FOVVisible = true,
    AimPredict = false, AimPriority = "FOV", AimAutoFOV = false,
    Silent = false, SilentKey = Enum.KeyCode.E, SilentDist = 500,
    SilentTeamCheck = true,
    KillAura = false, KillAuraRange = 20, KillAuraDelay = 0.15,
    KillAuraTeamCheck = true,
    TriggerBot = false, TriggerKey = Enum.KeyCode.V,
    AutoParry = false, AutoParryRange = 15,
    AutoFarm = false, AutoFarmRange = 50,
    AutoCollect = false, AutoCollectRange = 30,
    TeleportKey = Enum.KeyCode.T,
    Waypoints = {},
    AntiFling = false, AntiVoid = false, AntiRagdoll = false,
    AntiAFK = true, Notifications = true,
    Watermark = true, Fullbright = false,
    Theme = "Sukuna", SoundESP = false, SoundESPVolume = 0.5,
    ChatSpam = false, ChatSpamText = "🩸 Sukuna Hub v6.2!",
    ChatSpamDelay = 3,
    KillCounter = 0,
}

local currentTab = "Movimento"
local highlights, billboards, boxes, tracers = {}, {}, {}, {}
local flyBV, flyBG, flyConn, noclipConn
local sprintConn, autoParryConn, antiFlingConn, antiVoidConn, chatSpamConn
local lastHealth = {}

-- ================= TEMAS =================
local Themes = {
    Sukuna = {primary = RED, secondary = Color3.fromRGB(22, 8, 12), accent = YELLOW},
    Gojo = {primary = CYAN, secondary = Color3.fromRGB(8, 18, 30), accent = WHITE},
    Toji = {primary = Color3.fromRGB(90, 90, 100), secondary = Color3.fromRGB(15, 15, 20), accent = Color3.fromRGB(200, 30, 40)},
    Mahoraga = {primary = Color3.fromRGB(200, 80, 40), secondary = Color3.fromRGB(30, 15, 10), accent = Color3.fromRGB(255, 200, 100)},
    Purple = {primary = PURPLE, secondary = Color3.fromRGB(20, 8, 30), accent = Color3.fromRGB(255, 150, 255)},
}

-- ================= UTILS BÁSICOS =================
local function getHumanoid()
    local char = player.Character
    return char and char:FindFirstChildOfClass("Humanoid")
end

local function getRoot()
    local char = player.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function clearContent()
    for _, child in ipairs(content:GetChildren()) do
        if child:IsA("GuiObject") and child ~= list then
            child:Destroy()
        end
    end
end

local function applyMovement()
    local hum = getHumanoid()
    if hum then
        hum.WalkSpeed = Config.Speed
        hum.UseJumpPower = true
        hum.JumpPower = Config.Jump
    end
end

-- ================= NOTIFICAÇÕES =================
local notifHolder = Instance.new("Frame")
notifHolder.Size = UDim2.new(0, 290, 0, 240)
notifHolder.Position = UDim2.new(1, -300, 0, 20)
notifHolder.BackgroundTransparency = 1
notifHolder.Parent = gui

local notifList = Instance.new("UIListLayout")
notifList.Padding = UDim.new(0, 6)
notifList.SortOrder = Enum.SortOrder.LayoutOrder
notifList.VerticalAlignment = Enum.VerticalAlignment.Top
notifList.Parent = notifHolder

local function notify(text, color)
    if not Config.Notifications then return end
    color = color or Themes[Config.Theme].primary
    local n = Instance.new("Frame")
    n.Size = UDim2.new(1, 0, 0, 34)
    n.BackgroundColor3 = Color3.fromRGB(20, 15, 20)
    n.BorderSizePixel = 0
    n.Parent = notifHolder
    Instance.new("UICorner", n).CornerRadius = UDim.new(0, 6)
    local s = Instance.new("UIStroke", n)
    s.Color = color
    s.Thickness = 1.5

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(0, 4, 1, 0)
    bar.BackgroundColor3 = color
    bar.BorderSizePixel = 0
    bar.Parent = n
    Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 6)

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -14, 1, 0)
    lbl.Position = UDim2.fromOffset(12, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = WHITE
    lbl.Font = Enum.Font.GothamSemibold
    lbl.TextSize = 11
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = n

    n.BackgroundTransparency = 1
    bar.BackgroundTransparency = 1
    lbl.TextTransparency = 1
    s.Transparency = 1

    TweenService:Create(n, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
    TweenService:Create(bar, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
    TweenService:Create(lbl, TweenInfo.new(0.2), {TextTransparency = 0}):Play()
    TweenService:Create(s, TweenInfo.new(0.2), {Transparency = 0}):Play()

    task.delay(2.5, function()
        TweenService:Create(n, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
        TweenService:Create(bar, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
        TweenService:Create(lbl, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
        TweenService:Create(s, TweenInfo.new(0.3), {Transparency = 1}):Play()
        task.wait(0.35)
        n:Destroy()
    end)
end

local function applyTheme(name)
    local t = Themes[name] or Themes.Sukuna
    mainStroke.Color = t.primary
    header.BackgroundColor3 = t.secondary
    title.TextColor3 = t.primary
    subtitle.TextColor3 = t.accent
    fovStroke.Color = t.primary
    openStroke.Color = t.primary
    wmStroke.Color = t.primary
    radarStroke.Color = t.primary
    radarTitle.TextColor3 = t.primary
    watermark.TextColor3 = t.primary
    Config.ESPColor = t.primary
    Config.Theme = name
    notify("🎨 Tema: " .. name, t.primary)
end

-- ================= WATERMARK + RADAR =================
local watermark = Instance.new("TextLabel")
watermark.Size = UDim2.fromOffset(260, 26)
watermark.Position = UDim2.new(0, 12, 0, 12)
watermark.BackgroundColor3 = BLACK
watermark.BackgroundTransparency = 0.25
watermark.Text = "🩸 SUKUNA HUB v6.2"
watermark.TextColor3 = RED
watermark.Font = Enum.Font.GothamBold
watermark.TextSize = 12
watermark.Parent = gui
Instance.new("UICorner", watermark).CornerRadius = UDim.new(0, 6)
local wmStroke = Instance.new("UIStroke", watermark)
wmStroke.Color = RED
wmStroke.Transparency = 0.4

local radar = Instance.new("Frame")
radar.Size = UDim2.fromOffset(130, 130)
radar.Position = UDim2.new(0, 12, 1, -142)
radar.BackgroundColor3 = BLACK
radar.BackgroundTransparency = 0.3
radar.BorderSizePixel = 0
radar.Parent = gui
Instance.new("UICorner", radar).CornerRadius = UDim.new(1, 0)
local radarStroke = Instance.new("UIStroke", radar)
radarStroke.Color = RED
radarStroke.Thickness = 1.5
radarStroke.Transparency = 0.4

local radarTitle = Instance.new("TextLabel")
radarTitle.Size = UDim2.new(1, 0, 0, 16)
radarTitle.Position = UDim2.fromOffset(0, 4)
radarTitle.BackgroundTransparency = 1
radarTitle.Text = "📡 RADAR"
radarTitle.TextColor3 = RED
radarTitle.Font = Enum.Font.GothamBold
radarTitle.TextSize = 9
radarTitle.Parent = radar

local radarDots = {}
local radarRange = 300

-- ================= FOV CIRCLE =================
local fovCircle = Instance.new("Frame")
fovCircle.AnchorPoint = Vector2.new(0.5, 0.5)
fovCircle.Size = UDim2.fromOffset(Config.FOV, Config.FOV)
fovCircle.BackgroundTransparency = 1
fovCircle.ZIndex = 2
fovCircle.Parent = gui
Instance.new("UICorner", fovCircle).CornerRadius = UDim.new(1, 0)
local fovStroke = Instance.new("UIStroke")
fovStroke.Color = RED
fovStroke.Thickness = 1.5
fovStroke.Transparency = 0.2
fovStroke.Parent = fovCircle

-- ================= FLY =================
local function stopFly()
    if flyConn then flyConn:Disconnect(); flyConn = nil end
    if flyBV then flyBV:Destroy(); flyBV = nil end
    if flyBG then flyBG:Destroy(); flyBG = nil end
    local hum = getHumanoid()
    if hum then hum:ChangeState(Enum.HumanoidStateType.GettingUp) end
end

local function startFly()
    stopFly()
    local hrp = getRoot()
    local hum = getHumanoid()
    if not hrp or not hum then return end

    flyBV = Instance.new("BodyVelocity")
    flyBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    flyBV.Velocity = Vector3.zero
    flyBV.Parent = hrp

    flyBG = Instance.new("BodyGyro")
    flyBG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    flyBG.P = 1500
    flyBG.D = 100
    flyBG.CFrame = hrp.CFrame
    flyBG.Parent = hrp

    local keys = {}
    local kb1 = UserInputService.InputBegan:Connect(function(i, g)
        if not g and i.UserInputType == Enum.UserInputType.Keyboard then keys[i.KeyCode] = true end
    end)
    local kb2 = UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.Keyboard then keys[i.KeyCode] = false end
    end)

    flyConn = RunService.RenderStepped:Connect(function()
        if not Config.Fly or not hrp.Parent then
            kb1:Disconnect(); kb2:Disconnect()
            stopFly()
            return
        end
        flyBG.CFrame = camera.CFrame
        local move = Vector3.zero
        if keys[Enum.KeyCode.W] then move += camera.CFrame.LookVector end
        if keys[Enum.KeyCode.S] then move -= camera.CFrame.LookVector end
        if keys[Enum.KeyCode.A] then move -= camera.CFrame.RightVector end
        if keys[Enum.KeyCode.D] then move += camera.CFrame.RightVector end
        if keys[Enum.KeyCode.Space] then move += Vector3.new(0, 1, 0) end
        if keys[Enum.KeyCode.LeftShift] then move -= Vector3.new(0, 1, 0) end

        local hm = hum.MoveDirection
        if hm.Magnitude > 0 then
            move += camera.CFrame.LookVector * hm.Z
            move += camera.CFrame.RightVector * hm.X
        end

        flyBV.Velocity = move.Magnitude > 0 and move.Unit * Config.FlySpeed or Vector3.zero
    end)
end

-- ================= NOCLIP =================
local function setNoclip(state)
    local char = player.Character
    if not char then return end
    for _, p in ipairs(char:GetDescendants()) do
        if p:IsA("BasePart") then p.CanCollide = not state end
    end
end

local function startNoclip()
    if noclipConn then return end
    noclipConn = RunService.Stepped:Connect(function()
        if not Config.Noclip then return end
        local char = player.Character
        if not char then return end
        for _, p in ipairs(char:GetDescendants()) do
            if p:IsA("BasePart") and p.CanCollide then p.CanCollide = false end
        end
    end)
end

local function stopNoclip()
    if noclipConn then noclipConn:Disconnect(); noclipConn = nil end
    setNoclip(false)
end

-- ================= SPRINT & DASH =================
local function startSprint()
    if sprintConn then return end
    sprintConn = UserInputService.InputBegan:Connect(function(i, g)
        if g then return end
        if not Config.Sprint then return end
        if i.KeyCode == Config.SprintKey then
            local hum = getHumanoid()
            if hum then hum.WalkSpeed = Config.SprintSpeed end
        end
    end)
    UserInputService.InputEnded:Connect(function(i)
        if i.KeyCode == Config.SprintKey then
            local hum = getHumanoid()
            if hum then hum.WalkSpeed = Config.Speed end
        end
    end)
end

local function doDash()
    local hrp = getRoot()
    local hum = getHumanoid()
    if not hrp or not hum then return end
    local dir = hum.MoveDirection
    if dir.Magnitude < 0.1 then dir = camera.CFrame.LookVector end
    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(9e9, 0, 9e9)
    bv.Velocity = dir.Unit * Config.DashPower
    bv.Parent = hrp
    task.delay(0.2, function() bv:Destroy() end)
    notify("💨 Dash!", Themes[Config.Theme].primary)
end

-- ================= ESP =================
local function removeESP()
    for _, tbl in ipairs({highlights, billboards, boxes, tracers}) do
        for k, v in pairs(tbl) do
            if v then v:Destroy() end
            tbl[k] = nil
        end
    end
end

local function updateESP()
    if not Config.ESP then removeESP(); return end

    local active = {}
    for _, other in ipairs(Players:GetPlayers()) do
        if other ~= player then
            local char = other.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local head = char and char:FindFirstChild("Head")
            local hrp = char and char:FindFirstChild("HumanoidRootPart")

            local skip = false
            if Config.ESPTeamCheck and player.Team and other.Team == player.Team then skip = true end

            if not skip and char and hum and hum.Health > 0 and head and hrp then
                active[char] = true

                if not highlights[char] then
                    local hl = Instance.new("Highlight")
                    hl.Adornee = char
                    hl.FillColor = Config.ESPColor
                    hl.OutlineColor = WHITE
                    hl.FillTransparency = 0.75
                    hl.DepthMode = Config.ESPThroughWalls and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded
                    hl.Parent = gui
                    highlights[char] = hl
                end

                if not billboards[char] then
                    local bb = Instance.new("BillboardGui")
                    bb.Adornee = head
                    bb.Size = UDim2.fromOffset(200, 40)
                    bb.StudsOffset = Vector3.new(0, 2.6, 0)
                    bb.AlwaysOnTop = true
                    bb.Parent = gui
                    local lbl = Instance.new("TextLabel")
                    lbl.Name = "Info"
                    lbl.Size = UDim2.fromScale(1, 1)
                    lbl.BackgroundTransparency = 1
                    lbl.TextColor3 = Config.ESPColor
                    lbl.TextStrokeTransparency = 0.15
                    lbl.TextScaled = true
                    lbl.Font = Enum.Font.GothamBold
                    lbl.Parent = bb
                    billboards[char] = bb
                end

                local lbl = billboards[char]:FindFirstChild("Info")
                if lbl then
                    local parts = {}
                    if Config.ESPNames then table.insert(parts, other.DisplayName) end
                    if Config.ESPHealth then table.insert(parts, "❤ " .. math.floor(hum.Health)) end
                    if Config.ESPDistance then
                        local d = (camera.CFrame.Position - head.Position).Magnitude
                        table.insert(parts, math.floor(d) .. "s")
                    end
                    lbl.Text = table.concat(parts, " | ")
                end

                if Config.ESPBox then
                    local sp, onScreen = camera:WorldToViewportPoint(hrp.Position)
                    if onScreen and sp.Z > 0 then
                        if not boxes[char] then
                            local box = Instance.new("Frame")
                            box.AnchorPoint = Vector2.new(0.5, 0.5)
                            box.BackgroundTransparency = 1
                            box.BorderSizePixel = 0
                            box.Parent = gui
                            local s = Instance.new("UIStroke", box)
                            s.Color = Config.ESPColor
                            s.Thickness = 1.5
                            boxes[char] = box
                        end
                        local size = math.clamp(1400 / sp.Z, 20, 400)
                        boxes[char].Position = UDim2.fromOffset(sp.X, sp.Y)
                        boxes[char].Size = UDim2.fromOffset(size * 0.55, size)
                        boxes[char].Visible = true
                    elseif boxes[char] then
                        boxes[char].Visible = false
                    end
                elseif boxes[char] then
                    boxes[char]:Destroy(); boxes[char] = nil
                end

                if Config.ESPTracer then
                    local vp = camera.ViewportSize
                    local from = Vector2.new(vp.X/2, vp.Y)
                    local to = camera:WorldToViewportPoint(hrp.Position)
                    if to.Z > 0 then
                        if not tracers[char] then
                            local tr = Instance.new("Frame")
                            tr.AnchorPoint = Vector2.new(0.5, 0.5)
                            tr.BorderSizePixel = 0
                            tr.BackgroundColor3 = Config.ESPColor
                            tr.Parent = gui
                            tracers[char] = tr
                        end
                        local to2 = Vector2.new(to.X, to.Y)
                        local mid = (from + to2) / 2
                        local delta = to2 - from
                        tracers[char].Size = UDim2.fromOffset(delta.Magnitude, 1)
                        tracers[char].Position = UDim2.fromOffset(mid.X, mid.Y)
                        tracers[char].Rotation = math.deg(math.atan2(delta.Y, delta.X))
                        tracers[char].Visible = true
                    elseif tracers[char] then
                        tracers[char].Visible = false
                    end
                elseif tracers[char] then
                    tracers[char]:Destroy(); tracers[char] = nil
                end
            end
        end
    end

    for _, tbl in ipairs({highlights, billboards, boxes, tracers}) do
        for c, obj in pairs(tbl) do
            if not active[c] then
                if obj then obj:Destroy() end
                tbl[c] = nil
            end
        end
    end
end

-- ================= AIM / SILENT =================
local function isVisible(part)
    if Config.Wallbang then return true end
    if not Config.AimVisible then return true end
    local char = player.Character
    local origin = camera.CFrame.Position
    local dir = part.Position - origin
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    local ignore = {camera}
    if char then table.insert(ignore, char) end
    params.FilterDescendantsInstances = ignore
    local hit = workspace:Raycast(origin, dir, params)
    return hit == nil or hit.Instance:IsDescendantOf(part.Parent)
end

local function getTargetPart(char)
    if not char then return nil end
    if Config.AimPart == "Head" then
        return char:FindFirstChild("Head")
    else
        return char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
    end
end

local function predictPos(part)
    if not Config.AimPredict then return part.Position end
    local vel = part.AssemblyLinearVelocity
    local dist = (part.Position - camera.CFrame.Position).Magnitude
    local time = dist / 500
    return part.Position + vel * time
end

local function getNearestTarget(maxDist, teamCheck)
    local best, bestPos
    local vp = camera.ViewportSize
    local center = Vector2.new(vp.X / 2, vp.Y / 2)
    local closest = math.huge
    local fovUse = Config.FOV

    for _, other in ipairs(Players:GetPlayers()) do
        if other ~= player then
            local skip = false
            if teamCheck and player.Team and other.Team == player.Team then skip = true end
            if not skip then
                local char = other.Character
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                if hum and hum.Health > 0 then
                    local part = getTargetPart(char)
                    if part and isVisible(part) then
                        local wd = (part.Position - camera.CFrame.Position).Magnitude
                        if wd <= maxDist then
                            local predPos = predictPos(part)
                            local sp, on = camera:WorldToViewportPoint(predPos)
                            if on and sp.Z > 0 then
                                local sd = (Vector2.new(sp.X, sp.Y) - center).Magnitude
                                local priority = sd
                                if Config.AimPriority == "Health" then priority = hum.Health end
                                if Config.AimPriority == "Distance" then priority = wd end
                                if sd <= fovUse / 2 and priority < closest then
                                    closest = priority
                                    best = part
                                    bestPos = predPos
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return best, bestPos
end

-- ================= SILENT AIM (MOBILE SAFE) =================
local oldNamecall
local silentAvailable = false
if getrawmetatable and setreadonly and newcclosure and getnamecallmethod then
    pcall(function()
        local mt = getrawmetatable(game)
        setreadonly(mt, false)
        oldNamecall = mt.__namecall
        mt.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if Config.Silent and (method == "FindPartOnRayWithIgnoreList" or method == "FindPartOnRay") then
                local args = {...}
                local part = getNearestTarget(Config.SilentDist, Config.SilentTeamCheck)
                if part then
                    args[1] = Ray.new(camera.CFrame.Position, (part.Position - camera.CFrame.Position).Unit * Config.SilentDist)
                end
                return oldNamecall(self, unpack(args))
            end
            return oldNamecall(self, ...)
        end)
        setreadonly(mt, true)
        silentAvailable = true
    end)
end

-- Fallback mobile: hook no camera
if not silentAvailable then
    local origViewport = camera.ViewportPointToRay
    local origScreen = camera.ScreenPointToRay
    camera.ViewportPointToRay = function(self, x, y, depth)
        if Config.Silent then
            local part = getNearestTarget(Config.SilentDist, Config.SilentTeamCheck)
            if part then
                return Ray.new(camera.CFrame.Position, (part.Position - camera.CFrame.Position).Unit)
            end
        end
        return origViewport(self, x, y, depth)
    end
    camera.ScreenPointToRay = function(self, x, y, depth)
        if Config.Silent then
            local part = getNearestTarget(Config.SilentDist, Config.SilentTeamCheck)
            if part then
                return Ray.new(camera.CFrame.Position, (part.Position - camera.CFrame.Position).Unit)
            end
        end
        return origScreen(self, x, y, depth)
    end
end

-- ================= KILL AURA =================
local function damageTarget(hum)
    if firetouchinterest then
        pcall(function()
            local root = getRoot()
            if root then
                local targetPart = hum.Parent:FindFirstChild("Head") or hum.Parent:FindFirstChild("HumanoidRootPart")
                firetouchinterest(root, targetPart, 0)
                task.wait()
                firetouchinterest(root, targetPart, 1)
            end
        end)
    end
    pcall(function()
        local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChildOfClass("RemoteEvent") then
            tool:FindFirstChildOfClass("RemoteEvent"):FireServer(hum.Parent)
        end
    end)
end

local function updateKillAura()
    if not Config.KillAura then return end
    local root = getRoot()
    if not root then return end
    for _, other in ipairs(Players:GetPlayers()) do
        if other ~= player then
            local skip = false
            if Config.KillAuraTeamCheck and player.Team and other.Team == player.Team then skip = true end
            if not skip then
                local char = other.Character
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hum and hum.Health > 0 and hrp then
                    local d = (root.Position - hrp.Position).Magnitude
                    if d <= Config.KillAuraRange then
                        damageTarget(hum)
                    end
                end
            end
        end
    end
end

-- ================= TRIGGER BOT =================
local function updateTriggerBot()
    if not Config.TriggerBot then return end
    if not UserInputService:IsKeyDown(Config.TriggerKey) then return end
    local part = getNearestTarget(Config.AimDistance, Config.AimTeamCheck)
    if part and VirtualInputManager then
        pcall(function()
            local vp = camera.ViewportSize
            VirtualInputManager:SendMouseButtonEvent(vp.X/2, vp.Y/2, 0, true, game, 1)
            task.wait(0.02)
            VirtualInputManager:SendMouseButtonEvent(vp.X/2, vp.Y/2, 0, false, game, 1)
        end)
    end
end

-- ================= AUTO PARRY =================
local function startAutoParry()
    if autoParryConn then return end
    autoParryConn = RunService.Heartbeat:Connect(function()
        if not Config.AutoParry then return end
        local root = getRoot()
        if not root then return end
        for _, other in ipairs(Players:GetPlayers()) do
            if other ~= player then
                local char = other.Character
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hum and hum.Health > 0 and hrp then
                    local d = (root.Position - hrp.Position).Magnitude
                    if d <= Config.AutoParryRange then
                        pcall(function()
                            local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
                            if tool and tool:FindFirstChildOfClass("RemoteEvent") then
                                tool:FindFirstChildOfClass("RemoteEvent"):FireServer()
                            end
                        end)
                    end
                end
            end
        end
    end)
end

local function stopAutoParry()
    if autoParryConn then autoParryConn:Disconnect(); autoParryConn = nil end
end

-- ================= AUTO FARM =================
local function updateAutoFarm()
    if not Config.AutoFarm then return end
    local root = getRoot()
    if not root then return end
    local closest, closestHum, closestDist = nil, nil, math.huge
    for _, other in ipairs(Players:GetPlayers()) do
        if other ~= player then
            local char = other.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hum and hum.Health > 0 and hrp then
                local d = (root.Position - hrp.Position).Magnitude
                if d < closestDist and d <= Config.AutoFarmRange then
                    closestDist = d
                    closest = hrp
                    closestHum = hum
                end
            end
        end
    end
    if closest then
        local pos = closest.Position + (root.Position - closest.Position).Unit * 3
        root.CFrame = CFrame.new(pos, closest.Position)
        if closestHum then damageTarget(closestHum) end
    end
end

-- ================= AUTO COLLECT =================
local function updateAutoCollect()
    if not Config.AutoCollect then return end
    local root = getRoot()
    if not root then return end
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj ~= root then
            local d = (root.Position - obj.Position).Magnitude
            if d <= Config.AutoCollectRange and d > 1 then
                pcall(function()
                    if not obj.Anchored then
                        obj.CFrame = root.CFrame
                    end
                end)
            end
        end
    end
end

-- ================= ANTI FLING / VOID / RAGDOLL =================
local function startAntiFling()
    if antiFlingConn then return end
    antiFlingConn = RunService.Heartbeat:Connect(function()
        if not Config.AntiFling then return end
        local hrp = getRoot()
        if not hrp then return end
        for _, v in ipairs(hrp:GetChildren()) do
            if v:IsA("BodyVelocity") or v:IsA("BodyAngularVelocity") then
                v:Destroy()
            end
        end
        if hrp.AssemblyAngularVelocity.Magnitude > 100 then
            hrp.AssemblyAngularVelocity = Vector3.zero
        end
    end)
end

local function startAntiVoid()
    if antiVoidConn then return end
    antiVoidConn = RunService.Heartbeat:Connect(function()
        if not Config.AntiVoid then return end
        local hrp = getRoot()
        if hrp and hrp.Position.Y < -50 then
            hrp.CFrame = CFrame.new(0, 100, 0)
            notify("🛡 Anti-Void!", GREEN)
        end
    end)
end

local function startAntiRagdoll()
    task.spawn(function()
        while gui.Parent do
            if Config.AntiRagdoll then
                local char = player.Character
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                if hum then
                    pcall(function()
                        if hum:GetState() == Enum.HumanoidStateType.Physics then
                            hum:ChangeState(Enum.HumanoidStateType.GettingUp)
                        end
                    end)
                end
            end
            task.wait(0.5)
        end
    end)
end

-- ================= FULLBRIGHT =================
local oldLighting = {}
local function setFullbright(state)
    if state then
        oldLighting = {
            Ambient = Lighting.Ambient,
            OutdoorAmbient = Lighting.OutdoorAmbient,
            Brightness = Lighting.Brightness,
            FogEnd = Lighting.FogEnd,
        }
        Lighting.Ambient = Color3.fromRGB(178, 178, 178)
        Lighting.OutdoorAmbient = Color3.fromRGB(178, 178, 178)
        Lighting.Brightness = 3
        Lighting.FogEnd = 100000
    else
        for k, v in pairs(oldLighting) do
            Lighting[k] = v
        end
    end
end

-- ================= CHAT SPAM =================
local function startChatSpam()
    task.spawn(function()
        while Config.ChatSpam and gui.Parent do
            pcall(function()
                local rs = game:GetService("ReplicatedStorage")
                local event = rs:FindFirstChild("DefaultChatSystemChatEvents")
                if event and event:FindFirstChild("SayMessageRequest") then
                    event.SayMessageRequest:FireServer(Config.ChatSpamText, "All")
                end
            end)
            task.wait(Config.ChatSpamDelay)
        end
    end)
end

-- ================= SOUND ESP =================
local soundESPInst
local function startSoundESP()
    if soundESPInst then soundESPInst:Destroy() end
    soundESPInst = Instance.new("Sound")
    soundESPInst.SoundId = "rbxassetid://9120386436"
    soundESPInst.Volume = Config.SoundESPVolume
    soundESPInst.Parent = SoundService
    task.spawn(function()
        local played = {}
        while gui.Parent do
            if Config.SoundESP then
                for _, other in ipairs(Players:GetPlayers()) do
                    if other ~= player then
                        local hrp = other.Character and other.Character:FindFirstChild("HumanoidRootPart")
                        local myRoot = getRoot()
                        if hrp and myRoot and not played[other] then
                            local d = (myRoot.Position - hrp.Position).Magnitude
                            if d < 100 then
                                played[other] = true
                                pcall(function() soundESPInst:Play() end)
                            end
                        end
                    end
                end
                task.wait(0.5)
            else
                task.wait(1)
            end
        end
    end)
end

-- ================= PLAYER LIST =================
local function openPlayerList()
    local old = gui:FindFirstChild("PlayerList")
    if old then old:Destroy(); return end

    local pl = Instance.new("Frame")
    pl.Name = "PlayerList"
    pl.Size = UDim2.fromOffset(260, 340)
    pl.Position = UDim2.new(0, 12, 0, 60)
    pl.BackgroundColor3 = BLACK
    pl.BorderSizePixel = 0
    pl.Parent = gui
    Instance.new("UICorner", pl).CornerRadius = UDim.new(0, 10)
    local s = Instance.new("UIStroke", pl)
    s.Color = Themes[Config.Theme].primary

    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, 0, 0, 30)
    t.BackgroundColor3 = Themes[Config.Theme].secondary
    t.Text = "📋 JOGADORES (" .. #Players:GetPlayers() .. ")"
    t.TextColor3 = Themes[Config.Theme].primary
    t.Font = Enum.Font.GothamBold
    t.TextSize = 12
    t.Parent = pl
    Instance.new("UICorner", t).CornerRadius = UDim.new(0, 10)

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.fromOffset(24, 24)
    closeBtn.Position = UDim2.new(1, -28, 0, 3)
    closeBtn.BackgroundColor3 = RED
    closeBtn.Text = "×"
    closeBtn.TextColor3 = WHITE
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 15
    closeBtn.Parent = pl
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)
    closeBtn.Activated:Connect(function() pl:Destroy() end)

    local sf = Instance.new("ScrollingFrame")
    sf.Size = UDim2.new(1, -8, 1, -38)
    sf.Position = UDim2.fromOffset(4, 34)
    sf.BackgroundTransparency = 1
    sf.BorderSizePixel = 0
    sf.ScrollBarThickness = 3
    sf.CanvasSize = UDim2.new()
    sf.AutomaticCanvasSize = Enum.AutomaticSize.Y
    sf.Parent = pl

    local l = Instance.new("UIListLayout")
    l.Padding = UDim.new(0, 4)
    l.Parent = sf

    local function refresh()
        for _, c in ipairs(sf:GetChildren()) do
            if c:IsA("TextButton") then c:Destroy() end
        end
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player then
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1, -4, 0, 30)
                btn.BackgroundColor3 = Color3.fromRGB(30, 20, 25)
                btn.Text = p.DisplayName .. " (@" .. p.Name .. ")"
                btn.TextColor3 = WHITE
                btn.TextSize = 10
                btn.Font = Enum.Font.GothamSemibold
                btn.TextXAlignment = Enum.TextXAlignment.Left
                btn.Parent = sf
                Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
                local pad = Instance.new("UIPadding", btn)
                pad.PaddingLeft = UDim.new(0, 8)

                btn.Activated:Connect(function()
                    local hrp = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
                    local myRoot = getRoot()
                    if hrp and myRoot then
                        myRoot.CFrame = CFrame.new(hrp.Position + Vector3.new(0, 3, 3))
                        notify("🌀 TP: " .. p.DisplayName, Themes[Config.Theme].primary)
                    end
                end)
            end
        end
    end
    refresh()
    task.spawn(function()
        while pl.Parent do
            task.wait(2)
            pcall(refresh)
        end
    end)
end

-- ================= WAYPOINTS =================
local function openWaypoints()
    local old = gui:FindFirstChild("Waypoints")
    if old then old:Destroy(); return end

    local wp = Instance.new("Frame")
    wp.Name = "Waypoints"
    wp.Size = UDim2.fromOffset(240, 260)
    wp.Position = UDim2.new(0.5, -120, 0.5, -130)
    wp.BackgroundColor3 = BLACK
    wp.BorderSizePixel = 0
    wp.Parent = gui
    Instance.new("UICorner", wp).CornerRadius = UDim.new(0, 10)
    local s = Instance.new("UIStroke", wp)
    s.Color = Themes[Config.Theme].primary

    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, 0, 0, 30)
    t.BackgroundColor3 = Themes[Config.Theme].secondary
    t.Text = "📍 WAYPOINTS"
    t.TextColor3 = Themes[Config.Theme].primary
    t.Font = Enum.Font.GothamBold
    t.TextSize = 12
    t.Parent = wp
    Instance.new("UICorner", t).CornerRadius = UDim.new(0, 10)

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.fromOffset(24, 24)
    closeBtn.Position = UDim2.new(1, -28, 0, 3)
    closeBtn.BackgroundColor3 = RED
    closeBtn.Text = "×"
    closeBtn.TextColor3 = WHITE
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 15
    closeBtn.Parent = wp
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)
    closeBtn.Activated:Connect(function() wp:Destroy() end)

    local addBtn = Instance.new("TextButton")
    addBtn.Size = UDim2.new(1, -8, 0, 28)
    addBtn.Position = UDim2.fromOffset(4, 34)
    addBtn.BackgroundColor3 = Themes[Config.Theme].primary
    addBtn.Text = "+ Salvar Local Atual"
    addBtn.TextColor3 = WHITE
    addBtn.Font = Enum.Font.GothamBold
    addBtn.TextSize = 10
    addBtn.Parent = wp
    Instance.new("UICorner", addBtn).CornerRadius = UDim.new(0, 6)

    local sf = Instance.new("ScrollingFrame")
    sf.Size = UDim2.new(1, -8, 1, -70)
    sf.Position = UDim2.fromOffset(4, 66)
    sf.BackgroundTransparency = 1
    sf.BorderSizePixel = 0
    sf.ScrollBarThickness = 3
    sf.CanvasSize = UDim2.new()
    sf.AutomaticCanvasSize = Enum.AutomaticSize.Y
    sf.Parent = wp

    local l = Instance.new("UIListLayout")
    l.Padding = UDim.new(0, 4)
    l.Parent = sf

    local function refresh()
        for _, c in ipairs(sf:GetChildren()) do
            if c:IsA("TextButton") then c:Destroy() end
        end
        for _, w in ipairs(Config.Waypoints) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -4, 0, 28)
            btn.BackgroundColor3 = Color3.fromRGB(30, 20, 25)
            btn.Text = w.name
            btn.TextColor3 = WHITE
            btn.TextSize = 10
            btn.Font = Enum.Font.GothamSemibold
            btn.TextXAlignment = Enum.TextXAlignment.Left
            btn.Parent = sf
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
            local pad = Instance.new("UIPadding", btn)
            pad.PaddingLeft = UDim.new(0, 8)

            btn.Activated:Connect(function()
                local root = getRoot()
                if root and w.pos then
                    root.CFrame = CFrame.new(w.pos)
                    notify("📍 " .. w.name, Themes[Config.Theme].primary)
                end
            end)
        end
    end

    addBtn.Activated:Connect(function()
        local root = getRoot()
        if not root then return end
        local name = "WP " .. (#Config.Waypoints + 1)
        table.insert(Config.Waypoints, {name = name, pos = root.Position})
        notify("💾 " .. name .. " salvo!", GREEN)
        refresh()
    end)

    refresh()
end

-- ================= KEYBIND CHANGER =================
local function openKeybindChanger()
    local old = gui:FindFirstChild("Keybinds")
    if old then old:Destroy(); return end

    local kb = Instance.new("Frame")
    kb.Name = "Keybinds"
    kb.Size = UDim2.fromOffset(280, 320)
    kb.Position = UDim2.new(0.5, -140, 0.5, -160)
    kb.BackgroundColor3 = BLACK
    kb.BorderSizePixel = 0
    kb.Parent = gui
    Instance.new("UICorner", kb).CornerRadius = UDim.new(0, 10)
    local s = Instance.new("UIStroke", kb)
    s.Color = Themes[Config.Theme].primary

    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, 0, 0, 30)
    t.BackgroundColor3 = Themes[Config.Theme].secondary
    t.Text = "⌨ KEYBINDS"
    t.TextColor3 = Themes[Config.Theme].primary
    t.Font = Enum.Font.GothamBold
    t.TextSize = 12
    t.Parent = kb
    Instance.new("UICorner", t).CornerRadius = UDim.new(0, 10)

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.fromOffset(24, 24)
    closeBtn.Position = UDim2.new(1, -28, 0, 3)
    closeBtn.BackgroundColor3 = RED
    closeBtn.Text = "×"
    closeBtn.TextColor3 = WHITE
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 15
    closeBtn.Parent = kb
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)
    closeBtn.Activated:Connect(function() kb:Destroy() end)

    local sf = Instance.new("ScrollingFrame")
    sf.Size = UDim2.new(1, -8, 1, -38)
    sf.Position = UDim2.fromOffset(4, 34)
    sf.BackgroundTransparency = 1
    sf.BorderSizePixel = 0
    sf.ScrollBarThickness = 3
    sf.CanvasSize = UDim2.new()
    sf.AutomaticCanvasSize = Enum.AutomaticSize.Y
    sf.Parent = kb

    local l = Instance.new("UIListLayout")
    l.Padding = UDim.new(0, 4)
    l.Parent = sf

    local keys = {"AimKey", "SilentKey", "SprintKey", "DashKey", "TriggerKey", "TeleportKey"}
    for _, keyName in ipairs(keys) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -4, 0, 30)
        btn.BackgroundColor3 = Color3.fromRGB(30, 20, 25)
        btn.Text = keyName .. ": [" .. tostring(Config[keyName].Name) .. "]"
        btn.TextColor3 = WHITE
        btn.TextSize = 10
        btn.Font = Enum.Font.GothamSemibold
        btn.Parent = sf
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)

        btn.Activated:Connect(function()
            btn.Text = keyName .. ": pressione..."
            local c
            c = UserInputService.InputBegan:Connect(function(input, gpe)
                if gpe then return end
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    Config[keyName] = input.KeyCode
                    btn.Text = keyName .. ": [" .. input.KeyCode.Name .. "]"
                    notify("⌨ " .. keyName .. " = " .. input.KeyCode.Name, GREEN)
                    c:Disconnect()
                end
            end)
        end)
    end
end

-- ================= UI BUILDERS =================
local function makeButton(label, callback, color)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -2, 0, 32)
    button.BackgroundColor3 = color or Color3.fromRGB(35, 20, 25)
    button.TextColor3 = WHITE
    button.Text = label
    button.TextSize = 11
    button.Font = Enum.Font.GothamSemibold
    button.AutoButtonColor = true
    button.Parent = content
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)
    local stroke = Instance.new("UIStroke")
    stroke.Color = Themes[Config.Theme].primary
    stroke.Transparency = 0.65
    stroke.Parent = button
    button.Activated:Connect(callback)
    return button
end

local function makeLabel(label)
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, -2, 0, 24)
    text.BackgroundTransparency = 1
    text.Text = label
    text.TextColor3 = Themes[Config.Theme].primary
    text.Font = Enum.Font.GothamBold
    text.TextSize = 11
    text.TextXAlignment = Enum.TextXAlignment.Left
    text.Parent = content
end

-- ================= SHOW TAB =================
local showTab

showTab = function(tab)
    currentTab = tab
    clearContent()

    if tab == "Movimento" then
        makeLabel("🏃 MOVIMENTO")
        makeButton("Velocidade: " .. Config.Speed, function()
            Config.Speed = Config.Speed >= 300 and 16 or Config.Speed + 4
            applyMovement(); showTab("Movimento")
        end)
        makeButton("Pulo: " .. Config.Jump, function()
            Config.Jump = Config.Jump >= 300 and 50 or Config.Jump + 10
            applyMovement(); showTab("Movimento")
        end)
        makeButton("Pulo Infinito: " .. (Config.InfiniteJump and "✔ ON" or "✘ OFF"), function()
            Config.InfiniteJump = not Config.InfiniteJump; showTab("Movimento")
        end)
        makeLabel("⚡ SPRINT / DASH")
        makeButton("Sprint: " .. (Config.Sprint and "✔ ON" or "✘ OFF"), function()
            Config.Sprint = not Config.Sprint
            if Config.Sprint then startSprint() end
            showTab("Movimento")
        end)
        makeButton("Dash", function() doDash() end)
        makeLabel("🌐 GRAVIDADE")
        makeButton("Gravidade: " .. math.floor(Config.Gravity), function()
            Config.Gravity = Config.Gravity >= 300 and 20 or Config.Gravity + 30
            workspace.Gravity = Config.Gravity
            showTab("Movimento")
        end)
        makeButton("Resetar Gravidade", function()
            Config.Gravity = 196.2; workspace.Gravity = 196.2; showTab("Movimento")
        end)
        makeLabel("🔓 NOCLIP")
        makeButton("Noclip: " .. (Config.Noclip and "✔ ON" or "✘ OFF"), function()
            Config.Noclip = not Config.Noclip
            if Config.Noclip then startNoclip() else stopNoclip() end
            showTab("Movimento")
        end)

    elseif tab == "Fly" then
        makeLabel("🕊 VOO")
        makeButton("Fly: " .. (Config.Fly and "✔ ON" or "✘ OFF"), function()
            Config.Fly = not Config.Fly
            if Config.Fly then startFly() else stopFly() end
            showTab("Fly")
        end)
        makeButton("Velocidade: " .. Config.FlySpeed, function()
            Config.FlySpeed = Config.FlySpeed >= 500 and 20 or Config.FlySpeed + 10
            showTab("Fly")
        end)
        makeButton("Subir (+)", function()
            local r = getRoot()
            if r and Config.Fly then
                r.AssemblyLinearVelocity = Vector3.new(r.AssemblyLinearVelocity.X, 50, r.AssemblyLinearVelocity.Z)
            end
        end)
        makeButton("Descer (-)", function()
            local r = getRoot()
            if r and Config.Fly then
                r.AssemblyLinearVelocity = Vector3.new(r.AssemblyLinearVelocity.X, -35, r.AssemblyLinearVelocity.Z)
            end
        end)

    elseif tab == "ESP" then
        makeLabel("👁 ESP")
        makeButton("ESP: " .. (Config.ESP and "✔ ON" or "✘ OFF"), function()
            Config.ESP = not Config.ESP
            if not Config.ESP then removeESP() end
            showTab("ESP")
        end)
        makeButton("Team Check: " .. (Config.ESPTeamCheck and "✔" or "✘"), function()
            Config.ESPTeamCheck = not Config.ESPTeamCheck; showTab("ESP")
        end)
        makeButton("Nomes: " .. (Config.ESPNames and "✔" or "✘"), function()
            Config.ESPNames = not Config.ESPNames; showTab("ESP")
        end)
        makeButton("Vida: " .. (Config.ESPHealth and "✔" or "✘"), function()
            Config.ESPHealth = not Config.ESPHealth; showTab("ESP")
        end)
        makeButton("Distância: " .. (Config.ESPDistance and "✔" or "✘"), function()
            Config.ESPDistance = not Config.ESPDistance; showTab("ESP")
        end)
        makeButton("Box: " .. (Config.ESPBox and "✔" or "✘"), function()
            Config.ESPBox = not Config.ESPBox; showTab("ESP")
        end)
        makeButton("Tracer: " .. (Config.ESPTracer and "✔" or "✘"), function()
            Config.ESPTracer = not Config.ESPTracer; showTab("ESP")
        end)
        makeButton("Através Paredes: " .. (Config.ESPThroughWalls and "✔" or "✘"), function()
            Config.ESPThroughWalls = not Config.ESPThroughWalls
            removeESP(); showTab("ESP")
        end)
        makeLabel("🔊 SOUND ESP")
        makeButton("Sound ESP: " .. (Config.SoundESP and "✔ ON" or "✘ OFF"), function()
            Config.SoundESP = not Config.SoundESP
            if Config.SoundESP then startSoundESP() end
            showTab("ESP")
        end)

    elseif tab == "Combate" then
        makeLabel("🎯 AIM ASSIST")
        makeButton("Aim: " .. (Config.Aim and "✔ ON" or "✘ OFF"), function()
            Config.Aim = not Config.Aim; showTab("Combate")
        end)
        makeButton("Silent Aim: " .. (Config.Silent and "✔ ON" or "✘ OFF"), function()
            Config.Silent = not Config.Silent
            notify("Silent: " .. (Config.Silent and "ON" or "OFF"), Config.Silent and GREEN or RED)
            showTab("Combate")
        end)
        makeButton("Predict: " .. (Config.AimPredict and "✔" or "✘"), function()
            Config.AimPredict = not Config.AimPredict; showTab("Combate")
        end)
        makeButton("Prioridade: " .. Config.AimPriority, function()
            local opts = {"FOV", "Distance", "Health"}
            local i = 1
            for k, v in ipairs(opts) do if v == Config.AimPriority then i = k break end end
            Config.AimPriority = opts[(i % #opts) + 1]
            showTab("Combate")
        end)
        makeButton("Team Check: " .. (Config.AimTeamCheck and "✔" or "✘"), function()
            Config.AimTeamCheck = not Config.AimTeamCheck; showTab("Combate")
        end)
        makeButton("Wallbang: " .. (Config.Wallbang and "✔" or "✘"), function()
            Config.Wallbang = not Config.Wallbang; showTab("Combate")
        end)
        makeButton("Alvo: " .. Config.AimPart, function()
            Config.AimPart = Config.AimPart == "Head" and "Torso" or "Head"
            showTab("Combate")
        end)
        makeButton("Distância: " .. Config.AimDistance, function()
            Config.AimDistance = Config.AimDistance >= 2000 and 100 or Config.AimDistance + 100
            showTab("Combate")
        end)
        makeButton("Smooth: " .. math.floor(Config.AimSpeed * 100) .. "%", function()
            Config.AimSpeed = Config.AimSpeed >= 1 and 0.1 or Config.AimSpeed + 0.1
            showTab("Combate")
        end)
        makeButton("FOV: " .. Config.FOV, function()
            Config.FOV = Config.FOV >= 800 and 80 or Config.FOV + 40
            showTab("Combate")
        end)

        makeLabel("🔫 TRIGGER BOT")
        makeButton("Trigger Bot: " .. (Config.TriggerBot and "✔ ON" or "✘ OFF"), function()
            Config.TriggerBot = not Config.TriggerBot; showTab("Combate")
        end)

        makeLabel("⚔ KILL AURA")
        makeButton("Kill Aura: " .. (Config.KillAura and "✔ ON" or "✘ OFF"), function()
            Config.KillAura = not Config.KillAura
            notify("Kill Aura: " .. (Config.KillAura and "ON" or "OFF"), Config.KillAura and GREEN or RED)
            showTab("Combate")
        end)
        makeButton("KA Range: " .. Config.KillAuraRange, function()
            Config.KillAuraRange = Config.KillAuraRange >= 100 and 5 or Config.KillAuraRange + 5
            showTab("Combate")
        end)

        makeLabel("🛡 AUTO PARRY")
        makeButton("Auto Parry: " .. (Config.AutoParry and "✔ ON" or "✘ OFF"), function()
            Config.AutoParry = not Config.AutoParry
            if Config.AutoParry then startAutoParry() else stopAutoParry() end
            showTab("Combate")
        end)
        makeButton("Parry Range: " .. Config.AutoParryRange, function()
            Config.AutoParryRange = Config.AutoParryRange >= 50 and 5 or Config.AutoParryRange + 5
            showTab("Combate")
        end)

    elseif tab == "Farm" then
        makeLabel("🌾 AUTO FARM")
        makeButton("Auto Farm: " .. (Config.AutoFarm and "✔ ON" or "✘ OFF"), function()
            Config.AutoFarm = not Config.AutoFarm
            notify("Farm: " .. (Config.AutoFarm and "ON" or "OFF"), Config.AutoFarm and GREEN or RED)
            showTab("Farm")
        end)
        makeButton("Farm Range: " .. Config.AutoFarmRange, function()
            Config.AutoFarmRange = Config.AutoFarmRange >= 300 and 20 or Config.AutoFarmRange + 20
            showTab("Farm")
        end)
        makeLabel("🧲 AUTO COLLECT")
        makeButton("Auto Collect: " .. (Config.AutoCollect and "✔ ON" or "✘ OFF"), function()
            Config.AutoCollect = not Config.AutoCollect; showTab("Farm")
        end)
        makeButton("Collect Range: " .. Config.AutoCollectRange, function()
            Config.AutoCollectRange = Config.AutoCollectRange >= 100 and 10 or Config.AutoCollectRange + 10
            showTab("Farm")
        end)
        makeLabel("📋 JOGADORES")
        makeButton("Abrir Lista", function() openPlayerList() end)
        makeButton("Teleportar Mais Próximo", function()
            local myRoot = getRoot()
            if not myRoot then return end
            local closest, dist = nil, math.huge
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= player then
                    local hrp = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local d = (myRoot.Position - hrp.Position).Magnitude
                        if d < dist then dist = d; closest = hrp end
                    end
                end
            end
            if closest then
                myRoot.CFrame = CFrame.new(closest.Position + Vector3.new(0, 3, 3))
                notify("🌀 TP mais próximo", Themes[Config.Theme].primary)
            end
        end)
        makeLabel("📍 WAYPOINTS")
        makeButton("Abrir Waypoints", function() openWaypoints() end)

    elseif tab == "Proteção" then
        makeLabel("🛡 PROTEÇÃO")
        makeButton("Anti-Fling: " .. (Config.AntiFling and "✔ ON" or "✘ OFF"), function()
            Config.AntiFling = not Config.AntiFling
            if Config.AntiFling then startAntiFling() end
            showTab("Proteção")
        end)
        makeButton("Anti-Void: " .. (Config.AntiVoid and "✔ ON" or "✘ OFF"), function()
            Config.AntiVoid = not Config.AntiVoid
            if Config.AntiVoid then startAntiVoid() end
            showTab("Proteção")
        end)
        makeButton("Anti-Ragdoll: " .. (Config.AntiRagdoll and "✔ ON" or "✘ OFF"), function()
            Config.AntiRagdoll = not Config.AntiRagdoll
            if Config.AntiRagdoll then startAntiRagdoll() end
            showTab("Proteção")
        end)
        makeButton("Reset Personagem", function()
            local hum = getHumanoid()
            if hum then hum.Health = 0 end
        end)

    elseif tab == "Misc" then
        makeLabel("⚙ MISC")
        makeButton("Anti-AFK: " .. (Config.AntiAFK and "✔ ON" or "✘ OFF"), function()
            Config.AntiAFK = not Config.AntiAFK; showTab("Misc")
        end)
        makeButton("Notificações: " .. (Config.Notifications and "✔" or "✘"), function()
            Config.Notifications = not Config.Notifications; showTab("Misc")
        end)
        makeButton("Watermark + Radar: " .. (Config.Watermark and "✔" or "✘"), function()
            Config.Watermark = not Config.Watermark; showTab("Misc")
        end)
        makeButton("Fullbright: " .. (Config.Fullbright and "✔ ON" or "✘ OFF"), function()
            Config.Fullbright = not Config.Fullbright
            setFullbright(Config.Fullbright)
            showTab("Misc")
        end)
        makeLabel("💬 CHAT SPAM")
        makeButton("Chat Spam: " .. (Config.ChatSpam and "✔ ON" or "✘ OFF"), function()
            Config.ChatSpam = not Config.ChatSpam
            if Config.ChatSpam then startChatSpam() end
            showTab("Misc")
        end)
        makeButton("Delay: " .. Config.ChatSpamDelay .. "s", function()
            Config.ChatSpamDelay = Config.ChatSpamDelay >= 10 and 1 or Config.ChatSpamDelay + 1
            showTab("Misc")
        end)
        makeLabel("🎨 TEMA")
        for name in pairs(Themes) do
            makeButton((Config.Theme == name and "✔ " or "") .. name, function()
                applyTheme(name)
                showTab("Misc")
            end)
        end
        makeLabel("🔧 UI")
        makeButton("Keybind Changer", function() openKeybindChanger() end)
        makeButton("Reset Kill Counter (" .. Config.KillCounter .. ")", function()
            Config.KillCounter = 0; showTab("Misc")
        end)

    elseif tab == "Config" then
        makeLabel("💾 CONFIG")
        makeButton("Salvar Config", function()
            if writefile then
                local ok, err = pcall(function()
                    local save = {}
                    for k, v in pairs(Config) do
                        if k == "Waypoints" then
                            save[k] = v
                        elseif typeof(v) == "EnumItem" then
                            save[k] = {__enum = tostring(v), __type = "Enum"}
                        else
                            save[k] = v
                        end
                    end
                    writefile("SukunaHubV62.json", HttpService:JSONEncode(save))
                end)
                if ok then notify("✔ Config salva!", GREEN)
                else notify("✘ Erro: " .. tostring(err), RED) end
            else
                notify("✘ Sem writefile", RED)
            end
        end)
        makeButton("Carregar Config", function()
            if readfile and isfile and isfile("SukunaHubV62.json") then
                local ok, data = pcall(function()
                    return HttpService:JSONDecode(readfile("SukunaHubV62.json"))
                end)
                if ok and type(data) == "table" then
                    for k, v in pairs(data) do
                        if type(v) == "table" and v.__enum then
                            for _, key in ipairs(Enum.KeyCode:GetEnumItems()) do
                                if key.Name == v.__enum then
                                    Config[k] = key
                                    break
                                end
                            end
                        elseif Config[k] ~= nil then
                            Config[k] = v
                        end
                    end
                    applyMovement()
                    notify("✔ Config carregada!", GREEN)
                    showTab("Config")
                else
                    notify("✘ Erro ao ler", RED)
                end
            else
                notify("✘ Arquivo não encontrado", RED)
            end
        end)
        makeButton("Centralizar Painel", function()
            main.Position = UDim2.new(0.5, -PANEL_W/2, 0.5, -PANEL_H/2)
        end)
        makeButton("Fechar Painel", function()
            main.Visible = false; openButton.Visible = true
        end)
    end
end

-- ================= TAB BUTTONS =================
local function makeTabButton(name)
    local button = Instance.new("TextButton")
    button.BackgroundColor3 = (name == currentTab) and Themes[Config.Theme].primary or Color3.fromRGB(35, 25, 29)
    button.Text = name
    button.TextColor3 = WHITE
    button.TextSize = 9
    button.Font = Enum.Font.GothamBold
    button.Parent = tabsFrame
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 5)

    button.Activated:Connect(function()
        for _, item in ipairs(tabsFrame:GetChildren()) do
            if item:IsA("TextButton") then
                item.BackgroundColor3 = Color3.fromRGB(35, 25, 29)
            end
        end
        button.BackgroundColor3 = Themes[Config.Theme].primary
        showTab(name)
    end)
end

for _, name in ipairs({"Movimento", "Fly", "ESP", "Combate", "Farm", "Proteção", "Misc", "Config"}) do
    makeTabButton(name)
end

-- ================= DRAG =================
local dragging, dragStart, startPosition

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPosition = main.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
    or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(
            startPosition.X.Scale, startPosition.X.Offset + delta.X,
            startPosition.Y.Scale, startPosition.Y.Offset + delta.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

close.Activated:Connect(function()
    main.Visible = false; openButton.Visible = true
end)

openButton.Activated:Connect(function()
    main.Visible = not main.Visible
    openButton.Visible = not main.Visible
end)

-- ================= BINDS =================
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.UserInputType ~= Enum.UserInputType.Keyboard then return end

    if input.KeyCode == Config.AimKey then
        Config.Aim = not Config.Aim
        notify("Aim: " .. (Config.Aim and "ON" or "OFF"), Config.Aim and GREEN or RED)
        if currentTab == "Combate" then showTab("Combate") end
    end

    if input.KeyCode == Config.SilentKey then
        Config.Silent = not Config.Silent
        notify("Silent: " .. (Config.Silent and "ON" or "OFF"), Config.Silent and GREEN or RED)
        if currentTab == "Combate" then showTab("Combate") end
    end

    if input.KeyCode == Enum.KeyCode.F then
        Config.Fly = not Config.Fly
        if Config.Fly then startFly() else stopFly() end
        notify("Fly: " .. (Config.Fly and "ON" or "OFF"), Config.Fly and GREEN or RED)
        if currentTab == "Fly" then showTab("Fly") end
    end

    if input.KeyCode == Enum.KeyCode.N then
        Config.Noclip = not Config.Noclip
        if Config.Noclip then startNoclip() else stopNoclip() end
        notify("Noclip: " .. (Config.Noclip and "ON" or "OFF"), Config.Noclip and GREEN or RED)
        if currentTab == "Movimento" then showTab("Movimento") end
    end

    if input.KeyCode == Config.DashKey then doDash() end

    if input.KeyCode == Config.TeleportKey then
        local myRoot = getRoot()
        if not myRoot then return end
        local closest, dist = nil, math.huge
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player then
                local hrp = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local d = (myRoot.Position - hrp.Position).Magnitude
                    if d < dist then dist = d; closest = hrp end
                end
            end
        end
        if closest then
            myRoot.CFrame = CFrame.new(closest.Position + Vector3.new(0, 3, 3))
            notify("🌀 TP mais próximo", Themes[Config.Theme].primary)
        end
    end

    if input.KeyCode == Enum.KeyCode.P then openPlayerList() end

    if input.KeyCode == Enum.KeyCode.RightShift then
        main.Visible = not main.Visible
        openButton.Visible = not main.Visible
    end

    if input.KeyCode == Enum.KeyCode.RightControl then
        Config.Aim = false
        Config.Silent = false
        Config.Fly = false
        Config.Noclip = false
        Config.KillAura = false
        Config.ESP = false
        stopFly()
        stopNoclip()
        removeESP()
        notify("🛑 PANIC — tudo desligado!", RED)
    end
end)

-- ================= LOOPS =================
RunService.RenderStepped:Connect(function(dt)
    camera = workspace.CurrentCamera or camera
    local vp = camera.ViewportSize

    local fovUse = Config.FOV
    if Config.AimAutoFOV then
        local root = getRoot()
        if root then
            fovUse = math.clamp(600 - root.Position.Y * 0.5, 80, 500)
        end
    end
    fovCircle.Position = UDim2.fromOffset(vp.X / 2, vp.Y / 2)
    fovCircle.Size = UDim2.fromOffset(fovUse, fovUse)
    fovCircle.Visible = Config.FOVVisible and (Config.Aim or Config.Silent)
    fovStroke.Color = Themes[Config.Theme].primary

    if Config.Aim then
        local part, pos = getNearestTarget(Config.AimDistance, Config.AimTeamCheck)
        if part and pos then
            local desired = CFrame.lookAt(camera.CFrame.Position, pos)
            local alpha = math.clamp(Config.AimSpeed * dt * 60, 0.01, 1)
            camera.CFrame = camera.CFrame:Lerp(desired, alpha)
        end
    end
end)

-- Watermark loop
task.spawn(function()
    while gui.Parent do
        watermark.Visible = Config.Watermark
        if Config.Watermark then
            local dt = RunService.RenderStepped:Wait()
            local fps = math.floor(1 / math.max(dt, 0.001))
            local ping = math.floor(player:GetNetworkPing() * 1000)
            watermark.Text = string.format("🩸 v6.2 | %d FPS | %dms | 💀%d | %dP", fps, ping, Config.KillCounter, #Players:GetPlayers())
            watermark.TextColor3 = Themes[Config.Theme].primary
        else
            task.wait(0.5)
        end
    end
end)

-- Radar loop
task.spawn(function()
    while gui.Parent do
        radar.Visible = Config.Watermark
        if Config.Watermark then
            radarStroke.Color = Themes[Config.Theme].primary
            radarTitle.TextColor3 = Themes[Config.Theme].primary

            local myRoot = getRoot()
            if myRoot then
                local active = {}
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= player then
                        local hrp = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            active[p] = true
                            if not radarDots[p] then
                                local dot = Instance.new("Frame")
                                dot.Size = UDim2.fromOffset(6, 6)
                                dot.AnchorPoint = Vector2.new(0.5, 0.5)
                                dot.BackgroundColor3 = RED
                                dot.BorderSizePixel = 0
                                dot.Parent = radar
                                Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
                                radarDots[p] = dot
                            end
                            local offset = hrp.Position - myRoot.Position
                            local dist = Vector3.new(offset.X, 0, offset.Z).Magnitude
                            if dist <= radarRange then
                                local rel = camera.CFrame:VectorToObjectSpace(offset)
                                local x = math.clamp(rel.X / radarRange, -1, 1) * 50
                                local y = math.clamp(rel.Z / radarRange, -1, 1) * 50
                                radarDots[p].Position = UDim2.new(0.5, x, 0.5, y + 8)
                                radarDots[p].Visible = true
                            else
                                radarDots[p].Visible = false
                            end
                        end
                    end
                end
                for p, dot in pairs(radarDots) do
                    if not active[p] then
                        dot:Destroy()
                        radarDots[p] = nil
                    end
                end
            end
        end
        task.wait(0.1)
    end
end)

-- ESP loop
task.spawn(function()
    while gui.Parent do
        pcall(updateESP)
        task.wait(0.1)
    end
end)

-- Kill Aura loop
task.spawn(function()
    while gui.Parent do
        if Config.KillAura then
            pcall(updateKillAura)
            task.wait(Config.KillAuraDelay)
        else
            task.wait(0.5)
        end
    end
end)

-- Auto Farm loop
task.spawn(function()
    while gui.Parent do
        if Config.AutoFarm then
            pcall(updateAutoFarm)
            task.wait(0.1)
        else
            task.wait(0.5)
        end
    end
end)

-- Auto Collect loop
task.spawn(function()
    while gui.Parent do
        if Config.AutoCollect then
            pcall(updateAutoCollect)
            task.wait(0.3)
        else
            task.wait(0.5)
        end
    end
end)

-- Trigger Bot loop
task.spawn(function()
    while gui.Parent do
        if Config.TriggerBot then
            pcall(updateTriggerBot)
        end
        task.wait(0.05)
    end
end)

-- Kill Counter
task.spawn(function()
    while gui.Parent do
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player then
                local hum = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
                if hum then
                    local h = hum.Health
                    if lastHealth[p] and lastHealth[p] > 0 and h <= 0 then
                        Config.KillCounter = Config.KillCounter + 1
                    end
                    lastHealth[p] = h
                end
            end
        end
        task.wait(0.3)
    end
end)

-- Infinite jump
UserInputService.JumpRequest:Connect(function()
    if Config.InfiniteJump then
        local hum = getHumanoid()
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

-- Anti-AFK
if VirtualUser then
    player.Idled:Connect(function()
        if not Config.AntiAFK then return end
        pcall(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end)
end

-- Respawn
player.CharacterAdded:Connect(function()
    task.wait(0.5)
    applyMovement()
    if Config.Fly then Config.Fly = false; stopFly() end
    if Config.Noclip then startNoclip() end
end)

if player.Character then
    task.spawn(applyMovement)
end

-- ================= INIT =================
showTab("Movimento")
notify("🩸 SUKUNA HUB v6.2 SUPREMO!", RED)
task.wait(0.5)
notify("F:Fly N:Noclip Q:Aim E:Silent X:Dash T:TP", YELLOW)
task.wait(0.5)
notify("V:Trigger P:Players RightShift:Menu RightCtrl:PANIC", CYAN)

print("🩸 SUKUNA HUB v6.2 SUPREMO carregado!")
