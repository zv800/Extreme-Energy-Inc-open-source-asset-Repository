local hole = script.Parent
local childList = {}
local massConstant = 5.8 
local mass = 32000 * massConstant
function checkObject(obj)
	if obj ~= hole and obj:isA("BasePart") then
		if not obj.Anchored then
			childList[obj] = true
		end
	elseif obj:isA("Model") or obj:isA("Accoutrement") or obj:isA("Tool") then
		for _, child in ipairs(obj:GetChildren()) do
			checkObject(child)
		end
		obj.ChildAdded:connect(checkObject)
	end
end
checkObject(workspace)
while true do
	for child in pairs(childList) do
		local distance = (hole.Position - child.Position).magnitude
		local motivator = child:FindFirstChild("BlackHole Influence")
	
		if distance * 240 * massConstant < mass then
			child:BreakJoints()
			if distance * 320 * massConstant < mass and child.Size.z + hole.Size.x > distance * 2 - 4 then
				mass = mass + child:GetMass()
				childList[child] = nil
				child:Remove()
			else
				child.CanCollide = false 
				if not motivator then
					motivator = Instance.new("BodyPosition")
					motivator.Parent = child
					motivator.Name = "BlackHole Influence"
				end
				motivator.position = hole.Position
				motivator.maxForce = Vector3.new(1, 1, 1) * mass * child:GetMass() / (distance * massConstant)
			end
		elseif motivator ~= nil then
			motivator:Remove()
		end
	end
	task.wait()
end