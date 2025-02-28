local player = game.Players.LocalPlayer
 
-- Make sure this is in a LocalScript
if not player then
	warn("Player is not available.")
	return
end
 
-- Wait for the character to load
local char = player.Character or player.CharacterAdded:Wait()
 
-- Wait for the torso to exist (use "UpperTorso" for newer Roblox characters)
repeat wait() until char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
 
-- Function to create the orb
local function buildOrb()
	local orb = Instance.new("Part")
	orb.Anchored = true
	orb.CanCollide = false
	orb.FormFactor = Enum.FormFactor.Custom
	orb.Shape = Enum.PartType.Ball
	orb.Size = Vector3.new(1, 1, 1)
	orb.TopSurface = Enum.SurfaceType.Smooth
	orb.BottomSurface = Enum.SurfaceType.Smooth
	orb.BrickColor = BrickColor.new("Really black")
	orb.Material = Enum.Material.Neon
 
	-- Add a mesh to make it look like a sphere
	local orbMesh = Instance.new("SpecialMesh", orb)
	orbMesh.MeshType = Enum.MeshType.Sphere
	orbMesh.Scale = Vector3.new(1, 1, 1)
 
	orb.Parent = workspace
	return orb
end
local orb = buildOrb()
 
local miniOrbs = {}
local numMiniOrbs = 10
for i = 1, numMiniOrbs do
	local miniOrb = buildOrb()
	miniOrb.Mesh.Scale = Vector3.new(0.3, 0.3, 0.3)
	miniOrbs[i] = miniOrb
end
 
-- Create the sound object
local music = Instance.new("Sound")
music.SoundId = "rbxassetid://5409360995" -- Replace with the sound ID you want
music.Parent = workspace
music.Looped = true -- Set to true if you want the music to loop
music.Volume = 1 -- Adjust the volume (0 to 1)
music:Play() -- Play the music immediately
 
local rotStep = 0
local sineStep = 0
 
game:GetService("RunService").RenderStepped:Connect(function()
	rotStep = rotStep + 1
	sineStep = sineStep + 0.04
 
	-- Smoothly move the main orb to the torso's position
	local targetPosition = torso.Position
	orb.CFrame = CFrame.new(targetPosition) * CFrame.Angles(0, math.rad(rotStep), 0) * CFrame.new(0, 3, 5 + math.sin(sineStep) * 2)
 
	-- Add rotation effect to the main orb
	orb.CFrame = orb.CFrame * CFrame.Angles(math.sin(sineStep / 3) / 2, math.rad(rotStep), 0)
 
	-- Animate mini orbs around the main orb
	for i, miniOrb in pairs(miniOrbs) do
		local angle = math.rad((i * 36) + rotStep * 3)
		miniOrb.CFrame = orb.CFrame * CFrame.Angles(0, angle, 0) * CFrame.new(0, 0, 2 + math.sin(sineStep) * 0.5)
	end
end)
