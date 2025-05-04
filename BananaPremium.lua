game.StarterGui:SetCore("SendNotification", {
    Title = "Yes Or No";
    Text = "U want reset Config?";
    Icon = "rbxassetid://5009915795";
    Duration = 1e5;
	Button1 = "Yes";
	Button2 = "No";
})

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
    Title = "Banana Cat Hub-Blox Fruit  [ Premium ]",
    SubTitle = "by Obii",
    TabWidth = 160,
    Size = UDim2.fromOffset(500,350),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
     Shop = Window:AddTab({ Title = "Tab Shop", Icon = "" }),
    STSV = Window:AddTab({ Title = "Tab Status And Server", Icon = "" }),
    Player = Window:AddTab({ Title = "Tab Local Player", Icon = "" }),
    STFarm = Window:AddTab({ Title = "Setting Farm", Icon = "" }),
    STSkill = Window:AddTab({ Title = "Setting Hold \n and Select Skill", Icon = "" }),
    Farming = Window:AddTab({ Title = "Tab Farming", Icon = "" }),
    StackFarm = Window:AddTab({ Title = "Tab Stack Farm", Icon = "" }),
    FarmingOther = Window:AddTab({ Title = "Tab Farming Other", Icon = "" }),
    Raid = Window:AddTab({ Title = "Tab Fruit And Raid", Icon = "" }),
    SeaEvent = Window:AddTab({ Title = "Tab Sea Event", Icon = "" }),
    Race = Window:AddTab({ Title = "Tab Upgrade Race", Icon = "" }),
    Item = Window:AddTab({ Title = "Tab Get \n and Upgrade Items", Icon = "" }),
    Volcano = Window:AddTab({ Title = "Tab Volcano Event", Icon = "" }),
    Webhook = Window:AddTab({ Title = "Tab Webhook", Icon = "" }),
    ESP = Window:AddTab({ Title = "Tab ESP", Icon = "" }),
    PVP = Window:AddTab({ Title = "Tab PVP", Icon = "" }),
}

Tabs.Shop:AddButton({
        Title = "Redeem Code",
        Description = "",
        Callback = function()
        end
    })
    
    Tabs.Shop:AddButton({
        Title = "Teleport Old World",
        Description = "",
        Callback = function()
        end
    })
    
    Tabs.Shop:AddButton({
        Title = "Teleport New World",
        Description = "",
        Callback = function()
        end
    })
    
    Tabs.Shop:AddButton({
        Title = "Teleport Third Sea",
        Description = "",
        Callback = function()
        end
    })
    
    Tabs.Shop:AddParagraph({
        Title = "Fighting Shop",
        Content = "-----"
    })
    
    Tabs.Shop:AddButton({
        Title = "Black Leg",
        Description = "",
        Callback = function()
        end
    })
   
    Tabs.Shop:AddButton({
        Title = "Fishman Karate",
        Description = "",
        Callback = function()
        end
    })
    
    Tabs.Shop:AddButton({
        Title = "Electro",
        Description = "",
        Callback = function()
        end
    })
    
    Tabs.Shop:AddButton({
        Title = "Dragon Breath",
        Description = "",
        Callback = function()
        end
    })
    
    Tabs.Shop:AddButton({
        Title = "SuperHuman",
        Description = "",
        Callback = function()
        end
    })
    
    Tabs.Shop:AddButton({
        Title = "Death Step",
        Description = "",
        Callback = function()
        end
    })
    
    Tabs.Shop:AddButton({
        Title = "Sharkman Karate",
        Description = "",
        Callback = function()
        end
    })
    
    Tabs.Shop:AddButton({
        Title = "Electric Claw",
        Description = "",
        Callback = function()
        end
    })
    
    Tabs.Shop:AddButton({
        Title = "Dragon Talon",
        Description = "",
        Callback = function()
        end
    })
    
    Tabs.Shop:AddButton({
        Title = "God Human",
        Description = "",
        Callback = function()
        end
    })
    
    Tabs.Shop:AddButton({
        Title = "Sanguine Art",
        Description = "",
        Callback = function()
        end
    })

    Tabs.Shop:AddParagraph({
        Title = "Abilities Shop",
        Content = "-----"
    })

    Tabs.Shop:AddButton({
        Title = "Skyjump [ $10,000 Beli ]",
        Description = "",
        Callback = function()
        end
    })

    Tabs.Shop:AddButton({
        Title = "Buso Haki [ $25,000 Beli ]",
        Description = "",
        Callback = function()
        end
    })

    Tabs.Shop:AddButton({
        Title = "Observation Haki [ $750,000 Beli ]",
        Description = "",
        Callback = function()
        end
    })

    Tabs.Shop:AddButton({
        Title = "Soru [ $100,000 Beli ]",
        Description = "",
        Callback = function()
        end
    })

    Tabs.Shop:AddParagraph({
        Title = "Miss Shop",
        Content = "-----"
    })

    Tabs.Shop:AddButton({
        Title = "Buy Dual Flintlock",
        Description = "",
        Callback = function()
        end
    })

    Tabs.Shop:AddButton({
        Title = "Reroll Race",
        Description = "",
        Callback = function()
        end
    })

    Tabs.Shop:AddButton({
        Title = "Reset Stats",
        Description = "",
        Callback = function()
        end
    })

    Tabs.Shop:AddButton({
        Title = "Buy Race Cyborg",
        Description = "",
        Callback = function()
        end
    })

    Tabs.Shop:AddButton({
        Title = "Buy Race Ghoul",
        Description = "",
        Callback = function()
        end
    })

    Tabs.STSV:AddParagraph({
        Title = "Time",
        Content = "| Hour : 0 | Minute : 0 | Second : 0 |"
})

    Tabs.STSV:AddParagraph({
        Title = "Elite Mob",
        Content = "❌"
})

    Tabs.STSV:AddParagraph({
        Title = "Eyes Summon Tyrant",
        Content = ""
})

    Tabs.STSV:AddParagraph({
        Title = "Summon Katakuri",
        Content = ""
})

    Tabs.STSV:AddParagraph({
        Title = "Status SPY",
        Content = ""
})

    Tabs.STSV:AddParagraph({
        Title = "Mirage",
        Content = "❌"
})

    Tabs.STSV:AddParagraph({
        Title = "Prehistoric Island",
        Content = "❌"
})

    Tabs.STSV:AddParagraph({
        Title = "Frozen Dimension",
        Content = "❌"
})

    Tabs.STSV:AddParagraph({
        Title = "Moon",
        Content = ""
})

    Tabs.STSV:AddParagraph({
        Title = "Acient One Status",
        Content = ""
})

    Tabs.STSV:AddInput("Input", {
        Title = "Input JobId Normal",
        Default = "",
        Placeholder = "",
        Numeric = false,
        Finished = false,
        Callback = function()
        end
    })

    Tabs.STSV:AddButton({
        Title = "Clear JobId",
        Description = "",
        Callback = function()
        end
    })

Tabs.STSV:AddToggle("Spam Join", {Title = "Spam Join", Default = false })

    Tabs.STSV:AddButton({
        Title = "Join Server",
        Description = "",
        Callback = function()
        end
    })

    Tabs.STSV:AddButton({
        Title = "Copy JobId",
        Description = "",
        Callback = function()
        end
    })

    Tabs.STSV:AddButton({
        Title = "Hop Server",
        Description = "",
        Callback = function()
        end
    })

    Tabs.STSV:AddButton({
        Title = "Hop Server Less People",
        Description = "",
        Callback = function()
        end
})
