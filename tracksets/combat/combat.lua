local E = unpack(select(2, ...)); -- Import: Engine

local T = E:GetModule("Trackset")

function T:OnCombatStart()

	local TrackPool = {
		"combat\\resources\\ffxiv_ultima_bgm.mp3",
		"combat\\resources\\ffxiv_titan_bgm.mp3",
		"combat\\resources\\ffxiv_shiva_bgm.mp3",
		"combat\\resources\\ffxiv_garuda_bgm.mp3",
		"combat\\resources\\ffxiv_leviathan_bgm.mp3",
		"combat\\resources\\ffxiv_ramuh_bgm.mp3",
	}

	PlayMusic(T:GetTrackSetPath() .. TrackPool[random(0, 5)])
end

function T:OnCombatEnd()
	StopMusic()
end