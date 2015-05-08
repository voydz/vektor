local E = unpack(select(2, ...)); -- Import: Engine

local T = E:NewModule("Trackset", "AceEvent-3.0")

local TrackSetPath = "Interface\\AddOns\\VeKtor\\tracksets\\";

function T:GetTrackSetPath()
	return TrackSetPath
end

function T:Register()
	T:RegisterMessage("V_INIT", "Initialize", TrackSetPath)
	T:RegisterMessage("V_UPDATE_MOUSEOVER_UNIT", "OnMouseOver")

	T:RegisterMessage("V_COMBAT_STARTED", "OnCombatStart")
	T:RegisterMessage("V_COMBAT_ENDED", "OnCombatEnd")
	T:RegisterMessage("V_ZONE_CHANGED", "OnZoneChange")
	T:RegisterMessage("V_UPDATE_RESTING", "OnUpdateResting")
end

function T:Initialize(trackSetPath)
end

function T:OnMouseOver(event, unitName)
end

function T:OnCombatStart(event, unitName)
end

function T:OnCombatEnd(event)
end

function T:OnUpdateResting(event, isResting)
end

function T:OnZoneChange(event, zoneName)
end
