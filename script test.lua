local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- Tạo cửa sổ GUI chính
local Window = Fluent:CreateWindow({
    Title = "Blox Fruits GUI",
    SubTitle = "Update 22",
    TabWidth = 160,
    Size = UDim2.fromOffset(600, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Phím để thu nhỏ GUI
})

-- Tabs
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "sword" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

-- Toggle GUI
local ToggleGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

local IsOpen = true

-- Cấu hình nút toggle
ToggleGui.Name = "ToggleGui"
ToggleGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ToggleGui.ResetOnSpawn = false

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ToggleGui
ToggleButton.Size = UDim2.new(0, 100, 0, 40)
ToggleButton.Position = UDim2.new(0, 10, 0.8, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
ToggleButton.Text = "Close GUI"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.TextSize = 18
ToggleButton.Draggable = true

UICorner.Parent = ToggleButton

-- Chức năng đóng/mở GUI
ToggleButton.MouseButton1Click:Connect(function()
    IsOpen = not IsOpen
    Window:SetVisible(IsOpen)
    ToggleButton.Text = IsOpen and "Close GUI" or "Open GUI"
end)

-- Hiệu ứng đổi màu nút toggle
spawn(function()
    local hue = 0
    while true do
        ToggleButton.TextColor3 = Color3.fromHSV(hue, 1, 1)
        hue = (hue + 0.01) % 1
        wait(0.05)
    end
end)

-- Chức năng chính trong tab Main
Tabs.Main:AddLabel("Welcome to Blox Fruits GUI")

-- Tự động farm level
local AutoFarm = Tabs.Main:AddToggle("AutoFarm", { Title = "Auto Farm Level", Default = false })

AutoFarm:OnChanged(function(value)
    if value then
        print("Auto Farm Level: ON")
        -- Thêm logic farm level ở đây
    else
        print("Auto Farm Level: OFF")
    end
end)

-- Tự động nhận nhiệm vụ
local AutoQuest = Tabs.Main:AddToggle("AutoQuest", { Title = "Auto Quest", Default = false })

AutoQuest:OnChanged(function(value)
    if value then
        print("Auto Quest: ON")
        -- Thêm logic tự động nhận nhiệm vụ
    else
        print("Auto Quest: OFF")
    end
end)

-- Tự động đánh
local AutoAttack = Tabs.Main:AddToggle("AutoAttack", { Title = "Auto Attack", Default = false })

AutoAttack:OnChanged(function(value)
    if value then
        print("Auto Attack: ON")
        -- Thêm logic tấn công tự động
    else
        print("Auto Attack: OFF")
    end
end)

-- Tab Settings: Đổi màu GUI
local ColorPicker = Tabs.Settings:AddColorpicker("ThemeColor", {
    Title = "Change GUI Color",
    Default = Color3.fromRGB(96, 205, 255)
})

ColorPicker:OnChanged(function()
    Fluent:SetTheme({
        Accent = ColorPicker.Value
    })
end)

-- Thông báo khi GUI được tải
Fluent:Notify({
    Title = "Blox Fruits GUI",
    Content = "The GUI has been successfully loaded!",
    Duration = 8
})

-- Chọn tab đầu tiên khi khởi động
Window:SelectTab(1)

-- Cài đặt lưu cấu hình
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetFolder("BloxFruits/Configs")
InterfaceManager:SetFolder("BloxFruits/Interface")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

SaveManager:LoadAutoloadConfig()