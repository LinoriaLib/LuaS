-- Notification for successful injection
game.StarterGui:SetCore("SendNotification", {
	Title = "Injection",
	Text = "Successfully injected!",
	Duration = 5
})

wait(1)
print("Found ROBLOX Process...")
wait(2)
print("Injecting into CoreGui...")
wait(4)
print("Injection successful")

-- Create GUI elements
local LuaGUI = Instance.new("ScreenGui")
LuaGUI.Name = "Lua"
LuaGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame", LuaGUI)
Frame.Active = true
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Darker background for modern look
Frame.Position = UDim2.new(0.236, 0, 0.143, 0)
Frame.Size = UDim2.new(0, 627, 0, 381)
Frame.Draggable = true

-- Add rounded corners to the frame
local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 8)


-- Input TextBox
local TextBox = Instance.new("TextBox", Frame)
TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40) -- Darker background
TextBox.Position = UDim2.new(0.016, 0, 0.144, 0)
TextBox.Size = UDim2.new(0, 607, 0, 193)
TextBox.ClearTextOnFocus = false
TextBox.Font = Enum.Font.Code -- Use a monospace font for code
TextBox.MultiLine = true
TextBox.Text = "Press 'Execute' to run scripts..."
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
TextBox.TextSize = 14
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.PlaceholderText = "Enter your Lua code here..."
TextBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150) -- Gray placeholder text

-- Output Label
local outputContainer = Instance.new("ScrollingFrame", Frame)
outputContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40) -- Darker background
outputContainer.Position = UDim2.new(0.249, 0, 0.669, 0)
outputContainer.Size = UDim2.new(0, 326, 0, 116)
outputContainer.ScrollBarThickness = 8
outputContainer.CanvasSize = UDim2.new(0, 0, 0, 200)

local output = Instance.new("TextLabel", outputContainer)
output.BackgroundTransparency = 1 -- Transparent background
output.Size = UDim2.new(1, 0, 1, 0)
output.Font = Enum.Font.Code -- Monospace font for output
output.Text = "Output will appear here..."
output.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
output.TextSize = 14
output.TextWrapped = true
output.TextXAlignment = Enum.TextXAlignment.Left
output.TextYAlignment = Enum.TextYAlignment.Top

-- Execute Button
local execute = Instance.new("TextButton", Frame)
execute.Name = "Execute"
execute.BackgroundColor3 = Color3.fromRGB(0, 120, 215) -- Blue button
execute.Position = UDim2.new(0.016, 0, 0.685, 0)
execute.Size = UDim2.new(0, 137, 0, 27)
execute.Font = Enum.Font.SourceSans
execute.Text = "Execute"
execute.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
execute.TextSize = 14
execute.MouseButton1Click:Connect(function()
	local code = TextBox.Text
	if code and code ~= "" then
		local success, err = pcall(function()
			loadstring(code)()
		end)
		output.Text = success and "Script executed successfully!" or "Error: " .. err
	else
		output.Text = "Please enter a script to execute."
	end
end)

-- Clear Button
local clear = Instance.new("TextButton", Frame)
clear.Name = "Clear"
clear.BackgroundColor3 = Color3.fromRGB(200, 50, 50) -- Red button
clear.Position = UDim2.new(0.016, 0, 0.79, 0)
clear.Size = UDim2.new(0, 137, 0, 23)
clear.Font = Enum.Font.SourceSans
clear.Text = "Clear"
clear.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
clear.TextSize = 14
clear.MouseButton1Click:Connect(function()
	TextBox.Text = ""
	output.Text = "Output cleared."
end)

-- Title Label
local TextLabel = Instance.new("TextLabel", Frame)
TextLabel.BackgroundTransparency = 1 -- Transparent background
TextLabel.Position = UDim2.new(0.048, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 597, 0, 22)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "Lua Executor"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
TextLabel.TextSize = 16
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

-- HTTP Request Example (Optional)
local HttpService = game:GetService("HttpService")
local url = "https://api.example.com/endpoint"

local success, response = pcall(function()
	return HttpService:GetAsync(url)
end)

if success then
	local data = HttpService:JSONDecode(response)
	print(data)
else
	warn("Failed to fetch data: " .. response)
end

-- Finish GUI script setup
print("GUI loaded successfully!")
