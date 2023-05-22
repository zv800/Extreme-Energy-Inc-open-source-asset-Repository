local PlayersBanned = {"TheBestTheDeveloper"} --player name here to ban
local BanMessage = "go away please"
game.Players.PlayerAdded:Connect(function(player)
	while player.Character == nil do
		wait(1)
	end
	for i, v in pairs(PlayersBanned) do
		if string.match(v, player.Name) then
			player:Kick(BanMessage)
		end
	end
end)
