-- The default rotations generator for PALADINS.
local paladinRotationsGenerator = function ()
	local rotation = {
		["defaultRotation/paladin/protection"] = {
			["version"] = 1,
			["specID"] = 2,
			["ActionList"] = {
				["defaultRotation/paladin/word_of_glory"] = {
					["v_actionicon"] = "85673",
					["v_keybind"] = "<keybind>",
					["v_togglename"] = "Toggle 1",
					["b_p_knownotspell"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_knownotspell"] = "114163",
					["v_p_hp"] = "<=50%",
					["b_p_unitpower"] = true,
					["v_spellname"] = "85673",
					["v_p_unitpowertype"] = "9",
					["b_p_hp"] = true,
					["v_p_unitpower"] = ">=1",
				},
				["defaultRotation/paladin/avenger_shield"] = {
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "31935",
					["v_actionicon"] = "31935",
					["v_keybind"] = "<keybind>",
				},
				["defaultRotation/paladin/word_of_glory_divine_purpose"] = {
					["v_p_knowspell"] = "86172",
					["b_p_havebuff"] = true,
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "85673",
					["v_actionicon"] = "85673",
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "_90174",
				},
				["defaultRotation/paladin/holy_wrath"] = {
					["v_gunitpowertype"] = "9",
					["v_actionicon"] = "119072",
					["v_togglename"] = "Toggle 1",
					["b_p_knownotspell"] = true,
					["v_p_knownotspell"] = "171648",
					["b_gunitpower"] = true,
					["v_spellname"] = "119072",
					["v_keybind"] = "<keybind>",
					["v_gunitpower"] = "1",
					["v_durationstartedtime"] = 0,
				},
				["defaultRotation/paladin/judgment"] = {
					["v_gunitpowertype"] = "9",
					["v_actionicon"] = "20271",
					["v_togglename"] = "Toggle 1",
					["b_gunitpower"] = true,
					["v_spellname"] = "20271",
					["v_durationstartedtime"] = 0,
					["v_keybind"] = "<keybind>",
					["v_gunitpower"] = "1",
				},
				["defaultRotation/paladin/eternal_flame_divine_purpose"] = {
					["v_p_knowspell"] = "86172&114163",
					["v_actionicon"] = "114163",
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "85673",
					["b_p_havebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "_90174&114637#3",
				},
				["defaultRotation/paladin/sacred_shield"] = {
					["v_p_needbuff"] = "_20925^3",
					["b_p_needbuff"] = true,
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "20925",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "20925",
					["v_p_knowspell"] = "20925",
				},
				["defaultRotation/paladin/shield_of_the_righteous_divine_purpose"] = {
					["v_p_knowspell"] = "86172",
					["v_actionicon"] = "53600",
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "53600",
					["b_p_havebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "_90174",
				},
				["defaultRotation/paladin/righteous_fury"] = {
					["v_p_needbuff"] = "25780",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "25780",
					["b_p_needbuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "25780",
				},
				["defaultRotation/paladin/execution_sentence"] = {
					["v_p_knowspell"] = "114157",
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "114157",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "114157",
				},
				["defaultRotation/paladin/seal_of_insight"] = {
					["v_p_notstance"] = "2",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "20165",
					["b_p_notstance"] = true,
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "20165",
				},
				["defaultRotation/paladin/shield_of_the_righteous"] = {
					["v_p_needbuff"] = "114637^5",
					["b_p_needbuff"] = true,
					["v_actionicon"] = "53600",
					["v_p_unitpowertype"] = "9",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "53600",
					["b_p_unitpower"] = true,
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = ">=3",
				},
				["defaultRotation/paladin/lay_on_hands"] = {
					["v_p_hp"] = "<10%",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "633",
					["v_actionicon"] = "633",
					["b_p_hp"] = true,
					["v_keybind"] = "<keybind>",
				},
				["defaultRotation/paladin/eternal_flame"] = {
					["v_p_needbuff"] = "156322^3",
					["v_actionicon"] = "114163",
					["v_p_knowspell"] = "114163",
					["b_p_unitpower"] = true,
					["b_p_needbuff"] = true,
					["v_p_unitpowertype"] = "9",
					["v_p_havebuff"] = "114637#3",
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "114163",
					["b_p_havebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = ">=3",
				},
				["defaultRotation/paladin/consecration"] = {
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "26573",
					["v_actionicon"] = "26573",
					["v_keybind"] = "<keybind>",
				},
				["defaultRotation/paladin/crusader_strike"] = {
					["v_gunitpowertype"] = "9",
					["v_actionicon"] = "35395",
					["v_togglename"] = "Toggle 1",
					["b_gunitpower"] = true,
					["v_spellname"] = "35395",
					["v_durationstartedtime"] = 0,
					["v_keybind"] = "<keybind>",
					["v_gunitpower"] = "1",
				},
				["defaultRotation/paladin/blessing_of_might"] = {
					["v_p_needbuff"] = "_20217||155522||24907||19740||116956||160198||93435||160039||160073||128997",
					["b_p_needbuff"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "19740",
					["v_actionicon"] = "19740",
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "1126||115921||116781||20217||160206||159988||160017||90363||160077",
					["b_p_havebuff"] = true,
				},
				["defaultRotation/paladin/holy_wrath_sanctified_wrath"] = {
					["v_gunitpowertype"] = "9",
					["v_actionicon"] = "119072",
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "119072",
					["b_gunitpower"] = true,
					["v_keybind"] = "<keybind>",
					["v_gunitpower"] = "1",
					["v_p_knowspell"] = "171648",
				},
				["defaultRotation/paladin/hammer_of_wrath"] = {
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "24275",
					["v_actionicon"] = "24275",
					["v_keybind"] = "<keybind>",
				},
				["defaultRotation/paladin/light_hammer"] = {
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "114158",
					["v_p_knowspell"] = "114158",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "114158",
				},
				["defaultRotation/paladin/blessing_of_kings"] = {
					["v_p_needbuff"] = "1126||115921||116781||20217||160206||159988||160017||90363||160077",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "20217",
					["b_p_needbuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "20217",
				},
				["defaultRotation/paladin/holy_prism"] = {
					["v_p_knowspell"] = "114165",
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "114165",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "114165",
				},
				["defaultRotation/paladin/seraphim"] = {
					["v_actionicon"] = "152262",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "152262",
					["v_p_unitpowertype"] = "9",
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = ">=5",
					["b_p_unitpower"] = true,
				},
				["defaultRotation/paladin/flash_of_light"] = {
					["v_p_knowspell"] = "85804",
					["v_actionicon"] = "19750",
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "19750",
					["b_p_havebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "114250#3",
				},
			},
			["SortedActions"] = {
				"defaultRotation/paladin/righteous_fury", -- [1]
				"defaultRotation/paladin/seal_of_insight", -- [2]
				"defaultRotation/paladin/blessing_of_kings", -- [3]
				"defaultRotation/paladin/blessing_of_might", -- [4]
				"defaultRotation/paladin/lay_on_hands", -- [5]
				"defaultRotation/paladin/seraphim", -- [6]
				"defaultRotation/paladin/eternal_flame_divine_purpose", -- [7]
				"defaultRotation/paladin/word_of_glory_divine_purpose", -- [8]
				"defaultRotation/paladin/eternal_flame", -- [9]
				"defaultRotation/paladin/sacred_shield", -- [10]
				"defaultRotation/paladin/flash_of_light", -- [11]
				"defaultRotation/paladin/word_of_glory", -- [12]
				"defaultRotation/paladin/shield_of_the_righteous_divine_purpose", -- [13]
				"defaultRotation/paladin/shield_of_the_righteous", -- [14]
				"defaultRotation/paladin/crusader_strike", -- [15]
				"defaultRotation/paladin/judgment", -- [16]
				"defaultRotation/paladin/holy_wrath_sanctified_wrath", -- [17]
				"defaultRotation/paladin/avenger_shield", -- [18]
				"defaultRotation/paladin/execution_sentence", -- [19]
				"defaultRotation/paladin/light_hammer", -- [20]
				"defaultRotation/paladin/holy_prism", -- [21]
				"defaultRotation/paladin/hammer_of_wrath", -- [22]
				"defaultRotation/paladin/consecration", -- [23]
				"defaultRotation/paladin/holy_wrath", -- [24]
			},
			["keybind"] = "<keybind>",
		},
		["defaultRotation/paladin/retribution"] = {
			["version"] = 1,
			["specID"] = 3,
			["ActionList"] = {
				["defaultRotation/paladin/divine_storm_divine_purpose"] = {
					["v_p_knowspell"] = "157048&86172",
					["v_actionicon"] = "53385",
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["b_p_havebuff"] = true,
					["v_spellname"] = "53385",
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "174718&_90174",
					["v_durationstartedtime"] = 0,
				},
				["defaultRotation/paladin/final_verdict"] = {
					["v_p_knowspell"] = "157048",
					["v_p_unitpowertype"] = "9",
					["b_p_unitpower"] = true,
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "85256",
					["v_actionicon"] = "157048",
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = ">=3",
				},
				["defaultRotation/paladin/judgment"] = {
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "20271",
					["v_actionicon"] = "20271",
					["v_keybind"] = "<keybind>",
				},
				["defaultRotation/paladin/final_verdict_sacred_power_5"] = {
					["v_p_knowspell"] = "157048",
					["b_p_unitpower"] = true,
					["v_durationstartedtime"] = 0,
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_p_unitpowertype"] = "9",
					["v_spellname"] = "85256",
					["v_actionicon"] = "157048",
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = "=5",
				},
				["defaultRotation/paladin/divine_storm"] = {
					["v_actionicon"] = "53385",
					["v_p_havebuff"] = "174718",
					["v_p_knowspell"] = "157048",
					["v_durationstartedtime"] = 0,
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_p_unitpowertype"] = "9",
					["v_spellname"] = "53385",
					["b_p_havebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = "=5",
					["b_p_unitpower"] = true,
				},
				["defaultRotation/paladin/exorcism"] = {
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "879",
					["v_actionicon"] = "879",
					["v_keybind"] = "<keybind>",
				},
				["defaultRotation/paladin/templar_verdict_sacred_power_5"] = {
					["v_p_knowspell"] = "157048",
					["v_togglename"] = "Toggle 1",
					["b_p_knowspell"] = true,
					["v_p_knownotspell"] = "157048",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "85256",
					["b_p_knownotspell"] = true,
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "85256",
				},
				["defaultRotation/paladin/execution_sentence"] = {
					["v_p_knowspell"] = "114157",
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "114157",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "114157",
				},
				["defaultRotation/paladin/holy_avenger"] = {
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "105809",
					["v_p_knowspell"] = "105809",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "105809",
				},
				["defaultRotation/paladin/templar_verdict"] = {
					["v_togglename"] = "Toggle 1",
					["b_p_knownotspell"] = true,
					["b_p_unitpower"] = true,
					["v_p_unitpowertype"] = "9",
					["v_p_knownotspell"] = "157048",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "85256",
					["v_actionicon"] = "85256",
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = ">=3",
				},
				["defaultRotation/paladin/seal_of_truth"] = {
					["v_p_notstance"] = "1|3",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "31801",
					["b_p_notstance"] = true,
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "31801",
				},
				["defaultRotation/paladin/crusader_strike"] = {
					["v_gunitpowertype"] = "9",
					["b_gunitpower"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "35395",
					["v_actionicon"] = "35395",
					["v_keybind"] = "<keybind>",
					["v_gunitpower"] = "1",
				},
				["defaultRotation/paladin/blessing_of_might"] = {
					["v_p_needbuff"] = "_20217||155522||24907||19740||116956||160198||93435||160039||160073||128997",
					["b_p_needbuff"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "19740",
					["v_spellname"] = "19740",
					["b_p_havebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "1126||115921||116781||20217||160206||159988||160017||90363||160077",
					["v_durationstartedtime"] = 0,
				},
				["defaultRotation/paladin/final_verdict_divine_purpose"] = {
					["v_p_knowspell"] = "157048&86172",
					["v_actionicon"] = "157048",
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["b_p_havebuff"] = true,
					["v_spellname"] = "85256",
					["v_durationstartedtime"] = 0,
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "_90174",
				},
				["defaultRotation/paladin/hammer_of_wrath"] = {
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "24275",
					["v_actionicon"] = "24275",
					["v_keybind"] = "<keybind>",
				},
				["defaultRotation/paladin/light_hammer"] = {
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "114158",
					["v_p_knowspell"] = "114158",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "114158",
				},
				["defaultRotation/paladin/blessing_of_kings"] = {
					["v_p_needbuff"] = "1126||115921||116781||20217||160206||159988||160017||90363||160077",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "20217",
					["b_p_needbuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "20217",
				},
				["defaultRotation/paladin/holy_prism"] = {
					["v_p_knowspell"] = "114165",
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "114165",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "114165",
				},
				["defaultRotation/paladin/templar_verdict_divine_purpose"] = {
					["v_actionicon"] = "85256",
					["v_p_knowspell"] = "86172",
					["v_durationstartedtime"] = 0,
					["b_p_knownotspell"] = true,
					["b_p_knowspell"] = true,
					["v_p_knownotspell"] = "157048",
					["b_p_havebuff"] = true,
					["v_spellname"] = "85256",
					["v_togglename"] = "Toggle 1",
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "_90174",
				},
				["defaultRotation/paladin/avenging_wrath"] = {
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "31884",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "31884",
				},
			},
			["SortedActions"] = {
				"defaultRotation/paladin/seal_of_truth", -- [1]
				"defaultRotation/paladin/blessing_of_kings", -- [2]
				"defaultRotation/paladin/blessing_of_might", -- [3]
				"defaultRotation/paladin/avenging_wrath", -- [4]
				"defaultRotation/paladin/holy_avenger", -- [5]
				"defaultRotation/paladin/divine_storm_divine_purpose", -- [6]
				"defaultRotation/paladin/final_verdict_divine_purpose", -- [7]
				"defaultRotation/paladin/templar_verdict_divine_purpose", -- [8]
				"defaultRotation/paladin/divine_storm", -- [9]
				"defaultRotation/paladin/final_verdict_sacred_power_5", -- [10]
				"defaultRotation/paladin/templar_verdict_sacred_power_5", -- [11]
				"defaultRotation/paladin/execution_sentence", -- [12]
				"defaultRotation/paladin/light_hammer", -- [13]
				"defaultRotation/paladin/holy_prism", -- [14]
				"defaultRotation/paladin/hammer_of_wrath", -- [15]
				"defaultRotation/paladin/crusader_strike", -- [16]
				"defaultRotation/paladin/judgment", -- [17]
				"defaultRotation/paladin/exorcism", -- [18]
				"defaultRotation/paladin/final_verdict", -- [19]
				"defaultRotation/paladin/templar_verdict", -- [20]
			},
			["keybind"] = "<keybind>",
		},
	}

	return rotation;
end

local paladinRotationsGeneratorData = {
	["generator"] = paladinRotationsGenerator
};

RotationBuilder:addDefaultRotationsGenerator("PALADIN", paladinRotationsGeneratorData);