

bl, br,rs,rls =GetActionBarToggles()
ercnt:SetParent("UIParent")
ercnt:SetSize(16,16)
ercnt:Show()
local t = ercnt:CreateTexture(nil,"BACKGROUND")
t:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Factions.blp")
t:SetAllPoints(ercnt)
ercnt.texture = t
ercnt:SetFrameStrata("BACKGROUND")
ercnt:RegisterEvent("PLAYER_ENTERING_WORLD")





local function cntbar(self, event)
-- MainMenuExpBar:ClearAllPoints()
-- MainMenuExpBar:SetPoint("BOTTOMLEFT", ercnt,"BOTTOMLEFT")
	if bl==1 and br==1 then
		ercnt:ClearAllPoints()
		ercnt:SetPoint("BOTTOMLEFT", MultiBarBottomRightButton1,"TOPLEFT",-2,4)
		ercnt.SetPoint  = function() end
	elseif br==nil and bl==1 then
		ercnt:ClearAllPoints()
		ercnt:SetPoint("BOTTOMLEFT", MultiBarBottomLeftButton1,"TOPLEFT",-2,4)
		ercnt.SetPoint  = function() end
	else
		ercnt:ClearAllPoints()
		ercnt:SetPoint("BOTTOMLEFT", ActionButton1,"TOPLEFT",-2,4)
		ercnt.SetPoint  = function() end
end
end

ercnt:HookScript("OnEvent",cntbar) 