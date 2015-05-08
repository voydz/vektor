--[[

	VeKtor, Background Music Engine replacement

	local E = unpack(select(2, ...)); --Import: Engine

]]

BINDING_HEADER_VEKTOR = GetAddOnMetadata(..., "Title")

local AddOnName, Engine = ...
local AddOn = LibStub("AceAddon-3.0"):NewAddon(AddOnName, "AceConsole-3.0")

Engine[1] = AddOn

_G[AddOnName] = Engine

function AddOn:OnInitialize()
	AddOn:Print("initialized")
end

-- simple postpone init trigger
local f=CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
	AddOn:Initialize()
end)