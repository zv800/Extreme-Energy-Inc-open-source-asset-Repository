local Prev = CFrame.Angles(0,0,0)
local Prev2 = 0
local Value = workspace:WaitForChild("ScreenShake")
--local Blur = Instance.new("BlurEffect",workspace.CurrentCamera)
game:GetService("RunService").RenderStepped:Connect(function()
	workspace.CurrentCamera.FieldOfView=workspace.CurrentCamera.FieldOfView-Prev2
	workspace.CurrentCamera.CFrame=workspace.CurrentCamera.CFrame*Prev:Inverse()
	local Offset = CFrame.new(math.random(-Value.Value*100,Value.Value*100)/2000,math.random(-Value.Value*100,Value.Value*100)/2000,math.random(-Value.Value*100,Value.Value*100)/2000)*CFrame.Angles(0,0,math.rad(math.random(-Value.Value*100,Value.Value*100)/200))
	Prev = CFrame.Angles(math.rad(math.random(-Value.Value*100,Value.Value*100)/500),math.rad(math.random(-Value.Value*100,Value.Value*100)/500),0)
	Prev2 = math.random(-Value.Value*100,Value.Value*100)/100
	workspace.CurrentCamera.FieldOfView=workspace.CurrentCamera.FieldOfView+Prev2
	workspace.CurrentCamera.CFrame=workspace.CurrentCamera.CFrame*Offset*Prev
end)

-- Use this to control the shake: Tween:Create(script.Parent.ScreenShake,TweenInfo.new(0.5),{Value=1}):Play()
-- Almost forgot, You need this to allow tweens: local Tween = game:GetService("TweenService")

-- Lastly, the "local Tween = game:GetService("TweenService")" Should be at the top of your script.

--Hopefully I clarified everything. -xRainbowFusionx