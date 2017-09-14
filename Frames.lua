local addonName, addonTable = ...; 

LoadAddOn("Blizzard_ArenaUI") -- You only need to run this once. You can safely delete any copies of this line.
local font = CreateFont("accid") -- font must be named!
local font2 = CreateFont("calc") -- font must be named!
font:SetFont("Interface\\AddOns\\BurnUI\\media\\fonts\\accid.ttf", 13, "OUTLINE")
font2:SetFont("Interface\\AddOns\\BurnUI\\media\\fonts\\calc.ttf", 14, "OUTLINE")

------
FrameList = {"Player", "Target", "Focus"}
	function UpdateHealthValues(...)
		for i = 1, select("#", unpack(FrameList)) do 
			local FrameName = (select(i, unpack(FrameList)))
			local Health = TextStatusBar_CapDisplayOfNumericValue(UnitHealth(FrameName))
			--local HealthMax = TextStatusBar_CapDisplayOfNumericValue(UnitHealthMax(FrameName))
			local HealthPercent = (UnitHealth(FrameName)/UnitHealthMax(FrameName))*100
			_G[FrameName.."FrameHealthBar"].TextString:SetText(Health.." ("..format("%.0f",HealthPercent).."%)")
			--_G[FrameName.."FrameHealthBar"].TextString:SetText(Health.."/"..HealthMax.." ("..format("%.0f",HealthPercent).."%)")
		end
	end
	--hooksecurefunc("TextStatusBar_UpdateTextStringWithValues", UpdateHealthValues)
--------------------------------------------------------------------------------------
--player buffs/debuffs
--------------------------------------------------------------------------------------
 BuffFrame:ClearAllPoints()
 --BuffFrame:SetParent("PlayerFrame")
 BuffFrame:SetPoint("TOPRIGHT",-200,-20)
 BuffFrame:SetScale(1.2)
 -- BuffFrame.SetPoint = function () end



--------------------------------------------------------------------------------------------------------------------------------------
--Player frame 
--------------------------------------------------------------------------------------------------------------------------------------
PlayerFrame:SetScale(1.3)

PlayerFrame:ClearAllPoints()
PlayerFrame:SetPoint("BOTTOM", -300, 230)
PlayerFrame.SetPoint = function() end


hooksecurefunc("PlayerFrame_UpdateStatus", function()
   if IsResting("player") then
      PlayerStatusTexture:Hide()
      PlayerRestGlow:Hide()
      PlayerStatusGlow:Hide()
   end
 
end)




if PlayerFrame:IsShown() and not bg then
        local _, class = UnitClass("player")
        local colour = RAID_CLASS_COLORS[class]
        local bg = PlayerFrame:CreateTexture(nil, "ARTWORK")
            
        bg:SetPoint("TOPLEFT", PlayerFrameBackground)
        bg:SetPoint("BOTTOMRIGHT", PlayerFrameBackground, 0, 22)
        bg:SetVertexColor(colour.r, colour.g, colour.b, .9)
        bg:SetTexture("Interface\\AddOns\\BurnUI\\media\\statusbar\\status.tga")
    end
PlayerName:SetFontObject(font2)
PlayerName:SetPoint("TOP",PlayerFrameBackground , 0, -5)
PlayerFrameHealthBar:SetStatusBarTexture("Interface\\AddOns\\BurnUI\\media\\statusbar\\status3.tga")
PlayerFrameManaBar:SetStatusBarTexture("Interface\\AddOns\\BurnUI\\media\\statusbar\\status3.tga")
PlayerFrameHealthBarText:SetFontObject(font)
PlayerFrameManaBarText:SetFontObject(font)
PlayerFrameGroupIndicator.Show = function() return end

-------------------------------------------------------------------------------
--Target Frame
TargetFrame:ClearAllPoints()
TargetFrame:SetPoint("BOTTOM", 300, 230)
TargetFrame.SetPoint = function() end
TargetFrame:SetScale(1.3)
TargetFrameTextureFrameName:SetFontObject(font2)
TargetFrameTextureFrameName:SetPoint("CENTER",TargetFrameNameBackground,0,-1)
TargetFrameHealthBar:SetStatusBarTexture("Interface\\AddOns\\BurnUI\\media\\statusbar\\status3.tga")
TargetFrameManaBar:SetStatusBarTexture("Interface\\AddOns\\BurnUI\\media\\statusbar\\status3.tga")
TargetFrameTextureFrameHealthBarText:SetFontObject(font)
TargetFrameTextureFrameManaBarText:SetFontObject(font)


----------------------------------------------------------------------------------------------------------------------------
--focus frame
FocusFrame:ClearAllPoints()
FocusFrame:SetPoint("TOPRIGHT",PlayerFrame,"TOPRIGHT",-85,140)
FocusFrame.SetPoint= function () end
FocusFrameTextureFrameName:SetFontObject(font2)
FocusFrameTextureFrameName:SetPoint("CENTER",FocusFrameNameBackground,0,-1)
FocusFrame:SetScale(1.2)
FocusFrameHealthBar:SetStatusBarTexture("Interface\\AddOns\\BurnUI\\media\\statusbar\\status3.tga")
FocusFrameManaBar:SetStatusBarTexture("Interface\\AddOns\\BurnUI\\media\\statusbar\\status3.tga")
FocusFrameTextureFrameHealthBarText:SetFontObject(font)
FocusFrameTextureFrameManaBarText:SetFontObject(font)
---------
--Focus buffs resize
-------
function targetUpdateAuraPositions(self, auraName, numAuras, numOppositeAuras, largeAuraList, updateFunc, maxRowWidth, offsetX, mirrorAurasVertically)
   -- aura positioning constants
   local AURA_OFFSET_Y = 2;
   local LARGE_AURA_SIZE = 26;
   local SMALL_AURA_SIZE = 20;
  -- maxRowWidth = LARGE_AURA_SIZE * 5
   local AURA_ROW_WIDTH = 125;
   local TOT_AURA_ROW_WIDTH = 105;
   local NUM_TOT_AURA_ROWS = 2;	
   local size;
   local offsetY = AURA_OFFSET_Y;
   local rowWidth = 0;
   local firstBuffOnRow = 1;
	for i=1, numAuras do
      if ( largeAuraList[i] ) then
         size = LARGE_AURA_SIZE;
         offsetY = AURA_OFFSET_Y + AURA_OFFSET_Y;
      else
         size = SMALL_AURA_SIZE;
      end
      if ( i == 1 ) then
         rowWidth = size;
         self.auraRows = self.auraRows + 1;
      else
         rowWidth = rowWidth + size + offsetX;
      end
      if ( rowWidth > maxRowWidth ) then
         updateFunc(self, auraName, i, numOppositeAuras, firstBuffOnRow, size, offsetX, offsetY,mirrorAurasVertically);
         rowWidth = size;
         self.auraRows = self.auraRows + 1;
         firstBuffOnRow = i;
         offsetY = AURA_OFFSET_Y;
		 if ( self.auraRows > NUM_TOT_AURA_ROWS ) then
				-- if we exceed the number of tot rows, then reset the max row width
				-- note: don't have to check if we have tot because AURA_ROW_WIDTH is the default anyway
				maxRowWidth = AURA_ROW_WIDTH;
			end
      else
         updateFunc(self, auraName, i, numOppositeAuras, i - 1, size, offsetX, offsetY,mirrorAurasVertically);
      end
   end
end
hooksecurefunc("TargetFrame_UpdateAuraPositions", targetUpdateAuraPositions)

 
   
   
 



-----------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------------------
ptfr=CreateFrame("FRAME")
ptfr:RegisterEvent("PLAYER_ENTERING_WORLD")
function cpinst(self, event)
 local tofin, zone=IsInInstance()
      if tofin ~= nil and zone=="arena" then
		PartyMemberFrame1:SetParent("UIParent")
		PartyMemberFrame1:ClearAllPoints()
		PartyMemberFrame1:SetPoint("LEFT",PlayerFrame,"BOTTOM", -200, 100)
		else
		PartyMemberFrame1:SetParent("UIParent")
		PartyMemberFrame1:ClearAllPoints()
		PartyMemberFrame1:SetPoint("LEFT",UIParent,"BOTTOM", -600, 250)
		end
	end
ptfr:HookScript("OnEvent",cpinst)
-- PartyMemberFrame1:SetScale(1.6)
-- PartyMemberFrame1:SetParent("UIParent")
-- PartyMemberFrame1:ClearAllPoints()
PartyMemberFrame1:SetScale(1.6)
PartyMemberFrame1:SetPoint("LEFT",UIParent,"BOTTOM", -620, 250)
PartyMemberFrame2:SetScale(1.6)
PartyMemberFrame2:ClearAllPoints()
PartyMemberFrame2:SetPoint("BOTTOM",PartyMemberFrame1,"TOP", 0, 50)

PartyMemberFrame3:SetScale(1.6)
PartyMemberFrame3:ClearAllPoints()
PartyMemberFrame3:SetPoint("BOTTOM",PartyMemberFrame2,"TOP", 0, 50)
PartyMemberFrame4:SetScale(1.6)
PartyMemberFrame4:ClearAllPoints()
PartyMemberFrame4:SetPoint("BOTTOM",PartyMemberFrame3,"TOP", 0, 50)



local fram = CreateFrame("FRAME")
fram:RegisterEvent("GROUP_ROSTER_UPDATE")
fram:RegisterEvent("PLAYER_TARGET_CHANGED")
fram:RegisterEvent("PLAYER_FOCUS_CHANGED")
fram:RegisterEvent("UNIT_FACTION")

local function eventHandler(self, event, ...)
    if UnitIsPlayer("target") then
        c = RAID_CLASS_COLORS[select(2, UnitClass("target"))]
        TargetFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
		TargetFrameNameBackground:SetTexture("Interface\\AddOns\\BurnUI\\media\\statusbar\\status.tga")
    end
    if UnitIsPlayer("focus") then
        c = RAID_CLASS_COLORS[select(2, UnitClass("focus"))]
        FocusFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
		FocusFrameNameBackground:SetTexture("Interface\\AddOns\\BurnUI\\media\\statusbar\\status.tga")
    end
end

fram:SetScript("OnEvent", eventHandler)




--castingbar

CastingBarFrame:SetParent("UIParent")
CastingBarFrame:ClearAllPoints()
CastingBarFrame:SetPoint("BOTTOM", -2, 150)
CastingBarFrame.SetPoint = function() end

CastingBarFrame.timer = CastingBarFrame:CreateFontString(nil)
CastingBarFrame.timer:SetFont(STANDARD_TEXT_FONT,12,"OUTLINE")
CastingBarFrame.timer:SetPoint("RIGHT", CastingBarFrame, "RIGHT", -5, 0)
CastingBarFrame.timer:SetJustifyH("RIGHT")
CastingBarFrame.update = .1;

CastingBarFrame:SetSize(474, 20)
CastingBarFrameText:SetPoint("BOTTOMLEFT", CastingBarFrame,"BOTTOMLEFT", 5, -6)
CastingBarFrameText.SetPoint = function() end
CastingBarFrameText:SetJustifyH("LEFT")
CastingBarFrameText:SetJustifyV("CENTER")
CastingBarFrameText:SetFont(STANDARD_TEXT_FONT,13,"OUTLINE")
CastingBarFrame:SetStatusBarTexture("Interface\\AddOns\\BurnUI\\media\\statusbar\\status3.tga")
CastingBarFrameFlash:SetTexture(nil)
CastingBarFrameBorder:SetTexture(nil)
local cw= select (1, CastingBarFrame:GetSize())
local ch= select (2, CastingBarFrame:GetSize())
CastingBarFrameText:SetSize(cw, ch)
cbb=CreateFrame("FRAME", cstbrd, CastingBarFrame)
cbb:CreateTexture(nil,"ARTWORK")
cbb:SetFrameStrata("MEDIUM")
cbb:SetFrameLevel(10)
cbb:SetSize(cw+10, ch+10)
cbb:SetPoint("CENTER",CastingBarFrame, "CENTER",0,0)
cbb:SetAlpha(1)
cbb:SetBackdrop({
        bgFile = nil, 
        edgeFile = "Interface\\AddOns\\BurnUI\\media\\border\\border.tga", 
        edgeSize = 18,
insets = { left = -10, right = 10, top = 8, bottom = -8}
		})
		
cbb:Show()
-------------------------------------------------------------------------------------------------------------------
--target casting bar
-------------------------------------------------------------------------------------------------------------------


TargetFrameSpellBarIcon:Hide()
TargetFrameSpellBarBorder:SetTexture(nil)
TargetFrameSpellBar:SetStatusBarTexture("Interface\\AddOns\\BurnUI\\media\\statusbar\\status3.tga")
TargetFrameSpellBar:SetSize(180, 18)
TargetFrameSpellBar:SetPoint("BOTTOMLEFT",8,- 30)
TargetFrameSpellBar.SetPoint= function () end
TargetFrameSpellBarText:ClearAllPoints()
TargetFrameSpellBarText:SetPoint("BOTTOMLEFT",TargetFrameSpellBar,"BOTTOMLEFT", 5, 0)
TargetFrameSpellBarText:SetJustifyH("LEFT")
TargetFrameSpellBarText:SetJustifyV("CENTER")
TargetFrameSpellBarText:SetFont(STANDARD_TEXT_FONT,13,"OUTLINE")
TargetFrameSpellBar.timer = TargetFrameSpellBar:CreateFontString(nil)
TargetFrameSpellBar.timer:SetFont("Fonts\\FRIZQT__.TTF", 11, "OUTLINE")
TargetFrameSpellBar.timer:SetPoint("RIGHT", TargetFrameSpellBar, "RIGHT", -3, 0)
TargetFrameSpellBar.update = .1
TargetFrameSpellBar.timer:SetJustifyH("RIGHT")
local tcw, tch= TargetFrameSpellBar:GetSize()
tbb=CreateFrame("FRAME", tcstbrd, TargetFrameSpellBar)
tbb:CreateTexture(nil,"ARTWORK")
tbb:SetFrameStrata("MEDIUM")
tbb:SetFrameLevel(10)
tbb:SetSize(tcw+11, tch+11)
tbb:SetPoint("CENTER",TargetFrameSpellBar, "CENTER",0,0)
tbb:SetAlpha(1)
tbb:SetBackdrop({
        bgFile = nil, 
        edgeFile = "Interface\\AddOns\\BurnUI\\media\\border\\border.tga", 
        edgeSize = 20,
insets = { left = -20, right = 11, top = 11, bottom = -11}
		})
		
tbb:Show()
-------------------------------------------------------------------------------------------------------------------------------------------------
--Focus casting bar
-------------------------------------------------------------------------------------------------------------------------------------------------
FocusFrameSpellBarIcon:Hide()
FocusFrameSpellBarBorder:SetTexture(nil)
FocusFrameSpellBar:SetStatusBarTexture("Interface\\AddOns\\BurnUI\\media\\statusbar\\status3.tga")
FocusFrameSpellBar:SetSize(180, 18)
FocusFrameSpellBar:SetPoint("TOPLEFT",8, 15)
FocusFrameSpellBar.SetPoint= function () end
FocusFrameSpellBarText:ClearAllPoints()
FocusFrameSpellBarText:SetPoint("BOTTOMLEFT",FocusFrameSpellBar,"BOTTOMLEFT", 5, 0)
FocusFrameSpellBarText:SetJustifyH("LEFT")
FocusFrameSpellBarText:SetJustifyV("CENTER")
FocusFrameSpellBarText:SetFont(STANDARD_TEXT_FONT,13,"OUTLINE")
FocusFrameSpellBar.timer = FocusFrameSpellBar:CreateFontString(nil)
FocusFrameSpellBar.timer:SetFont("Fonts\\FRIZQT__.TTF", 11, "OUTLINE")
FocusFrameSpellBar.timer:SetPoint("RIGHT", FocusFrameSpellBar, "RIGHT", -3, 0)
FocusFrameSpellBar.update = .1
FocusFrameSpellBar.timer:SetJustifyH("RIGHT")
local fcw, fch= FocusFrameSpellBar:GetSize()
tbb=CreateFrame("FRAME", tcstbrd, FocusFrameSpellBar)
tbb:CreateTexture(nil,"ARTWORK")
tbb:SetFrameStrata("MEDIUM")
tbb:SetFrameLevel(10)
tbb:SetSize(fcw+11, fch+11)
tbb:SetPoint("CENTER",FocusFrameSpellBar, "CENTER",0,0)
tbb:SetAlpha(1)
tbb:SetBackdrop({
        bgFile = nil, 
        edgeFile = "Interface\\AddOns\\BurnUI\\media\\border\\border.tga", 
        edgeSize = 20,
insets = { left = -20, right = 11, top = 11, bottom = -11}
		})
		
tbb:Show()
hooksecurefunc("CastingBarFrame_OnUpdate", function(self, elapsed)
    if not self.timer then return end
    if self.update and self.update < elapsed then
        if self.casting then
            self.timer:SetText(format("%2.2f/%1.2f", max(self.maxValue - self.value, 0), self.maxValue))
        elseif self.channeling then
            self.timer:SetText(format("%.2f", max(self.value, 0)))
        else
            self.timer:SetText("")
        end
        self.update = .1
    else
        self.update = self.update - elapsed
    end
end)

----------


trinkets = {}
local arenaFrame, trinket
for i = 1, 5 do
    arenaFrame = "ArenaEnemyFrame"..i
    trinket = CreateFrame("Cooldown", arenaFrame.."Trinket", ArenaEnemyFrames, "CooldownFrameTemplate")
    trinket:SetPoint("TOPRIGHT", arenaFrame, 30, -6)
    trinket:SetSize(32, 32)
    trinket.icon = trinket:CreateTexture(nil, "BACKGROUND")
    trinket.icon:SetAllPoints()
    trinket.icon:SetTexture("Interface\\Icons\\inv_jewelry_trinketpvp_01")
    trinket:Hide()
    trinkets["arena"..i] = trinket
end

local events = CreateFrame("Frame")
function events:UNIT_SPELLCAST_SUCCEEDED(unitID, spell, rank, lineID, spellID)
    if not trinkets[unitID] then
        return
    end
    if spellID == 59752 or spellID == 42292 then
        CooldownFrame_SetTimer(trinkets[unitID], GetTime(), 120, 1)
        SendChatMessage("Trinket used by: "..GetUnitName(unitID, true), "PARTY")
    end
end

function events:PLAYER_ENTERING_WORLD()
    local _, instanceType = IsInInstance()
    if instanceType == "arena" then
        self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    elseif self:IsEventRegistered("UNIT_SPELLCAST_SUCCEEDED") then
        self:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
        for _, trinket in pairs(trinkets) do
            trinket:SetCooldown(0, 0)
            trinket:Hide()
        end
    end
end
events:SetScript("OnEvent", function(self, event, ...) return self[event](self, ...) end)
events:RegisterEvent("PLAYER_ENTERING_WORLD")



UFP ="UnitFramePortrait_Update"
UICC ="Interface\\AddOns\\BurnUI\\media\\UI-Classes-Circles"
CIT = CLASS_ICON_TCOORDS
 
hUFP = "UnitFramePortrait_Update"
UICC = "Interface\\AddOns\\BurnUI\\media\\UI-Classes-Circles"
CIT = CLASS_ICON_TCOORDS
hooksecurefunc(UFP,function(self) if self.portrait then local t = CIT[select(2,UnitClass(self.unit))] if t then self.portrait:SetTexture(UICC) self.portrait:SetTexCoord(unpack(t)) end end end)
 


for i=1, 5 do
    _G["ArenaEnemyFrame"..i]:SetScale(1.8)
	_G["ArenaEnemyFrame"..i.."CastingBar"]:SetScale(1.1)
    _G["ArenaEnemyFrame"..i.."CastingBar"]:SetPoint("BOTTOMRIGHT", 95, -10)
end


for i=1, 5 do
_G["ArenaEnemyFrame"..i.."CastingBar"]:Show()
_G["ArenaEnemyFrame"..i.."CastingBar"]:SetAlpha(1)
end
print(ArenaEnemyFrame1:GetPoint())
ArenaEnemyFrame1:SetPoint("TOPRIGHT", -80, -200)
ArenaEnemyFrame1.SetPoint= function() end
ArenaEnemyFrame2:ClearAllPoints()
ArenaEnemyFrame2:SetPoint("TOPLEFT",ArenaEnemyFrame1,"TOPLEFT",0,80)
ArenaEnemyFrame2.SetPoint= function() end
ArenaEnemyFrame3:ClearAllPoints()
ArenaEnemyFrame3:SetPoint("TOPLEFT",ArenaEnemyFrame2,"TOPLEFT",0,80)
ArenaEnemyFrame3.SetPoint= function() end





	

	
	
	


	
	local frame=CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")

frame:SetScript("OnEvent", function(self, event, addon)
    if (addon == "Blizzard_TimeManager") then
        for i, v in pairs({PlayerFrameTexture, TargetFrameTextureFrameTexture, PetFrameTexture, PartyMemberFrame1Texture, PartyMemberFrame2Texture, PartyMemberFrame3Texture, PartyMemberFrame4Texture,
            PartyMemberFrame1PetFrameTexture, PartyMemberFrame2PetFrameTexture, PartyMemberFrame3PetFrameTexture, PartyMemberFrame4PetFrameTexture, FocusFrameTextureFrameTexture,
            TargetFrameToTTextureFrameTexture, FocusFrameToTTextureFrameTexture, BonusActionBarFrameTexture0, BonusActionBarFrameTexture1, BonusActionBarFrameTexture2, BonusActionBarFrameTexture3,
            BonusActionBarFrameTexture4, MainMenuBarTexture0, MainMenuBarTexture1, MainMenuBarTexture2, MainMenuBarTexture3, MainMenuMaxLevelBar0, MainMenuMaxLevelBar1, MainMenuMaxLevelBar2,
            MainMenuMaxLevelBar3, MinimapBorder, CastingBarFrameBorder, FocusFrameSpellBarBorder, TargetFrameSpellBarBorder, MiniMapTrackingButtonBorder, MiniMapLFGFrameBorder, MiniMapBattlefieldBorder,
            MiniMapMailBorder, MinimapBorderTop,
            select(1, TimeManagerClockButton:GetRegions())
        }) do
            v:SetVertexColor(.4, .4, .4)
        end

        for i,v in pairs({ select(2, TimeManagerClockButton:GetRegions()) }) do
            v:SetVertexColor(1, 1, 1)
        end

        self:UnregisterEvent("ADDON_LOADED")
        frame:SetScript("OnEvent", nil)
    end
end)

	

for i, v in pairs({ MainMenuBarLeftEndCap, MainMenuBarRightEndCap }) do
    v:SetVertexColor(.35, .35, .35)
end
 

	
	--party buffs/debuffs
	for i=1,4 do
	local f = _G["PartyMemberFrame"..i]
	f:UnregisterEvent("UNIT_AURA")
	local g = CreateFrame("Frame")
	g:RegisterEvent("UNIT_AURA")
	g:SetScript("OnEvent",function(self,event,a1)
		if a1 == f.unit then
			RefreshDebuffs(f,a1,20,nil,1)
		else
			if a1 == f.unit.."pet" then
				PartyMemberFrame_RefreshPetDebuffs(f)
			end
		end
	end)
	local b = _G[f:GetName().."Debuff1"]
	b:ClearAllPoints()
	b:SetPoint("LEFT",f,"RIGHT",-7,5)
	for j=5,20 do
		local l = f:GetName().."Debuff"
		local n = l..j
		local c = CreateFrame("Frame",n,f,"PartyDebuffFrameTemplate")
		c:SetPoint("LEFT",_G[l..(j-1)],"RIGHT")
	end
end

for i=1,4 do
	local f = _G["PartyMemberFrame"..i]
	f:UnregisterEvent("UNIT_AURA")
	local g = CreateFrame("Frame")
	g:RegisterEvent("UNIT_AURA")
	g:SetScript("OnEvent",function(self,event,a1)
		if a1 == f.unit then
			RefreshBuffs(f,a1,20,nil,1)
		end
	end)
	for j=1,20 do
		local l = f:GetName().."Buff"
		local n = l..j
		local c = CreateFrame("Frame",n,f,"TargetBuffFrameTemplate")
		c:EnableMouse(false)
		if j == 1 then
			c:SetPoint("TOPLEFT",48,-32)
		else
			c:SetPoint("LEFT",_G[l..(j-1)],"RIGHT",1,0)
		end
	end
end
----- minimap
    MinimapZoomIn:Hide();
	MinimapZoomOut:Hide();

	-- Move and Scale the entire Minimap frame
	MinimapCluster:ClearAllPoints();
	MinimapCluster:SetScale(1.2);
	MinimapCluster:SetPoint("TOPRIGHT", -15, -15);

	-- All and handle Mouse Scroll for minimap zooming
	Minimap:EnableMouseWheel(true);
	Minimap:SetScript("OnMouseWheel", function(self, delta)
		if(delta > 0) then
			Minimap_ZoomIn();
		else
			Minimap_ZoomOut();
		end
	end);




-- slash commands
SlashCmdList["CLCE"] = function() CombatLogClearEntries() end
SLASH_CLCE1 = "/clc"

SlashCmdList["TICKET"] = function() ToggleHelpFrame() end
SLASH_TICKET1 = "/gm"

SlashCmdList["READYCHECK"] = function() DoReadyCheck() end
SLASH_READYCHECK1 = '/rc'

SlashCmdList["CHECKROLE"] = function() InitiateRolePoll() end
SLASH_CHECKROLE1 = '/cr'
SlashCmdList["RELOAD"] = function() ReloadUI() end
SLASH_RELOAD1 = '/rl'


 -- cs=20;ps=10;ctp="CENTER"ptp="BOTTOMRIGHT"cp=1;ct=UNIT_NAME_FONT;crt=2;cDB={}action={}ccf=CreateFrame;gac=GetActionCooldown;ol="OUTLINE"cpe="PLAYER_ENTERING_WORLD"cau="ACTIONBAR_UPDATE_COOLDOWN"co="OnUpdate"

 -- function 
 -- rt(f)f.e=nil f.t:SetText("")f:SetScript(co,nil)
 -- end 
 -- function 
 -- sf(f,v)f.t:SetFont(ct,f.s*v,ol)
 -- end 
 -- function
 -- acv(b)local x=b.cooldown x.a=b.action action[x]=x 
 -- end 
 -- function 
 -- scv(p,f,po,s)if(s>1)then 
 -- f.t:SetPoint(po,p)end f.s=s;
 -- end

 -- function 
 -- sr(f,e)if(e>60)then sf(f,0.7)if(f.s==cs)then return"%d:%02d",e,e else return"%dm",e+60,e end elseif(e>=cp)then sf(f,1)f.t:SetTextColor(1,1,0,1)return"%d",e elseif(e>0)then sf(f,0.9)f.t:SetTextColor(1,0,0,1)return"%.1f",e else return end end

 -- function suc(f)if not f.e then f.e=1;f:SetScript(co,function(s,e)f.c=f.c+e;local fo,v1,v2=sr(f,f.r-f.c)if not fo then rt(f)elseif not v2 then f.t:SetFormattedText(fo,v1)else f.t:SetTextColor(1,1,1,1)f.t:SetFormattedText(fo,v1/60,v2%60)end end)end end
 -- function scs(p,f)if(p:GetSize()<35)then scv(p,f,ptp,ps)else scv(p,f,ctp,cs)end end 
 -- function 
 -- gict(f)local c=ccf("Frame",nil,f)c:SetFrameLevel(f:GetFrameLevel()+5)c.t=c:CreateFontString(nil,"OVERLAY")c.t:SetAllPoints(c)scs(f:GetParent(),c)return c
 -- end

 -- function gct(f)if not cDB[f]then local c=gict(f)c:SetSize(c.s*crt,c.s*crt)sf(c,1)cDB[f]=c;end return cDB[f]end function cvf(f,s,d)local c=gct(f)if(s and d)then c.b=s;c.d=d;if(s>0 and d>1.5)then c.c=0;c.r=d-(GetTime()-s);suc(c)else rt(c)end end end

 -- function cvc(DB)for c in pairs(DB)do if c.a then local s,d=gac(c.a)cvf(c,s,d)end end end 
 -- function pcv(_,e)if e==cau then cvc(action)else cvc(cDB)end end for _,b in pairs(ActionBarButtonEventsFrame.frames)do acv(b)end

 -- vc=ccf("Frame")vc:SetScript("OnEvent",pcv)vc:RegisterEvent(cpe)vc:RegisterEvent(cau)hooksecurefunc(getmetatable(ActionButton1Cooldown).__index,"SetCooldown",cvf)hooksecurefunc("SetActionUIButton",acv) 