print("[RX] Loading...")
local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer
local pg = player:WaitForChild("PlayerGui")

local old = pg:FindFirstChild("BodyBasilRX") if old then old:Destroy() end
local oldS = SoundService:FindFirstChild("BodyBasilRXMusic") if oldS then oldS:Destroy() end

local RED, DARK, PANEL, WHITE, GRAY, GREEN, GOLD, BLACK = Color3.fromRGB(190,20,45), Color3.fromRGB(18,18,23), Color3.fromRGB(32,32,40), Color3.fromRGB(255,255,255), Color3.fromRGB(160,160,170), Color3.fromRGB(30,150,85), Color3.fromRGB(190,160,50), Color3.fromRGB(10,10,10)

local musicString = "87361483652743,94229502650041,123244893615420,123511627553696,129098116998483,136932193331774,103409297553965,14145620056,125476440612900,95131770144654,139266399633943,119598380829349,140504265985079,85735197482652,140158652733698,128510578554487,128438366056581,77701977147898,140691985128867,139777823649977,137296865428573,92299938059573,134434412138800,108154450229025,138915681911522,135862064486942,140215257631273,140439256760765,139904111224548,138178180069464,136674057014960,102866809292046,126132092368935,131866006114988,140134130458943,140667339171815,134366188285514,140254463357652,134289279929880,74793860481732,127741614429245,114788894326738,78571301330361,136350225160627,140415473717614,71044023212052,71659730326072,135822443550596,99979837873059,140179571050556,101382134303698,128598190743578,133872159686728,140269857340979,71551309767068,79029575185337,118659968747915,114152684566510,139742201959014,131732248464220,95924518033822,139364733224542,136259851989379,133761848795389,125080074540092,89449802432408,138608395929191,101554751678049,109662743902778,108607548201778,129794577122360,114525275626826,73460666355457,134653609966867,139161205970637,135209837340816,132045045896336,134406710152287,137691412494086,128825897988432,129870811738706,140580823167015,138595535774575,92045878932953,74339364466686,104918743319996,111921203483149,116690587449059,84911925564617,112382718143604,126617625293761,104185011771893,101659475300792,128386068316811,137589724762757,135101066737097,118959016267248,119560785746143,137032467545645,92040177250773,98345964392748,103445348511856,140704128008979,130367831349871,134839199346188,115975132179972,95307587881792,107923689617410,100064822066230,115175275895587,93202214051700,122709835629172,112616554326917,106354339081280,80756640219716,116824418547083,96759658390084,71718873161287,72793675791485,85742937376358,98116708399138,125189133330380,137002624017447,123039027577735,121868316988947,14145624031,14145625078,14145623221,14145626111,14145627474,14145619304,14145619621,112143944982807,110819538477291,89468541981273,114301377310331,93712926710253,74817280893051,133498554139200,104880194210827,112903678064836,120138115344262,88641227039807,86154690578670,130633105268814,73066714924090,137135395010424,97231051040304,126291069838831,128809761213710,119936139925486,77428091165211,125498129824026,107808879439303,71155117988517,74366765967475,99536765967475,129154320419135,70626485375251,74697049223758,122578964492158,98337901681441,82042384271740,86226885334711,79314929106323,86545615838028,139105356757739,107424491541808,118606765652831,121330021284263,131695135737032,93627775492676,109805678713575,77791377297002,103183298894656,132498452685473,98387577045573,85773798853470,107820557040384,107650199947846,112043715643271,71123357599630,83081904363818,135286582331883,130581028268522,86839065790068,132551342931479,97108775635938,88038595663211,79689519382685,110778188531582,127388462601694,16190760005,1837015626,17422074849,128011871344522,123055942415853,86412047196482,18841891575,90521568613709"
local musicList = string.split(musicString, ",")

local function cor(o, r) local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0, r or 8) c.Parent = o return c end
local function str(o, c, t) local s = Instance.new("UIStroke") s.Color = c or RED s.Thickness = t or 1 s.Parent = o return s end
local function pill(b) local c = b:FindFirstChildOfClass("UICorner") if c then c.CornerRadius = UDim.new(1, 0) end end
local function lbl(p, txt, s, ps, ts) local l = Instance.new("TextLabel") l.BackgroundTransparency = 1 l.Size = s l.Position = ps l.Text = txt l.TextColor3 = WHITE l.TextSize = ts or 14 l.Font = Enum.Font.GothamBold l.TextWrapped = true l.Parent = p return l end
local function btn(p, txt, s, ps, c) local b = Instance.new("TextButton") b.Size = s b.Position = ps b.BackgroundColor3 = c or PANEL b.Text = txt b.TextColor3 = WHITE b.TextSize = 14 b.Font = Enum.Font.GothamBold b.AutoButtonColor = true b.Parent = p cor(b, 7) return b end

local function drag(f, a)
    local d, ds, sp = false, nil, nil
    a.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            local t = i.Target
            if t and (t:IsA("TextButton") or t:IsA("ImageButton") or t:IsA("TextBox")) then return end
            d = true ds = i.Position sp = f.Position
            i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then d = false end end)
        end
    end)
    UIS.InputChanged:Connect(function(i)
        if not d then return end
        if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then
            local x = i.Position - ds
            f.Position = UDim2.new(sp.X.Scale, sp.X.Offset + x.X, sp.Y.Scale, sp.Y.Offset + x.Y)
        end
    end)
end

local gui = Instance.new("ScreenGui") gui.Name = "BodyBasilRX" gui.ResetOnSpawn = false gui.IgnoreGuiInset = true gui.DisplayOrder = 50 gui.Parent = pg
local sound = Instance.new("Sound") sound.Name = "BodyBasilRXMusic" sound.Volume = 0.5 sound.Looped = true sound.Parent = SoundService

local main = Instance.new("Frame") main.Size = UDim2.fromOffset(330, 285) main.Position = UDim2.new(0.5, -165, 0.5, -142) main.BackgroundColor3 = DARK main.BorderSizePixel = 0 main.Active = true main.Parent = gui cor(main, 12) str(main, RED, 2)

local hdr = Instance.new("Frame") hdr.Size = UDim2.new(1, 0, 0, 40) hdr.BackgroundColor3 = RED hdr.BorderSizePixel = 0 hdr.ZIndex = 5 hdr.Parent = main cor(hdr, 10)
local ttl = lbl(hdr, "عمك بودي يا باسل RX 🩸", UDim2.new(1, -85, 1, 0), UDim2.fromOffset(10, 0), 14) ttl.TextXAlignment = Enum.TextXAlignment.Left ttl.ZIndex = 6

local minB = btn(hdr, "-", UDim2.fromOffset(30, 28), UDim2.new(1, -68, 0, 6), PANEL) minB.TextSize = 22 minB.ZIndex = 6
local clsB = btn(hdr, "X", UDim2.fromOffset(28, 28), UDim2.new(1, -34, 0, 6), Color3.fromRGB(100, 15, 25)) clsB.ZIndex = 6
drag(main, hdr)

local tbM = btn(main, "الموسيقى | Music", UDim2.fromOffset(85, 35), UDim2.new(1, 0, 0, 10), GOLD) tbM.TextColor3 = BLACK tbM.ZIndex = 10
local tbA = btn(main, "الانيميشن | Anim", UDim2.fromOffset(85, 35), UDim2.new(1, 0, 0, 55), DARK) tbA.ZIndex = 10
local tbAd = btn(main, "اوامر الادمن | Admin", UDim2.fromOffset(85, 35), UDim2.new(1, 0, 0, 100), DARK) tbAd.ZIndex = 10

local pgM = Instance.new("Frame") pgM.Size = UDim2.new(1, 0, 1, 0) pgM.BackgroundTransparency = 1 pgM.Parent = main
local pgA = Instance.new("Frame") pgA.Size = UDim2.new(1, 0, 1, 0) pgA.BackgroundTransparency = 1 pgA.Visible = false pgA.Parent = main
local pgAd = Instance.new("Frame") pgAd.Size = UDim2.new(1, 0, 1, 0) pgAd.BackgroundTransparency = 1 pgAd.Visible = false pgAd.Parent = main

local animL = false
local function swt(t)
    pgM.Visible = t == "M" pgA.Visible = t == "A" pgAd.Visible = t == "Ad"
    tbM.BackgroundColor3 = t == "M" and GOLD or DARK tbM.TextColor3 = t == "M" and BLACK or WHITE
    tbA.BackgroundColor3 = t == "A" and GOLD or DARK tbA.TextColor3 = t == "A" and BLACK or WHITE
    tbAd.BackgroundColor3 = t == "Ad" and GOLD or DARK tbAd.TextColor3 = t == "Ad" and BLACK or WHITE
    if t == "A" and not animL then animL = true pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/BundleAnimations.lua"))() end) end
end
tbM.Activated:Connect(function() swt("M") end) tbA.Activated:Connect(function() swt("A") end) tbAd.Activated:Connect(function() swt("Ad") end)

local sInd = 1
local sBtn = btn(pgM, "", UDim2.new(1, -20, 0, 34), UDim2.fromOffset(10, 49), PANEL) pill(sBtn) str(sBtn, RED, 1)
local function upS() sBtn.Text = "🎵 MUSIC " .. sInd .. "/" .. #musicList .. " | ID: " .. musicList[sInd] end upS()

local cBox = Instance.new("TextBox") cBox.Size = UDim2.new(1, -20, 0, 32) cBox.Position = UDim2.fromOffset(10, 89) cBox.BackgroundColor3 = PANEL cBox.TextColor3 = WHITE cBox.PlaceholderColor3 = GRAY cBox.PlaceholderText = "اكتب Music ID هنا (اختياري)" cBox.Text = "" cBox.ClearTextOnFocus = false cBox.TextSize = 13 cBox.Font = Enum.Font.Gotham cBox.Parent = pgM cor(cBox, 7) pill(cBox) str(cBox, RED, 1)

local pTg = btn(pgM, "تكبير", UDim2.fromOffset(52, 34), UDim2.new(0, -58, 0, 49), RED)
local pkr = Instance.new("Frame") pkr.Size = UDim2.fromOffset(230, 300) pkr.Position = UDim2.new(0, -238, 0, 88) pkr.BackgroundColor3 = DARK pkr.BorderSizePixel = 0 pkr.Visible = false pkr.ZIndex = 5 pkr.Parent = pgM cor(pkr, 10) str(pkr, RED, 2)
local pTtl = lbl(pkr, "اختار الموسيقى 1 - " .. #musicList, UDim2.new(1, -12, 0, 32), UDim2.fromOffset(6, 4), 13) pTtl.ZIndex = 6

local lF = Instance.new("ScrollingFrame") lF.Size = UDim2.new(1, -12, 1, -44) lF.Position = UDim2.fromOffset(6, 38) lF.BackgroundColor3 = PANEL lF.BorderSizePixel = 0 lF.ScrollBarThickness = 5 lF.ScrollBarImageColor3 = RED lF.CanvasSize = UDim2.new(0, 0, 0, 0) lF.AutomaticCanvasSize = Enum.AutomaticSize.Y lF.ZIndex = 6 lF.Parent = pkr cor(lF, 7)
local lLay = Instance.new("UIListLayout") lLay.Padding = UDim.new(0, 5) lLay.Parent = lF
local lPad = Instance.new("UIPadding") lPad.PaddingTop = UDim.new(0, 5) lPad.PaddingBottom = UDim.new(0, 5) lPad.PaddingLeft = UDim.new(0, 5) lPad.PaddingRight = UDim.new(0, 5) lPad.Parent = lF

local mB = {}
local function selM(i)
    if i < 1 or i > #musicList then return end
    sInd = i cBox.Text = "" upS()
    for j, b in ipairs(mB) do b.BackgroundColor3 = j == sInd and RED or DARK end
    pkr.Visible = false
end

for i, m in ipairs(musicList) do
    local e = Instance.new("TextButton") e.Size = UDim2.new(1, -4, 0, 49) e.BackgroundColor3 = i == sInd and RED or DARK e.BorderSizePixel = 0 e.Text = "" e.LayoutOrder = i e.AutoButtonColor = true e.ZIndex = 7 e.Parent = lF cor(e, 6)
    local n = lbl(e, "MUSIC " .. i, UDim2.new(1, -12, 0, 20), UDim2.fromOffset(6, 2), 12) n.TextXAlignment = Enum.TextXAlignment.Left n.ZIndex = 8
    local idl = lbl(e, m, UDim2.new(1, -12, 0, 20), UDim2.fromOffset(6, 24), 11) idl.TextColor3 = Color3.fromRGB(220, 220, 220) idl.TextXAlignment = Enum.TextXAlignment.Left idl.ZIndex = 8
    mB[i] = e
    e.Activated:Connect(function() selM(i) end)
end
pTg.Activated:Connect(function() pkr.Visible = not pkr.Visible end) sBtn.Activated:Connect(function() pkr.Visible = not pkr.Visible end)

local vol = 50
local vLbl = lbl(pgM, "الصوت: 50", UDim2.new(1, -20, 0, 16), UDim2.fromOffset(10, 125), 13) vLbl.TextXAlignment = Enum.TextXAlignment.Left
local sH = Instance.new("Frame") sH.Size = UDim2.new(1, -20, 0, 22) sH.Position = UDim2.fromOffset(10, 146) sH.BackgroundTransparency = 1 sH.Parent = pgM
local sT = Instance.new("Frame") sT.Size = UDim2.new(1, -20, 0, 8) sT.Position = UDim2.new(0, 10, 0.5, -4) sT.BackgroundColor3 = PANEL sT.BorderSizePixel = 0 sT.Parent = sH cor(sT, 4) str(sT, RED, 1)
local sF = Instance.new("Frame") sF.Size = UDim2.new(vol / 200, 0, 1, 0) sF.BackgroundColor3 = RED sF.BorderSizePixel = 0 sF.Parent = sT cor(sF, 4)
local sK = Instance.new("Frame") sK.Size = UDim2.fromOffset(18, 18) sK.AnchorPoint = Vector2.new(0.5, 0.5) sK.Position = UDim2.new(vol / 200, 0, 0.5, 0) sK.BackgroundColor3 = WHITE sK.ZIndex = 2 sK.Parent = sH cor(sK, 9) str(sK, RED, 2)

local function setV(v)
    vol = math.clamp(math.floor(v + 0.5), 0, 200) sound.Volume = vol / 100
    vLbl.Text = "الصوت: " .. vol sF.Size = UDim2.new(vol / 200, 0, 1, 0) sK.Position = UDim2.new(vol / 200, 0, 0.5, 0)
end
local dV = false
local function updV(x)
    local p, w = sT.AbsolutePosition.X, sT.AbsoluteSize.X
    if w <= 0 then return end
    setV(math.clamp((x - p) / w, 0, 1) * 200)
end
sT.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dV = true updV(i.Position.X) end end)
sK.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dV = true end end)
UIS.InputChanged:Connect(function(i) if dV and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then updV(i.Position.X) end end)
UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dV = false end end)
setV(50)

local pB = btn(pgM, "▶ تشغيل", UDim2.new(0.5, -15, 0, 34), UDim2.fromOffset(10, 174), GREEN) pill(pB) str(pB, Color3.fromRGB(60, 200, 120), 1)
local stB = btn(pgM, "■ إيقاف", UDim2.new(0.5, -15, 0, 34), UDim2.new(0.5, 5, 0, 174), RED) pill(stB) str(stB, Color3.fromRGB(230, 60, 80), 1)
local stF = Instance.new("Frame") stF.Size = UDim2.new(1, -20, 0, 26) stF.Position = UDim2.fromOffset(10, 218) stF.BackgroundColor3 = PANEL stF.BorderSizePixel = 0 stF.Parent = pgM cor(stF, 13) str(stF, Color3.fromRGB(70, 70, 85), 1)
local stL = lbl(stF, "جاهز للتشغيل", UDim2.new(1, 0, 1, 0), UDim2.fromOffset(0, 0), 12) stL.TextColor3 = GRAY

pB.Activated:Connect(function()
    local c = cBox.Text:gsub("%s+", "")
    local id = (c ~= "" and c:match("^%d+$")) and c or (c == "" and musicList[sInd])
    if not id then stL.Text = "ID غير صحيح" stL.TextColor3 = RED return end
    sound:Stop() sound.SoundId = "rbxassetid://" .. id sound.Volume = vol / 100
    stL.Text = "جاري التشغيل..." stL.TextColor3 = WHITE
    local s, e = pcall(function() sound:Play() end)
    if s then stL.Text = "تم التشغيل: " .. id stL.TextColor3 = GREEN else stL.Text = "تعذر التشغيل" stL.TextColor3 = RED end
end)
stB.Activated:Connect(function() sound:Stop() stL.Text = "تم الإيقاف" stL.TextColor3 = GRAY end)

lbl(pgA, "قسم الأنيميشن", UDim2.new(1, -20, 0, 30), UDim2.fromOffset(10, 50), 16).TextColor3 = GOLD
lbl(pgA, "اضغط على تاب الأنيميشن بالأعلى لفتح قائمة الـ Bundle Animations", UDim2.new(1, -40, 0, 60), UDim2.fromOffset(20, 100), 13).TextColor3 = GRAY

lbl(pgAd, "أوامر الأدمن", UDim2.new(1, -20, 0, 30), UDim2.fromOffset(10, 45), 16).TextColor3 = GOLD

local function mkAdm(t, y, c, fn)
    local b = btn(pgAd, t, UDim2.new(1, -40, 0, 38), UDim2.fromOffset(20, y), c)
    pill(b) str(b, WHITE, 1) b.TextSize = 14
    b.Activated:Connect(fn)
    return b
end

local aSt = lbl(pgAd, "اضغط على أي أمر لتشغيله", UDim2.new(1, -20, 0, 20), UDim2.fromOffset(10, 260), 11) aSt.TextColor3 = GRAY

mkAdm("flyV2", 80, RED, function()
    aSt.Text = "جاري التحميل..." aSt.TextColor3 = WHITE
    local s, e = pcall(function() loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Flyv2-30617"))() end)
    if s then aSt.Text = "تم تشغيل FlyV2" aSt.TextColor3 = GREEN else aSt.Text = "فشل" aSt.TextColor3 = RED end
end)

mkAdm("VR7", 125, RED, function()
    aSt.Text = "جاري التحميل..." aSt.TextColor3 = WHITE
    local s, e = pcall(function() loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-VR7-45290"))() end)
    if s then aSt.Text = "تم تشغيل VR7" aSt.TextColor3 = GREEN else aSt.Text = "فشل" aSt.TextColor3 = RED end
end)

mkAdm("adminX2", 170, RED, function()
    aSt.Text = "جاري التحميل..." aSt.TextColor3 = WHITE
    local s, e = pcall(function() loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Nameless-admin-232171"))() end)
    if s then aSt.Text = "تم تشغيل AdminX2" aSt.TextColor3 = GREEN else aSt.Text = "فشل" aSt.TextColor3 = RED end
end)

mkAdm("تخفيف اللاج", 215, Color3.fromRGB(30, 120, 80), function()
    aSt.Text = "جاري تخفيف اللاج..." aSt.TextColor3 = WHITE
    pcall(function()
        local L = game:GetService("Lighting")
        L.GlobalShadows = false L.FogEnd = 100000 L.Brightness = 1 L.EnvironmentDiffuseScale = 0 L.EnvironmentSpecularScale = 0
        for _, v in ipairs(L:GetChildren()) do if v:IsA("PostEffect") or v:IsA("Atmosphere") or v:IsA("Sky") then v:Destroy() end end
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") or v:IsA("Beam") then v:Destroy() end
            if v:IsA("BasePart") then v.CastShadow = false v.Material = Enum.Material.SmoothPlastic end
        end
        local T = workspace:FindFirstChildOfClass("Terrain")
        if T then T.WaterWaveSize = 0 T.WaterWaveSpeed = 0 T.WaterReflectance = 0 T.WaterTransparency = 1 end
        pcall(function() settings().Rendering.QualityLevel = 1 end)
    end)
    aSt.Text = "تم تخفيف اللاج!" aSt.TextColor3 = GREEN
end)

local mini = btn(gui, "RX", UDim2.fromOffset(55, 55), UDim2.new(0, 15, 0.5, -27), RED)
mini.Name = "RXMini" mini.TextSize = 17 mini.Visible = false str(mini, WHITE, 1)

local isDM, mSP, mDS, mM = false, nil, nil, false
mini.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        mSP = mini.Position mDS = i.Position isDM = true mM = false
        i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then isDM = false end end)
    end
end)
UIS.InputChanged:Connect(function(i)
    if isDM and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
        local d = i.Position - mDS
        if math.abs(d.X) > 10 or math.abs(d.Y) > 10 then mM = true end
        mini.Position = UDim2.new(mSP.X.Scale, mSP.X.Offset + d.X, mSP.Y.Scale, mSP.Y.Offset + d.Y)
    end
end)
mini.Activated:Connect(function()
    if not mM then main.Visible = true mini.Visible = false end
end)

minB.Activated:Connect(function() pkr.Visible = false main.Visible = false mini.Visible = true end)
clsB.Activated:Connect(function() sound:Stop() sound:Destroy() gui:Destroy() end)

print("[RX] Loaded successfully!")
