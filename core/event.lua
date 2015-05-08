local E = unpack(select(2, ...)); -- Import: Engine

local EH = E:NewModule("EventHandler", "AceEvent-3.0"); -- mainly just an event proxy

function EH:Register()
	-- register events
	EH:RegisterEvent("PLAYER_ENTERING_WORLD")
	EH:RegisterEvent("UPDATE_MOUSEOVER_UNIT")

	EH:RegisterEvent("PLAYER_REGEN_DISABLED")
	EH:RegisterEvent("PLAYER_REGEN_ENABLED")

	EH:RegisterEvent("PLAYER_UPDATE_RESTING")

	EH:RegisterEvent("ZONE_CHANGED")
	EH:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	EH:RegisterEvent("ZONE_CHANGED_INDOORS")
end

--
-- Init
--

function EH:PLAYER_ENTERING_WORLD()
	EH:SendMessage("V_INIT")
end

function EH:UPDATE_MOUSEOVER_UNIT()
	EH:SendMessage("V_UPDATE_MOUSEOVER_UNIT", GetUnitName("mouseover"))
end

--
-- Combat
--

function EH:PLAYER_REGEN_DISABLED()
	EH:SendMessage("V_COMBAT_STARTED", GetUnitName("target", false))
end

function EH:PLAYER_REGEN_ENABLED()
	EH:SendMessage("V_COMBAT_ENDED")
end

--
-- Zone Changing
--

function EH:PLAYER_UPDATE_RESTING()
	EH:SendMessage("V_UPDATE_RESTING", IsResting())
end

function EH:ZONE_CHANGED()
	EH:SendMessage("V_ZONE_CHANGED", GetMinimapZoneText(), GetZoneText())
end

function EH:ZONE_CHANGED_NEW_AREA()
	EH:SendMessage("V_ZONE_CHANGED", GetMinimapZoneText(), GetZoneText())
end

function EH:ZONE_CHANGED_INDOORS()
	EH:SendMessage("V_ZONE_CHANGED", GetMinimapZoneText(), GetZoneText())
end