local _, Burn = ...; 
 Burn.micmen = {}
local micmen = Burn.micmen
local menu
 --SetCVar("useUiScale",0)
 --hiding default micromenu
 MainMenuBarLeftEndCap:Hide()
MainMenuBarRightEndCap:Hide() -- hide the gryphons


MainMenuBarTexture0:Hide() -- hide all the background textures.
MainMenuBarTexture1:Hide() -- leaving them on looks better,
MainMenuBarTexture2:Hide() -- unless you are going to hide the
MainMenuBarTexture3:Hide() -- micromenu and bag buttons too.

--BonusActionBarFrameTexture1:SetAlpha(0)
-- BonusActionBarFrameTexture2:SetAlpha(0) -- this is for druids/rogues/warriors.
-- BonusActionBarFrameTexture3:SetAlpha(0) -- their stances cause this to show up
-- BonusActionBarFrameTexture4:SetAlpha(0) -- over the normal bar.

SlidingActionBarTexture0:SetAlpha(0)
SlidingActionBarTexture1:SetAlpha(0) -- hide pet bar background

-- These hide individual elements of the menu bar. Its easy to figure out what is what.
ActionBarUpButton:Hide()
ActionBarDownButton:Hide()
MainMenuBarPageNumber:SetAlpha(0)

CharacterMicroButton:Hide()
SpellbookMicroButton:Hide()
TalentMicroButton:Hide()
AchievementMicroButton:SetAlpha(0)
QuestLogMicroButton:Hide()
--GuildMicroButton:Hide()
PVPMicroButton:Hide()
LFDMicroButton:Hide()
--EJMicroButton:Hide()
MainMenuMicroButton:Hide()
HelpMicroButton:Hide()
--RaidMicroButton:Hide()

CharacterBag3Slot:Hide()
CharacterBag2Slot:Hide()
CharacterBag1Slot:Hide()
CharacterBag0Slot:Hide()
MainMenuBarBackpackButton:Hide()

---------------------------------------------------------------------------------------------------
--Creating new one text based 
---------------------------------------------------------------------------------------------------
--function Burn:CrBtn(name, point, relFrame ,relPoint,x_off,y_off,size_x,size_y,text)
micmen.acv=Burn:CrBtn("LEFT",Burn.panel.tpfl,"LEFT",4,-4,102,16,"Achievments","Interface\\AddOns\\BurnUI\\media\\blp\\btnL.blp")
micmen.pvp=Burn:CrBtn("LEFT",micmen.acv,"RIGHT", 0, 0,102,16,"PvP","Interface\\AddOns\\BurnUI\\media\\blp\\btnL.blp" )
micmen.lfr=Burn:CrBtn("LEFT",micmen.pvp,"RIGHT", 0, 0,102,16,"LfG/LfR","Interface\\AddOns\\BurnUI\\media\\blp\\btnL.blp" )
micmen.help=Burn:CrBtn("LEFT",micmen.lfr,"RIGHT", 0, 0,102,16,"GM HELP","Interface\\AddOns\\BurnUI\\media\\blp\\btnL.blp" )
micmen.dj=Burn:CrBtn("LEFT",micmen.help,"RIGHT", 0, 0,102,16,"D.Journal","Interface\\AddOns\\BurnUI\\media\\blp\\btnL.blp" )
--micmen.tal=Burn:CrBtn("RIGHT"
Burn:Border(micmen.acv, "Interface\\AddOns\\BurnUI\\media\\blp\\btnL.blp")
Burn:Border(micmen.pvp, "Interface\\AddOns\\BurnUI\\media\\blp\\btnL.blp")
Burn:Border(micmen.lfr, "Interface\\AddOns\\BurnUI\\media\\blp\\btnL.blp")
Burn:Border(micmen.help, "Interface\\AddOns\\BurnUI\\media\\blp\\btnL.blp")
Burn:Border(micmen.dj, "Interface\\AddOns\\BurnUI\\media\\blp\\btnL.blp")

--make button works // functions for buttons
--Achievments button
micmen.acv:RegisterForClicks("AnyUp")
---
local function acv_OnClick(self,button)
ToggleAchievementFrame()
end
micmen.acv:SetScript("OnClick", acv_OnClick)
---PvP frame
micmen.pvp:RegisterForClicks("AnyUp")
micmen.pvp:RegisterEvent("UNIT_AURA") 
micmen.pvp:RegisterEvent("UDATE_BATTLEFIELD_STATUS")
micmen.pvp:RegisterEvent("PLAYER_ENTERING_WOLRD")
local function pvp_OnClick(self,button)
TogglePVPFrame()
end
micmen.pvp:SetScript("OnClick",pvp_OnClick)

	

local function pvp_onUpdate(self,elapsed)
local timer=0
local totime=timer+elapsed
local expirationTime = select(7,UnitDebuff("player","Deserter"))
local InQue = GetBattlefieldTimeWaited(1)
local quetime = Burn:STC(InQue/1000)
if totime > timer then

	if UnitDebuff("player","Deserter")then 
        local expirationTime = select(7,UnitDebuff("player","Deserter"))
		local dbtimer=Burn:STC((expirationTime-GetTime()))
		micmen.pvp.txt:SetText("Dsrt:"..dbtimer)
		elseif InQue > 0 then
			micmen.pvp.txt:SetText("Que : "..quetime)
		else			
		micmen.pvp.txt:SetText("PvP")
		end
		end
		end
		local function dsrtr(event,self)
		pvp_onUpdate()

	end
micmen.pvp:SetScript("OnUpdate", pvp_onUpdate)
micmen.pvp:SetScript("OnEvent",dsrtr) 
-------------------------------------------------------------------------------
-- LfG/LfR Button
-------------------------------------------------------------------------------
micmen.lfr:RegisterForClicks("AnyUp")
micmen.lfr:RegisterEvent("LFG_UPDATE", "LFG_QUEUE_STATUS_UPDATE")
micmen.lfr:RegisterEvent("UNIT_AURA")
local function lfr_onclick(self, button)
ToggleLFDFrame()
end
micmen.lfr:SetScript("OnClick", lfr_onclick)
local function lfr_OnEvent(event, self)

end
-------------------------------------------------------------------------------
-- Ticket window
-------------------------------------------------------------------------------
micmen.help:RegisterForClicks("AnyUp")
local function help_onclick(self, button)
PVEFrame_ToggleFrame()
end
micmen.help:SetScript("OnClick", help_onclick)
-------------------------------------------------------------------------------
--dungeon journal
-------------------------------------------------------------------------------
micmen.dj:RegisterForClicks("AnyUp")
local function dj_onclick(self, button)
ToggleEncounterJournal()
end
micmen.dj:SetScript("OnClick", dj_onclick)