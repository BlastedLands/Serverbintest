local AllowedZones = {2557, 3217};

local function OnDuelReset(event, winner, loser)
	local winnerZone, loserZone = winner:GetZoneId(), loser:GetZoneId()
	
	-- Loop through allowed zones specified above
	for _, zone in pairs(AllowedZones) do
		-- Reset winner and loser cooldowns, health and power if winner and loser is within allowed Zone
		if(winnerZone == zone) and (loserZone == zone) then
			local winnerPType, loserPType = winner:GetPowerType(), loser:GetPowerType()
			
			winner:ResetAllCooldowns()
			winner:SetHealth(winner:GetMaxHealth())
			
			-- Set power to 0 if type is 1 (Rage), else set to max power
			if(winnerPType == 1) then
				winner:SetPower(winnerPType, 0)
			else
				winner:SetPower(winnerPType, winner:GetMaxPower())
			end
		
			loser:ResetAllCooldowns()
			loser:SetHealth(loser:GetMaxHealth())
			
			-- Set power to 0 if type is 1 (Rage), else set to max power
			if(loserPType == 1) then
				loser:SetPower(loserPType, 0)
			else
				loser:SetPower(loserPType, loser:GetMaxPower())
			end
		end
	end
end


RegisterPlayerEvent(11, OnDuelReset)