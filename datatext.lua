----Data Text for BurnUI


-------------------------------------
--namespace
----------------------------------------
local _, Burn = ...; 
 Burn.dt = {}
 local dt = Burn.dt
 local panel=Burn.panel
-- local function Border(Frame)
-- local border=Frame:CreateTexture(nil,"ARTWORK")
-- border:SetTexture("Interface\\AddOns\\BurnUI\\media\\border\\border1.tga")
-- border:SetPoint("TOPLEFT",-1,1)
-- border:SetPoint("BOTTOMRIGHT",1,-2)
-- border:SetVertexColor(0.4, 0.4, 0.4, .6) 
-- end
-- local function round(number, decimals)
-- return (("%%.%df"):format(decimals)):format(number)
-- end
-------------------------------------------------------------------
--DATA TEXTS
-------------------------------------------------------------------
--xp Text
-- local cur=UnitXP("player")
-- local maxp= UnitXPMax("player")
-- local tlvl = maxp - cur
-- local xpperc = Burn:round((cur / maxp )*100,1)
-- xptxt=CreateFrame("Frame",XPtxt,UIParent)
-- xptxt.txt=xptxt:CreateFontString("txt", "OVERLAY")
-- xptxt.txt:SetFont("Interface\\AddOns\\BurnUI\\media\\fonts\\calc.ttf", 13, "OUTLINE")
-- xptxt.txt:SetPoint("LEFT",panel.tpf,"CENTER",3,0)
-- xptxt:SetSize(60,10)
-- xptxt:Show()
-- xptxt:SetPoint("CENTER",dt,"CENTER",0,0)
-- xptxt:RegisterEvent("PLAYER_XP_UPDATE")

-- local function xp_up (self)
		-- local cur=UnitXP("player")
		-- local maxp= UnitXPMax("player")
		-- local tlvl = maxp - cur
		-- local xpperc = Burn:round((cur / maxp )*100,1)
		-- local rest=GetRestState()
		-- xptxt.txt:SetText("Xp : ".. xpperc.. " %")
			-- if rest==1 then 
				-- xptxt.txt:SetTextColor(0,.40,.95)
			-- else
				-- xptxt.txt:SetTextColor(.75,.75,.75)
			-- end
			
				-- local lvl=UnitLevel("player")
				-- if lvl==85 then
				-- xptxt:Hide()
				-- end
-- end

-- hooksecurefunc("MainMenuExpBar_Update",xp_up)



 -------------------------------------------------------------
 --reputation text
FACTION_BAR_COLORS = {
	[1] = {r = 0.8, g = 0.3, b = 0.22},
	[2] = {r = 0.8, g = 0.3, b = 0.22},
	[3] = {r = 0.75, g = 0.27, b = 0},
	[4] = {r = 0.9, g = 0.7, b = 0},
	[5] = {r = 0, g = 0.6, b = 0.1},
	[6] = {r = 0, g = 0.6, b = 0.1},
	[7] = {r = 0, g = 0.6, b = 0.1},
	[8] = {r = 0, g = 0.6, b = 0.1},
	}
-- function Burn:CrBtn(point, relFrame ,relPoint,x_off,y_off,size_x,size_y,text)
 --dt.repdt=Burn:CrBtn("TOP",panel.tpf,"BOTTOM",0,0,200,20,"btn")
-- dt.repdt:SetTexture("Interface\\AddOns\\BurnUI\\media\\buttons\\Midnorm")
 
 
 dt.repdt=CreateFrame("Button",rept,UIParent,"SecureHandlerClickTemplate")
 dt.repdt.tx=dt.repdt:CreateTexture(nil,"BACKGROUND",dt.repdt)
 dt.repdt.tx:SetTexture("Interface\\AddOns\\BurnUI\\media\\buttons\\Midnorm.")
 dt.repdt.txt=dt.repdt:CreateFontString("txt",OVERLAY,"GameFontNormal")
 dt.repdt.txt:SetFont("Interface\\AddOns\\BurnUI\\media\\fonts\\calc.ttf", 13, "OUTLINE")
 dt.repdt.txt:SetTextColor(.3,.3,.3)
 dt.repdt.tx:SetPoint("TOPLEFT",-2,1)
 dt.repdt.txt:SetJustifyH("CENTER")
 dt.repdt.tx:SetPoint("BOTTOMRIGHT",1,-2)
 dt.repdt.tx:SetVertexColor(0.4, 0.4, 0.4, .8) 
 
dt.repdt:SetSize(250,15)
dt.repdt:RegisterEvent("PLAYER_ENTERING_WORLD")
dt.repdt:RegisterEvent("UPDATE_FACTION")
local lvl=UnitLevel("player")
				if lvl==80 then
	dt.repdt:SetPoint("TOP",panel.tpf,"BOTTOM",-0,0)
	dt.repdt.txt:SetPoint("CENTER",dt.repdt,"CENTER",-0,0)
	else
	dt.repdt:SetPoint("RIGHT",panel.tpf,"CENTER",-3,0)
	dt.repdt.txt:SetPoint("RIGHT",panel.tpf,"CENTER",-3,0)
	end

dt.repdt:RegisterForClicks("AnyUp")
dt.repdt:SetScript("PostClick", function (self,button)
ToggleCharacter("ReputationFrame")
end)

dt.repdt:SetBackdrop( {bgFile = nil, egdeFile= nil})
function rep_OnEnter()
dt.repdt.txt:SetFontObject("GameFontHighlight")
dt.repdt.txt:SetTextColor(.9,.7,.3)
 
dt.repdt.txt:SetText("Reputation Tab")
dt.repdt.tx:SetTexture("Interface\\AddOns\\BurnUI\\media\\buttons\\Midhigh")
	end
	dt.repdt:SetScript("OnEnter",rep_OnEnter)
function rep_OnLeave()
repupd()
 dt.repdt.tx:SetTexture("Interface\\AddOns\\BurnUI\\media\\buttons\\Midnorm.")
end
dt.repdt:SetScript("OnLeave",rep_OnLeave)

function rep_load(self)
local FACTION_BAR_COLORS = {
	[1] = {r = 0.8, g = 0.3, b = 0.22},
	[2] = {r = 0.8, g = 0.3, b = 0.22},
	[3] = {r = 0.75, g = 0.27, b = 0},
	[4] = {r = 0.9, g = 0.7, b = 0},
	[5] = {r = 0, g = 0.6, b = 0.1},
	[6] = {r = 0, g = 0.6, b = 0.1},
	[7] = {r = 0, g = 0.6, b = 0.1},
	[8] = {r = 0, g = 0.6, b = 0.1},
	}
 
local name, standing, min, max, value = GetWatchedFactionInfo()
local color = FACTION_BAR_COLORS[standing];
dt.repdt.txt:SetTextColor(color.r, color.g, color.b);
	if name == nil then
	dt.repdt.txt:Hide()
	else
	dt.repdt.txt:SetText(name..": "..value.." / "..max.." " )
	dt.repdt.txt:Show()
	end
	
	
	
end
--rep_load(repdt)
--hooksecurefunc("ReputationFrame_OnShow",rep_load)

function repupd(event,self)

local name, standing, min, max, value = GetWatchedFactionInfo()
local color = FACTION_BAR_COLORS[standing]
-- repdt.txt:SetTextColor(color.r, color.g, color.b)
	if name == nil then
	dt.repdt.txt:Hide()
	else
	dt.repdt.txt:SetTextColor(color.r, color.g, color.b)
	dt.repdt.txt:SetText(name..": "..value.." / "..max.." " )
	dt.repdt.txt:Show()
	end
	
	
end
--repdt:SetScript("OnEvent",repupd)
hooksecurefunc("ReputationWatchBar_Update",repupd)
--function ReputationWatchBar_Update(newLevel)

---------------------------------------------------------------
--Zone Text

dt.zoneText=Burn:CrBtn("RIGHT",panel.tpfr,"RIGHT",-5,-8,205,16,"Zone","Interface\\AddOns\\BurnUI\\media\\blp\\2btnR")


local function Zone(event,self)
local zone=GetMinimapZoneText()
dt.zoneText.txt:SetText(zone)
local pvpType, isSubZonePvP, factionName = GetZonePVPInfo();
	if ( pvpType == "sanctuary" ) then
		dt.zoneText.txt:SetTextColor(0.41, 0.8, 0.94);
	elseif ( pvpType == "arena" ) then
		dt.zoneText.txt:SetTextColor(1.0, 0.1, 0.1);
	elseif ( pvpType == "friendly" ) then
		dt.zoneText.txt:SetTextColor(0.1, 1.0, 0.1);
	elseif ( pvpType == "hostile" ) then
		dt.zoneText.txt:SetTextColor(1.0, 0.1, 0.1);
	elseif ( pvpType == "contested" ) then
		dt.zoneText.txt:SetTextColor(1.0, 0.7, 0.0);
	else
		dt.zoneText.txt:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
	end

	
end
dt.zoneText:RegisterEvent("PLAYER_ENTERING_WORLD")
dt.zoneText:RegisterEvent("ZONE_CHANGED")
dt.zoneText:RegisterEvent("ZONE_CHANGED_INDOORS")
dt.zoneText:RegisterEvent("ZONE_CHANGED_NEW_AREA")
dt.zoneText:SetScript("OnEvent",Zone)
Burn:Border(dt.zoneText, "Interface\\AddOns\\BurnUI\\media\\blp\\2btnR")

----------------------------------------------------
--Friend List
dt.f=Burn:CrBtn("LEFT",panel.btfl,"LEFT",0,4,102,16,"FRIENDS","Interface\\AddOns\\BurnUI\\media\\blp\\btnR.blp")
Burn:Border(dt.f,"Interface\\AddOns\\BurnUI\\media\\blp\\btnR.blp")

dt.f:RegisterEvent("FRIENDLIST_UPDATE")
dt.f:RegisterEvent("PLAYER_LOGIN")
dt.f:RegisterEvent("PLAYER_ENTERING_WORLD")
dt.f:RegisterForClicks("Any")


local function fevent(event, self)
local numberOfFriends, onlineFriends = GetNumFriends()
dt.f.txt:SetText("Friends:"..onlineFriends)
if onlineFriends==0 then
dt.f.txt:SetTextColor(1,1,1,.5)
else 
dt.f.txt:SetTextColor(0.1, 1.0, 0.8)
end
end
dt.f:SetScript("OnEvent",fevent)

function f_OnMouseUp()
ToggleFriendsFrame(1)
end
dt.f:SetScript("OnMouseUp", f_OnMouseUp)

-------------------------------------------------------
--Guild info 
dt.gl=Burn:CrBtn("LEFT",dt.f,"RIGHT",0,0,205,16,"Guild","Interface\\AddOns\\BurnUI\\media\\blp\\2btnR.blp")
Burn:Border(dt.gl,"Interface\\AddOns\\BurnUI\\media\\blp\\2btnR")
local function gl_load(event,self)
local guildName, guildRankName, guildRankIndex = GetGuildInfo("player")
local isGuildMember = IsInGuild()
-- if isGuildMember==1 then
-- numGuildMembers, numOnline, numOnlineAndMobile = GetNumGuildMembers()
-- dt.gl.txt:SetText(guildName.." "..numOnline.."/"..numGuildMembers )
-- dt.gl.txt:SetTextColor(0.2, 1.0, 0.1)
-- else
-- dt.gl.txt:SetText("You need to find a guild!!")
-- dt.gl.txt:SetTextColor(1,1,1,.5)
-- end
end
dt.gl:RegisterEvent("PLAYER_LOGIN")
dt.gl:RegisterEvent("GUILD_ROSTER_UPDATE")
dt.gl:RegisterForClicks("Any")
--dt.gl:SetScript("OnEvent", gl_load)

function gl_click()
ToggleGuildFrame()
end
dt.gl:SetScript("OnMouseUp",gl_click)


gl_load(gl)
-----------------------------------------------------------
--FPS
-----------------------------------------------------------
--Burn:CrBtn(point, relFrame ,relPoint,x_off,y_off,size_x,size_y,text,txr)
dt.fps=Burn:CrBtn("LEFT",dt.gl,"RIGHT",0,0,102,16,"fps","Interface\\AddOns\\BurnUI\\media\\blp\\btnR")

 local fps_val=GetFramerate()

--fps statusbar
dt.fps.stb=CreateFrame("StatusBar",stb,dt.fps)
--dt.fps.stb:SetStatusBarTexture("Interface\\AddOns\\BurnUI\\media\\media\\blp\\btnR")
--dt.fps.stb:GetStatusBarTexture():SetHorizTile(false)
dt.fps.stb:SetMinMaxValues(0, 120)
dt.fps.stb:SetValue(0)
--dt.fps.stb:SetWidth(dt.fps:GetWidth()-2)
--dt.fps.stb:SetHeight(dt.fps:GetHeight()-2)
--dt.fps.stb:SetPoint("CENTER",dt.fps,"CENTER")
--dt.fps.stb:SetStatusBarColor(0,1,0)
FPS_UPDATE = 0
 FPS_RATE = 1
 Burn:Border(dt.fps,"Interface\\AddOns\\BurnUI\\media\\blp\\btnR")

function fps_OnUpdate(self, elapsed)
FPS_UPDATE = FPS_UPDATE + elapsed
if FPS_UPDATE > FPS_RATE then
   FPS_UPDATE = 0
   local fps_val=GetFramerate()
   dt.fps.txt:SetText(string.format("FPS: %0.1f",fps_val))
   dt.fps.stb:SetValue(fps_val)
   end
    local min,max  = dt.fps.stb:GetMinMaxValues()
     if fps_val < (max*0.25) then -- Red under 25%
     dt.fps.stb:SetStatusBarColor(1,0,0)
	 dt.fps.txt:SetTextColor(1,0,0)
     elseif fps_val > (max*0.25) and fps_val < (max/2) then -- Yellow under 50% > 25%
     dt.fps.stb:SetStatusBarColor(1,1,0)
	 dt.fps.txt:SetTextColor(1,1,0)
     else -- Green > 50%
     dt.fps.stb:SetStatusBarColor(0,1,0)
	 dt.fps.txt:SetTextColor(0,1,0)
     end
   end
   dt.fps:RegisterEvent("OnUpdate")
   dt.fps:SetScript("OnUpdate",fps_OnUpdate)
   
-----------------------------------------------------------------
--Latency timer
----------------
--Burn:CrBtn(point, relFrame ,relPoint,x_off,y_off,size_x,size_y,text,txr)
dt.lat=Burn:CrBtn("LEFT",dt.fps,"RIGHT",0,0,102,16,lat,"Interface\\AddOns\\BurnUI\\media\\blp\\btnR")


 LAT_UPDATE = 0
 LAT_RATE = 1
 Burn:Border(dt.lat,"Interface\\AddOns\\BurnUI\\media\\blp\\btnR")

function lat_OnUpdate(self, elapsed)
LAT_UPDATE = LAT_UPDATE + elapsed
if LAT_UPDATE > LAT_RATE then
   LAT_UPDATE = 0
   local up, down, mshome, msworld = GetNetStats()
   dt.lat.txt:SetText("MS:"..mshome)
   --dt.lat.stb:SetValue(mshome)
   end
    --local min,max  = 0,300
    -- if mshome < 75 then --green
      -- dt.lat.txt:SetTextColor(0,1,0)
    -- elseif mshome > (75) and mshome < (150) then -- Yellow 
        -- --dt.lat.stb:SetStatusBarColor(1,1,0)
    -- else -- Gred
       -- --dt.lat.stb:SetStatusBarColor(1,0,0)
    --end
   end
      dt.lat:RegisterEvent("OnUpdate")
	  dt.lat:SetScript("OnUpdate",lat_OnUpdate)
------------------------------------------------------------
--OMG durability
------------------------------------------------------------
dt.dur=CreateFrame("Frame",nil, UIParent)
dt.dur:SetFrameStrata("BACKGROUND")
dt.dur:SetSize(90,18)
dt.dur:SetPoint("LEFT",dt.lat,"RIGHT", 3,0)
--durability text
 dt.dur.text=dt.dur:CreateFontString("txtlat", DIALOG,"GameFontNormal")
 dt.dur.text:SetFont("Interface\\AddOns\\BurnUI\\media\\fonts\\calc.ttf", 12, "OUTLINE")
 dt.dur.text:SetTextColor(1,1,1)
 dt.dur:SetFrameLevel(3)
 dt.dur.text:SetPoint("LEFT",dt.dur,"LEFT",2,0)


-- dt.dur.text:SetJustifyH("CENTER")
-- dt.dur.text:SetJustifyV("CENTER")
--durability statusbar

dt.dur.statusbar = CreateFrame("StatusBar",nil,dt.dur)
dt.dur.statusbar:SetStatusBarTexture("Interface\\AddOns\\BurnUI\\media\\blp\\btnR")
dt.dur.statusbar:GetStatusBarTexture():SetHorizTile(false)
dt.dur.statusbar:SetMinMaxValues(0, 100)
dt.dur.statusbar:SetValue(100)
dt.dur.statusbar:SetWidth(dt.dur:GetWidth()-2)
dt.dur.statusbar:SetHeight(dt.dur:GetHeight()-2)
dt.dur.statusbar:SetFrameLevel(2)
dt.dur.statusbar:SetPoint("CENTER",dt.dur,"CENTER")
dt.dur.statusbar:SetStatusBarColor(0,1,0)
-- Register inventory events
dt.dur:RegisterEvent("UPDATE_INVENTORY_DURABILITY")
dt.dur:RegisterEvent("PLAYER_ENTERING_WORLD")

local border=dt.dur:CreateTexture(nil,"ARTWORK")
border:SetTexture("Interface\\AddOns\\BurnUI\\media\\border\\border1.tga")
border:SetPoint("TOPLEFT",-1,1)
border:SetPoint("BOTTOMRIGHT",1,-1)
border:SetVertexColor(0.4, 0.4, 0.4, .6) 
-- Durability table labeling the slot names with slot id's.

DURABILITY_SLOT_NAME = {
    [1] = { slot = "HeadSlot"},
    [2] = { slot = "ShoulderSlot"},
    [3] = { slot = "ChestSlot"},
    [4] = { slot = "WaistSlot"},
    [5] = { slot = "WristSlot"},
    [6] = { slot = "HandsSlot"},
    [7] = { slot = "LegsSlot"},
    [8] = { slot = "FeetSlot"},
    [9] = { slot = "MainHandSlot"},
    [10] = { slot = "SecondaryHandSlot"},
    [11] = { slot = "RangedSlot"},
}	 

--on event handler for durability text 
function dur_event(self,OnEvent)
local slotInfo = { } -- Table we'll use to hold all our information
local minVal = 100 -- This will have our minimum durability should we have no items equiped with durability.
 
for i = 1, 11 do
    if ( not slotInfo[i] ) then tinsert(slotInfo, i, { equip, value, max, perc }) end -- Insert table information
    local slotID = GetInventorySlotInfo(DURABILITY_SLOT_NAME[i].slot)
    local itemLink = GetInventoryItemLink("player", slotID)
    local value, maximum = 0, 0
    if ( itemLink ~= nil ) then -- Find the durability and set 'equiped' to true.
        slotInfo[i].equip = true
        value, maximum = GetInventoryItemDurability(slotID)
    else
        slotInfo[i].equip = false
    end
    if ( slotInfo[i].equip and maximum ~= nil ) then -- determine the % of durability
        slotInfo[i].value = value
        slotInfo[i].max = maximum
        slotInfo[i].perc = floor((slotInfo[i].value/slotInfo[i].max)*100)
    end
end
for i = 1, 11 do
    if ( slotInfo[i].equip and slotInfo[i].max ~= nil ) then
        if ( slotInfo[i].perc < minVal ) then minVal = slotInfo[i].perc end -- Find the lowest item's durability and set 'minVal' to that %
    end
end
-- Update Text and Statusbar as well as coloring
dt.dur.text:SetText(string.format("Dur: %0.1f%%",minVal))
dt.dur.statusbar:SetValue(minVal)
local min,max  = dt.dur.statusbar:GetMinMaxValues()
if minVal < (max*0.25) then
    dt.dur.statusbar:SetStatusBarColor(1,0,0)
elseif minVal > (max*0.25) and minVal < (max/2) then
    dt.dur.statusbar:SetStatusBarColor(1,1,0)
else
    dt.dur.statusbar:SetStatusBarColor(0,1,0)
end
end
dt.dur:SetScript("OnEvent",dur_event)
---------------------------------------
--bag text
---------------------------------------
dt.bag=CreateFrame("Frame",bag,UIParent)
dt.bag:SetPoint("RIGHT",panel.btfr,"RIGHT",-3,0)
dt.bag:SetSize(75,18)
dt.bag:SetFrameStrata("BACKGROUND")
dt.bag:SetFrameLevel(3)
local border=dt.bag:CreateTexture(nil,"ARTWORK")
border:SetTexture("Interface\\AddOns\\BurnUI\\media\\border\\border1.tga")
border:SetPoint("TOPLEFT",-1,1)
border:SetPoint("BOTTOMRIGHT",1,-1)
border:SetVertexColor(0.4, 0.4, 0.4, .6) 
dt.bag:RegisterEvent("BAG_UPDATE")
dt.bag:RegisterEvent("UNIT_INVENTORY_CHANGED")
dt.bag:RegisterEvent("PLAYER_ENTERING_WORLD")
--bag text
txt=dt.bag:CreateFontString("bagtxt",DIALOG,"GameFontNormal")
txt:SetFont("Interface\\AddOns\\BurnUI\\media\\fonts\\calc.ttf", 12, "OUTLINE")
txt:SetTextColor(1,1,1)
txt:SetPoint("LEFT",dt.bag,"LEFT", 3,0)
--txt:SetText("Tralalala")
--Status Bar
-- dt.bag.stb=CreateFrame("StatusBar",nil,dt.bag)
-- dt.bag.stb:SetStatusBarTexture("Interface\\AddOns\\BurnUI\\media\\statusbar\\status2.tga")
-- dt.bag.stb:GetStatusBarTexture():SetHorizTile(false)
-- dt.bag.stb:SetMinMaxValues(0, 100)
-- dt.bag.stb:SetValue(100)
-- dt.bag.stb:SetWidth(dt.bag:GetWidth()-2)
-- dt.bag.stb:SetHeight(dt.bag:GetHeight()-2)
-- dt.bag.stb:SetFrameLevel(1)
-- dt.bag.stb:SetPoint("CENTER",dt.bag,"CENTER")
-- dt.bag.stb:SetStatusBarColor(0,1,0)

function bag_update(self, event)
local bagRem, bagTtl = 0, 0
 
for i = 0, NUM_BAG_SLOTS do
    bagRem, bagTtl = bagRem + GetContainerNumFreeSlots(i), bagTtl + GetContainerNumSlots(i)
end
 
txt:SetText(string.format("Bag: %d/%d",(bagTtl - bagRem), bagTtl))
--dt.bag.stb:SetMinMaxValues(0,bagTtl) 
--dt.bag.stb:SetValue((bagTtl - bagRem))
--local min,max  = dt.bag.stb:GetMinMaxValues()
--if bagRem < (max*0.25) then
 --   dt.bag.stb:SetStatusBarColor(1,0,0)
--elseif bagRem > (max*0.25) and bagRem < (max/2) then
    --dt.bag.stb:SetStatusBarColor(1,1,0)
--else
   -- dt.bag.stb:SetStatusBarColor(0,1,0)
--end
end
dt.bag:SetScript("OnEvent",bag_update)






