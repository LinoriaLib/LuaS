-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create TextLabel
local helloLabel = Instance.new("TextLabel")
helloLabel.Size = UDim2.new(0, 200, 0, 50)
helloLabel.Position = UDim2.new(0.5, -100, 0.5, -25)
helloLabel.Text = "Hello"
helloLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
helloLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
helloLabel.BackgroundTransparency = 0.5
helloLabel.Font = Enum.Font.Gotham
helloLabel.TextSize = 30
helloLabel.Parent = screenGui
