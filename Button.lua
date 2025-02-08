if game.CoreGui:FindFirstChild("SSS Button") then
    game.CoreGui["SSS Button"]:Destroy()
end

local S = Instance.new("ScreenGui")
local B = Instance.new("TextButton")
local Text = Instance.new("TextLabel")
local IMG = Instance.new("ImageLabel")
local C = Instance.new("UICorner")
local Sk = Instance.new("UIStroke")

S.Name = "SSS Button"
S.Parent = game.CoreGui
S.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

B.Parent = S
B.Text = ""
B.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
B.BorderSizePixel = 0
B.Size = UDim2.new(0, 200, 0, 30)

C.Parent = B
C.CornerRadius = UDim.new(0, 100)

Sk.Parent = B
Sk.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Sk.Color = Color3.fromRGB(255, 0, 0)
Sk.Thickness = 0.5

Text.Parent = B
Text.Position = UDim2.new(0, 35, 0, 6)
Text.Size = UDim2.new(0, 150, 0, 20)
Text.TextSize = 7
Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Text.Text = "FPS: -- | Time: --"
Text.BackgroundTransparency = 1 

IMG.Parent = B
IMG.Size = UDim2.new(0, 35, 0, 35)
IMG.Position = UDim2.new(0, 0, 0, -3)
IMG.Image = "rbxassetid://86913874100548"
IMG.BackgroundTransparency = 1

local startTime = tick()

local function updateStats()
    local fps = math.round(workspace:GetRealPhysicsFPS())
    local elapsedTime = tick() - startTime
    local hours = math.floor(elapsedTime / 3600)
    local minutes = math.floor((elapsedTime % 3600) / 60)
    local seconds = math.floor(elapsedTime % 60)
    local timeString = string.format("%02d:%02d:%02d", hours, minutes, seconds)

    Text.Text = "SSS Hub | FPS: " .. fps .. " | Time: " .. timeString
end

game:GetService("RunService").Heartbeat:Connect(function()
    updateStats()
end)

local function updatePosition()
    local screenSize = workspace.CurrentCamera.ViewportSize
    B.Position = UDim2.new(0.5, -B.Size.X.Offset / 2, 0, -50)
end

updatePosition()
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updatePosition)

B.MouseButton1Down:Connect(function()
  if game:GetService("CoreGui"):FindFirstChild("redz Library V5"):FindFirstChild("Hub") then
    game:GetService("CoreGui"):FindFirstChild("redz Library V5"):FindFirstChild("Hub").Visible = not game:GetService("CoreGui"):FindFirstChild("redz Library V5"):FindFirstChild("Hub").Visible
  end
end)
