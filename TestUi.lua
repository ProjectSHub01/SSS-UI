Library = {}

local function Tw(info)
	local Value = info.vu or info.Value or info.value or info.Vu or info.v or info.u
	local Time = info.Time or info.t or info.T or 0
	local Style = info.Style or info.style or info.Sty or info.sty or info.s or info.S or "Linear"
	local Direction = info.Direction or info.direction or info.d or info.D or info.Drt or info.drt or info.dt or info.Dt or "Out"
	local Goal = info.Goal or info.goal or info.go or info.Go or info.G or info.g

	return game:GetService("TweenService"):Create(Value,TweenInfo.new(Time,Enum.EasingStyle[Style],Enum.EasingDirection[Direction]),Goal)
end

local function lak(a)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
		local Tween = game:GetService("TweenService"):Create(a, TweenInfo.new(0.3), {Position = pos})
		Tween:Play()
	end

	a.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			Dragging = true
			DragStart = input.Position
			StartPosition = a.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					Dragging = false
				end
			end)
		end
	end)

	a.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			DragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == DragInput and Dragging then
			Update(input)
		end
	end)
end

local HttpService = game:GetService("HttpService")
local IconLink = "https://raw.githubusercontent.com/ProjectSHub01/SSS-UI/main/icons.json"
local success, data = pcall(HttpService.GetAsync, HttpService, IconLink)
local IconList = success and HttpService:JSONDecode(data) or nil

local Excusyz = Instance.new("ScreenGui")

Excusyz.Name = "SSSEditUi"
Excusyz.IgnoreGuiInset = true
Excusyz.Parent = game.CoreGui

function Library:CreateWindow(info)
	
	local NameHub = info.Name or info.name or info.Title or info.title or "Excusyz"
	local Icon = info.Icon or info.icon or 86913874100548
	
	local Background_1 = Instance.new("Frame")
	local UICorner_1 = Instance.new("UICorner")
	local Logo_1 = Instance.new("ImageLabel")
	local HubName_1 = Instance.new("TextLabel")
	local Day_1 = Instance.new("TextLabel")
	local Line_1 = Instance.new("Frame")
	
	Background_1.Name = "Background"
	Background_1.Parent = Excusyz
	Background_1.AnchorPoint = Vector2.new(0.5, 0.5)
	Background_1.BackgroundColor3 = Color3.fromRGB(24,24,24)
	Background_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Background_1.BorderSizePixel = 0
	Background_1.Position = UDim2.new(0.5, 0,0.5, 0)
	Background_1.Size = UDim2.new(0, 0,0, 0)
	Background_1.ClipsDescendants = true
	
	lak(Background_1)
	
	UICorner_1.Parent = Background_1
	UICorner_1.CornerRadius = UDim.new(0,10)

	Logo_1.Name = "Logo"
	Logo_1.Parent = Background_1
	Logo_1.AnchorPoint = Vector2.new(0, 0.5)
	Logo_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Logo_1.BackgroundTransparency = 1
	Logo_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Logo_1.BorderSizePixel = 0
	Logo_1.Position = UDim2.new(0.0299999993, 0,0.0799999982, 0)
	Logo_1.Size = UDim2.new(0, 45,0, 45)
	if type(Icon) == 'string' and not Icon:find('rbxassetid://') then
		Logo_1.Image = "rbxassetid://".. Icon
	elseif type(Icon) == 'number' then
		Logo_1.Image = "rbxassetid://".. Icon
	else
		Logo_1.Image = Icon
	end

	HubName_1.Name = "HubName"
	HubName_1.Parent = Background_1
	HubName_1.AnchorPoint = Vector2.new(0.5, 0.5)
	HubName_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	HubName_1.BackgroundTransparency = 1
	HubName_1.BorderColor3 = Color3.fromRGB(0,0,0)
	HubName_1.BorderSizePixel = 0
	HubName_1.Position = UDim2.new(0.248750001, 0,0.0644999966, 0)
	HubName_1.Size = UDim2.new(0, 63,0, 30)
	HubName_1.Font = Enum.Font.SourceSansBold
	HubName_1.Text = NameHub
	HubName_1.TextColor3 = Color3.fromRGB(255,255,255)
	HubName_1.TextSize = 21
	HubName_1.TextXAlignment = Enum.TextXAlignment.Left

	Day_1.Name = "Day"
	Day_1.Parent = Background_1
	Day_1.AnchorPoint = Vector2.new(0.5, 0.5)
	Day_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Day_1.BackgroundTransparency = 1
	Day_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Day_1.BorderSizePixel = 0
	Day_1.Position = UDim2.new(0.248750001, 0,0.12, 0)
	Day_1.Size = UDim2.new(0, 63,0, 30)
	Day_1.FontFace = Font.new("rbxassetid://16658237174", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	Day_1.Text = os.date("%A, %B %d, %Y")
	Day_1.TextColor3 = Color3.fromRGB(255,255,255)
	Day_1.TextSize = 10
	Day_1.TextTransparency = 0.5
	Day_1.TextXAlignment = Enum.TextXAlignment.Left
	
	Line_1.Name = "Line"
	Line_1.Parent = Background_1
	Line_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Line_1.BackgroundTransparency = 0.5
	Line_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Line_1.BorderSizePixel = 0
	Line_1.Position = UDim2.new(0, 0,0.16, 0)
	Line_1.Size = UDim2.new(1, 0,0, 2)

	local CloseUI = Instance.new("TextButton")
	local UICorner_1 = Instance.new("UICorner")
	local ClouseUIIcon = Instance.new("ImageLabel")
	local BackgroundGradient_1 = Instance.new("UIGradient")
	local FPSText = Instance.new("TextLabel")
	local ServerTimeText = Instance.new("TextLabel")

	CloseUI.Name = "CloseUI"
	CloseUI.Parent = Excusyz
	CloseUI.Active = true
	CloseUI.AnchorPoint = Vector2.new(0.5, 0.5)
	CloseUI.BackgroundColor3 = Color3.fromRGB(58,58,58)
	CloseUI.BorderColor3 = Color3.fromRGB(0,0,0)
	CloseUI.BorderSizePixel = 0
	CloseUI.Position = UDim2.new(0.0909999982, 0,0.186000004, 0)
	CloseUI.Size = UDim2.new(0, 70,0, 30)
	CloseUI.Font = Enum.Font.Gotham
	CloseUI.Text = ""
	CloseUI.TextColor3 = Color3.fromRGB(255,255,255)
	CloseUI.TextSize = 14
	CloseUI.BackgroundTransparency = 1

	UICorner_1.Parent = CloseUI
	UICorner_1.CornerRadius = UDim.new(1,0)

	ClouseUIIcon.Parent = CloseUI
	ClouseUIIcon.AnchorPoint = Vector2.new(0.5, 0.5)
	ClouseUIIcon.BackgroundColor3 = Color3.fromRGB(255,255,255)
	ClouseUIIcon.BackgroundTransparency = 1
	ClouseUIIcon.BorderColor3 = Color3.fromRGB(0,0,0)
	ClouseUIIcon.BorderSizePixel = 0
	ClouseUIIcon.Position = UDim2.new(0.5, 0,0.5, 0)
	ClouseUIIcon.Size = UDim2.new(0, 20,0, 20)
	if type(Icon) == 'string' and not Icon:find('rbxassetid://') then
		ClouseUIIcon.Image = "rbxassetid://".. Icon
	elseif type(Icon) == 'number' then
		ClouseUIIcon.Image = "rbxassetid://".. Icon
	else
		ClouseUIIcon.Image = Icon
	end
	ClouseUIIcon.ImageTransparency = 1

	BackgroundGradient_1.Name = "BackgroundGradient"
	BackgroundGradient_1.Parent = CloseUI
	BackgroundGradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(13, 13, 13)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}
	BackgroundGradient_1.Rotation = -100
	
	FPSText.Name = "FPSText"
	FPSText.Parent = CloseUI
	FPSText.AnchorPoint = Vector2.new(0.5, 0.5)
	FPSText.BackgroundColor3 = Color3.fromRGB(255,255,255)
	FPSText.BackgroundTransparency = 1
	FPSText.BorderColor3 = Color3.fromRGB(0,0,0)
	FPSText.BorderSizePixel = 0
	FPSText.Position = UDim2.new(0.5, 0,0.5, 0)
	FPSText.Size = UDim2.new(0.800000012, 0,1, 0)
	FPSText.Font = Enum.Font.Gotham
	FPSText.Text = "FPS : 60"
	FPSText.TextColor3 = Color3.fromRGB(255,255,255)
	FPSText.TextSize = 10
	FPSText.TextXAlignment = Enum.TextXAlignment.Left
	FPSText.TextTransparency = 1

	ServerTimeText.Name = "ServerTimeText"
	ServerTimeText.Parent = CloseUI
	ServerTimeText.AnchorPoint = Vector2.new(0.5, 0.5)
	ServerTimeText.BackgroundColor3 = Color3.fromRGB(255,255,255)
	ServerTimeText.BackgroundTransparency = 1
	ServerTimeText.BorderColor3 = Color3.fromRGB(0,0,0)
	ServerTimeText.BorderSizePixel = 0
	ServerTimeText.Position = UDim2.new(0.5, 0,0.5, 0)
	ServerTimeText.Size = UDim2.new(0.800000012, 0,1, 0)
	ServerTimeText.Font = Enum.Font.Gotham
	ServerTimeText.Text = "00:00:00"
	ServerTimeText.TextColor3 = Color3.fromRGB(255,255,255)
	ServerTimeText.TextSize = 10
	ServerTimeText.TextXAlignment = Enum.TextXAlignment.Right
	ServerTimeText.TextTransparency = 1
	
	lak(CloseUI)
	
	local Sound_1 = Instance.new("Sound")

	Sound_1.Parent = CloseUI
	Sound_1.Volume = 0.3
	Sound_1.RollOffMode = Enum.RollOffMode.InverseTapered
	Sound_1.SoundId = "rbxassetid://17208361335"

	delay(0,function()
		Tw({
			v = CloseUI,
			t = 0.3,
			s = "Linear",
			d = "Out",
			g = {BackgroundTransparency = 0}
		}):Play()
		Tw({
			v = ClouseUIIcon,
			t = 0.3,
			s = "Linear",
			d = "Out",
			g = {ImageTransparency = 0}
		}):Play()
		Tw({
			v = Background_1,
			t = 0.3,
			s = "Linear",
			d = "Out",
			g = {Size = UDim2.new(0, 400,0, 300)}
		}):Play()
	end)
	
	local isopen = false
	local oripos
	
	CloseUI.MouseButton1Click:Connect(function()
		isopen = not isopen
		if isopen then
			oripos = CloseUI.Position
			Tw({
				v = Background_1,
				t = 0.15,
				s = "Linear",
				d = "Out",
				g = {Size = UDim2.new(0, 0,0, 0)}
			}):Play()
			Tw({
				v = CloseUI,
				t = 0.15,
				s = "Back",
				d = "In",
				g = {Position = UDim2.new(.5, 0,.1, 0)}
			}):Play()
			Tw({
				v = FPSText,
				t = 0.3,
				s = "Linear",
				d = "Out",
				g = {TextTransparency = 0}
			}):Play()
			Tw({
				v = ServerTimeText,
				t = 0.3,
				s = "Linear",
				d = "Out",
				g = {TextTransparency = 0}
			}):Play()
			Tw({
				v = CloseUI,
				t = 0.3,
				s = "Back",
				d = "Out",
				g = {Size = UDim2.new(0, 200,0, 30)}
			}):Play()
		else
			Tw({
				v = Background_1,
				t = 0.15,
				s = "Linear",
				d = "Out",
				g = {Size = UDim2.new(0, 400,0, 300)}
			}):Play()
			Tw({
				v = CloseUI,
				t = 0.15,
				s = "Linear",
				d = "Out",
				g = {Position = oripos}
			}):Play()
			Tw({
				v = FPSText,
				t = 0.3,
				s = "Linear",
				d = "Out",
				g = {TextTransparency = 1}
			}):Play()
			Tw({
				v = ServerTimeText,
				t = 0.3,
				s = "Linear",
				d = "Out",
				g = {TextTransparency = 1}
			}):Play()
			Tw({
				v = CloseUI,
				t = 0.3,
				s = "Back",
				d = "Out",
				g = {Size = UDim2.new(0, 70,0, 30)}
			}):Play()
		end
	end)
	
	local fps = 0
	local lastTime = tick()

	game:GetService("RunService").RenderStepped:Connect(function()
		local currentTime = tick()
		local deltaTime = currentTime - lastTime
		lastTime = currentTime
		fps = 1 / deltaTime
	end)
	
	spawn(function()
		while wait(1) do
			pcall(function()
				local scripttime = game.Workspace.DistributedGameTime
				local seconds = scripttime%60
				local minutes = math.floor(scripttime/60%60)
				local hours = math.floor(scripttime/3600)
				local tempo = string.format("%02d:%02d:%02d", hours ,minutes, seconds)
				ServerTimeText.Text = tostring(tempo)
				FPSText.Text = "FPS : "..string.format("%.0f", fps)
			end)
		end
	end)
	
	local Tablist_1 = Instance.new("Frame")
	local ScrollingFrame_1 = Instance.new("ScrollingFrame")
	local UIListLayout_1 = Instance.new("UIListLayout")
	
	Tablist_1.Name = "Tablist"
	Tablist_1.Parent = Background_1
	Tablist_1.AnchorPoint = Vector2.new(1, 0.5)
	Tablist_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Tablist_1.BackgroundTransparency = 1
	Tablist_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Tablist_1.BorderSizePixel = 0
	Tablist_1.Position = UDim2.new(0.970000029, 0,0.0799999982, 0)
	Tablist_1.Size = UDim2.new(0, 182,0, 45)

	ScrollingFrame_1.Name = "ScrollingFrame"
	ScrollingFrame_1.Parent = Tablist_1
	ScrollingFrame_1.Active = true
	ScrollingFrame_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	ScrollingFrame_1.BackgroundTransparency = 1
	ScrollingFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
	ScrollingFrame_1.BorderSizePixel = 0
	ScrollingFrame_1.Size = UDim2.new(1, 0,1, 0)
	ScrollingFrame_1.ClipsDescendants = true
	ScrollingFrame_1.AutomaticCanvasSize = Enum.AutomaticSize.None
	ScrollingFrame_1.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
	ScrollingFrame_1.CanvasPosition = Vector2.new(0, 0)
	ScrollingFrame_1.CanvasSize = UDim2.new(2, 0,0, 0)
	ScrollingFrame_1.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
	ScrollingFrame_1.HorizontalScrollBarInset = Enum.ScrollBarInset.None
	ScrollingFrame_1.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	ScrollingFrame_1.ScrollBarImageColor3 = Color3.fromRGB(0,0,0)
	ScrollingFrame_1.ScrollBarImageTransparency = 0
	ScrollingFrame_1.ScrollBarThickness = 0
	ScrollingFrame_1.ScrollingDirection = Enum.ScrollingDirection.XY
	ScrollingFrame_1.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
	ScrollingFrame_1.VerticalScrollBarInset = Enum.ScrollBarInset.None
	ScrollingFrame_1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right

	UIListLayout_1.Parent = ScrollingFrame_1
	UIListLayout_1.Padding = UDim.new(0,8)
	UIListLayout_1.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Center
	
	Library.Tab = {
		Value = false
	}
	function Library.Tab:CreateTab(info)
		
		local Title = info.Name or info.name or info.Title or info.title or nil
		local Icon = info.Icon or info.icon or nil
		
		local Tab_1 = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local List_1 = Instance.new("Frame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		local Title_1 = Instance.new("TextLabel")
		local Icon_1 = Instance.new("Frame")
		local Icon_2 = Instance.new("ImageLabel")
		local Click_1 = Instance.new("TextButton")
		
		Tab_1.Name = "Tab"
		Tab_1.Parent = ScrollingFrame_1
		Tab_1.BackgroundColor3 = Color3.fromRGB(136,136,136)
		Tab_1.BackgroundTransparency = 1
		Tab_1.BorderColor3 = Color3.fromRGB(0,0,0)
		Tab_1.BorderSizePixel = 0
		Tab_1.Position = UDim2.new(0, 0,0.111111112, 0)
		Tab_1.Size = UDim2.new(0, 43,0, 35)
		Tab_1.ClipsDescendants = true

		UICorner_2.Parent = Tab_1
		UICorner_2.CornerRadius = UDim.new(0,4)

		List_1.Name = "List"
		List_1.Parent = Tab_1
		List_1.AnchorPoint = Vector2.new(0.5, 0.5)
		List_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		List_1.BackgroundTransparency = 1
		List_1.BorderColor3 = Color3.fromRGB(0,0,0)
		List_1.BorderSizePixel = 0
		List_1.Position = UDim2.new(0.5, 0,0.5, 0)
		List_1.Size = UDim2.new(0.899999976, 0,0.899999976, 0)

		UIListLayout_2.Parent = List_1
		UIListLayout_2.Padding = UDim.new(0,5)
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

		Title_1.Name = "Title"
		Title_1.Parent = List_1
		Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		Title_1.BackgroundTransparency = 1
		Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
		Title_1.BorderSizePixel = 0
		Title_1.LayoutOrder = 1
		Title_1.Size = UDim2.new(0, 50,0, 5)
		Title_1.Font = Enum.Font.GothamBold
		Title_1.Text = Title
		Title_1.TextColor3 = Color3.fromRGB(255,255,255)
		Title_1.TextSize = 9
		Title_1.TextTransparency = 0.8

		Icon_1.Name = "Icon"
		Icon_1.Parent = List_1
		Icon_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		Icon_1.BackgroundTransparency = 1
		Icon_1.BorderColor3 = Color3.fromRGB(0,0,0)
		Icon_1.BorderSizePixel = 0
		Icon_1.Size = UDim2.new(0, 18,0, 18)

		Icon_2.Name = "Icon"
		Icon_2.Parent = Icon_1
		Icon_2.AnchorPoint = Vector2.new(0.5, 0.5)
		Icon_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
		Icon_2.BackgroundTransparency = 1
		Icon_2.BorderColor3 = Color3.fromRGB(0,0,0)
		Icon_2.BorderSizePixel = 0
		Icon_2.Position = UDim2.new(0.5, 0,0.5, 0)
		Icon_2.Size = UDim2.new(0, 15,0, 15)
		Icon_2.ImageTransparency = 0.8
		if IconList[Icon] then
			Icon_2.Image = IconList[Icon]
		elseif type(Icon) == 'string' and not Icon:find('rbxassetid://') then
			Icon_2.Image = "rbxassetid://".. Icon
		elseif type(Icon) == 'number' then
			Icon_2.Image = "rbxassetid://".. Icon
		else
			Icon_2.Image = Icon
		end
		
		Click_1.Name = "Click"
		Click_1.Parent = Tab_1
		Click_1.Active = true
		Click_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		Click_1.BackgroundTransparency = 1
		Click_1.BorderColor3 = Color3.fromRGB(0,0,0)
		Click_1.BorderSizePixel = 0
		Click_1.Size = UDim2.new(1, 0,1, 0)
		Click_1.Font = Enum.Font.SourceSans
		Click_1.Text = ""
		Click_1.TextSize = 14
		
		Title_1.Size = UDim2.new(0, Title_1.TextBounds.X + 10, 0, 5)
		Tab_1.Size = UDim2.new(0, math.max(Title_1.TextBounds.X + 20, 35), 0, 35)
		
		local Page_1 = Instance.new("Frame")
		local UIListLayout_6 = Instance.new("UIListLayout")
		local PageLeft_1 = Instance.new("ScrollingFrame")
		local PageRight_1 = Instance.new("ScrollingFrame")
		
		Page_1.Name = "Page"
		Page_1.Parent = Background_1
		Page_1.AnchorPoint = Vector2.new(0.5, 0.5)
		Page_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		Page_1.BackgroundTransparency = 1
		Page_1.BorderColor3 = Color3.fromRGB(0,0,0)
		Page_1.BorderSizePixel = 0
		Page_1.Position = UDim2.new(-2, 0,0.569999993, 0)
		Page_1.Size = UDim2.new(0.949999988, 0,0, 225)
		Page_1.Visible = false

		UIListLayout_6.Parent = Page_1
		UIListLayout_6.Padding = UDim.new(0,5)
		UIListLayout_6.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout_6.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder

		PageLeft_1.Name = "PageLeft"
		PageLeft_1.Parent = Page_1
		PageLeft_1.Active = true
		PageLeft_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		PageLeft_1.BackgroundTransparency = 1
		PageLeft_1.BorderColor3 = Color3.fromRGB(0,0,0)
		PageLeft_1.BorderSizePixel = 0
		PageLeft_1.Size = UDim2.new(0.479999989, 0,1, 0)
		PageLeft_1.ClipsDescendants = true
		PageLeft_1.AutomaticCanvasSize = Enum.AutomaticSize.None
		PageLeft_1.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
		PageLeft_1.CanvasPosition = Vector2.new(0, 0)
		PageLeft_1.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
		PageLeft_1.HorizontalScrollBarInset = Enum.ScrollBarInset.None
		PageLeft_1.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		PageLeft_1.ScrollBarImageColor3 = Color3.fromRGB(0,0,0)
		PageLeft_1.ScrollBarImageTransparency = 0
		PageLeft_1.ScrollBarThickness = 0
		PageLeft_1.ScrollingDirection = Enum.ScrollingDirection.XY
		PageLeft_1.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
		PageLeft_1.VerticalScrollBarInset = Enum.ScrollBarInset.None
		PageLeft_1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
		
		PageRight_1.Name = "PageRight"
		PageRight_1.Parent = Page_1
		PageRight_1.Active = true
		PageRight_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		PageRight_1.BackgroundTransparency = 1
		PageRight_1.BorderColor3 = Color3.fromRGB(0,0,0)
		PageRight_1.BorderSizePixel = 0
		PageRight_1.Size = UDim2.new(0.479999989, 0,1, 0)
		PageRight_1.ClipsDescendants = true
		PageRight_1.AutomaticCanvasSize = Enum.AutomaticSize.None
		PageRight_1.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
		PageRight_1.CanvasPosition = Vector2.new(0, 0)
		PageRight_1.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
		PageRight_1.HorizontalScrollBarInset = Enum.ScrollBarInset.None
		PageRight_1.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		PageRight_1.ScrollBarImageColor3 = Color3.fromRGB(0,0,0)
		PageRight_1.ScrollBarImageTransparency = 0
		PageRight_1.ScrollBarThickness = 0
		PageRight_1.ScrollingDirection = Enum.ScrollingDirection.XY
		PageRight_1.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
		PageRight_1.VerticalScrollBarInset = Enum.ScrollBarInset.None
		PageRight_1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
		
		local UIListLayoutPageLeft = Instance.new("UIListLayout")

		UIListLayoutPageLeft.Parent = PageLeft_1
		UIListLayoutPageLeft.Padding = UDim.new(0,8)
		UIListLayoutPageLeft.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayoutPageLeft.SortOrder = Enum.SortOrder.LayoutOrder
		
		local UIListLayoutPageRight = Instance.new("UIListLayout")

		UIListLayoutPageRight.Parent = PageRight_1
		UIListLayoutPageRight.Padding = UDim.new(0,8)
		UIListLayoutPageRight.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayoutPageRight.SortOrder = Enum.SortOrder.LayoutOrder
		
		Click_1.MouseButton1Click:Connect(function()
			for i,v in pairs(ScrollingFrame_1:GetChildren()) do
				if v:IsA("Frame") then
					Tw({
						v = v,
						t = 0.3,
						s = "Linear",
						d = "Out",
						g = {BackgroundTransparency = 1}
					}):Play()
					Tw({
						v = v.List.Title,
						t = 0.3,
						s = "Linear",
						d = "Out",
						g = {TextTransparency = 0.8}
					}):Play()
					Tw({
						v = v.List.Icon.Icon,
						t = 0.3,
						s = "Linear",
						d = "Out",
						g = {ImageTransparency = 0.8}
					}):Play()
				end
			end
			for i,v in pairs(Background_1:GetChildren()) do
				if v.Name == "Page" then
					v.Visible = false
					v.Position = UDim2.new(-2, 0,0.569999993, 0)
				end
			end
			Tw({
				v = Icon_2,
				t = 0.3,
				s = "Linear",
				d = "Out",
				g = {ImageTransparency = 0}
			}):Play()
			Tw({
				v = Tab_1,
				t = 0.3,
				s = "Linear",
				d = "Out",
				g = {BackgroundTransparency = 0.8}
			}):Play()
			Tw({
				v = Title_1,
				t = 0.3,
				s = "Linear",
				d = "Out",
				g = {TextTransparency = 0}
			}):Play()
			Page_1.Visible = true
			Tw({
				v = Page_1,
				t = 0.3,
				s = "Linear",
				d = "Out",
				g = {Position = UDim2.new(0.5, 0,0.569999993, 0)}
			}):Play()
		end)
		
		delay(0,function()
			if not Library.Tab.Value then
				Tw({
					v = Icon_2,
					t = 0.3,
					s = "Linear",
					d = "Out",
					g = {ImageTransparency = 0}
				}):Play()
				Tw({
					v = Tab_1,
					t = 0.3,
					s = "Linear",
					d = "Out",
					g = {BackgroundTransparency = 0.8}
				}):Play()
				Tw({
					v = Title_1,
					t = 0.3,
					s = "Linear",
					d = "Out",
					g = {TextTransparency = 0}
				}):Play()
				Page_1.Visible = true
				Tw({
					v = Page_1,
					t = 0.3,
					s = "Linear",
					d = "Out",
					g = {Position = UDim2.new(0.5, 0,0.569999993, 0)}
				}):Play()
				Library.Tab.Value = true
			end
		end)
		
		local function GetSide(side)
			if side == "r" or side == "R" or side == "Right" or side == "right" or side == 2 then
				return PageRight_1
			elseif side == "l" or side == "L" or side == "Left" or side == "left" or side == 1 then
				return PageLeft_1
			else
				return PageLeft_1
			end
		end
		
		Library.Section = {}
		
		function Library.Section:CreateSection(info)
			
			local Title = info.Name or info.name or info.Title or info.title or nil
			local Side = info.Side or info.side
			
			local Section_1 = Instance.new("Frame")
			local UICorner_6 = Instance.new("UICorner")
			--local UIStroke_1 = Instance.new("UIStroke")
			local UIListLayout_7 = Instance.new("UIListLayout")
			local SectionTitle_1 = Instance.new("TextLabel")
			local Line_2 = Instance.new("Frame")
			local Line2_1 = Instance.new("Frame")
			
			Section_1.Name = "Section"
			Section_1.Parent = GetSide(Side)
			Section_1.BackgroundColor3 = Color3.fromRGB(29,29,29)
			Section_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Section_1.BorderSizePixel = 0
			Section_1.Position = UDim2.new(0.0049999305, 0,0.0250000004, 0)
			Section_1.Size = UDim2.new(1, 0,0, 0)
			Section_1.ClipsDescendants = true

			UICorner_6.Parent = Section_1
			UICorner_6.CornerRadius = UDim.new(0,10)

			--UIStroke_1.Parent = Section_1
			--UIStroke_1.Color = Color3.fromRGB(43,43,43)
			--UIStroke_1.Thickness = 1

			UIListLayout_7.Parent = Section_1
			UIListLayout_7.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout_7.SortOrder = Enum.SortOrder.LayoutOrder

			SectionTitle_1.Name = "SectionTitle"
			SectionTitle_1.Parent = Section_1
			SectionTitle_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			SectionTitle_1.BackgroundTransparency = 1
			SectionTitle_1.BorderColor3 = Color3.fromRGB(0,0,0)
			SectionTitle_1.BorderSizePixel = 0
			SectionTitle_1.Size = UDim2.new(1, 0,0, 25)
			SectionTitle_1.Font = Enum.Font.GothamBold
			SectionTitle_1.Text = Title
			SectionTitle_1.TextColor3 = Color3.fromRGB(255,255,255)
			SectionTitle_1.TextSize = 10
			
			Line_2.Name = "Line"
			Line_2.Parent = Section_1
			Line_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Line_2.BackgroundTransparency = 0.5
			Line_2.BorderColor3 = Color3.fromRGB(0,0,0)
			Line_2.BorderSizePixel = 0
			Line_2.LayoutOrder = 1
			Line_2.Size = UDim2.new(1, 0,0, 2)
			
			Line2_1.Name = "Line2"
			Line2_1.Parent = Section_1
			Line2_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Line2_1.BackgroundTransparency = 1
			Line2_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Line2_1.BorderSizePixel = 0
			Line2_1.LayoutOrder = 1
			Line2_1.Size = UDim2.new(1, 0,0, 5)
			
			Library.Main = {}
			
			function Library.Main:CreateToggle(info)
				
				local Title = info.Name or info.name or info.Title or info.title or nil
				local Value = info.Value or info.Defuse or info.value or info.defuse or info.vu or info.df or false
				local Callback = info.Callback or info.callback or info.cb or function() end
				
				local Toggle_1 = Instance.new("Frame")
				local ListfunctionToggle_1 = Instance.new("Frame")
				local UIListLayout_8 = Instance.new("UIListLayout")
				local Title_5 = Instance.new("TextLabel")
				local ToggleO_1 = Instance.new("Frame")
				local UICorner_7 = Instance.new("UICorner")
				local done_1 = Instance.new("ImageLabel")
				local UICorner_8 = Instance.new("UICorner")
				local UIStroke_2 = Instance.new("UIStroke")
				local Click_1 = Instance.new("TextButton")
				
				Toggle_1.Name = "Toggle"
				Toggle_1.Parent = Section_1
				Toggle_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Toggle_1.BackgroundTransparency = 1
				Toggle_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Toggle_1.BorderSizePixel = 0
				Toggle_1.LayoutOrder = 2
				Toggle_1.Size = UDim2.new(1, 0,0, 25)

				ListfunctionToggle_1.Name = "ListfunctionToggle"
				ListfunctionToggle_1.Parent = Toggle_1
				ListfunctionToggle_1.AnchorPoint = Vector2.new(0.5, 0.5)
				ListfunctionToggle_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				ListfunctionToggle_1.BackgroundTransparency = 1
				ListfunctionToggle_1.BorderColor3 = Color3.fromRGB(0,0,0)
				ListfunctionToggle_1.BorderSizePixel = 0
				ListfunctionToggle_1.Position = UDim2.new(0.5, 0,0.5, 0)
				ListfunctionToggle_1.Size = UDim2.new(0.899999976, 0,0, 25)

				UIListLayout_8.Parent = ListfunctionToggle_1
				UIListLayout_8.Padding = UDim.new(0,8)
				UIListLayout_8.FillDirection = Enum.FillDirection.Horizontal
				UIListLayout_8.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_8.VerticalAlignment = Enum.VerticalAlignment.Center

				Title_5.Name = "Title"
				Title_5.Parent = ListfunctionToggle_1
				Title_5.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Title_5.BackgroundTransparency = 1
				Title_5.BorderColor3 = Color3.fromRGB(0,0,0)
				Title_5.BorderSizePixel = 0
				Title_5.Size = UDim2.new(1, 0,1, 0)
				Title_5.Font = Enum.Font.GothamBold
				Title_5.Text = Title
				Title_5.TextColor3 = Color3.fromRGB(255,255,255)
				Title_5.TextSize = 9
				Title_5.TextXAlignment = Enum.TextXAlignment.Left

				ToggleO_1.Name = "ToggleO"
				ToggleO_1.Parent = ListfunctionToggle_1
				ToggleO_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				ToggleO_1.BorderColor3 = Color3.fromRGB(0,0,0)
				ToggleO_1.BorderSizePixel = 0
				ToggleO_1.LayoutOrder = -1
				ToggleO_1.Size = UDim2.new(0, 15,0, 15)
				ToggleO_1.BackgroundTransparency = 1

				UICorner_7.Parent = ToggleO_1
				UICorner_7.CornerRadius = UDim.new(0,4)

				done_1.Name = "done"
				done_1.Parent = ToggleO_1
				done_1.AnchorPoint = Vector2.new(0.5, 0.5)
				done_1.BackgroundColor3 = Color3.fromRGB(27,27,27)
				done_1.BackgroundTransparency = 1
				done_1.BorderColor3 = Color3.fromRGB(27,27,27)
				done_1.Position = UDim2.new(0.5, 0,0.5, 0)
				done_1.Size = UDim2.new(0.899999976, 0,0.899999976, 0)
				done_1.ZIndex = 2
				done_1.Image = "rbxassetid://3926305904"
				done_1.ImageColor3 = Color3.fromRGB(27,27,27)
				done_1.ImageRectOffset = Vector2.new(644, 204)
				done_1.ImageRectSize = Vector2.new(36, 36)

				UICorner_8.Parent = done_1
				UICorner_8.CornerRadius = UDim.new(0,4)

				UIStroke_2.Parent = ToggleO_1
				UIStroke_2.Color = Color3.fromRGB(37,37,37)
				UIStroke_2.Thickness = 1

				Click_1.Name = "Click"
				Click_1.Parent = Toggle_1
				Click_1.Active = true
				Click_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Click_1.BackgroundTransparency = 1
				Click_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Click_1.BorderSizePixel = 0
				Click_1.Size = UDim2.new(1, 0,1, 0)
				Click_1.Font = Enum.Font.SourceSans
				Click_1.Text = ""
				Click_1.TextSize = 14
				
				local function ToggleC(Value)
					if not Value then 
						Callback(Value)
						Tw({
							v = ToggleO_1,
							t = 0.15,
							s = "Linear",
							d = "Out",
							g = {BackgroundTransparency = 1}
						}):Play()
						Tw({
							v = Title_5,
							t = 0.3,
							s = "Linear",
							d = "Out",
							g = {TextTransparency = 0.5}
						}):Play()
					elseif Value then 
						Callback(Value)
						Tw({
							v = ToggleO_1,
							t = 0.15,
							s = "Linear",
							d = "Out",
							g = {BackgroundTransparency = 0}
						}):Play()
						Tw({
							v = Title_5,
							t = 0.3,
							s = "Linear",
							d = "Out",
							g = {TextTransparency = 0}
						}):Play()
					end
				end

				Click_1.MouseButton1Click:Connect(function()
					Value = not Value
					ToggleC(Value)
				end)

				ToggleC(Value)

				local NewValue = {}

				function NewValue:SetValue(a)
					Value = a
					ToggleC(Value)
				end

				function NewValue:Set(b)
					Title_1.Text = b
				end

				return NewValue
			end
			
			function Library.Main:CreateSlider(info)
				
				local Title = info.Name or info.name or info.Title or info.title or nil
				local Textending = info.TextEnding or info.textending or info.te or info.ending or ""
				local Min = info.Min or info.min or 0
				local Max = info.Max or info.max or 100
				local Value = info.Value or info.Defuse or info.value or info.defuse or info.vu or info.df or Min or 50
				local Callback = info.Callback or info.callback or info.cb or function() end
				
				local Slider_1 = Instance.new("Frame")
				local SliderText_1 = Instance.new("Frame")
				local Title_7 = Instance.new("TextLabel")
				local SliderBar_1 = Instance.new("Frame")
				local SliderBarValue_1 = Instance.new("Frame")
				local UICorner_11 = Instance.new("UICorner")
				local SliderO_1 = Instance.new("Frame")
				local UICorner_12 = Instance.new("UICorner")
				local UICorner_13 = Instance.new("UICorner")
				local Click_3 = Instance.new("TextButton")
				local UIGradient_1 = Instance.new("UIGradient")
				local SliderValueBox_1 = Instance.new("Frame")
				local UICorner_14 = Instance.new("UICorner")
				local UIStroke_4 = Instance.new("UIStroke")
				local TextBox_1 = Instance.new("TextBox")
				
				Slider_1.Name = "Slider"
				Slider_1.Parent = Section_1
				Slider_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Slider_1.BackgroundTransparency = 1
				Slider_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Slider_1.BorderSizePixel = 0
				Slider_1.LayoutOrder = 2
				Slider_1.Size = UDim2.new(1, 0,0, 40)

				SliderText_1.Name = "SliderText"
				SliderText_1.Parent = Slider_1
				SliderText_1.AnchorPoint = Vector2.new(0.5, 0.5)
				SliderText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				SliderText_1.BackgroundTransparency = 1
				SliderText_1.BorderColor3 = Color3.fromRGB(0,0,0)
				SliderText_1.BorderSizePixel = 0
				SliderText_1.Position = UDim2.new(0.5, 0,0.5, 0)
				SliderText_1.Size = UDim2.new(0.899999976, 0,0, 25)

				Title_7.Name = "Title"
				Title_7.Parent = SliderText_1
				Title_7.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Title_7.BackgroundTransparency = 1
				Title_7.BorderColor3 = Color3.fromRGB(0,0,0)
				Title_7.BorderSizePixel = 0
				Title_7.Size = UDim2.new(1, 0,1, 0)
				Title_7.Font = Enum.Font.GothamBold
				Title_7.Text = Title
				Title_7.TextColor3 = Color3.fromRGB(255,255,255)
				Title_7.TextSize = 9
				Title_7.TextTransparency = 0.5
				Title_7.TextXAlignment = Enum.TextXAlignment.Left
				Title_7.TextYAlignment = Enum.TextYAlignment.Top

				SliderBar_1.Name = "SliderBar"
				SliderBar_1.Parent = Slider_1
				SliderBar_1.AnchorPoint = Vector2.new(0, 0.5)
				SliderBar_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				SliderBar_1.BackgroundTransparency = 0.6000000238418579
				SliderBar_1.BorderColor3 = Color3.fromRGB(0,0,0)
				SliderBar_1.BorderSizePixel = 0
				SliderBar_1.Position = UDim2.new(0.0500000007, 0,0.699999988, 0)
				SliderBar_1.Size = UDim2.new(0.680000007, 0,0, 3)

				SliderBarValue_1.Name = "SliderBarValue"
				SliderBarValue_1.Parent = SliderBar_1
				SliderBarValue_1.BackgroundColor3 = Color3.fromRGB(217,40,40)
				SliderBarValue_1.BorderColor3 = Color3.fromRGB(0,0,0)
				SliderBarValue_1.BorderSizePixel = 0
				SliderBarValue_1.Size = UDim2.new(0.5, 0,1, 0)

				UICorner_11.Parent = SliderBarValue_1
				UICorner_11.CornerRadius = UDim.new(1,0)

				SliderO_1.Name = "SliderO"
				SliderO_1.Parent = SliderBarValue_1
				SliderO_1.AnchorPoint = Vector2.new(1, 0.5)
				SliderO_1.BackgroundColor3 = Color3.fromRGB(217,40,40)
				SliderO_1.BorderColor3 = Color3.fromRGB(0,0,0)
				SliderO_1.BorderSizePixel = 0
				SliderO_1.Position = UDim2.new(1, 0,0.5, 0)
				SliderO_1.Size = UDim2.new(0, 8,0, 8)

				UICorner_12.Parent = SliderO_1
				UICorner_12.CornerRadius = UDim.new(1,0)

				UICorner_13.Parent = SliderBar_1
				UICorner_13.CornerRadius = UDim.new(1,0)

				Click_3.Name = "Click"
				Click_3.Parent = SliderBar_1
				Click_3.Active = true
				Click_3.AnchorPoint = Vector2.new(0.5, 0.5)
				Click_3.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Click_3.BackgroundTransparency = 1
				Click_3.BorderColor3 = Color3.fromRGB(0,0,0)
				Click_3.BorderSizePixel = 0
				Click_3.Position = UDim2.new(0.5, 0,0.5, 0)
				Click_3.Size = UDim2.new(1, 10,1, 10)
				Click_3.Font = Enum.Font.SourceSans
				Click_3.Text = ""
				Click_3.TextSize = 14

				UIGradient_1.Parent = SliderBar_1
				UIGradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(24, 24, 24))}

				SliderValueBox_1.Name = "SliderValueBox"
				SliderValueBox_1.Parent = Slider_1
				SliderValueBox_1.AnchorPoint = Vector2.new(1, 0.5)
				SliderValueBox_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				SliderValueBox_1.BackgroundTransparency = 1
				SliderValueBox_1.BorderColor3 = Color3.fromRGB(0,0,0)
				SliderValueBox_1.BorderSizePixel = 0
				SliderValueBox_1.LayoutOrder = -1
				SliderValueBox_1.Position = UDim2.new(0.959999979, 0,0.699999988, 0)
				SliderValueBox_1.Size = UDim2.new(0, 30,0, 15)

				UICorner_14.Parent = SliderValueBox_1
				UICorner_14.CornerRadius = UDim.new(0,4)

				UIStroke_4.Parent = SliderValueBox_1
				UIStroke_4.Color = Color3.fromRGB(37,37,37)
				UIStroke_4.Thickness = 1

				TextBox_1.Parent = SliderValueBox_1
				TextBox_1.Active = true
				TextBox_1.AnchorPoint = Vector2.new(0.5,0.5)
				TextBox_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				TextBox_1.BackgroundTransparency = 1
				TextBox_1.BorderColor3 = Color3.fromRGB(0,0,0)
				TextBox_1.BorderSizePixel = 0
				TextBox_1.Size = UDim2.new(1, 0,1, 0)
				TextBox_1.Font = Enum.Font.Gotham
				TextBox_1.PlaceholderText = ""
				TextBox_1.Text = "50"
				TextBox_1.TextColor3 = Color3.fromRGB(255,255,255)
				TextBox_1.TextSize = 8
				TextBox_1.Position = UDim2.new(0.5, 0,0.5, 0)
				
				local function updateSlider(value)
					value = math.clamp(value, Min, Max)
					Tw({
						v = SliderBarValue_1,
						t = 0.15,
						s = "Exponential",
						d = "Out",
						g = {Size = UDim2.new((value - Min) / (Max - Min), 0, 1, 0)}
					}):Play()
					TextBox_1.Text = tostring(value)..Textending
					TextBox_1.Size = UDim2.new(0, TextBox_1.TextBounds.X + 2, 0.5, 0)
					Callback(value)
				end

				updateSlider(Value or 0)

				TextBox_1.FocusLost:Connect(function()
					local value = tonumber(TextBox_1.Text) or Min
					updateSlider(value)
				end)

				local function move(input)
					local sliderBar = SliderBar_1
					local relativeX = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
					local value = math.floor(relativeX * (Max - Min) + Min)
					updateSlider(value)
				end

				local dragging = false

				Click_3.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						dragging = true
						move(input)
					end
				end)

				Click_3.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						dragging = false
					end
				end)

				game:GetService("UserInputService").InputChanged:Connect(function(input)
					if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
						move(input)
					end
				end)
			end
			
			function Library.Main:CreateDropdown(info)
				
				local Title = info.Name or info.name or info.Title or info.title or info.Text or info.text or nil
				local Callback = info.Callback or info.callback or info.cb or function() end
				local Value = info.Value or info.Defuse or info.value or info.defuse or info.vu or info.df or ""
				local List = info.List or info.list
				local Multi = info.Multi or info.multi or info.MultiDropdown or info.multidropdown or info.Multidropdown or false
				
				local Dropdown_1 = Instance.new("Frame")
				local DropdownText_1 = Instance.new("Frame")
				local Title_8 = Instance.new("TextLabel")
				local DropdownBar_1 = Instance.new("Frame")
				local UICorner_15 = Instance.new("UICorner")
				local UIStroke_5 = Instance.new("UIStroke")
				local DropdownIcon_1 = Instance.new("ImageLabel")
				local TextLabel_1 = Instance.new("TextLabel")
				local Click_4 = Instance.new("TextButton")
				
				local DropdownSelect_1 = Instance.new("Frame")
				local DropdownItem_1 = Instance.new("Frame")
				local ScrollingFrame_2 = Instance.new("ScrollingFrame")
				local UIListLayout_10 = Instance.new("UIListLayout")
				local UICorner_16 = Instance.new("UICorner")
				
				Dropdown_1.Name = "Dropdown"
				Dropdown_1.Parent = Section_1
				Dropdown_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Dropdown_1.BackgroundTransparency = 1
				Dropdown_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Dropdown_1.BorderSizePixel = 0
				Dropdown_1.LayoutOrder = 2
				Dropdown_1.Size = UDim2.new(1, 0,0, 40)

				DropdownText_1.Name = "DropdownText"
				DropdownText_1.Parent = Dropdown_1
				DropdownText_1.AnchorPoint = Vector2.new(0.5, 0.5)
				DropdownText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				DropdownText_1.BackgroundTransparency = 1
				DropdownText_1.BorderColor3 = Color3.fromRGB(0,0,0)
				DropdownText_1.BorderSizePixel = 0
				DropdownText_1.Position = UDim2.new(0.5, 0,0.5, 0)
				DropdownText_1.Size = UDim2.new(0.899999976, 0,0, 25)

				Title_8.Name = "Title"
				Title_8.Parent = DropdownText_1
				Title_8.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Title_8.BackgroundTransparency = 1
				Title_8.BorderColor3 = Color3.fromRGB(0,0,0)
				Title_8.BorderSizePixel = 0
				Title_8.Size = UDim2.new(1, 0,1, 0)
				Title_8.Font = Enum.Font.GothamBold
				Title_8.Text = Title
				Title_8.TextColor3 = Color3.fromRGB(255,255,255)
				Title_8.TextSize = 9
				Title_8.TextTransparency = 0.5
				Title_8.TextXAlignment = Enum.TextXAlignment.Left
				Title_8.TextYAlignment = Enum.TextYAlignment.Top

				DropdownBar_1.Name = "DropdownBar"
				DropdownBar_1.Parent = Dropdown_1
				DropdownBar_1.AnchorPoint = Vector2.new(0.5, 0.5)
				DropdownBar_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				DropdownBar_1.BackgroundTransparency = 1
				DropdownBar_1.BorderColor3 = Color3.fromRGB(0,0,0)
				DropdownBar_1.BorderSizePixel = 0
				DropdownBar_1.Position = UDim2.new(0.5, 0,0.699999988, 0)
				DropdownBar_1.Size = UDim2.new(0.899999976, 0,0, 15)

				UICorner_15.Parent = DropdownBar_1
				UICorner_15.CornerRadius = UDim.new(0,4)

				UIStroke_5.Parent = DropdownBar_1
				UIStroke_5.Color = Color3.fromRGB(37,37,37)
				UIStroke_5.Thickness = 1

				DropdownIcon_1.Name = "DropdownIcon"
				DropdownIcon_1.Parent = DropdownBar_1
				DropdownIcon_1.AnchorPoint = Vector2.new(1, 0.5)
				DropdownIcon_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				DropdownIcon_1.BackgroundTransparency = 1
				DropdownIcon_1.BorderColor3 = Color3.fromRGB(0,0,0)
				DropdownIcon_1.BorderSizePixel = 0
				DropdownIcon_1.Position = UDim2.new(0.980000019, 0,0.5, 0)
				DropdownIcon_1.Size = UDim2.new(0, 10,0, 10)
				DropdownIcon_1.Image = "rbxassetid://12974428978"

				TextLabel_1.Parent = DropdownBar_1
				TextLabel_1.AnchorPoint = Vector2.new(0.5, 0)
				TextLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				TextLabel_1.BackgroundTransparency = 1
				TextLabel_1.BorderColor3 = Color3.fromRGB(0,0,0)
				TextLabel_1.BorderSizePixel = 0
				TextLabel_1.Position = UDim2.new(0.5, 0,0, 0)
				TextLabel_1.Size = UDim2.new(0.899999976, 0,1, 0)
				TextLabel_1.Font = Enum.Font.Gotham
				if type(Value) == "table" then
					TextLabel_1.Text = table.concat(Value, ", ")
				else
					TextLabel_1.Text = Value
				end
				TextLabel_1.TextColor3 = Color3.fromRGB(255,255,255)
				TextLabel_1.TextSize = 9
				TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left

				Click_4.Name = "Click"
				Click_4.Parent = Dropdown_1
				Click_4.Active = true
				Click_4.AnchorPoint = Vector2.new(0.5, 0.5)
				Click_4.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Click_4.BackgroundTransparency = 1
				Click_4.BorderColor3 = Color3.fromRGB(0,0,0)
				Click_4.BorderSizePixel = 0
				Click_4.Position = UDim2.new(0.5, 0,0.5, 0)
				Click_4.Size = UDim2.new(1, 0,1, 0)
				Click_4.Font = Enum.Font.SourceSans
				Click_4.Text = ""
				Click_4.TextSize = 14

				DropdownSelect_1.Name = "DropdownSelect"
				DropdownSelect_1.Parent = Section_1
				DropdownSelect_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				DropdownSelect_1.BackgroundTransparency = 1
				DropdownSelect_1.BorderColor3 = Color3.fromRGB(0,0,0)
				DropdownSelect_1.BorderSizePixel = 0
				DropdownSelect_1.LayoutOrder = 2
				DropdownSelect_1.Size = UDim2.new(1, 0,0, 0)

				DropdownItem_1.Name = "DropdownItem"
				DropdownItem_1.Parent = DropdownSelect_1
				DropdownItem_1.AnchorPoint = Vector2.new(0.5, 0.5)
				DropdownItem_1.BackgroundColor3 = Color3.fromRGB(46,46,46)
				DropdownItem_1.BorderColor3 = Color3.fromRGB(0,0,0)
				DropdownItem_1.BorderSizePixel = 0
				DropdownItem_1.Position = UDim2.new(0.5, 0,0.5, 0)
				DropdownItem_1.Size = UDim2.new(0.899999976, 0,1, 0)
				DropdownItem_1.ClipsDescendants = true

				ScrollingFrame_2.Name = "ScrollingFrame"
				ScrollingFrame_2.Parent = DropdownItem_1
				ScrollingFrame_2.Active = true
				ScrollingFrame_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
				ScrollingFrame_2.BackgroundTransparency = 1
				ScrollingFrame_2.BorderColor3 = Color3.fromRGB(0,0,0)
				ScrollingFrame_2.BorderSizePixel = 0
				ScrollingFrame_2.Size = UDim2.new(1, 0,1, 0)
				ScrollingFrame_2.ClipsDescendants = true
				ScrollingFrame_2.AutomaticCanvasSize = Enum.AutomaticSize.None
				ScrollingFrame_2.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
				ScrollingFrame_2.CanvasPosition = Vector2.new(0, 0)
				ScrollingFrame_2.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
				ScrollingFrame_2.HorizontalScrollBarInset = Enum.ScrollBarInset.None
				ScrollingFrame_2.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
				ScrollingFrame_2.ScrollBarImageColor3 = Color3.fromRGB(0,0,0)
				ScrollingFrame_2.ScrollBarImageTransparency = 0
				ScrollingFrame_2.ScrollBarThickness = 0
				ScrollingFrame_2.ScrollingDirection = Enum.ScrollingDirection.XY
				ScrollingFrame_2.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
				ScrollingFrame_2.VerticalScrollBarInset = Enum.ScrollBarInset.None
				ScrollingFrame_2.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right

				UIListLayout_10.Parent = ScrollingFrame_2
				UIListLayout_10.SortOrder = Enum.SortOrder.LayoutOrder
				
				UICorner_16.Parent = DropdownItem_1
				UICorner_16.CornerRadius = UDim.new(0,5)
				
				local isOpen = false
				
				Click_4.MouseButton1Click:Connect(function()
					isOpen = not isOpen
					if isOpen then
						if UIListLayout_10.AbsoluteContentSize.Y + 5 < 100 then
							Tw({
								v = DropdownSelect_1,
								t = 0.15,
								s = "Exponential",
								d = "Out",
								g = {Size = UDim2.new(1, 0,0, UIListLayout_10.AbsoluteContentSize.Y + 5)}
							}):Play()
						else
							Tw({
								v = DropdownSelect_1,
								t = 0.15,
								s = "Exponential",
								d = "Out",
								g = {Size = UDim2.new(1, 0,0, 100)}
							}):Play()
						end
					else
						Tw({
							v = DropdownSelect_1,
							t = 0.15,
							s = "Exponential",
							d = "Out",
							g = {Size = UDim2.new(1, 0,0, 0)}
						}):Play()
					end
				end)
				
				local itemslist = {}
				local selectedItem

				function itemslist:Clear()
					for _, child in ipairs(ScrollingFrame_2:GetChildren()) do
						if child:IsA("Frame") then
							child:Destroy()
						end
					end

					selectedItem = nil
					TextLabel_1.Text = ""
				end

				local selectedValues = {}
				
				function itemslist:AddList(text)
					
					local Item_1 = Instance.new("TextButton")
					
					Item_1.Name = "Item"
					Item_1.Parent = ScrollingFrame_2
					Item_1.Active = true
					Item_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
					Item_1.BackgroundTransparency = 1
					Item_1.BorderColor3 = Color3.fromRGB(0,0,0)
					Item_1.BorderSizePixel = 0
					Item_1.Size = UDim2.new(1, 0,0, 20)
					Item_1.Font = Enum.Font.Gotham
					Item_1.Text = text
					Item_1.TextColor3 = Color3.fromRGB(255,255,255)
					Item_1.TextSize = 9
					Item_1.TextTransparency = 0.5
					
					Item_1.MouseButton1Click:Connect(function()
						if Multi then
							if selectedValues[text] then
								selectedValues[text] = nil
								Tw({
									v = Item_1,
									t = 0.15,
									s = "Back",
									d = "Out",
									g = {TextTransparency = 0.5}
								}):Play()
							else
								selectedValues[text] = true
								Tw({
									v = Item_1,
									t = 0.15,
									s = "Back",
									d = "Out",
									g = {TextTransparency = 0}
								}):Play()
							end
							local selectedList = {}
							for i, v in pairs(selectedValues) do
								table.insert(selectedList, i)
							end
							TextLabel_1.Text = table.concat(selectedList, ", ")
							Callback(TextLabel_1.Text)
						else
							for i,v in pairs(ScrollingFrame_2:GetChildren()) do
								if v:IsA("TextButton") then
									Tw({
										v = v,
										t = 0.15,
										s = "Back",
										d = "Out",
										g = {TextTransparency = 0.5}
									}):Play()
								end
							end
							Tw({
								v = Item_1,
								t = 0.15,
								s = "Back",
								d = "Out",
								g = {TextTransparency = 0}
							}):Play()
							Tw({
								v = DropdownSelect_1,
								t = 0.15,
								s = "Exponential",
								d = "Out",
								g = {Size = UDim2.new(1, 0,0, 0)}
							}):Play()
							isOpen = false
							Value = text
							TextLabel_1.Text = text
							Callback(TextLabel_1.Text)
						end
					end)

					local function isValueInTable(val, tbl)
						if type(tbl) ~= "table" then
							return false
						end

						for _, v in pairs(tbl) do
							if v == val then
								return true
							end
						end
						return false
					end

					delay(0,function()
						if Multi then
							if isValueInTable(text, Value) then
								Tw({
									v = Item_1,
									t = 0.15,
									s = "Back",
									d = "Out",
									g = {TextTransparency = 0}
								}):Play()

								selectedValues[text] = true
								local selectedList = {}
								for i, v in pairs(selectedValues) do
									table.insert(selectedList, i)
								end
								TextLabel_1.Text = table.concat(selectedList, ", ")
								Callback(TextLabel_1.Text)
							end
						else
							if text == Value then
								Tw({
									v = Item_1,
									t = 0.15,
									s = "Back",
									d = "Out",
									g = {TextTransparency = 0}
								}):Play()

								Value = text
								TextLabel_1.Text = text
								Callback(TextLabel_1.Text)
							end
						end
					end)
					
				end
				
				for i,v in ipairs(List) do
					itemslist:AddList(v, i)
				end

				UIListLayout_10:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					ScrollingFrame_2.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_10.AbsoluteContentSize.Y + 5)
				end)

				return itemslist
			end
			
			function Library.Main:CreateButton(info)
				
				local Title = info.Name or info.name or info.Title or info.title or info.Text or info.text or nil
				local Callback = info.Callback or info.callback or info.cb or function() end
				
				local Button = Instance.new("Frame")
				local Click_1 = Instance.new("TextButton")
				local UICorner_1 = Instance.new("UICorner")
				local UIStroke_1 = Instance.new("UIStroke")

				Button.Name = "Button"
				Button.Parent = Section_1
				Button.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Button.BackgroundTransparency = 1
				Button.BorderColor3 = Color3.fromRGB(0,0,0)
				Button.BorderSizePixel = 0
				Button.LayoutOrder = 2
				Button.Size = UDim2.new(1, 0,0, 40)

				Click_1.Name = "Click"
				Click_1.Parent = Button
				Click_1.Active = true
				Click_1.AnchorPoint = Vector2.new(0.5, 0.5)
				Click_1.BackgroundColor3 = Color3.fromRGB(24,24,24)
				Click_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Click_1.BorderSizePixel = 0
				Click_1.Position = UDim2.new(0.5, 0,0.5, 0)
				Click_1.Size = UDim2.new(0.9, 0,0, 25)
				Click_1.Font = Enum.Font.Gotham
				Click_1.Text = Title
				Click_1.TextColor3 = Color3.fromRGB(255,255,255)
				Click_1.TextSize = 10

				UICorner_1.Parent = Click_1

				UIStroke_1.Parent = Click_1
				UIStroke_1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				UIStroke_1.Color = Color3.fromRGB(43,43,43)
				UIStroke_1.Thickness = 1
				
				Click_1.MouseButton1Click:Connect(function()
					task.spawn(function()
						local twsizebutton = Tw({
							v = Click_1,
							t = 0.1,
							s = "Back",
							d = "Out",
							g = {Size = UDim2.new(.85, 0,0, 20)}
						})
						Tw({
							v = Click_1,
							t = 0.1,
							s = "Back",
							d = "Out",
							g = {TextSize = 8}
						}):Play()
						twsizebutton:Play()
						twsizebutton.Completed:Connect(function()
							Tw({
								v = Click_1,
								t = 0.1,
								s = "Back",
								d = "Out",
								g = {Size = UDim2.new(.9, 0,0, 25)}
							}):Play()
							Tw({
								v = Click_1,
								t = 0.1,
								s = "Back",
								d = "Out",
								g = {TextSize = 10}
							}):Play()
						end)
					end)
					Callback()
				end)
			end
			
			function Library.Main:CreateKeyBind(info)
				
				local Title = info.Name or info.name or info.Title or info.title or info.Text or info.text or nil
				local DefaultKey = info.Value or info.DefaultKey or info.defaultKey or Enum.KeyCode.Q
				local Callback = info.Callback or info.callback or info.cb or function() end
				
				local Keybind_1 = Instance.new("Frame")
				local KeybindText_1 = Instance.new("Frame")
				local Title_9 = Instance.new("TextLabel")
				local KeybindValue_1 = Instance.new("Frame")
				local UICorner_18 = Instance.new("UICorner")
				local UIStroke_7 = Instance.new("UIStroke")
				local ValueBind_1 = Instance.new("TextLabel")
				local Click_1 = Instance.new("TextButton")
				
				local Key = DefaultKey
				
				Keybind_1.Name = "Keybind"
				Keybind_1.Parent = Section_1
				Keybind_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Keybind_1.BackgroundTransparency = 1
				Keybind_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Keybind_1.BorderSizePixel = 0
				Keybind_1.LayoutOrder = 2
				Keybind_1.Size = UDim2.new(1, 0,0, 25)

				KeybindText_1.Name = "KeybindText"
				KeybindText_1.Parent = Keybind_1
				KeybindText_1.AnchorPoint = Vector2.new(0.5, 0.5)
				KeybindText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				KeybindText_1.BackgroundTransparency = 1
				KeybindText_1.BorderColor3 = Color3.fromRGB(0,0,0)
				KeybindText_1.BorderSizePixel = 0
				KeybindText_1.Position = UDim2.new(0.5, 0,0.5, 0)
				KeybindText_1.Size = UDim2.new(0.899999976, 0,0, 25)

				Title_9.Name = "Title"
				Title_9.Parent = KeybindText_1
				Title_9.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Title_9.BackgroundTransparency = 1
				Title_9.BorderColor3 = Color3.fromRGB(0,0,0)
				Title_9.BorderSizePixel = 0
				Title_9.Size = UDim2.new(1, 0,1, 0)
				Title_9.Font = Enum.Font.GothamBold
				Title_9.Text = Title
				Title_9.TextColor3 = Color3.fromRGB(255,255,255)
				Title_9.TextSize = 9
				Title_9.TextTransparency = 0.5
				Title_9.TextXAlignment = Enum.TextXAlignment.Left

				KeybindValue_1.Name = "KeybindValue"
				KeybindValue_1.Parent = Keybind_1
				KeybindValue_1.AnchorPoint = Vector2.new(1, 0.5)
				KeybindValue_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				KeybindValue_1.BackgroundTransparency = 1
				KeybindValue_1.BorderColor3 = Color3.fromRGB(0,0,0)
				KeybindValue_1.BorderSizePixel = 0
				KeybindValue_1.LayoutOrder = -1
				KeybindValue_1.Position = UDim2.new(0.959999979, 0,0.5, 0)
				KeybindValue_1.Size = UDim2.new(0, 20,0, 15)

				UICorner_18.Parent = KeybindValue_1
				UICorner_18.CornerRadius = UDim.new(0,4)

				UIStroke_7.Parent = KeybindValue_1
				UIStroke_7.Color = Color3.fromRGB(37,37,37)
				UIStroke_7.Thickness = 1

				ValueBind_1.Name = "ValueBind"
				ValueBind_1.Parent = KeybindValue_1
				ValueBind_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				ValueBind_1.BackgroundTransparency = 1
				ValueBind_1.BorderColor3 = Color3.fromRGB(0,0,0)
				ValueBind_1.BorderSizePixel = 0
				ValueBind_1.Size = UDim2.new(1, 0,1, 0)
				ValueBind_1.Font = Enum.Font.Gotham
				ValueBind_1.Text = tostring(Key):gsub("Enum.KeyCode.", "")
				ValueBind_1.TextColor3 = Color3.fromRGB(255,255,255)
				ValueBind_1.TextSize = 9
				
				Click_1.Name = "Click"
				Click_1.Parent = KeybindValue_1
				Click_1.Active = true
				Click_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Click_1.BackgroundTransparency = 1
				Click_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Click_1.BorderSizePixel = 0
				Click_1.Size = UDim2.new(1, 0,1, 0)
				Click_1.Font = Enum.Font.SourceSans
				Click_1.Text = ""
				Click_1.TextSize = 14
				
				local function adjustBoxBindSize()
					local textSize = game:GetService("TextService"):GetTextSize(ValueBind_1.Text, ValueBind_1.TextSize, ValueBind_1.Font, Vector2.new(1000, 1000))
					KeybindValue_1.Size = UDim2.new(0, textSize.X + 15, 0, 15)
				end

				adjustBoxBindSize()

				local function changeKey()
					ValueBind_1.Text = "..."
					Tw({
						v = Title_9,
						t = 0.1,
						s = "Linear",
						d = "Out",
						g = {TextTransparency = 0.5}
					}):Play()
					local inputConnection

					inputConnection = game:GetService("UserInputService").InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.Keyboard then
							Key = input.KeyCode
							ValueBind_1.Text = tostring(Key):gsub("Enum.KeyCode.", "")
							adjustBoxBindSize()
							inputConnection:Disconnect()
						end
					end)
				end

				Click_1.MouseButton1Click:Connect(function()
					changeKey()
				end)

				game:GetService("UserInputService").InputBegan:Connect(function(input)
					if input.KeyCode == Key then
						Callback(Key)
						Tw({
							v = Title_9,
							t = 0.1,
							s = "Linear",
							d = "Out",
							g = {TextTransparency = 0}
						}):Play()
					end
				end)

				delay(0,function()
					if ValueBind_1 ~= "..." then
						Callback(Key)
						Tw({
						v = Title_9,
							t = 0.1,
							s = "Linear",
							d = "Out",
							g = {TextTransparency = 0}
						}):Play()
					end
				end)

				local NewText = {}

				function NewText:Set(b)
					Title_9.Text = b
				end
				return NewText
			end
			
			function Library.Main:CreateLabel(info)
				
				local Title = info.Name or info.name or info.Title or info.title or info.Text or info.text or nil
				
				local Title_10 = Instance.new("TextLabel")
				local TextLabel_2 = Instance.new("Frame")

				TextLabel_2.Name = "TextLabel"
				TextLabel_2.Parent = Section_1
				TextLabel_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
				TextLabel_2.BackgroundTransparency = 1
				TextLabel_2.BorderColor3 = Color3.fromRGB(0,0,0)
				TextLabel_2.BorderSizePixel = 0
				TextLabel_2.LayoutOrder = 2
				TextLabel_2.Size = UDim2.new(0.899999976, 0,0, 25)
				
				Title_10.Name = "Title"
				Title_10.Parent = TextLabel_2
				Title_10.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Title_10.BackgroundTransparency = 1
				Title_10.BorderColor3 = Color3.fromRGB(0,0,0)
				Title_10.BorderSizePixel = 0
				Title_10.LayoutOrder = 2
				Title_10.Size = UDim2.new(1, 0,1, 0)
				Title_10.Font = Enum.Font.GothamBold
				Title_10.Text = Title
				Title_10.TextColor3 = Color3.fromRGB(255,255,255)
				Title_10.TextSize = 9
				Title_10.TextWrapped = true
				Title_10.TextXAlignment = Enum.TextXAlignment.Left
				Title_10.RichText = true
				
				local NewText = {}

				function NewText:Set(b)
					Title_10.Text = b
				end
				return NewText
			end
			
			function Library.Main:CreateTextBox(info)
				
				local Title = info.Name or info.name or info.Title or info.title or info.Text or info.text or nil
				local Placeholder = info.Placeholder or info.placeholder or "Place Your Text"
				local Value = info.Value or info.Defuse or info.value or info.defuse or info.vu or info.df or nil
				local Callback = info.Callback or info.callback or info.cb or function() end
				
				local TextBox = Instance.new("Frame")
				local TextBoxBar_1 = Instance.new("Frame")
				local UICorner_1 = Instance.new("UICorner")
				local UIStroke_1 = Instance.new("UIStroke")
				local TextBoxValue_1 = Instance.new("TextBox")
				local Title_1 = Instance.new("TextLabel")
				
				TextBox.Name = "TextBox"
				TextBox.Parent = Section_1
				TextBox.BackgroundColor3 = Color3.fromRGB(255,255,255)
				TextBox.BackgroundTransparency = 1
				TextBox.BorderColor3 = Color3.fromRGB(0,0,0)
				TextBox.BorderSizePixel = 0
				TextBox.LayoutOrder = 2
				TextBox.Size = UDim2.new(1, 0,0, 45)

				TextBoxBar_1.Name = "TextBoxBar"
				TextBoxBar_1.Parent = TextBox
				TextBoxBar_1.AnchorPoint = Vector2.new(0.5, 0.5)
				TextBoxBar_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				TextBoxBar_1.BackgroundTransparency = 1
				TextBoxBar_1.BorderColor3 = Color3.fromRGB(0,0,0)
				TextBoxBar_1.BorderSizePixel = 0
				TextBoxBar_1.Position = UDim2.new(0.5, 0,0.699999988, 0)
				TextBoxBar_1.Size = UDim2.new(0.899999976, 0,0, 20)

				UICorner_1.Parent = TextBoxBar_1
				UICorner_1.CornerRadius = UDim.new(0,4)

				UIStroke_1.Parent = TextBoxBar_1
				UIStroke_1.Color = Color3.fromRGB(37,37,37)
				UIStroke_1.Thickness = 1

				TextBoxValue_1.Name = "TextBoxValue"
				TextBoxValue_1.Parent = TextBoxBar_1
				TextBoxValue_1.Active = true
				TextBoxValue_1.AnchorPoint = Vector2.new(0.5, 0.5)
				TextBoxValue_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				TextBoxValue_1.BackgroundTransparency = 1
				TextBoxValue_1.BorderColor3 = Color3.fromRGB(0,0,0)
				TextBoxValue_1.BorderSizePixel = 0
				TextBoxValue_1.Position = UDim2.new(0.5, 0,0.5, 0)
				TextBoxValue_1.Size = UDim2.new(0.899999976, 0,1, 0)
				TextBoxValue_1.Font = Enum.Font.Gotham
				TextBoxValue_1.PlaceholderColor3 = Color3.fromRGB(145, 145, 145)
				TextBoxValue_1.PlaceholderText = Placeholder
				TextBoxValue_1.Text = Value
				TextBoxValue_1.TextColor3 = Color3.fromRGB(255,255,255)
				TextBoxValue_1.TextSize = 9

				Title_1.Name = "Title"
				Title_1.Parent = TextBox
				Title_1.AnchorPoint = Vector2.new(0.5, 0.5)
				Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Title_1.BackgroundTransparency = 1
				Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Title_1.BorderSizePixel = 0
				Title_1.Position = UDim2.new(0.5, 0,0.25, 0)
				Title_1.Size = UDim2.new(0.899999976, 0,0, 20)
				Title_1.Font = Enum.Font.GothamBold
				Title_1.Text = Title
				Title_1.TextColor3 = Color3.fromRGB(255,255,255)
				Title_1.TextSize = 9
				Title_1.TextXAlignment = Enum.TextXAlignment.Left
				
				TextBoxValue_1.FocusLost:Connect(function()
					if Value then
						if #TextBoxValue_1.Text > 0 then
							pcall(Callback,TextBoxValue_1.Text)
						end
					end
				end)

				delay(0,function()
					if Value then
						if #TextBoxValue_1.Text > 0 then
							pcall(Callback,TextBoxValue_1.Text)
						end
					end
				end)
			end
			
			function Library.Main:CreateColorPicker(info)
				
				local Title = info.Name or info.name or info.Title or info.title or info.Text or info.text or nil
				local preset = info.Color or info.color or Color3.fromRGB(255, 255, 255)
				local Callback = info.Callback or info.callback or info.cb or function() end
				
				local Colorpicker_1 = Instance.new("Frame")
				local ColorPickText_1 = Instance.new("Frame")
				local Title_11 = Instance.new("TextLabel")
				local ColorValue_1 = Instance.new("Frame")
				local UICorner_19 = Instance.new("UICorner")
				local UIStroke_8 = Instance.new("UIStroke")
				local Click_1 = Instance.new("TextButton")
				
				local ColorPickerBar_1 = Instance.new("Frame")
				local ColorPickerIn_1 = Instance.new("Frame")
				local UICorner_20 = Instance.new("UICorner")
				local Color_1 = Instance.new("ImageButton")
				local ColorCorner_1 = Instance.new("UICorner")
				local ColorSelection_1 = Instance.new("ImageLabel")
				local Hue_1 = Instance.new("ImageButton")
				local HueCorner_1 = Instance.new("UICorner")
				local HueGradient_1 = Instance.new("UIGradient")
				local HueSelection_1 = Instance.new("ImageLabel")
				local ValueBox_1 = Instance.new("Frame")
				local UICorner_21 = Instance.new("UICorner")
				local UIStroke_9 = Instance.new("UIStroke")
				local RGBValue_1 = Instance.new("TextBox")
				
				Colorpicker_1.Name = "Colorpicker"
				Colorpicker_1.Parent = Section_1
				Colorpicker_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Colorpicker_1.BackgroundTransparency = 1
				Colorpicker_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Colorpicker_1.BorderSizePixel = 0
				Colorpicker_1.LayoutOrder = 2
				Colorpicker_1.Size = UDim2.new(1, 0,0, 25)

				ColorPickText_1.Name = "ColorPickText"
				ColorPickText_1.Parent = Colorpicker_1
				ColorPickText_1.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorPickText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				ColorPickText_1.BackgroundTransparency = 1
				ColorPickText_1.BorderColor3 = Color3.fromRGB(0,0,0)
				ColorPickText_1.BorderSizePixel = 0
				ColorPickText_1.Position = UDim2.new(0.5, 0,0.5, 0)
				ColorPickText_1.Size = UDim2.new(0.899999976, 0,0, 25)

				Title_11.Name = "Title"
				Title_11.Parent = ColorPickText_1
				Title_11.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Title_11.BackgroundTransparency = 1
				Title_11.BorderColor3 = Color3.fromRGB(0,0,0)
				Title_11.BorderSizePixel = 0
				Title_11.Size = UDim2.new(1, 0,1, 0)
				Title_11.Font = Enum.Font.GothamBold
				Title_11.Text = Title
				Title_11.TextColor3 = Color3.fromRGB(255,255,255)
				Title_11.TextSize = 9
				Title_11.TextTransparency = 0.5
				Title_11.TextXAlignment = Enum.TextXAlignment.Left

				ColorValue_1.Name = "ColorValue"
				ColorValue_1.Parent = Colorpicker_1
				ColorValue_1.AnchorPoint = Vector2.new(1, 0.5)
				ColorValue_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				ColorValue_1.BorderColor3 = Color3.fromRGB(0,0,0)
				ColorValue_1.BorderSizePixel = 0
				ColorValue_1.LayoutOrder = -1
				ColorValue_1.Position = UDim2.new(0.959999979, 0,0.5, 0)
				ColorValue_1.Size = UDim2.new(0, 20,0, 15)

				UICorner_19.Parent = ColorValue_1
				UICorner_19.CornerRadius = UDim.new(0,4)

				UIStroke_8.Parent = ColorValue_1
				UIStroke_8.Color = Color3.fromRGB(37,37,37)
				UIStroke_8.Thickness = 1
				
				ColorPickerBar_1.Name = "ColorPickerBar"
				ColorPickerBar_1.Parent = Section_1
				ColorPickerBar_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				ColorPickerBar_1.BackgroundTransparency = 1
				ColorPickerBar_1.BorderColor3 = Color3.fromRGB(0,0,0)
				ColorPickerBar_1.BorderSizePixel = 0
				ColorPickerBar_1.LayoutOrder = 2
				ColorPickerBar_1.Size = UDim2.new(1, 0,0, 0)

				ColorPickerIn_1.Name = "ColorPickerIn"
				ColorPickerIn_1.Parent = ColorPickerBar_1
				ColorPickerIn_1.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorPickerIn_1.BackgroundColor3 = Color3.fromRGB(46,46,46)
				ColorPickerIn_1.BorderColor3 = Color3.fromRGB(0,0,0)
				ColorPickerIn_1.BorderSizePixel = 0
				ColorPickerIn_1.Position = UDim2.new(0.5, 0,0.5, 0)
				ColorPickerIn_1.Size = UDim2.new(0.899999976, 0,0.949999988, 0)
				ColorPickerIn_1.ClipsDescendants = true

				UICorner_20.Parent = ColorPickerIn_1
				UICorner_20.CornerRadius = UDim.new(0,5)

				Color_1.Name = "Color"
				Color_1.Parent = ColorPickerIn_1
				Color_1.BackgroundColor3 = Color3.fromRGB(39,39,39)
				Color_1.Position = UDim2.new(0.100000001, 0,0, 13)
				Color_1.Size = UDim2.new(0, 80,0, 80)
				Color_1.Image = "rbxassetid://4155801252"

				ColorCorner_1.Name = "ColorCorner"
				ColorCorner_1.Parent = Color_1
				ColorCorner_1.CornerRadius = UDim.new(0,3)

				ColorSelection_1.Name = "ColorSelection"
				ColorSelection_1.Parent = Color_1
				ColorSelection_1.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorSelection_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				ColorSelection_1.BackgroundTransparency = 1
				ColorSelection_1.Size = UDim2.new(0, 18,0, 18)
				ColorSelection_1.Image = "http://www.roblox.com/asset/?id=4805639000"
				ColorSelection_1.ScaleType = Enum.ScaleType.Fit

				Hue_1.Name = "Hue"
				Hue_1.Parent = ColorPickerIn_1
				Hue_1.AnchorPoint = Vector2.new(1, 0)
				Hue_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Hue_1.Position = UDim2.new(0.899999976, 0,0, 13)
				Hue_1.Size = UDim2.new(0, 25,0, 80)

				HueCorner_1.Name = "HueCorner"
				HueCorner_1.Parent = Hue_1
				HueCorner_1.CornerRadius = UDim.new(0,3)

				HueGradient_1.Name = "HueGradient"
				HueGradient_1.Parent = Hue_1
				HueGradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.2, Color3.fromRGB(234, 255, 0)), ColorSequenceKeypoint.new(0.4, Color3.fromRGB(21, 255, 0)), ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 17, 255)), ColorSequenceKeypoint.new(0.9, Color3.fromRGB(255, 0, 251)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 4))}
				HueGradient_1.Rotation = 270

				HueSelection_1.Name = "HueSelection"
				HueSelection_1.Parent = Hue_1
				HueSelection_1.AnchorPoint = Vector2.new(0.5, 0.5)
				HueSelection_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				HueSelection_1.BackgroundTransparency = 1
				HueSelection_1.Position = UDim2.new(0.479999989, 0,1, 0)
				HueSelection_1.Size = UDim2.new(0, 18,0, 18)
				HueSelection_1.Image = "http://www.roblox.com/asset/?id=4805639000"

				ValueBox_1.Name = "ValueBox"
				ValueBox_1.Parent = ColorPickerIn_1
				ValueBox_1.AnchorPoint = Vector2.new(0.5, 0.5)
				ValueBox_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				ValueBox_1.BackgroundTransparency = 1
				ValueBox_1.BorderColor3 = Color3.fromRGB(0,0,0)
				ValueBox_1.BorderSizePixel = 0
				ValueBox_1.Position = UDim2.new(0.5, 0,0.800000012, 0)
				ValueBox_1.Size = UDim2.new(0.899999976, 0,0, 20)

				UICorner_21.Parent = ValueBox_1
				UICorner_21.CornerRadius = UDim.new(0,4)

				UIStroke_9.Parent = ValueBox_1
				UIStroke_9.Color = Color3.fromRGB(37,37,37)
				UIStroke_9.Thickness = 1

				RGBValue_1.Name = "RGBValue"
				RGBValue_1.Parent = ValueBox_1
				RGBValue_1.Active = true
				RGBValue_1.AnchorPoint = Vector2.new(0.5, 0.5)
				RGBValue_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				RGBValue_1.BackgroundTransparency = 1
				RGBValue_1.BorderColor3 = Color3.fromRGB(0,0,0)
				RGBValue_1.BorderSizePixel = 0
				RGBValue_1.Position = UDim2.new(0.5, 0,0.5, 0)
				RGBValue_1.Size = UDim2.new(0.899999976, 0,1, 0)
				RGBValue_1.Font = Enum.Font.Gotham
				RGBValue_1.PlaceholderColor3 = Color3.fromRGB(178,178,178)
				RGBValue_1.PlaceholderText = "R,G,B"
				RGBValue_1.Text = string.format("%d, %d, %d", math.floor(ColorValue_1.BackgroundColor3.R * 255), math.floor(ColorValue_1.BackgroundColor3.G * 255), math.floor(ColorValue_1.BackgroundColor3.B * 255))
				RGBValue_1.TextColor3 = Color3.fromRGB(255,255,255)
				RGBValue_1.TextSize = 9
				
				Click_1.Name = "Click"
				Click_1.Parent = Colorpicker_1
				Click_1.Active = true
				Click_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Click_1.BackgroundTransparency = 1
				Click_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Click_1.BorderSizePixel = 0
				Click_1.Size = UDim2.new(1, 0,1, 0)
				Click_1.Font = Enum.Font.SourceSans
				Click_1.Text = ""
				Click_1.TextSize = 14
				
				local IsOpen = false

				local ColorH, ColorS, ColorV = 1, 1, 1
				local ColorInput = nil
				local HueInput = nil
				local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
				local lastColor = nil
				local ColorInput = nil
				local HueInput = nil
				local isTouchDevice = game:GetService("UserInputService").TouchEnabled

				Click_1.MouseButton1Click:Connect(function()
					IsOpen = not IsOpen
					if IsOpen then
						Tw({
							v = ColorPickerBar_1,
							t = 0.3,
							s = "Exponential",
							d = "Out",
							g = {Size = UDim2.new(1, 0,0, 150)}
						}):Play()
					else
						Tw({
							v = ColorPickerBar_1,
							t = 0.3,
							s = "Exponential",
							d = "Out",
							g = {Size = UDim2.new(1, 0,0, 0)}
						}):Play()
					end
				end)

				local function UpdateColorPicker(nope)
					ColorValue_1.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
					Color_1.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

					local r, g, b = ColorValue_1.BackgroundColor3.R * 255, ColorValue_1.BackgroundColor3.G * 255, ColorValue_1.BackgroundColor3.B * 255

					RGBValue_1.Text = string.format("%d, %d, %d", math.floor(r), math.floor(g), math.floor(b))

					if lastColor ~= ColorValue_1.BackgroundColor3 then
						lastColor = ColorValue_1.BackgroundColor3
						pcall(Callback, math.floor(r), math.floor(g), math.floor(b))
					end
				end

				ColorH = 1 - (math.clamp(HueSelection_1.AbsolutePosition.Y - Hue_1.AbsolutePosition.Y, 0, Hue_1.AbsoluteSize.Y) / Hue_1.AbsoluteSize.Y)
				ColorS = (math.clamp(ColorSelection_1.AbsolutePosition.X - Color_1.AbsolutePosition.X, 0, Color_1.AbsoluteSize.X) / Color_1.AbsoluteSize.X)
				ColorV = 1 - (math.clamp(ColorSelection_1.AbsolutePosition.Y - Color_1.AbsolutePosition.Y, 0, Color_1.AbsoluteSize.Y) / Color_1.AbsoluteSize.Y)

				ColorValue_1.BackgroundColor3 = preset
				Color_1.BackgroundColor3 = preset

				Color_1.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end

						ColorInput = game:GetService("RunService").RenderStepped:Connect(function()
							local ColorX = (math.clamp(Mouse.X - Color_1.AbsolutePosition.X, 0, Color_1.AbsoluteSize.X) /Color_1.AbsoluteSize.X)
							local ColorY = (math.clamp(Mouse.Y - Color_1.AbsolutePosition.Y, 0, Color_1.AbsoluteSize.Y) /Color_1.AbsoluteSize.Y)

							Tw({
								v = ColorSelection_1,
								t = 0.3,
								s = "Exponential",
								d = "Out",
								g = {Position = UDim2.new(ColorX, 0, ColorY, 0)}
							}):Play()
							ColorS = ColorX
							ColorV = 1 - ColorY

							UpdateColorPicker(true)
						end)
					end
				end)

				Color_1.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end
					end
				end)

				Hue_1.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end

						HueInput = game:GetService("RunService").RenderStepped:Connect(function()
							local HueY = (math.clamp(Mouse.Y - Hue_1.AbsolutePosition.Y, 0, Hue_1.AbsoluteSize.Y) /Hue_1.AbsoluteSize.Y)

							Tw({
								v = HueSelection_1,
								t = 0.3,
								s = "Exponential",
								d = "Out",
								g = {Position = UDim2.new(0.48, 0, HueY, 0)}
							}):Play()
							ColorH = 1 - HueY

							UpdateColorPicker(true)
						end)
					end
				end)

				Hue_1.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end
					end
				end)

				if isTouchDevice then
					Color_1.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.Touch then
							if ColorInput then
								ColorInput:Disconnect()
							end

							ColorInput = game:GetService("RunService").RenderStepped:Connect(function()
								local ColorX = (math.clamp(Mouse.X - Color_1.AbsolutePosition.X, 0, Color_1.AbsoluteSize.X) / Color_1.AbsoluteSize.X)
								local ColorY = (math.clamp(Mouse.Y - Color_1.AbsolutePosition.Y, 0, Color_1.AbsoluteSize.Y) / Color_1.AbsoluteSize.Y)

								Tw({
									v = ColorSelection_1,
									t = 0.3,
									s = "Exponential",
									d = "Out",
									g = {Position = UDim2.new(ColorX, 0, ColorY, 0)}
								}):Play()
								ColorS = ColorX
								ColorV = 1 - ColorY

								UpdateColorPicker(true)
							end)
						end
					end)

					Color_1.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.Touch then
							if ColorInput then
								ColorInput:Disconnect()
							end
						end
					end)

					Hue_1.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.Touch then
							if HueInput then
								HueInput:Disconnect()
							end

							HueInput = game:GetService("RunService").RenderStepped:Connect(function()
								local HueY = (math.clamp(Mouse.Y - Hue_1.AbsolutePosition.Y, 0, Hue_1.AbsoluteSize.Y) / Hue_1.AbsoluteSize.Y)

								Tw({
									v = HueSelection_1,
									t = 0.3,
									s = "Exponential",
									d = "Out",
									g = {Position = UDim2.new(0.48, 0, HueY, 0)}
								}):Play()
								
								ColorH = 1 - HueY

								UpdateColorPicker(true)
							end)
						end
					end)

					Hue_1.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.Touch then
							if HueInput then
								HueInput:Disconnect()
							end
						end
					end)
				end

				RGBValue_1.FocusLost:Connect(function(enterPressed)
					if enterPressed then
						local inputText = RGBValue_1.Text
						local r, g, b = inputText:match("(%d+),%s*(%d+),%s*(%d+)")

						if r and g and b then
							r, g, b = tonumber(r), tonumber(g), tonumber(b)
							if r >= 0 and r <= 255 and g >= 0 and g <= 255 and b >= 0 and b <= 255 then
								local newColor = Color3.fromRGB(r, g, b)
								ColorValue_1.BackgroundColor3 = newColor
								Color_1.BackgroundColor3 = newColor

								local h, s, v = Color3.toHSV(newColor)
								ColorH, ColorS, ColorV = h, s, v
								
								Tw({
									v = ColorSelection_1,
									t = 0.3,
									s = "Exponential",
									d = "Out",
									g = {Position = UDim2.new(s, 0, 1 - v, 0)}
								}):Play()
								Tw({
									v = HueSelection_1,
									t = 0.3,
									s = "Exponential",
									d = "Out",
									g = {Position = UDim2.new(0.48, 0, 1 - h, 0)}
								}):Play()

								pcall(Callback, r, g, b)
							else
								RGBValue_1.Text = string.format("%d, %d, %d", math.floor(ColorValue_1.BackgroundColor3.R * 255), math.floor(ColorValue_1.BackgroundColor3.G * 255), math.floor(ColorValue_1.BackgroundColor3.B * 255))
							end
						else
							RGBValue_1.Text = string.format("%d, %d, %d", math.floor(ColorValue_1.BackgroundColor3.R * 255), math.floor(ColorValue_1.BackgroundColor3.G * 255), math.floor(ColorValue_1.BackgroundColor3.B * 255))
						end
					end
				end)

				delay(0,function()
					local r, g, b = ColorValue_1.BackgroundColor3.R * 255, ColorValue_1.BackgroundColor3.G * 255, ColorValue_1.BackgroundColor3.B * 255
					RGBValue_1.Text = string.format("%d, %d, %d", math.floor(r), math.floor(g), math.floor(b))
					pcall(Callback, math.floor(r), math.floor(g), math.floor(b))
				end)

				local NewColor = {}

				function NewColor:SetColor(colorTable)
					local r = colorTable.R or ColorValue_1.BackgroundColor3.R * 255
					local g = colorTable.G or ColorValue_1.BackgroundColor3.G * 255
					local b = colorTable.B or ColorValue_1.BackgroundColor3.B * 255

					if r >= 0 and r <= 255 and g >= 0 and g <= 255 and b >= 0 and b <= 255 then
						local newColor = Color3.fromRGB(r, g, b)

						ColorValue_1.BackgroundColor3 = newColor
						Color_1.BackgroundColor3 = newColor

						local h, s, v = Color3.toHSV(newColor)
						ColorH, ColorS, ColorV = h, s, v

						Tw({
							v = ColorSelection_1,
							t = 0.3,
							s = "Exponential",
							d = "Out",
							g = {Position = UDim2.new(s, 0, 1 - v, 0)}
						}):Play()
						Tw({
							v = HueSelection_1,
							t = 0.3,
							s = "Exponential",
							d = "Out",
							g = {Position = UDim2.new(0.48, 0, 1 - h, 0)}
						}):Play()

						RGBValue_1.Text = string.format("%d, %d, %d", math.floor(r), math.floor(g), math.floor(b))
						pcall(Callback, r, g, b)
					end
				end

				return NewColor
			end
			
			UIListLayoutPageLeft:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				PageLeft_1.CanvasSize = UDim2.new(0, 0, 0, UIListLayoutPageLeft.AbsoluteContentSize.Y + 20)
			end)
			UIListLayoutPageRight:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				PageRight_1.CanvasSize = UDim2.new(0, 0, 0, UIListLayoutPageRight.AbsoluteContentSize.Y + 20)
			end)
			
			UIListLayout_7:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				Section_1.Size = UDim2.new(1, 0, 0, UIListLayout_7.AbsoluteContentSize.Y + 15)
			end)
			
			return Library.Main
		end
		
		return Library.Section
	end
	
	UIListLayout_1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		ScrollingFrame_1.CanvasSize = UDim2.new(0, UIListLayout_1.AbsoluteContentSize.X + 5, 0, 0)
	end)

	return Library.Tab
end
