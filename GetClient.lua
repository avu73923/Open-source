local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

pcall(function() setfpscap(120) end)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RainbowFPS"
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 1000
screenGui.IgnoreGuiInset = true
screenGui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 120, 0, 30)
frame.Position = UDim2.new(0, 10, 0, 10)
frame.BackgroundTransparency = 1
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.Position = UDim2.new(0, 0, 0, 0)
textLabel.Font = Enum.Font.FredokaOne
textLabel.TextScaled = true
textLabel.BackgroundTransparency = 1
textLabel.TextStrokeTransparency = 0.2
textLabel.Text = "FPS: 0"
textLabel.Parent = frame

task.spawn(function()
    local hue = 0
    while true do
        hue = (hue + 0.005) % 1
        textLabel.TextColor3 = Color3.fromHSV(hue, 1, 1)
        RunService.RenderStepped:Wait()
    end
end)

local frameCount = 0
local lastUpdate = tick()
RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local now = tick()
    if now - lastUpdate >= 1 then
        local fps = math.floor(frameCount / (now - lastUpdate))
        textLabel.Text = "FPS: " .. tostring(fps)
        frameCount = 0
        lastUpdate = now
    end
end)

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")  
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0.1, 0.1)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 0
Frame.BorderColor3 = Color3.fromRGB(27, 42, 53)
Frame.BorderSizePixel = 1
Frame.Position = UDim2.new(0, 20, 0.1, -6)  
Frame.Size = UDim2.new(0, 50, 0, 50)
Frame.Name = "dut dit"

ImageLabel.Parent = Frame
ImageLabel.Name = "Banana Test"
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel.Size = UDim2.new(0, 40, 0, 40)
ImageLabel.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
ImageLabel.BackgroundTransparency = 1
ImageLabel.BorderSizePixel = 1
ImageLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.Image = "http://www.roblox.com/asset/?id= 5009915795"

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = Frame

TextButton.Name = "TextButton"
TextButton.Parent = Frame
TextButton.AnchorPoint = Vector2.new(0, 0)
TextButton.Position = UDim2.new(0, 0, 0, 0)
TextButton.Size = UDim2.new(1, 0, 1, 0)
TextButton.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
TextButton.BackgroundTransparency = 1
TextButton.BorderSizePixel = 1
TextButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextButton.TextColor3 = Color3.fromRGB(27, 42, 53)
TextButton.Text = ""
TextButton.Font = Enum.Font.SourceSans
TextButton.TextSize = 8
TextButton.TextTransparency = 0

local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local zoomedIn = false
local originalSize = UDim2.new(0, 40, 0, 40)
local zoomedSize = UDim2.new(0, 30, 0, 30)
local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local faded = false
local fadeInTween = TweenService:Create(Frame, tweenInfo, {BackgroundTransparency = 0.25})
local fadeOutTween = TweenService:Create(Frame, tweenInfo, {BackgroundTransparency = 0})

TextButton.MouseButton1Down:Connect(function()

    if zoomedIn then
        TweenService:Create(ImageLabel, tweenInfo, {Size = originalSize}):Play()
    else
        TweenService:Create(ImageLabel, tweenInfo, {Size = zoomedSize}):Play()
    end
    zoomedIn = not zoomedIn

    if faded then
        fadeOutTween:Play()
    else
        fadeInTween:Play()
    end
    faded = not faded

    VirtualInputManager:SendKeyEvent(true, "LeftControl", false, game)
end)

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Get client",
    SubTitle = "by Việt Hoàng IOS",
    TabWidth = 160,
    Size = UDim2.fromOffset(500,350),
    Acrylic = true,
    Theme = "Aqua",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Delta = Window:AddTab({ Title = "Delta VNG", Icon = "" }),
    Codex = Window:AddTab({ Title = "Codex VNG", Icon = "" }),
    Trigon = Window:AddTab({ Title = "Trigon VNG", Icon = "" }),
    Ronix = Window:AddTab({ Title = "Ronix VNG", Icon = "" }),
    Krnl = Window:AddTab({ Title = "Krnl VNG", Icon = "" }),
    Arceus = Window:AddTab({ Title = "Arceus X VNG", Icon = "" }),
    Cryptic = Window:AddTab({ Title = "Cryptic VNG", Icon = "" }),
    Setting = Window:AddTab({ Title = "Setting", Icon = "" }),
}

Tabs.Delta:AddParagraph({
        Title = "Client IOS",
        Content = "Client IOS đọc kĩ"
    })


Tabs.Delta:AddButton({
        Title = "Delta quốc tế",
        Description = "Delta quốc tế IOS",
        Callback = function()
    setclipboard("https://www.mediafire.com/file/qaftdmatsrl999i/Delta%20X%20quốc%20tế%20IOS%20V2.668.ipa/file")
end
})

Tabs.Delta:AddButton({
        Title = "Delta VNG",
        Description = "Delta VNG IOS",
        Callback = function()
    setclipboard("https://www.mediafire.com/file/khjjeohwh3kpzlg/DeltaVN_V17_HuyMythic.ipa/file")
end
})

Tabs.Delta:AddParagraph({
        Title = "Client ANDROID",
        Content = "Client ANDROID đọc kĩ"
    })
    
Tabs.Delta:AddButton({
        Title = "Delta quốc tế",
        Description = "Delta quốc tế ANDROID",
        Callback = function()
    setclipboard("https://www.mediafire.com/file/9fs2mhvcxpbn68q/Delta%20X%20quốc%20tế%20V2.673.apk/file")
end
})

Tabs.Delta:AddButton({
        Title = "Delta VNG",
        Description = "Delta VNG chính thức ANDROID",
        Callback = function()
    setclipboard("https://www.mediafire.com/file/60upi48g23uevkp/Delta%20Vng%20Chính%20Thức%20V2.672.apk/file")
end
})

Tabs.Codex:AddParagraph({
        Title = "Client IOS",
        Content = "Client IOS đọc kĩ"
    })

Tabs.Codex:AddButton({
        Title = "Codex quốc tế",
        Description = "Codex quốc tế IOS",
        Callback = function()
    setclipboard("https://codexexecutor.net/ios/")
end
})

Tabs.Codex:AddButton({
        Title = "Codex VNG",
        Description = "Codex VNG IOS",
        Callback = function()
    setclipboard("https://www.mediafire.com/file/gdltxutin3dektf/CodexVN%2BV7%2BHuyMythic.ipa/file")
end
})

Tabs.Codex:AddParagraph({
        Title = "Client ANDROID",
        Content = "Client ANDROID đọc kĩ"
    })
    
Tabs.Codex:AddButton({
        Title = "Codex quốc tế",
        Description = "Codex quốc tế ANDROID",
        Callback = function()
    setclipboard("https://www.mediafire.com/file/pw2vze12hlrm8o5/Code%20X%20quốc%20tế%20V2.673.apk/file")
end
})

Tabs.Codex:AddButton({
        Title = "Codex VNG",
        Description = "Codex ㅤchính thức ANDROID",
        Callback = function()
    setclipboard("https://www.mediafire.com/file/55giaz0bom6w3bm/Code%20X%20VNG%20ch%C3%ADnh%20thức%20V2.672.apk/file")
end
})

Tabs.Trigon:AddParagraph({
        Title = "Client ANDROID",
        Content = "Client ANDROID đọc kĩ"
    })
    
Tabs.Trigon:AddButton({
        Title = "Trigon quốc tế",
        Description = "Trigon quốc tế ANDROID",
        Callback = function()
    setclipboard("https://www.mediafire.com/file/ajmbwv4on14m6lu/Trigon%20quốc%20tế%20V2.673.apk/file")
end
})

Tabs.Trigon:AddButton({
        Title = "Trigon VNG login",
        Description = "Trigon VNG login ANDROID",
        Callback = function()
    setclipboard("https://www.mediafire.com/file/3ebj2wz6myjaua6/V2.670%20Trigon%20VNG%20Login.apk/file")
end
})

Tabs.Trigon:AddButton({
        Title = "Login VNG Trigon",
        Description = "Login VNG Trigon ANDROID",
        Callback = function()
    setclipboard("https://www.mediafire.com/file/1ujme1mjht56v01/Login%2BV2.670%2BVNG.apk/file")
end
})

Tabs.Ronix:AddParagraph({
        Title = "Client IOS",
        Content = "Client IOS đọc kĩ"
    })

Tabs.Ronix:AddButton({
        Title = "Ronix VNG IOS",
        Description = "IOS Update",
        Callback = function()
    setclipboard("Ronix VNG IOS đang update vui lòng chờ")
end
})

Tabs.Ronix:AddParagraph({
        Title = "Client ANDROID",
        Content = "Client ANDROID đọc kĩ"
    })
    
Tabs.Ronix:AddButton({
        Title = "Ronix quốc tế",
        Description = "Ronix quốc tế ANDROID",
        Callback = function()
    setclipboard("https://www.mediafire.com/file/7ihdp1b0eav5wy5/Ronix%20quốc%20tế%20V2.671.apk/file")
end
})

Tabs.Ronix:AddButton({
        Title = "Ronix VNG login",
        Description = "Ronix VNG login ANDROID",
        Callback = function()
    setclipboard("https://www.mediafire.com/file/du50nf8l1jb3vpw/V2.666_Ronix_VNG_Login.apk/file")
end
})

Tabs.Ronix:AddButton({
        Title = "Login VNG Ronix",
        Description = "Login VNG Ronix ANDROID",
        Callback = function()
    setclipboard("https://www.mediafire.com/file/4r3mvq4blc23wou/Login%20V2.666%20VNG.apk/file")
end
})

Tabs.Krnl:AddParagraph({
        Title = "Client IOS",
        Content = "Client IOS đọc kĩ"
    })
    
Tabs.Krnl:AddButton({
        Title = "Krnl VNG HUYMYTHIC",
        Description = "Krnl VNG IOS",
        Callback = function()
    setclipboard("https://www.mediafire.com/file/xbyo605j4a5wg2f/KrnlVN+V3+HuyMythic.ipa/file")
end
})

Tabs.Krnl:AddButton({
        Title = "Krnl VNG HUNEIPA",
        Description = "Krnl VNG IOS",
        Callback = function()
    setclipboard("https://download2269.mediafire.com/bsizjyz103bgWRt0QJrrgX8vdb-_VY-Xz16XczGY3HXTjvg1oOLHDvIOpkajpMQE_SLB1VCBZEFThAias0418ToziR8ZK_lPeCkXezMVlHYqjQ7CrQMI5gEX7nyCNZtJw4uPgEXf7moWQauxwhqNBNo9XdcWauMBp5dJ00lB0LNc/wbl7yfryxcrt0r9/KrnlxVNG+V3+Fix+Crash.ipa")
end
})

Tabs.Krnl:AddParagraph({
        Title = "Client ANDROID",
        Content = "Client ANDROID đọc kĩ"
    })
    
Tabs.Krnl:AddButton({
        Title = "Krnl quốc tế",
        Description = "Krnl quốc tế ANDROID",
        Callback = function()
    setclipboard("https://wrdcdn.net/r/54921/1747606249618/krnl_release_2.673.710_2025.5.17_26.apk")
end
})

Tabs.Krnl:AddButton({
        Title = "Krnl VNG",
        Description = "Krnl VNG chính thức ANDROID",
        Callback = function()
    setclipboard("https://wrdcdn.net/r/54921/1747606313016/krnl_vng_release_2.272.706_2025.5.17_6.apk")
end
})

Tabs.Arceus:AddParagraph({
        Title = "Client IOS",
        Content = "Client IOS đọc kĩ"
    })
    
Tabs.Arceus:AddButton({
        Title = "Arceus quốc tế",
        Description = "Arceus quốc tế IOS",
        Callback = function()
    setclipboard("https://www.mediafire.com/file/54zjq6gtxee8tfw/Arceus%20X%20quốc%20tế%20IOS%20V2.669.ipa/file")
end
})

Tabs.Arceus:AddButton({
        Title = "Arceus X VNG",
        Description = "IOS Update",
        Callback = function()
    setclipboard("Arceus X VNG đang update vui lòng chờ")
end
})

Tabs.Arceus:AddParagraph({
        Title = "Client ANDROID",
        Content = "Client ANDROID đọc kĩ"
    })
    
Tabs.Arceus:AddButton({
        Title = "Arceus quốc tế",
        Description = "Arceus quốc tế ANDROID",
        Callback = function()
    setclipboard("https://www.mediafire.com/file/z7cyqj3t31uabjy/Arceus%20X%20quốc%20tế%20V2.674.apk/file")
end
})

Tabs.Arceus:AddButton({
        Title = "Arceus X VNG",
        Description = "Arceus X VNG chính thức ANDROID",
        Callback = function()
    setclipboard("https://www.mediafire.com/file/k53hkzwzxyu2jjh/Arceus%20X%20VNG%20chính%20thức%20V2.675.apk/file")
end
})

Tabs.Cryptic:AddParagraph({
        Title = "Client IOS",
        Content = "Client IOS đọc kĩ"
    })
    
Tabs.Cryptic:AddButton({
        Title = "Cryptic VNG",
        Description = "IOS Update",
        Callback = function()
    setclipboard("Cryptic VNG đang update vui lòng chờ")
end
})

Tabs.Cryptic:AddParagraph({
        Title = "Client ANDROI",
        Content = "Client ANDROI đọc kĩ"
    })
    
Tabs.Cryptic:AddButton({
        Title = "Cryptic VNG",
        Description = "Cryptic VNG chính thức ANDROI",
        Callback = function()
    setclipboard("https://www.mediafire.com/file/4lct3r2lbnn3m82/Cryptic.2.672.VNG_CrypticExecutor.com.apk/file?dkey=0zhpnb02rjz&r=510")
end
})

local Toggle = Tabs.Setting:AddToggle("Toggle", {Title = "Fast Attack", Default = false })
  Toggle:OnChanged(function(Value)
     _G.FastAttack = Value
 end)
if _G.FastAttack then
    local _ENV = (getgenv or getrenv or getfenv)()

    local function SafeWaitForChild(parent, childName)
        local success, result = pcall(function()
            return parent:WaitForChild(childName)
        end)
        if not success or not result then
            warn("noooooo: " .. childName)
        end
        return result
    end

    local function WaitChilds(path, ...)
        local last = path
        for _, child in {...} do
            last = last:FindFirstChild(child) or SafeWaitForChild(last, child)
            if not last then break end
        end
        return last
    end

    local VirtualInputManager = game:GetService("VirtualInputManager")
    local CollectionService = game:GetService("CollectionService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local TeleportService = game:GetService("TeleportService")
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local Player = Players.LocalPlayer

    if not Player then
        warn("Không tìm thấy người chơi cục bộ.")
        return
    end

    local Remotes = SafeWaitForChild(ReplicatedStorage, "Remotes")
    if not Remotes then return end

    local Validator = SafeWaitForChild(Remotes, "Validator")
    local CommF = SafeWaitForChild(Remotes, "CommF_")
    local CommE = SafeWaitForChild(Remotes, "CommE")

    local ChestModels = SafeWaitForChild(workspace, "ChestModels")
    local WorldOrigin = SafeWaitForChild(workspace, "_WorldOrigin")
    local Characters = SafeWaitForChild(workspace, "Characters")
    local Enemies = SafeWaitForChild(workspace, "Enemies")
    local Map = SafeWaitForChild(workspace, "Map")

    local EnemySpawns = SafeWaitForChild(WorldOrigin, "EnemySpawns")
    local Locations = SafeWaitForChild(WorldOrigin, "Locations")

    local RenderStepped = RunService.RenderStepped
    local Heartbeat = RunService.Heartbeat
    local Stepped = RunService.Stepped

    local Modules = SafeWaitForChild(ReplicatedStorage, "Modules")
    local Net = SafeWaitForChild(Modules, "Net")

    local sethiddenproperty = sethiddenproperty or function(...) return ... end
    local setupvalue = setupvalue or (debug and debug.setupvalue)
    local getupvalue = getupvalue or (debug and debug.getupvalue)

    local Settings = {
        AutoClick = true,
        ClickDelay = 0,
    }

    local Module = {}

    Module.FastAttack = (function()
        if _ENV.rz_FastAttack then
            return _ENV.rz_FastAttack
        end

        local FastAttack = {
            Distance = 100,
            attackMobs = true,
            attackPlayers = true,
            Equipped = nil
        }

        local RegisterAttack = SafeWaitForChild(Net, "RE/RegisterAttack")
        local RegisterHit = SafeWaitForChild(Net, "RE/RegisterHit")

        local function IsAlive(character)
        return character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0
        end

        local function ProcessEnemies(OthersEnemies, Folder)
            local BasePart = nil
            for _, Enemy in Folder:GetChildren() do
                local Head = Enemy:FindFirstChild("Head")
                if Head and IsAlive(Enemy) and Player:DistanceFromCharacter(Head.Position) < FastAttack.Distance then
                    if Enemy ~= Player.Character then
                        table.insert(OthersEnemies, { Enemy, Head })
                        BasePart = Head
                    end
                end
            end
            return BasePart
        end

        function FastAttack:Attack(BasePart, OthersEnemies)
            if not BasePart or #OthersEnemies == 0 then return end
            RegisterAttack:FireServer(Settings.ClickDelay or 0)
            RegisterHit:FireServer(BasePart, OthersEnemies)
        end

        function FastAttack:AttackNearest()
            local OthersEnemies = {}
            local Part1 = ProcessEnemies(OthersEnemies, Enemies)
            local Part2 = ProcessEnemies(OthersEnemies, Characters)
            if #OthersEnemies > 0 then
                self:Attack(Part1 or Part2, OthersEnemies)
            else
                task.wait(0)
            end
        end

        function FastAttack:BladeHits()
            local Equipped = IsAlive(Player.Character) and Player.Character:FindFirstChildOfClass("Tool")
            if Equipped and Equipped.ToolTip ~= "Gun" then
                self:AttackNearest()
            else
                task.wait(0)
            end
        end

        task.spawn(function()
            while task.wait(Settings.ClickDelay) do
                if Settings.AutoClick then
                    FastAttack:BladeHits()
                end
            end
        end)

        _ENV.rz_FastAttack = FastAttack
        return FastAttack
    end)()
end

	◦	
