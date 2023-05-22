local minimumAge = 30
game.Players.PlayerAdded:Connect(function(player)
	if(player.AccountAge < minimumAge) and player.Name~="Player1" then
		player:Kick("Anti-Alt: Your account must be at least "..tostring(minimumAge).." days old to play this game!")
	end
end)