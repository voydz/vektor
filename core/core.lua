local E = unpack(select(2, ...));

function E:Initialize()
	-- wow api event proxy
	self:GetModule("EventHandler"):Register()

	-- internal api event handler
	self:GetModule("Trackset"):Register()

	-- attach utils
	E.utils = self:GetModule("Utils")
end