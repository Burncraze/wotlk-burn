local _, Burn = ...; 
 Burn.Burn = {}
 function Burn:Border(Frame, txr)
	local border=Frame:CreateTexture(nil,"ARTWORK")
	border:SetTexture(txr)
	border:SetPoint("TOPLEFT",-1,1)
	border:SetPoint("BOTTOMRIGHT",1,-2)
	border:SetVertexColor(0.5, 0.5, 0.5, .8) 
end
 function Burn:round(number, decimals)
	return (("%%.%df"):format(decimals)):format(number)
end

function Burn:CrBtn(point, relFrame ,relPoint,x_off,y_off,size_x,size_y,text,txr)
local btn = CreateFrame("Button", nil, UIParent,"SecureHandlerClickTemplate")
btn:SetPoint(point, relFrame, relPoint, x_off, y_off)
btn.txt=btn:CreateFontString("txt",OVERLAY,"GameFontNormal")
btn.txt:SetText(text)
btn.txt:SetAllPoints(btn)
btn:SetSize(size_x,size_y)
btn:SetHighlightTexture(txr,.4)
btn:SetPushedTexture(txr,.4)
return btn
end
function Burn:STC(seconds)
  local seconds = tonumber(seconds)
  if seconds <= 0 then
    return "00:00";
  else
    mins = string.format("%02.f", math.floor(seconds/60));
    secs = string.format("%02.f", math.floor(seconds - mins *60));
    return mins..":"..secs
  end
end

	function Burn:CF(size_x, size_y, point, relFrame, relPoint, x_off, y_off, frameStrata,texture)
		F=CreateFrame("Frame",Tpf,UIParent)
		F:SetSize(size_x,size_y)
		F:SetPoint(point,relFrame,relpoint,x_off,y_off)
		F:SetFrameStrata(frameStrata)
		F:SetFrameLevel(3)
		F:Show()
		F.tx=F:CreateTexture(nil,frameStrata,F)
		F.tx:SetTexture(texture)
		F.tx:SetVertexColor(.9,.9,.9, .8)
		F.tx:SetAllPoints(F)
		return F
		end