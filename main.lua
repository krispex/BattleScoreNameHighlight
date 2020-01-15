local f = CreateFrame("Frame")

local colourX,colourY,colourZ,colourA = 0.99999779462814, 0.81960606575012, 0, 0.99999779462814

function f:onUpdate()
	local isActiveBattlefield = GetBattlefieldStatus(1)
		if isActiveBattlefield=="active" then
			for i=1, 22 do
				local x,y,z,a = _G["WorldStateScoreButton"..i.."Name"].text:GetTextColor()
				if (_G["WorldStateScoreButton"..i.."Name"].name == UnitName("player")) then
					_G["WorldStateScoreButton"..i.."Name"].text:SetTextColor(1,1,1,1)
				else if (z ~= 0) then
					_G["WorldStateScoreButton"..i.."Name"].text:SetTextColor(colourX,colourY,colourZ,colourA)
				end
			end
		end
	end
end

f:SetScript("OnUpdate",f.onUpdate)