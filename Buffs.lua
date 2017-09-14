-- BUFF_BUTTON_HEIGHT = 10;

-- function  BuffFrameUpdatePositions()
 -- local BUFFS_PER_ROW = 4;
-- local BUFF_MAX_DISPLAY = 16;
-- local BUFF_ACTUAL_DISPLAY = 0;
-- local DEBUFF_MAX_DISPLAY = 16
-- local DEBUFF_ACTUAL_DISPLAY = 0;
 -- local BUFF_ROW_SPACING = 0;
-- local CONSOLIDATED_BUFFS_PER_ROW = 4;
-- local CONSOLIDATED_BUFF_ROW_HEIGHT = 0;
-- local NUM_TEMP_ENCHANT_FRAMES = 3;
-- local BUFF_BUTTON_HEIGHT = 10;
-- local BUFF_FRAME_BASE_EXTENT = 13;	-- pixels from the top of the screen to the top edge of the buff frame, needed to calculate extent for UIParentManageFramePositions

 
 -- BuffFrame:ClearAllPoints()
 -- --BuffFrame:SetParent("PlayerFrame")
 -- BuffFrame:SetPoint("TOPRIGHT",PlayerFrame,0,20)
 -- --BuffFrame:SetScale(1.2)
 -- BuffFrame.SetPoint = function () end
 
 -- end
 
 -- hooksecurefunc("BuffFrame_UpdatePositions", BuffFrameUpdatePositions) 
 
 -- function BuffFrameUpdateAllBuffAnchors()

 -- local BUFFS_PER_ROW = 6
 -- local BUFF_ROW_SPACING = 10
 -- local BUFF_BUTTON_HEIGHT = 12
-- -----
	-- local buff, previousBuff, aboveBuff, index;
	-- local numBuffs = 0;
	-- local numAuraRows = 0;
	-- local slack = BuffFrame.numEnchants;
	-- if ( BuffFrame.numConsolidated > 0 ) then
		-- slack = slack + 1;	-- one icon for all consolidated buffs
	-- end
	
	-- for i = 1, BUFF_ACTUAL_DISPLAY do
		-- buff = _G["BuffButton"..i];
		-- if ( buff.consolidated ) then	
			-- if ( buff.parent == BuffFrame ) then
				-- buff:SetParent(ConsolidatedBuffsContainer);
				-- buff.parent = ConsolidatedBuffsContainer;
			-- end
		-- else
			-- numBuffs = numBuffs + 1;
			-- index = numBuffs + slack;
			-- if ( buff.parent ~= BuffFrame ) then
				-- buff.count:SetFontObject(NumberFontNormal);
				-- buff:SetParent(BuffFrame);
				-- buff.parent = BuffFrame;
			-- end
			-- buff:ClearAllPoints();
			-- if ( (index > 1) and (mod(index, BUFFS_PER_ROW) == 1) ) then
				-- -- New row
				-- numAuraRows = numAuraRows + 1;
				-- if ( index == BUFFS_PER_ROW+1 ) then
					-- buff:SetPoint("BOTTOM", ConsolidatedBuffs, "TOP", 0, BUFF_ROW_SPACING);
				-- else
					-- buff:SetPoint("BOTTOM", aboveBuff, "TOP", 0, BUFF_ROW_SPACING);
				-- end
				-- aboveBuff = buff;
			-- elseif ( index == 1 ) then
				-- numAuraRows = 1;
				-- buff:SetPoint("TOPRIGHT", BuffFrame, "TOPRIGHT", 0, 0);
			-- else
				-- if ( numBuffs == 1 ) then
					-- if ( BuffFrame.numEnchants > 0 ) then
						-- buff:SetPoint("TOPRIGHT", "TemporaryEnchantFrame", "TOPLEFT", -5, 0);
					-- else
						-- buff:SetPoint("TOPRIGHT", ConsolidatedBuffs, "TOPLEFT", -5, 0);
					-- end
				-- else
					-- buff:SetPoint("RIGHT", previousBuff, "LEFT", -5, 0);
				-- end
			-- end
			-- previousBuff = buff;
		-- end
	-- end

	-- -- check if we need to manage frames
	-- local bottomEdgeExtent = BUFF_FRAME_BASE_EXTENT;
	-- if ( DEBUFF_ACTUAL_DISPLAY > 0 ) then
		-- bottomEdgeExtent = bottomEdgeExtent + DebuffButton1.offsetY + BUFF_BUTTON_HEIGHT + ceil(DEBUFF_ACTUAL_DISPLAY / BUFFS_PER_ROW) * (BUFF_BUTTON_HEIGHT + BUFF_ROW_SPACING);
	-- else
		-- bottomEdgeExtent = bottomEdgeExtent + numAuraRows * (BUFF_BUTTON_HEIGHT + BUFF_ROW_SPACING);
	-- end
	-- if ( BuffFrame.bottomEdgeExtent ~= bottomEdgeExtent ) then
		-- BuffFrame.bottomEdgeExtent = bottomEdgeExtent;
		-- UIParent_ManageFramePositions();
	-- end

	-- if ( ConsolidatedBuffsTooltip:IsShown() ) then
		-- ConsolidatedBuffs_UpdateAllAnchors();
	-- end
	
-- end

-- hooksecurefunc("BuffFrame_UpdateAllBuffAnchors",BuffFrameUpdateAllBuffAnchors)


-- -- 
-- function DebuffButtonUpdateAnchors(buttonName, index)
	-- local BUFF_BUTTON_HEIGHT = 18
	-- local BUFFS_PER_ROW = 5;
	-- local BUFF_ROW_SPACING = 10
	-- local numBuffs = BUFF_ACTUAL_DISPLAY + BuffFrame.numEnchants;
	-- if ( BuffFrame.numConsolidated > 0 ) then
		-- numBuffs = numBuffs - BuffFrame.numConsolidated + 1;
	-- end
	-- local rows = ceil(numBuffs/BUFFS_PER_ROW);
	-- local buff = _G[buttonName..index];

	-- -- Position debuffs
	-- if ( (index > 1) and (mod(index, BUFFS_PER_ROW) == 1) ) then
		-- -- New row
		-- buff:SetPoint("BOTTOM", buff, "TOP", 0, -BUFF_ROW_SPACING);
	-- elseif ( index == 1 ) then
		-- if ( rows < 2 ) then
			-- DebuffButton1.offsetY = 2*((2*BUFF_ROW_SPACING)+BUFF_BUTTON_HEIGHT);
		-- else
			-- DebuffButton1.offsetY = rows*(BUFF_ROW_SPACING+BUFF_BUTTON_HEIGHT);
		-- end
		-- buff:SetPoint("TOPRIGHT", ConsolidatedBuffs, "BOTTOMRIGHT", 0, DebuffButton1.offsetY);
	-- else
		-- buff:SetPoint("RIGHT", _G[buttonName..(index-1)], "LEFT", -5, 0);
	-- end
-- end
-- hooksecurefunc("DebuffButton_UpdateAnchors", DebuffButtonUpdateAnchors)



