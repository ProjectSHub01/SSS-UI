
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local Stroke = Instance.new("UIStroke")

ScreenGui.Name = "ImageButton"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Size = UDim2.new(0, 40, 0, 40)
ImageButton.Image = "http://www.roblox.com/asset/?id=74099166547943"

UICorner.Parent = ImageButton
UICorner.CornerRadius = UDim.new(0, 100)
Stroke.Parent = ImageButton
Stroke.Color = Color3.fromRGB(150, 0, 0)
Stroke.Thickness = 1.5

local function updatePosition()
    local screenSize = workspace.CurrentCamera.ViewportSize
    ImageButton.Position = UDim2.new(0, 10, 1, -50) -- ซ้ายล่าง
end

updatePosition()
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updatePosition)

ImageButton.MouseButton1Down:Connect(function()
    game:GetService("CoreGui")["redz Library V5"].Hub.Visible = not game:GetService("CoreGui")["redz Library V5"].Hub.Visible
end)
