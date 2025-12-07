-- 🌟 JOSÉ GABRIEL HUB 🚀
-- Criado por ChatGPT + José 😈🔥

local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

local Gui = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
Gui.ResetOnSpawn = false

local Frame = Instance.new("Frame", Gui)
Frame.Size = UDim2.new(0, 250, 0, 350)
Frame.Position = UDim2.new(0.75, 0, 0.25, 0)
Frame.BackgroundColor3 = Color3.fromRGB(10,10,10)
Frame.BorderSizePixel = 0

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(25,25,25)
Title.Text = "🔥 JOSÉ GABRIEL HUB 🔥"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextScaled = true

function CreateButton(text, callback)
    local b = Instance.new("TextButton", Frame)
    b.Size = UDim2.new(1, -10, 0, 35)
    b.Position = UDim2.new(0, 5, 0, #Frame:GetChildren() * 42)
    b.BackgroundColor3 = Color3.fromRGB(40,40,40)
    b.Text = text
    b.TextColor3 = Color3.new(1,1,1)
    b.TextScaled = true
    b.MouseButton1Click:Connect(callback)
end

----------------------------------------------------
-- ✔ INVISIBILIDADE
----------------------------------------------------
CreateButton("👤 Invisível", function()
    for _,v in ipairs(lp.Character:GetDescendants()) do
        pcall(function() v.Transparency = 1 end)
    end
end)

----------------------------------------------------
-- ✔ TELEPORT PARA INIMIGO MAIS PRÓXIMO
----------------------------------------------------
CreateButton("⚡ TP Pro Inimigo Mais Próximo", function()
    local nearest = nil
    local dist = 9999

    for _,plr in ipairs(Players:GetPlayers()) do
        if plr ~= lp and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local d = (plr.Character.HumanoidRootPart.Position - lp.Character.HumanoidRootPart.Position).Magnitude
            if d < dist then dist = d nearest = plr end
        end
    end

    if nearest then
        lp.Character.HumanoidRootPart.CFrame = nearest.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
    end
end)

----------------------------------------------------
-- ✔ AIMBOT
----------------------------------------------------
local aimbot = false

CreateButton("🎯 Aimbot", function()
    aimbot = not aimbot
end)

RunService.RenderStepped:Connect(function()
    if aimbot then
        local target = nil
        local dist = 9999

        for _,plr in ipairs(Players:GetPlayers()) do
            if plr ~= lp and plr.Character and plr.Character:FindFirstChild("Head") then
                local d = (plr.Character.Head.Position - Camera.CFrame.Position).Magnitude
                if d < dist then dist = d target = plr end
            end
        end

        if target then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.Head.Position)
        end
    end
end)

----------------------------------------------------
-- ✔ FLY
----------------------------------------------------
local flying = false

CreateButton("🛸 Fly", function()
    flying = not flying
end)

RunService.RenderStepped:Connect(function()
    if flying then
        lp.Character.HumanoidRootPart.Velocity = Vector3.new(0,50,0)
    end
end)

----------------------------------------------------
-- ✔ ESP
----------------------------------------------------
CreateButton("👁 ESP (players)", function()
    for _,player in ipairs(Players:GetPlayers()) do
        if player ~= lp and player.Character then
            local highlight = Instance.new("Highlight", player.Character)
            highlight.FillColor = Color3.fromRGB(255,0,0)
        end
    end
end)

----------------------------------------------------
-- ✔ AUTO KILL + CRÍTICO
----------------------------------------------------
local autokill = false

CreateButton("💀 Auto Kill + Crítico", function()
    autokill = not autokill
end)

RunService.RenderStepped:Connect(function()
    if autokill then
        for _,plr in ipairs(Players:GetPlayers()) do
            if plr ~= lp and plr.Character and plr.Character:FindFirstChild("Humanoid") then
                plr.Character.Humanoid.Health = 0
            end
        end
    end
end)

----------------------------------------------------
-- ✔ ANTI KICK
----------------------------------------------------
CreateButton("🛡 Anti Kick", function()
    for _, connection in ipairs(getconnections(lp.Idled)) do
        connection:Disable()
    end
end)

print("🟢 SCRIPT LOADED COM SUCESSO")
