local f = CreateFrame("Frame")

local colourX,colourY,colourZ,colourA
local defaultTextColour

f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self,event, ...)
	if event == "PLAYER_ENTERING_WORLD" then
		local defaultTextColour = WorldStateScoreButton1Name.text:GetTextColor()
		colourX,colourY,colourZ,colourA = WorldStateScoreButton1Name.text:GetTextColor()
	end
end)

function f:onUpdate()
	local isActiveBattlefield = GetBattlefieldStatus(1)
		if isActiveBattlefield=="active" then
			for i=1, 22 do
				if (_G["WorldStateScoreButton"..i.."Name"].name == UnitName("player")) then
					_G["WorldStateScoreButton"..i.."Name"].text:SetTextColor(1,1,1,1)
				else if (_G["WorldStateScoreButton"..i.."Name"].text:GetTextColor() ~= defaultTextColour) then
					_G["WorldStateScoreButton"..i.."Name"].text:SetTextColor(colourX,colourY,colourZ,colourA)
				end
			end
		end
	end
end

f:SetScript("OnUpdate",f.onUpdate)