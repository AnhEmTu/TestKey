-- Chờ game và người chơi tải xong
-- Đảm bảo game đã được tải và người chơi đã sẵn sàng
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Liên kết Discord
setclipboard("https://discord.gg/heSHddPs")

-- Tự động chọn team trong Block Fruit
local function AutoSelectBlockFruitTeam()
    if not getgenv().Team then
        warn("Chưa chọn team!")
        return
    end

    local teamName = getgenv().Team
    local validTeams = {"Marines", "Pirates"}

    if table.find(validTeams, teamName) then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", teamName)
        print("Đã chọn team: " .. teamName)
    else
        warn("Team không hợp lệ: " .. teamName)
    end
end

AutoSelectBlockFruitTeam()

---FLY
--- GUI Setup
local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local up = Instance.new("TextButton")
local down = Instance.new("TextButton")
local onof = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local plus = Instance.new("TextButton")
local speed = Instance.new("TextLabel")
local mine = Instance.new("TextButton")

--Properties:

main.Name = "TBoyRoblox "
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
Frame.Size = UDim2.new(0, 190, 0, 57)

up.Name = "lên"
up.Parent = Frame
up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
up.Size = UDim2.new(0, 44, 0, 28)
up.Font = Enum.Font.SourceSans
up.Text = "LÊN"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = 14.000

down.Name = "xuống"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
down.Position = UDim2.new(0, 0, 0.491228074, 0)
down.Size = UDim2.new(0, 44, 0, 28)
down.Font = Enum.Font.SourceSans
down.Text = "XUỐNG"
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = 14.000

onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
onof.Size = UDim2.new(0, 56, 0, 28)
onof.Font = Enum.Font.SourceSans
onof.Text = "BAY"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = 14.000

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 100, 0, 28)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "gui by TBoyBoblox "
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

plus.Name = "Kun"
plus.Parent = Frame
plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
plus.Position = UDim2.new(0.231578946, 0, 0, 0)
plus.Size = UDim2.new(0, 45, 0, 28)
plus.Font = Enum.Font.SourceSans
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(0, 0, 0)
plus.TextScaled = true
plus.TextSize = 14.000
plus.TextWrapped = true

speed.Name = "speed"
speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
speed.Size = UDim2.new(0, 44, 0, 28)
speed.Font = Enum.Font.SourceSans
speed.Text = "1"
speed.TextColor3 = Color3.fromRGB(0, 0, 0)
speed.TextScaled = true
speed.TextSize = 14.000
speed.TextWrapped = true

mine.Name = "mine"
mine.Parent = Frame
mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
mine.Size = UDim2.new(0, 45, 0, 29)
mine.Font = Enum.Font.SourceSans
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(0, 0, 0)
mine.TextScaled = true
mine.TextSize = 14.000
mine.TextWrapped = true

speeds = 1

local speaker = game:GetService("Players").LocalPlayer

local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

nowe = false

game:GetService("StarterGui"):SetCore("SendNotification", { 
    Title = "SUB TBoyBoblox ";
    Text = "fly gui by TBoyBoblox ";
    Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
Duration = 16;


Frame.Active = true -- main = gui
Frame.Draggable = true

onof.MouseButton1Down:connect(function()

    if nowe == true then
        nowe = false

        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
        speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    else 
        nowe = true



        for i = 1, speeds do
            spawn(function()

                local hb = game:GetService("RunService").Heartbeat


                tpwalking = true
                local chr = game.Players.LocalPlayer.Character
                local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                    if hum.MoveDirection.Magnitude > 0 then
                        chr:TranslateBy(hum.MoveDirection)
                    end
                end

            end)
        end
        game.Players.LocalPlayer.Character.Animate.Disabled = true
        local Char = game.Players.LocalPlayer.Character
        local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

        for i,v in next, Hum:GetPlayingAnimationTracks() do
            v:AdjustSpeed(0)
        end
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
        speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
    end




    if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then



        local plr = game.Players.LocalPlayer
        local torso = plr.Character.Torso
        local flying = true
        local deb = true
        local ctrl = {f = 0, b = 0, l = 0, r = 0}
        local lastctrl = {f = 0, b = 0, l = 0, r = 0}
        local maxspeed = 50
        local speed = 0


        local bg = Instance.new("BodyGyro", torso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = torso.CFrame
        local bv = Instance.new("BodyVelocity", torso)
        bv.velocity = Vector3.new(0,0.1,0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        if nowe == true then
            plr.Character.Humanoid.PlatformStand = true
        end
        while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
            game:GetService("RunService").RenderStepped:Wait()

            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speed = speed+.5+(speed/maxspeed)
                if speed > maxspeed then
                    speed = maxspeed
                end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = speed-1
                if speed < 0 then
                    speed = 0
                end
            end
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
            else
                bv.velocity = Vector3.new(0,0,0)
            end
            --  game.Players.LocalPlayer.Character.Animate.Disabled = true
            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
        end
        ctrl = {f = 0, b = 0, l = 0, r = 0}
        lastctrl = {f = 0, b = 0, l = 0, r = 0}
        speed = 0
        bg:Destroy()
        bv:Destroy()
        plr.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Animate.Disabled = false
        tpwalking = false




    else
        local plr = game.Players.LocalPlayer
        local UpperTorso = plr.Character.UpperTorso
        local flying = true
        local deb = true
        local ctrl = {f = 0, b = 0, l = 0, r = 0}
        local lastctrl = {f = 0, b = 0, l = 0, r = 0}
        local maxspeed = 50
        local speed = 0


        local bg = Instance.new("BodyGyro", UpperTorso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = UpperTorso.CFrame
        local bv = Instance.new("BodyVelocity", UpperTorso)
        bv.velocity = Vector3.new(0,0.1,0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        if nowe == true then
            plr.Character.Humanoid.PlatformStand = true
        end
        while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
            wait()

            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speed = speed+.5+(speed/maxspeed)
                if speed > maxspeed then
                    speed = maxspeed
                end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = speed-1
                if speed < 0 then
                    speed = 0
                end
            end
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
            else
                bv.velocity = Vector3.new(0,0,0)
            end

            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
        end
        ctrl = {f = 0, b = 0, l = 0, r = 0}
        lastctrl = {f = 0, b = 0, l = 0, r = 0}
        speed = 0
        bg:Destroy()
        bv:Destroy()
        plr.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Animate.Disabled = false
        tpwalking = false



    end





end)


up.MouseButton1Down:connect(function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,2,0)

end)


down.MouseButton1Down:connect(function()

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-2,0)

end)


game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
    wait(0.7)
    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
    game.Players.LocalPlayer.Character.Animate.Disabled = false

end)


plus.MouseButton1Down:connect(function()
    speeds = speeds + 1
    speed.Text = speeds
    if nowe == true then


    tpwalking = false
    for i = 1, speeds do
        spawn(function()

            local hb = game:GetService("RunService").Heartbeat


            tpwalking = true
            local chr = game.Players.LocalPlayer.Character
            local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
            while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                if hum.MoveDirection.Magnitude > 0 then
                    chr:TranslateBy(hum.MoveDirection)
                end
            end

        end)
        end
        end
end)
mine.MouseButton1Down:connect(function()
    if speeds == 1 then
        speed.Text = 'can not be less than 1'
        wait(1)
        speed.Text = speeds
    else
    speeds = speeds - 1
        speed.Text = speeds
        if nowe == true then
    tpwalking = false
    for i = 1, speeds do
        spawn(function()

            local hb = game:GetService("RunService").Heartbeat


            tpwalking = true
            local chr = game.Players.LocalPlayer.Character
            local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
            while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                if hum.MoveDirection.Magnitude > 0 then
                    chr:TranslateBy(hum.MoveDirection)
                end
            end

        end)
        end
        end
        end
end)
-----End



-- FPS Optimization
function OptimizePerformance()
    if not getgenv().FixCrash then return end

    -- Tắt các hiệu ứng không cần thiết
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
            obj.Enabled = false
        elseif obj:IsA("Explosion") or obj:IsA("ForceField") then
            obj:Destroy()
        end
    end

    -- Tối ưu hóa Lighting
    local lighting = game.Lighting
    lighting.GlobalShadows = false
    lighting.FogEnd = 9e9
    lighting.Brightness = 1
    lighting.FogStart = 0

    -- Giảm chất lượng đồ họa
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

    -- Tối ưu hóa nhân vật người chơi
    local function OptimizeCharacter(character)
        -- Duyệt qua tất cả các đối tượng trong nhân vật
        for _, obj in pairs(character:GetDescendants()) do
            -- Xử lý các đối tượng Decal và Texture
            if obj:IsA("Decal") or obj:IsA("Texture") or obj:IsA("MeshPart") then
                obj.Transparency = 0.9  -- Đặt độ trong suốt cao
            elseif obj:IsA("Accessory") then
                obj:Destroy()  -- Xóa phụ kiện không cần thiết
            end
        end
    end

    -- Áp dụng tối ưu hóa nhân vật khi nhân vật được thêm vào
    local player = game.Players.LocalPlayer
    if player and player.Character then
        OptimizeCharacter(player.Character)
    end

    -- Đảm bảo tối ưu hóa vẫn được áp dụng khi nhân vật bị hạ gục và tái sinh
    player.CharacterAdded:Connect(function(character)
        OptimizeCharacter(character)
    end)

    -- Tăng SimulationRadius
    game:GetService("RunService").Stepped:Connect(function()
        if game.Players.LocalPlayer then
            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
        end
    end)

    -- Tối ưu hóa quái vật và boss
    local function OptimizeEnemy(enemy)
        if enemy:IsA("Model") then
            for _, obj in pairs(enemy:GetDescendants()) do
                if obj:IsA("Part") or obj:IsA("MeshPart") then
                    obj.Material = Enum.Material.Plastic
                    obj.Reflectance = 0
                elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
                    obj.Enabled = false
                elseif obj:IsA("Decal") or obj:IsA("Texture") then
                    obj.Transparency = 1
                elseif obj:IsA("Accessory") then
                    obj:Destroy()
                end
            end
        end
    end

    -- Áp dụng tối ưu hóa cho quái vật/boss
    for _, enemy in pairs(workspace:GetDescendants()) do
        if enemy:IsA("Model") and (enemy:FindFirstChild("Humanoid") or enemy:FindFirstChild("Boss")) then
            OptimizeEnemy(enemy)
        end
    end

    workspace.DescendantAdded:Connect(function(obj)
        if obj:IsA("Model") and (obj:FindFirstChild("Humanoid") or obj:FindFirstChild("Boss")) then
            OptimizeEnemy(obj)
        end
    end)
end

-- Kích hoạt tối ưu hóa FPS
OptimizePerformance()

-- FPS2: Tối ưu hóa thêm cho FPS
local function FPSBooster()
    if not getgenv().FixCrash2 then return end

    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    local decalsHidden = true

    -- Tối ưu hóa Lighting và Terrain
    sethiddenproperty(l, "Technology", Enum.Technology.Compatibility)
    sethiddenproperty(t, "Decoration", false)
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

    -- Tối ưu hóa các đối tượng trong game
    for _, obj in pairs(g:GetDescendants()) do
        if obj:IsA("Part") or obj:IsA("Union") or obj:IsA("CornerWedgePart") or obj:IsA("TrussPart") then
            obj.Material = Enum.Material.Plastic
            obj.Reflectance = 0
        elseif obj:IsA("Decal") or obj:IsA("Texture") and decalsHidden then
            obj.Transparency = 1
        elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
            obj.Lifetime = NumberRange.new(0)
        elseif obj:IsA("Explosion") then
            obj.BlastPressure = 1
            obj.BlastRadius = 1
        elseif obj:IsA("Fire") or obj:IsA("SpotLight") or obj:IsA("Smoke") or obj:IsA("Sparkles") then
            obj.Enabled = false
        elseif obj:IsA("MeshPart") then
            obj.Material = Enum.Material.Plastic
            obj.Reflectance = 0
        end
    end

    -- Tắt các hiệu ứng ánh sáng
    for _, effect in pairs(l:GetChildren()) do
        if effect:IsA("BlurEffect") or effect:IsA("SunRaysEffect") or 
           effect:IsA("ColorCorrectionEffect") or effect:IsA("BloomEffect") or 
           effect:IsA("DepthOfFieldEffect") then
            effect.Enabled = false
        end
    end

    print("FPS Booster đã được kích hoạt!")
end

-- Kích hoạt FPS booster
FPSBooster()

-- Tự động nhặt vật phẩm
local function AutoCollect()
    if not getgenv().VatPham then return end
    print("Tự động nhặt vật phẩm đã bật!")

    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    while wait(0.5) do
        for _, item in pairs(workspace:GetDescendants()) do
            if item:IsA("Tool") or item.Name == "CollectibleItem" then
                if (character.HumanoidRootPart.Position - item.Position).Magnitude < 20 then
                    firetouchinterest(character.HumanoidRootPart, item, 0)
                    wait(0.1)
                    firetouchinterest(character.HumanoidRootPart, item, 1)
                end
            end
        end
    end
end

-- Chống AFK
local function AnTiAFK()
    if not getgenv().AntiAFK then return end
    print("Chức năng chống AFK đã bật!")

    local vu = game:GetService("VirtualUser")
    game.Players.LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        print("Đã ngăn việc ngắt kết nối do AFK.")
    end)
end

-- Kích hoạt các chức năng
AutoCollect()
AnTiAFK()

-- Chế độ bảo vệ
local function ShieldMode1()
    if not getgenv().ShieldMode then return end
    print("Chế độ bảo vệ đã bật!")

    local player = game.Players.LocalPlayer
    player.CharacterAdded:Connect(function(character)
        character:WaitForChild("HumanoidRootPart").Anchored = true
    end)
end

ShieldMode1()

-- Chức năng chống Anti-Cheat
function AntiAntiCheat()
    if not getgenv().AntiCheat then return end

    local mt = getrawmetatable(game)
    local oldNamecall = mt.__namecall
    local oldIndex = mt.__index
    setreadonly(mt, false)

    -- Chặn các yêu cầu kiểm tra từ hệ thống
    mt.__namecall = function(self, ...)
        local args = {...}
        local method = getnamecallmethod()

        -- Vô hiệu hóa "kick" hoặc "ban"
        if tostring(method) == "Kick" or tostring(method) == "Ban" then
            return warn("[Anti-AntiCheat] Chặn lệnh Kick hoặc Ban từ hệ thống.")
        end

        return oldNamecall(self, ...)
    end

    mt.__index = function(self, key)
        if tostring(key):lower():find("anticheat") or tostring(key):lower():find("kick") then
            return nil
        end

        return oldIndex(self, key)
    end

    local player = game.Players.LocalPlayer
    player.ChildAdded:Connect(function(child)
        if child:IsA("Script") or child:IsA("LocalScript") then
            if tostring(child.Name):lower():find("anticheat") then
                child:Destroy()
                warn("[Anti-AntiCheat] Đã phá hủy script Anti-cheat!")
            end
        end
    end)

    player.CharacterAdded:Connect(function(character)
        character.DescendantAdded:Connect(function(descendant)
            if descendant:IsA("Script") and tostring(descendant.Name):lower():find("anticheat") then
                descendant:Destroy()
                warn("[Anti-AntiCheat] Đã loại bỏ Anti-cheat trong nhân vật.")
            end
        end)
    end)

    print("[Anti-AntiCheat] Đã kích hoạt chức năng chống Anti-cheat.")
end

-- Kích hoạt chống Anti-Cheat
AntiAntiCheat()

-- Chức năng thông minh

-- Tự động hồi phục
local function AutoHeal()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    while wait(0.5) do
        if character:FindFirstChild("Humanoid") then
            local humanoid = character.Humanoid
            if humanoid.Health < humanoid.MaxHealth * 0.3 then
                -- Tự động sử dụng thuốc hồi phục hoặc khả năng hồi phục
                -- (Thực hiện hành động phù hợp tại đây)
                print("Health is low, healing...")
            end
        end
    end
end

AutoHeal()

-- Cảnh báo tài nguyên hệ thống
local function MonitorResourceUsage()
    while wait(1) do
        local cpuUsage = game:GetService("Stats").MemoryUsage
        if cpuUsage > 80 then
            warn("CPU usage is high, consider lowering graphics settings!")
        end
    end
end

MonitorResourceUsage()

-- Tự động nâng cấp kỹ năng
local function AutoSkillUpgrade()
    local player = game.Players.LocalPlayer
    while wait(5) do
        if player:FindFirstChild("Skills") then
            local skills = player.Skills:GetChildren()
            for _, skill in pairs(skills) do
                if skill.Level < skill.MaxLevel then
                    -- Tự động sử dụng điểm kỹ năng hoặc nâng cấp kỹ năng
                    skill.Level = skill.Level + 1
                    print("Skill upgraded: " .. skill.Name)
                end
            end
        end
    end
end

AutoSkillUpgrade()

-- Chế độ tự động tương tác
local function AutoInteract()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    while wait(0.5) do
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("ProximityPrompt") then
                if (character.HumanoidRootPart.Position - obj.Position).Magnitude < 5 then
                    fireproximityprompt(obj)
                    print("Interacting with: " .. obj.Name)
                end
            end
        end
    end
end

AutoInteract()

-- Tự động nâng cấp sức mạnh
local function AutoUpgradeStats()
    if not getgenv().AutoUpgrade then return end
    local player = game.Players.LocalPlayer
    local stats = player:WaitForChild("leaderstats")  -- Giả sử stats được lưu trong leaderstats

    -- Định nghĩa các mức nâng cấp
    local upgradeThreshold = 100  -- Ngưỡng điểm cần để nâng cấp

    -- Cập nhật các chỉ số
    while wait(1) do
        if stats and stats.Strength and stats.Strength.Value >= upgradeThreshold then
            -- Nâng cấp Strength (ví dụ)
            player.Character.Humanoid.Health = player.Character.Humanoid.Health + 10  -- Tăng thêm máu
            stats.Strength.Value = stats.Strength.Value - upgradeThreshold  -- Giảm điểm sau khi nâng cấp
            print("Đã nâng cấp Strength!")
        end
    end
end

-- Kích hoạt AutoUpgrade
AutoUpgradeStats()

-- Tự động chiến đấu
local function AutoFarm()
    if not getgenv().AutoFarm then return end

    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    -- Tự động tìm kiếm quái vật gần đó và tấn công
    while wait(1) do
        local nearestEnemy = nil
        local shortestDistance = math.huge

        -- Tìm kiếm quái vật gần nhất
        for _, enemy in pairs(workspace:GetChildren()) do
            if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") then
                local distance = (character.HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).Magnitude
                if distance < shortestDistance then
                    nearestEnemy = enemy
                    shortestDistance = distance
                end
            end
        end

        -- Tấn công nếu tìm thấy quái vật
        if nearestEnemy then
            -- Di chuyển đến quái vật và tấn công (bạn có thể sử dụng các kỹ năng của nhân vật tại đây)
            humanoid:MoveTo(nearestEnemy.HumanoidRootPart.Position)
            -- Có thể thay thế bằng các kỹ năng cụ thể khi quái vật ở gần
            print("Đang tấn công quái vật: " .. nearestEnemy.Name)
        end
    end
end

-- Kích hoạt AutoFarm
AutoFarm()

-- Tự động học kỹ năng
local function AutoLearnSkills()
    if not getgenv().AutoLearnSkills then return end

    local player = game.Players.LocalPlayer
    local skills = player:WaitForChild("Skills")  -- Giả sử kỹ năng lưu trong một folder Skills

    while wait(1) do
        for _, skill in pairs(skills:GetChildren()) do
            if skill:IsA("IntValue") and skill.Value > 0 then
                -- Học kỹ năng nếu có đủ điểm
                -- Bạn có thể thêm logic kiểm tra điểm để học kỹ năng
                print("Đã học kỹ năng: " .. skill.Name)
                skill.Value = 0  -- Reset điểm kỹ năng sau khi học
            end
        end
    end
end

-- Kích hoạt AutoLearnSkills
AutoLearnSkills()

-- Tự động thu thập Devil Fruits
local function AutoCollectDevilFruits()
    if not getgenv().AutoCollectFruits then return end

    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    while wait(0.5) do
        for _, item in pairs(workspace:GetDescendants()) do
            if item:IsA("Model") and item.Name == "DevilFruit" then
                if (humanoidRootPart.Position - item.PrimaryPart.Position).Magnitude < 15 then
                    firetouchinterest(humanoidRootPart, item.PrimaryPart, 0)
                    wait(0.1)
                    firetouchinterest(humanoidRootPart, item.PrimaryPart, 1)
                    print("Đã thu thập trái ác quỷ: " .. item.Name)
                end
            end
        end
    end
end

-- Kích hoạt AutoCollectDevilFruits
AutoCollectDevilFruits()

-- Tự động tránh combat
local function AutoAvoidCombat()
    if not getgenv().AutoAvoidCombat then return end

    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    -- Đặt khoảng cách an toàn từ kẻ thù
    local safeDistance = 50

    while wait(1) do
        for _, enemy in pairs(workspace:GetChildren()) do
            if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") then
                local distance = (character.HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).Magnitude
                if distance < safeDistance then
                    -- Chạy trốn khỏi kẻ thù
                    local direction = (character.HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).unit
                    humanoid:MoveTo(character.HumanoidRootPart.Position + direction * safeDistance)
                    print("Đang tránh kẻ thù!")
                end
            end
        end
    end
end

-- Kích hoạt AutoAvoidCombat
AutoAvoidCombat()

-- Tự động sử dụng kỹ năng đặc biệt
local function AutoUseSkill()
    if not getgenv().AutoUseSkill then return end

    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    -- Kiểm tra khi cần dùng kỹ năng
    while wait(1) do
        if humanoid.Health < humanoid.MaxHealth / 2 then
            -- Sử dụng kỹ năng chữa trị hoặc kỹ năng đặc biệt
            print("Sử dụng kỹ năng chữa trị!")
            -- Thực hiện hành động sử dụng kỹ năng (có thể là gọi đến một phương thức trong game)
        end
    end
end

-- Kích hoạt AutoUseSkill
AutoUseSkill()

-- Thiết lập khoảng cách đánh xa
-- Hàm kiểm tra và thực hiện đánh xa
-- Hàm kiểm tra và thực hiện đánh xa
local function danhXa()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    -- Kiểm tra khoảng cách và thực hiện đánh
    if getgenv().DanhXaBat then  -- Chỉ thực hiện nếu chức năng đánh xa được bật
        for _, enemy in pairs(workspace:GetChildren()) do
            if enemy:FindFirstChild("HumanoidRootPart") and enemy ~= character and enemy:FindFirstChildOfClass("Humanoid") then
                local distance = (humanoidRootPart.Position - enemy.HumanoidRootPart.Position).Magnitude
                if distance <= getgenv().KhoangCach then
                    -- Thực hiện hành động đánh đối thủ
                end
            end
        end
    end
end

-- Hàm bật/tắt tính năng đánh xa
local function toggleDanhXa()
    getgenv().DanhXaBat = not getgenv().DanhXaBat  -- Đảo ngược trạng thái
    print("DanhXaBat hiện tại:", getgenv().DanhXaBat)  -- Thêm thông báo để kiểm tra
end

-- Lắng nghe sự kiện nhấn phím để bật/tắt tính năng đánh xa
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end  -- Tránh xử lý khi game đã xử lý sự kiện (như trong giao diện UI)
    
    -- Kiểm tra nếu nhấn phím "T" để bật/tắt tính năng đánh xa
    if input.KeyCode == Enum.KeyCode.T then
        toggleDanhXa()  -- Thực hiện bật/tắt tính năng đánh xa
    end
end)

-- Kiểm tra và thực hiện đánh xa mỗi lần "heartbeat"
local RunService = game:GetService("RunService")
RunService.Heartbeat:Connect(function()
    danhXa()  -- Gọi hàm kiểm tra và thực hiện đánh xa
end)

-- Đảm bảo rằng mã này đang chạy trong môi trường được phép, như trong một LocalScript hoặc ServerScript

-- Hàm gom quái
function BringMobsToPlayer()
    local player = game.Players.LocalPlayer  -- Lấy người chơi hiện tại
    local character = player.Character or player.CharacterAdded:Wait()  -- Lấy nhân vật của người chơi
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")  -- Lấy phần gốc của nhân vật

    -- Lặp qua tất cả các quái vật trong game
    for _, mob in pairs(workspace.Mobs:GetChildren()) do  -- Giả sử quái vật nằm trong workspace.Mobs
        if mob:IsA("Model") and mob:FindFirstChild("Humanoid") then  -- Kiểm tra nếu đối tượng là một quái vật
            local mobHumanoidRootPart = mob:FindFirstChild("HumanoidRootPart")
            if mobHumanoidRootPart then
                -- Di chuyển quái vật đến gần người chơi nếu biến BringMob là true
                if getgenv().BringMob then
                    mobHumanoidRootPart.CFrame = humanoidRootPart.CFrame + Vector3.new(math.random(-5, 5), 0, math.random(-5, 5))
                end
            end
        end
    end
end

-- Gọi hàm gom quái mỗi khi cần
while true do
    if getgenv().BringMob then
        BringMobsToPlayer()
    end
    wait(1)  -- Đợi một giây trước khi lặp lại
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local fps = 0

-- Tạo ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.Name = "UtilityGui"

-- Tạo Frame chứa các thông tin
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0, 20, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Tiêu đề
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Text = "Công Cụ Tối Ưu Hóa"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
titleLabel.Parent = frame

-- Hiển thị FPS
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(1, 0, 0, 30)
fpsLabel.Position = UDim2.new(0, 0, 0, 40)
fpsLabel.TextColor3 = Color3.new(1, 1, 1)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Text = "FPS Hiện Tại: 0"
fpsLabel.Parent = frame

RunService.RenderStepped:Connect(function(deltaTime)
    fps = math.floor(1 / deltaTime)
    fpsLabel.Text = "FPS Hiện Tại: " .. fps
end)

-- Nút Dọn Dẹp Bộ Nhớ
local memoryButton = Instance.new("TextButton")
memoryButton.Size = UDim2.new(1, 0, 0, 30)
memoryButton.Position = UDim2.new(0, 0, 0, 80)
memoryButton.TextColor3 = Color3.new(1, 1, 1)
memoryButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
memoryButton.Text = "Dọn Dẹp Bộ Nhớ"
memoryButton.Parent = frame

memoryButton.MouseButton1Click:Connect(function()
    collectgarbage("collect")
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") == nil then
            v:Destroy()
        end
    end
    print("Đã dọn dẹp bộ nhớ.")
end)