-- The default rotations generator for SHAMANS.
local shamanRotationsGenerator = function ()
	local rotation = {
		["defaultRotation/shaman/elemental"] = {
			["ActionList"] = {
				["defaultRotation/shaman/earth_shock"] = {
					["b_rangecheck"] = true,
					["b_p_havebuff"] = true,
					["v_gcdspell"] = "324",
					["v_keybind"] = "<keybind>",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "8042",
					["v_actionicon"] = "8042",
					["v_checkothercdvalue"] = "<2",
					["v_p_havebuff"] = "324#5",
					["v_checkothercdname"] = "8042",
				},
				["defaultRotation/shaman/searing_totem"] = {
					["b_p_firetoteminactive"] = true,
					["v_rangespell"] = "403",
					["v_gcdspell"] = "3599",
					["v_togglename"] = "Toggle 1",
					["v_keybind"] = "<keybind>",
					["b_p_firetotemtimeleft"] = true,
					["v_actionicon"] = "3599",
					["v_spellname"] = "3599",
					["v_durationstartedtime"] = 0,
					["v_p_firetotemtimeleft"] = "=0",
					["v_p_firetoteminactive"] = "3599",
					["b_rangecheck"] = true,
				},
				["defaultRotation/shaman/thunderstorm"] = {
					["v_actionicon"] = "51490",
					["v_p_unitpowertype"] = "0",
					["v_gcdspell"] = "324",
					["v_checkothercdvalue"] = "<2",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["b_p_unitpower"] = true,
					["v_spellname"] = "51490",
					["v_durationstartedtime"] = 0,
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = "<75%",
					["v_checkothercdname"] = "51490",
				},
				["defaultRotation/shaman/stormlash_totem"] = {
					["b_p_havebuff"] = true,
					["v_gcdspell"] = "3599",
					["v_actionicon"] = "120668",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "120668",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "32182|2825|90355|80353",
					["v_checkothercdname"] = "120668",
				},
				["defaultRotation/shaman/ancestral_swiftness"] = {
					["v_gcdspell"] = "0",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "16188",
					["v_spellname"] = "16188",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["v_checkothercdname"] = "16188",
				},
				["defaultRotation/shaman/lightning_shield"] = {
					["v_p_needbuff"] = "324",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "324",
					["b_p_needbuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "324",
					["v_actionicon"] = "324",
				},
				["defaultRotation/shaman/searing_totem_refresh"] = {
					["v_gcdspell"] = "3599",
					["v_rangespell"] = "403",
					["b_p_firetotemactive"] = true,
					["v_p_firetotemtimeleft"] = "<=3",
					["v_durationstartedtime"] = 0,
					["b_p_firetotemtimeleft"] = true,
					["v_p_firetotemactive"] = "3599",
					["v_spellname"] = "3599",
					["v_actionicon"] = "3599",
					["v_keybind"] = "<keybind>",
					["v_togglename"] = "Toggle 1",
					["b_rangecheck"] = true,
				},
				["defaultRotation/shaman/fire_elemental_totem"] = {
					["v_rangespell"] = "403",
					["v_gcdspell"] = "3599",
					["v_keybind"] = "<keybind>",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "2894",
					["v_spellname"] = "2894",
					["b_t_boss"] = true,
					["v_checkothercdvalue"] = "<2",
					["v_durationstartedtime"] = 0,
					["v_checkothercdname"] = "2894",
				},
				["defaultRotation/shaman/unleash_elements_unleashed_fury"] = {
					["v_p_knowspell"] = "117012",
					["b_rangecheck"] = true,
					["v_gcdspell"] = "324",
					["v_durationstartedtime"] = 0,
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "73680",
					["v_spellname"] = "73680",
					["v_keybind"] = "<keybind>",
					["v_checkothercdvalue"] = "<2",
					["b_checkothercd"] = true,
					["v_checkothercdname"] = "73680",
				},
				["defaultRotation/shaman/lava_burst"] = {
					["b_t_hasdebuff"] = true,
					["b_rangecheck"] = true,
					["v_gcdspell"] = "324",
					["v_durationstartedtime"] = 0,
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "51505",
					["v_spellname"] = "51505",
					["v_keybind"] = "<keybind>",
					["v_checkothercdvalue"] = "<2",
					["v_t_hasdebuff"] = "_8050^3",
					["v_checkothercdname"] = "51505",
				},
				["defaultRotation/shaman/elemental_blast"] = {
					["v_gcdspell"] = "324",
					["b_rangecheck"] = true,
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "117014",
					["v_actionicon"] = "117014",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_checkothercdname"] = "117014",
				},
				["defaultRotation/shaman/elemental_mastery"] = {
					["v_gcdspell"] = "0",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "16166",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "16166",
					["v_checkothercdname"] = "16166",
				},
				["defaultRotation/shaman/ascendance"] = {
					["v_p_needbuff"] = "114050",
					["v_actionicon"] = "114049",
					["b_p_needbuff"] = true,
					["b_p_havebuff"] = true,
					["v_gcdspell"] = "0",
					["v_checkothercdvalue"] = "<2",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "114049",
					["b_t_boss"] = true,
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "16166",
					["v_checkothercdname"] = "114049",
				},
				["defaultRotation/shaman/lightning_bolt"] = {
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "403",
					["v_spellname"] = "403",
					["v_durationstartedtime"] = 0,
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "324",
					["b_rangecheck"] = true,
				},
				["defaultRotation/shaman/flame_shock"] = {
					["v_t_needsdebuff"] = "_8050^3",
					["b_rangecheck"] = true,
					["v_gcdspell"] = "324",
					["v_durationstartedtime"] = 0,
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "8050",
					["v_spellname"] = "8050",
					["b_t_needsdebuff"] = true,
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_checkothercdname"] = "8050",
				},
			},
			["SortedActions"] = {
				"defaultRotation/shaman/lightning_shield", -- [1]
				"defaultRotation/shaman/elemental_mastery", -- [2]
				"defaultRotation/shaman/fire_elemental_totem", -- [3]
				"defaultRotation/shaman/ascendance", -- [4]
				"defaultRotation/shaman/ancestral_swiftness", -- [5]
				"defaultRotation/shaman/stormlash_totem", -- [6]
				"defaultRotation/shaman/thunderstorm", -- [7]
				"defaultRotation/shaman/unleash_elements_unleashed_fury", -- [8]
				"defaultRotation/shaman/elemental_blast", -- [9]
				"defaultRotation/shaman/flame_shock", -- [10]
				"defaultRotation/shaman/lava_burst", -- [11]
				"defaultRotation/shaman/earth_shock", -- [12]
				"defaultRotation/shaman/searing_totem", -- [13]
				"defaultRotation/shaman/searing_totem_refresh", -- [14]
				"defaultRotation/shaman/lightning_bolt", -- [15]
			},
			["keybind"] = "<keybind>",
		},
		["defaultRotation/shaman/enhancement"] = {
			["ActionList"] = {
				["defaultRotation/shaman/lava_lash"] = {
					["b_rangecheck"] = true,
					["b_p_havebuff"] = true,
					["v_gcdspell"] = "324",
					["v_keybind"] = "<keybind>",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "60103",
					["v_spellname"] = "60103",
					["v_durationstartedtime"] = 0,
					["v_checkothercdvalue"] = "<2",
					["v_p_havebuff"] = "77661#5",
					["v_checkothercdname"] = "60103",
				},
				["defaultRotation/shaman/stormstrike"] = {
					["v_p_needbuff"] = "114051",
					["b_p_needbuff"] = true,
					["b_rangecheck"] = true,
					["v_rangespell"] = "60103",
					["v_actionicon"] = "17364",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "17364",
					["v_keybind"] = "<keybind>",
					["v_checkothercdvalue"] = "<2",
					["v_gcdspell"] = "324",
					["v_checkothercdname"] = "17364",
				},
				["defaultRotation/shaman/unleash_elements_unleashed_fury"] = {
					["v_p_knowspell"] = "117012",
					["b_rangecheck"] = true,
					["v_gcdspell"] = "324",
					["v_actionicon"] = "73680",
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "73680",
					["v_keybind"] = "<keybind>",
					["v_checkothercdvalue"] = "<2",
					["b_checkothercd"] = true,
					["v_checkothercdname"] = "73680",
				},
				["defaultRotation/shaman/lightning_bolt_maelstrom_5"] = {
					["v_gcdspell"] = "324",
					["v_durationstartedtime"] = 0,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "403",
					["v_spellname"] = "403",
					["b_p_havebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "53817#5",
					["b_rangecheck"] = true,
				},
				["defaultRotation/shaman/unleash_elements"] = {
					["v_gcdspell"] = "324",
					["b_rangecheck"] = true,
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "73680",
					["v_spellname"] = "73680",
					["v_durationstartedtime"] = 0,
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_checkothercdname"] = "73680",
				},
				["defaultRotation/shaman/elemental_mastery"] = {
					["v_gcdspell"] = "0",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "16166",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "16166",
					["v_checkothercdname"] = "16166",
				},
				["defaultRotation/shaman/searing_totem"] = {
					["b_p_firetoteminactive"] = true,
					["v_gcdspell"] = "3599",
					["v_rangespell"] = "8050",
					["v_togglename"] = "Toggle 1",
					["v_keybind"] = "<keybind>",
					["b_p_firetotemtimeleft"] = true,
					["v_actionicon"] = "3599",
					["v_spellname"] = "3599",
					["v_durationstartedtime"] = 0,
					["v_p_firetotemtimeleft"] = "=0",
					["v_p_firetoteminactive"] = "3599",
					["b_rangecheck"] = true,
				},
				["defaultRotation/shaman/lightning_bolt"] = {
					["v_gcdspell"] = "324",
					["v_actionicon"] = "403",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "403",
					["b_p_havebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "53817#2",
					["b_rangecheck"] = true,
				},
				["defaultRotation/shaman/elemental_blast"] = {
					["v_gcdspell"] = "324",
					["b_rangecheck"] = true,
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "117014",
					["v_spellname"] = "117014",
					["v_durationstartedtime"] = 0,
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_checkothercdname"] = "117014",
				},
				["defaultRotation/shaman/lightning_shield"] = {
					["v_p_needbuff"] = "324",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "324",
					["b_p_needbuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "324",
					["v_actionicon"] = "324",
				},
				["defaultRotation/shaman/stormblast"] = {
					["v_gcdspell"] = "324",
					["v_checkothercdname"] = "17364",
					["v_keybind"] = "<keybind>",
					["v_rangespell"] = "403",
					["v_actionicon"] = "115356",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "17364",
					["b_p_havebuff"] = true,
					["v_checkothercdvalue"] = "<2",
					["v_p_havebuff"] = "114051",
					["b_rangecheck"] = true,
				},
				["defaultRotation/shaman/fire_elemental_totem"] = {
					["v_rangespell"] = "8050",
					["v_gcdspell"] = "3599",
					["v_checkothercdvalue"] = "<2",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "2894",
					["b_t_boss"] = true,
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "2894",
					["v_checkothercdname"] = "2894",
				},
				["defaultRotation/shaman/stormlash_totem"] = {
					["v_actionicon"] = "120668",
					["v_gcdspell"] = "3599",
					["v_durationstartedtime"] = 0,
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["b_p_havebuff"] = true,
					["v_spellname"] = "120668",
					["v_keybind"] = "<keybind>",
					["v_checkothercdvalue"] = "<2",
					["v_p_havebuff"] = "32182|2825|90355|80353",
					["v_checkothercdname"] = "120668",
				},
				["defaultRotation/shaman/ascendance"] = {
					["v_p_needbuff"] = "114051",
					["b_p_needbuff"] = true,
					["v_gcdspell"] = "0",
					["v_durationstartedtime"] = 0,
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "114049",
					["v_spellname"] = "114049",
					["b_t_boss"] = true,
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_checkothercdname"] = "114049",
				},
				["defaultRotation/shaman/earth_shock"] = {
					["v_gcdspell"] = "324",
					["b_rangecheck"] = true,
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "8042",
					["v_spellname"] = "8042",
					["v_durationstartedtime"] = 0,
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_checkothercdname"] = "8042",
				},
				["defaultRotation/shaman/searing_totem_refresh"] = {
					["v_gcdspell"] = "3599",
					["v_durationstartedtime"] = 0,
					["b_p_firetotemactive"] = true,
					["v_p_firetotemtimeleft"] = "<=3",
					["v_p_firetotemactive"] = "3599",
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "3599",
					["v_spellname"] = "3599",
					["b_p_firetotemtimeleft"] = true,
					["v_keybind"] = "<keybind>",
					["v_rangespell"] = "8050",
					["b_rangecheck"] = true,
				},
				["defaultRotation/shaman/ancestral_swiftness"] = {
					["v_gcdspell"] = "0",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "16188",
					["v_spellname"] = "16188",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["v_checkothercdname"] = "16188",
				},
				["defaultRotation/shaman/feral_spirit"] = {
					["v_gcdspell"] = "324",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "51533",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "51533",
					["v_checkothercdname"] = "51533",
				},
				["defaultRotation/shaman/flame_shock"] = {
					["v_t_needsdebuff"] = "_8050^3",
					["b_rangecheck"] = true,
					["b_p_havebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "324",
					["v_durationstartedtime"] = 0,
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "8050",
					["v_spellname"] = "8050",
					["b_t_needsdebuff"] = true,
					["v_checkothercdvalue"] = "<2",
					["v_p_havebuff"] = "73683",
					["v_checkothercdname"] = "8050",
				},
			},
			["SortedActions"] = {
				"defaultRotation/shaman/lightning_shield", -- [1]
				"defaultRotation/shaman/elemental_mastery", -- [2]
				"defaultRotation/shaman/fire_elemental_totem", -- [3]
				"defaultRotation/shaman/ascendance", -- [4]
				"defaultRotation/shaman/ancestral_swiftness", -- [5]
				"defaultRotation/shaman/stormlash_totem", -- [6]
				"defaultRotation/shaman/feral_spirit", -- [7]
				"defaultRotation/shaman/searing_totem", -- [8]
				"defaultRotation/shaman/searing_totem_refresh", -- [9]
				"defaultRotation/shaman/unleash_elements_unleashed_fury", -- [10]
				"defaultRotation/shaman/elemental_blast", -- [11]
				"defaultRotation/shaman/lightning_bolt_maelstrom_5", -- [12]
				"defaultRotation/shaman/flame_shock", -- [13]
				"defaultRotation/shaman/stormblast", -- [14]
				"defaultRotation/shaman/stormstrike", -- [15]
				"defaultRotation/shaman/lava_lash", -- [16]
				"defaultRotation/shaman/unleash_elements", -- [17]
				"defaultRotation/shaman/earth_shock", -- [18]
				"defaultRotation/shaman/lightning_bolt", -- [19]
			},
			["keybind"] = "<keybind>",
		},
	}

	-- Restore the true state of the saved data.
	--	return RotationBuilder:restoreTable({}, rotation);
	return rotation;
end

RotationBuilder:addDefaultRotationsGenerator("SHAMAN", shamanRotationsGenerator);