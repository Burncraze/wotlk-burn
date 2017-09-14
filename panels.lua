local _, Burn = ...; 
 Burn.panel = {}
local panel=Burn.panel
--SetCVar("useUIScale",1)
--SetCVar("UIScale", 0.7111111111)





--Panels for Bottom side of screen
local _, class = UnitClass("player")
local color = RAID_CLASS_COLORS[class]


panel.btfl=Burn:CF(528, 16, "BOTTOMLEFT", UIParent,"BOTTOMLEFT",0,0,"BACKGROUND","Interface\\AddOns\\BurnUI\\media\\blp\\BcL")
panel.btfr=Burn:CF(528, 16, "BOTTOMRIGHT", UIParent,"BOTTOMRIGHT",0,0,"BACKGROUND","Interface\\AddOns\\BurnUI\\media\\blp\\BcR")



-----------------------------------------------------------------------------
--Top Panels
-- panel.tpfl=CreateFrame("Frame",Tpf,UIParent)
-- panel.tpfl:SetSize(528,17)
-- panel.tpfl:SetPoint("TOPLEFT",0,0)
-- panel.tpfl:SetFrameStrata("BACKGROUND")
-- panel.tpfl:SetFrameLevel(3)
-- panel.tpfl:Show()
-- txl=panel.tpfl:CreateTexture(nil,"BACKGROUND",tpf)

-- txl:SetTexture("Interface\\AddOns\\BurnUI\\media\\blp\\TcL")
-- txl:SetVertexColor(.9,.9,.9, .8)
-- txl:SetAllPoints(panel.tpfl)
--txl:SetBlendMode("BLEND")

--function Burn:CF(size_x, size_y, point, relFrame, relPoint, x_off, y_off, frameStrata,texture)
panel.tpfr=Burn:CF(528, 16, "TOPRIGHT", UIParent,"TOPRIGHT",0,0,"BACKGROUND","Interface\\AddOns\\BurnUI\\media\\blp\\TcR")
panel.tpfl=Burn:CF(528, 16, "TOPLEFT", UIParent,"TOPLEFT",0,0,"BACKGROUND","Interface\\AddOns\\BurnUI\\media\\blp\\TcL")




	
								
								


 
 