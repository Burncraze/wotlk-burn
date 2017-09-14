local addonName, addonTable = ...; 



local act = CreateFrame("FRAME");
act:RegisterEvent("PLAYER_ENTERING_WORLD");
act:RegisterEvent("PLAYER_REGEN_ENABLED")
act:RegisterEvent("PLAYER_REGEN_DISABLED")

local function DoNothing()
end

local function HideFrame(frame)
	if type(frame) == "string" then
		frame = _G[frame]
	end
	if type(frame) == "table" and frame.Show then
		frame.Show = DoNothing
		frame:Hide()
	end
end
local function eventHandler(self, event, ...)
 


-- Action Bars
	MainMenuBar:Hide()
	MainMenuBar.Show = function() end

	local x = -208
	for i=1, NUM_ACTIONBAR_BUTTONS do
		local button = _G["ActionButton"..i]

		if button then
			button:SetParent(UIParent)
			button:ClearAllPoints()
			button:SetPoint("BOTTOM", UIParent, "BOTTOM", x, 24)
			button.SetPoint = function() end
			button:SetScale(1.2)
		end

		x=x+42
	end

	MultiBarBottomLeft:SetParent(UIParent)
	MultiBarBottomLeft:ClearAllPoints()
	MultiBarBottomLeft:SetPoint("BOTTOMLEFT", ActionButton1, "TOPLEFT", 0, 4)
	MultiBarBottomLeft.SetPoint = function() end
	MultiBarBottomLeft:SetScale(1.2)

	MultiBarBottomRight:SetParent(UIParent)
	MultiBarBottomRight:ClearAllPoints()
	MultiBarBottomRight:SetPoint("BOTTOMLEFT", MultiBarBottomLeft, "TOPLEFT", 0, 4)
	MultiBarBottomRight.SetPoint = function() end
	MultiBarBottomRight:SetScale(1.2)

	BonusActionBarFrame:SetParent(UIParent)
	BonusActionBarFrame.SetParent = function() end
	BonusActionBarFrame:ClearAllPoints()
	BonusActionBarFrame.ClearAllPoints = function() end
	BonusActionBarFrame:SetPoint("LEFT", ActionButton1, "LEFT", -5, 0)
	BonusActionBarFrame.ClearAllPoints = function() end
	BonusActionBarFrame:SetScale(1.2)
	
	MultiCastActionBarFrame:SetParent(UIParent)
	MultiCastActionBarFrame:SetPoint("BOTTOMLEFT", MultiBarBottomRightButton12, "TOPLEFT", -32, 6)
	MultiCastActionBarFrame:SetScale(1.2)

	PetActionBarFrame:SetParent(UIParent)
	PetActionBarFrame:ClearAllPoints()
	PetActionBarFrame:SetPoint("BOTTOMRIGHT", MultiBarBottomRightButton12, "TOPRIGHT", 50, 6)
	PetActionBarFrame.SetPoint = function() end
	PetActionBarFrame:SetScale(0.65)

	
end
z=CreateFrame("FRAME",nil)
z:RegisterEvent("ACTIONBAR_UPDATE_STATE")
z:RegisterEvent("PLAYER_ENTERING_WORLD")
function act_OnEvent()
local array = {"ActionButton", "BonusActionButton", "MultiBarBottomLeftButton", "MultiBarBottomRightButton", "PetActionButton", "VehicleMenuBarActionButton"}
	for i=1, NUM_ACTIONBAR_BUTTONS do
		for _, v in pairs(array) do
			local border = _G[v..i.."NormalTexture"] or _G[v..i.."NormalTexture2"]
			local hotkey = _G[v..i.."HotKey"]
			local macro = _G[v..i.."Name"]
			local txtr = _G[v..i.."FloatingBG"]
			if border then
				border:SetAlpha(0)
				border:Hide()
				border.SetAlpha = function() end
			end
			--[[if hotkey then
				hotkey:Hide()
				hotkey.Show = function() end
			end]]
			--if macro then
			--	macro:Hide()
			--	macro.Show = function() end
			--end
			if txtr then
			txtr:SetAlpha(0)
			txtr:Hide()
			txtr.Show= DoNothing()
			end
		end
	end

	 -- for i=1,BONUSACTIONBAR_NUM_TEXTURES do
		 -- local texture = _G["BonusActionBarFrameTexture"..i]

		 -- if texture then
		 -- texture:Hide()
		 -- texture.Show = function() end
		 -- end
	 -- end
	end
ShapeshiftBarFrame:SetParent("UIParent")	
z:SetScript("OnEvent", act_OnEvent)
z:SetScript("OnLoad",act_OnEvent)
	
	
	
	
local font = CreateFont("accid1") -- font must be named!
font:SetFont("Interface\\AddOns\\zBurnUI\\media\\fonts\\accid.ttf", 16, "OUTLINE")
NumberFontNormalSmallGray:SetFontObject(font)
GameFontHighlightSmallOutline:SetFont("Interface\\AddOns\\zBurnUI\\media\\fonts\\accid.ttf", 14)
NumberFontNormal:SetFont("Interface\\AddOns\\zBurnUI\\media\\fonts\\accid.ttf", 16, "OUTLINE")
act:HookScript("OnEvent", eventHandler);

--------------------------------------------
local function chclass(self, event, ...)
asdf=select(2, UnitClass("Player"))	
	if asdf=="WARRIOR" or asdf == "PRIEST" then
		RegisterStateDriver(MainMenuBarArtFrame, "actionpage", "[bonusbar:5] 11; [bar:1] 1; [bar:2] 2; [bar:3] 3; [bar:4] 4; [bar:5] 5; [bar:6] 6; 1")
		BonusActionBarFrame:Hide()
		BonusActionBarFrame:UnregisterAllEvents()
  
    
	end
	end

act:HookScript("OnEvent", chclass)