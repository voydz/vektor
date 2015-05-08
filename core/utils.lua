local E = unpack(select(2, ...)); -- Import: Engine

local U = E:NewModule("Utils");

function U:InSet(key, set)
	for _,v in pairs(set) do
		if v == key then
			return true
		end
	end

	return false
end