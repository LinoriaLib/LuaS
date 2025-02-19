wait(5)
local col = Instance.new("ColorCorrectionEffect", game.Lighting)
while task.wait() do
    col.TintColor = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
    col.Saturation = math.random(-1000, 1000)
end
