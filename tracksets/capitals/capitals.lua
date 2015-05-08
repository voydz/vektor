local E = unpack(select(2, ...)); -- Import: Engine

local T = E:GetModule("Trackset")

local IsPlaying = false

function T:OnZoneChange(event, subZone, zoneName)

	local Handeled = false

	-- play music for major capitals
	Handeled = MajorCapitals(zoneName)

	-- play music for garrisons
	if not Handeled then
		Handeled = Garrison(zoneName)
	end

	-- play music for lesser capitals
	if not Handeled then
		Handeled = LesserCapitals(zoneName)
	end

	-- if not handeled by this set stop music
	if not Handeled and IsPlaying then
		StopMusic()
	end

	-- if the zone where handled we are playing music
	IsPlaying = Handeled
end

function T:OnUpdateResting(event, isResting)
	-- if not isResting then
	--	StopMusic()
	-- end
end

function HandlePlay(file)
	-- care if already playing we wont interrupt in sub zones
	if not IsPlaying then
		PlayMusic(file)
	end
end

function MajorCapitals(zoneName)

	local Capitals = { 
		"Stormwind City", "Sturmwind",
		"Orgrimmar",
		"Warspear", "Kriegsspeer",
	}

	if E.utils:InSet(zoneName, Capitals) then
		HandlePlay(T:GetTrackSetPath() .. "capitals\\resources\\got_main_theme.mp3")

		return true
	end

	return false
end

function LesserCapitals(zoneName)

	local Lesser = { 
		"Ironforge", "Eisenschmiede",
		"Darnassus",
	}

	if E.utils:InSet(zoneName, Lesser) then
		HandlePlay(T:GetTrackSetPath() .. "capitals\\resources\\ffxiv_limsalominsa.mp3")

		return true
	end

	local Odd = { 
		"Exodar",
		"Thunderbluff", "Donnerfels",
	}

	if E.utils:InSet(zoneName, Odd) then
		HandlePlay(T:GetTrackSetPath() .. "capitals\\resources\\ffxiv_uldah.mp3")

		return true
	end

	return false
end

function Garrison(zoneName)

	local Garrisons = { 
		"Frostwall", "Frostfestung",
		"Lunarfall", "Mondfall",
	}

	if E.utils:InSet(zoneName, Garrisons) then
		HandlePlay(T:GetTrackSetPath() .. "capitals\\resources\\ffxiv_gridania.mp3")

		return true
	end

	return false
end