
local TextLabel = script.Parent:WaitForChild("yourtextlabel")

local function Typewriter(object,text)
	for i = 1, #text, 1 do
		object.Text = string.sub(text,1,i)
		task.wait(0.03)
	end
end


Typewriter(TextLabel,log.Value) --type the text useing this line