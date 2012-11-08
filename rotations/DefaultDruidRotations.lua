-- The default rotations generator for ROGUES.
local druidRotationsGenerator = function ()
	local rotation = {
		[L["defaultRotation/druid/balance"]] = {
			["ActionList"] = {
				[L["defaultRotation/druid/mark_of_the_wild"]] = {
					["v_p_needbuff"] = "1126",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "1126",
					["b_p_needbuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "768",
					["v_actionicon"] = "1126",
				},
				[L["defaultRotation/druid/innervate"]] = {
					["v_gcdspell"] = "765",
					["v_p_unitpowertype"] = "0",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "29166",
					["v_actionicon"] = "29166",
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = "<=75%",
					["b_p_unitpower"] = true,
				},
				[L["defaultRotation/druid/starfire_celestial_alignment"]] = {
					["v_gcdspell"] = "768",
					["v_durationstartedtime"] = 0,
					["v_togglename"] = "Toggle 1",
					["b_p_havebuff"] = true,
					["v_spellname"] = "2912",
					["v_actionicon"] = "2912",
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "_112071",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/druid/moonfire_eclipse"]] = {
					["v_p_needbuff"] = "_112071",
					["b_p_needbuff"] = true,
					["v_actionicon"] = "8921",
					["v_gcdspell"] = "768",
					["v_t_needsdebuff"] = "_8921^3",
					["v_durationstartedtime"] = 0,
					["v_togglename"] = "Toggle 1",
					["b_p_havebuff"] = true,
					["v_spellname"] = "8921",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "_48518",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/druid/sunfire_eclipse"]] = {
					["v_p_needbuff"] = "_112071",
					["b_p_needbuff"] = true,
					["v_actionicon"] = "93402",
					["v_gcdspell"] = "768",
					["v_t_needsdebuff"] = "_93402^3",
					["v_durationstartedtime"] = 0,
					["v_togglename"] = "Toggle 1",
					["b_p_havebuff"] = true,
					["v_spellname"] = "93402",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "_48517",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/druid/wrath_solar_to_lunar"]] = {
					["b_p_eclipse"] = true,
					["v_gcdspell"] = "768",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "5176",
					["v_p_eclipse"] = "moon",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "5176",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/druid/faerie_fire"]] = {
					["v_t_needsdebuff"] = "113746#3^5",
					["v_gcdspell"] = "768",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "770",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "770",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/druid/force_of_nature"]] = {
					["v_gcdspell"] = "0",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "106737",
					["v_spellname"] = "106737",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["v_checkothercdname"] = "106737",
				},
				[L["defaultRotation/druid/sunfire"]] = {
					["v_t_needsdebuff"] = "_93402^3",
					["b_p_eclipse"] = true,
					["v_gcdspell"] = "768",
					["v_p_eclipse"] = "moon",
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "93402",
					["v_spellname"] = "93402",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/druid/moonfire_astral_communion"]] = {
					["v_t_needsdebuff"] = "_8921^3",
					["v_gcdspell"] = "768",
					["b_p_havebuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "8921",
					["v_spellname"] = "8921",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "_112071",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/druid/celestial_alignment"]] = {
					["v_gcdspell"] = "0",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "112071",
					["v_spellname"] = "112071",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["v_checkothercdname"] = "112071",
				},
				[L["defaultRotation/druid/starfall"]] = {
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "48505",
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "768",
					["v_actionicon"] = "48505",
				},
				[L["defaultRotation/druid/wrath"]] = {
					["b_p_eclipse"] = true,
					["v_gcdspell"] = "768",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "5176",
					["v_p_eclipse"] = "none",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "5176",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/druid/moonkin_form"]] = {
					["v_p_needbuff"] = "24858",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "24858",
					["b_p_needbuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "768",
					["v_actionicon"] = "24858",
				},
				[L["defaultRotation/druid/incarnation"]] = {
					["v_durationstartedtime"] = 0,
					["v_gcdspell"] = "0",
					["v_keybind"] = "<keybind>",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "106731",
					["v_spellname"] = "106731",
					["b_p_havebuff"] = true,
					["v_checkothercdvalue"] = "<2",
					["v_p_havebuff"] = "48518|48517",
					["v_checkothercdname"] = "106731",
				},
				[L["defaultRotation/druid/astral_communion"]] = {
					["v_p_eclipse"] = "none",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "127663",
					["b_p_eclipse"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "768",
					["v_actionicon"] = "127663",
				},
				[L["defaultRotation/druid/starsurge"]] = {
					["b_rangecheck"] = true,
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "78674",
					["v_spellname"] = "78674",
					["v_durationstartedtime"] = 0,
					["v_keybind"] = "<keybind>",
					["v_checkothercdvalue"] = "<1",
					["v_checkothercdname"] = "78674",
				},
				[L["defaultRotation/druid/nature_s_vigil"]] = {
					["v_gcdspell"] = "0",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "124974",
					["v_spellname"] = "124974",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["v_checkothercdname"] = "124974",
				},
				[L["defaultRotation/druid/starsurge_shooting_stars"]] = {
					["v_durationstartedtime"] = 0,
					["v_gcdspell"] = "768",
					["v_checkothercdvalue"] = "<1",
					["b_rangecheck"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "78674",
					["v_spellname"] = "78674",
					["b_p_havebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "93400",
					["v_checkothercdname"] = "78674",
				},
				[L["defaultRotation/druid/starfire_lunar_to_solar"]] = {
					["b_p_eclipse"] = true,
					["v_gcdspell"] = "768",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "2912",
					["v_p_eclipse"] = "sun",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "2912",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/druid/moonfire"]] = {
					["v_t_needsdebuff"] = "_8921^3",
					["b_p_eclipse"] = true,
					["v_gcdspell"] = "768",
					["v_p_eclipse"] = "sun",
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "8921",
					["v_spellname"] = "8921",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["b_rangecheck"] = true,
				},
			},
			["SortedActions"] = {
				L["defaultRotation/druid/mark_of_the_wild"], -- [1]
				L["defaultRotation/druid/moonkin_form"], -- [2]
				L["defaultRotation/druid/astral_communion"], -- [3]
				L["defaultRotation/druid/celestial_alignment"], -- [4]
				L["defaultRotation/druid/force_of_nature"], -- [5]
				L["defaultRotation/druid/nature_s_vigil"], -- [6]
				L["defaultRotation/druid/starfall"], -- [7]
				L["defaultRotation/druid/starsurge_shooting_stars"], -- [8]
				L["defaultRotation/druid/incarnation"], -- [9]
				L["defaultRotation/druid/moonfire_astral_communion"], -- [10]
				L["defaultRotation/druid/moonfire_eclipse"], -- [11]
				L["defaultRotation/druid/sunfire_eclipse"], -- [12]
				L["defaultRotation/druid/moonfire"], -- [13]
				L["defaultRotation/druid/sunfire"], -- [14]
				L["defaultRotation/druid/faerie_fire"], -- [15]
				L["defaultRotation/druid/innervate"], -- [16]
				L["defaultRotation/druid/starsurge"], -- [17]
				L["defaultRotation/druid/starfire_celestial_alignment"], -- [18]
				L["defaultRotation/druid/wrath_solar_to_lunar"], -- [19]
				L["defaultRotation/druid/starfire_lunar_to_solar"], -- [20]
				L["defaultRotation/druid/wrath"], -- [21]
			},
			["keybind"] = "<keybind>",
		},
		[L["defaultRotation/druid/feral"]] = {
			["ActionList"] = {
				[L["defaultRotation/druid/mark_of_the_wild"]] = {
					["v_p_needbuff"] = "1126",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "1126",
					["b_p_needbuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "768",
					["v_actionicon"] = "1126",
				},
				[L["defaultRotation/druid/shred"]] = {
					["b_gcombopoints"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "5221",
					["v_actionicon"] = "5221",
					["v_keybind"] = "<keybind>",
					["v_gcombopoints"] = "1",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/druid/renewal"]] = {
					["v_p_hp"] = "<50%",
					["v_gcdspell"] = "0",
					["b_p_hp"] = true,
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "108238",
					["v_actionicon"] = "108238",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_checkothercdname"] = "108238",
				},
				[L["defaultRotation/druid/cenarion_ward"]] = {
					["v_gcdspell"] = "0",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "102351",
					["v_spellname"] = "102351",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["v_checkothercdname"] = "102351",
				},
				[L["defaultRotation/druid/cat_form"]] = {
					["v_p_needbuff"] = "768",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "768",
					["b_p_needbuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "768",
					["v_actionicon"] = "768",
				},
				[L["defaultRotation/druid/nature_s_swiftness"]] = {
					["v_p_needbuff"] = "132158",
					["b_p_needbuff"] = true,
					["v_gcdspell"] = "0",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "132158",
					["v_keybind"] = "<keybind>",
					["v_checkothercdvalue"] = "<2",
					["v_actionicon"] = "132158",
					["v_checkothercdname"] = "108238",
				},
				[L["defaultRotation/druid/healing_touch"]] = {
					["v_gcdspell"] = "768",
					["v_durationstartedtime"] = 0,
					["v_p_hp"] = "<50%",
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "5185",
					["v_spellname"] = "5185",
					["b_p_havebuff"] = true,
					["b_p_hp"] = true,
					["v_p_havebuff"] = "132158",
					["v_keybind"] = "<keybind>",
				},
				[L["defaultRotation/druid/rip"]] = {
					["v_t_needsdebuff"] = "_1079^5",
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "768",
					["v_togglename"] = "Toggle 1",
					["v_p_combopoints"] = "=5",
					["v_actionicon"] = "1079",
					["v_spellname"] = "1079",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/druid/tiger_s_fury"]] = {
					["v_gcdspell"] = "0",
					["v_p_unitpowertype"] = "3",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "5217",
					["v_actionicon"] = "5217",
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = "<30",
					["b_p_unitpower"] = true,
				},
				[L["defaultRotation/druid/faerie_fire"]] = {
					["v_t_needsdebuff"] = "113746#3^5",
					["v_gcdspell"] = "768",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "770",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "770",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/druid/incarnation"]] = {
					["v_p_needbuff"] = "50334",
					["b_p_needbuff"] = true,
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "106731",
					["v_keybind"] = "<keybind>",
					["v_checkothercdvalue"] = "<2",
					["v_actionicon"] = "106731",
					["v_checkothercdname"] = "106731",
				},
				[L["defaultRotation/druid/berserk"]] = {
					["v_gcdspell"] = "0",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "106951",
					["v_spellname"] = "106951",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["v_checkothercdname"] = "106951",
				},
				[L["defaultRotation/druid/mangle"]] = {
					["v_gcdspell"] = "768",
					["b_gcombopoints"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "33917",
					["v_spellname"] = "33917",
					["v_durationstartedtime"] = 0,
					["v_keybind"] = "<keybind>",
					["v_gcombopoints"] = "1",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/druid/ferocious_bite_rip"]] = {
					["b_t_hasdebuff"] = true,
					["v_t_hp"] = "<=25%",
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "768",
					["v_togglename"] = "Toggle 1",
					["b_rangecheck"] = true,
					["v_p_combopoints"] = "=5",
					["v_durationstartedtime"] = 0,
					["b_t_hp"] = true,
					["v_spellname"] = "22568",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "22568",
					["v_t_hasdebuff"] = "_1079",
				},
				[L["defaultRotation/druid/rake"]] = {
					["v_t_needsdebuff"] = "_1822^3",
					["v_gcdspell"] = "768",
					["v_actionicon"] = "1822",
					["b_gcombopoints"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "1822",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcombopoints"] = "1",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/druid/nature_s_vigil"]] = {
					["v_gcdspell"] = "0",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "124974",
					["v_spellname"] = "124974",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["v_checkothercdname"] = "124974",
				},
				[L["defaultRotation/druid/ferocious_bite"]] = {
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "768",
					["v_p_combopoints"] = "=5",
					["v_actionicon"] = "22568",
					["v_spellname"] = "22568",
					["v_togglename"] = "Toggle 1",
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/druid/force_of_nature"]] = {
					["v_gcdspell"] = "0",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "102706",
					["v_spellname"] = "102706",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["v_checkothercdname"] = "102706",
				},
				[L["defaultRotation/druid/savage_roar"]] = {
					["v_p_needbuff"] = "52610^5",
					["b_p_needbuff"] = true,
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "768",
					["v_p_combopoints"] = ">=1",
					["v_actionicon"] = "52610",
					["v_spellname"] = "52610",
					["v_keybind"] = "<keybind>",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
				},
			},
			["SortedActions"] = {
				L["defaultRotation/druid/mark_of_the_wild"], -- [1]
				L["defaultRotation/druid/cat_form"], -- [2]
				L["defaultRotation/druid/cenarion_ward"], -- [3]
				L["defaultRotation/druid/renewal"], -- [4]
				L["defaultRotation/druid/healing_touch"], -- [5]
				L["defaultRotation/druid/nature_s_swiftness"], -- [6]
				L["defaultRotation/druid/nature_s_vigil"], -- [7]
				L["defaultRotation/druid/force_of_nature"], -- [8]
				L["defaultRotation/druid/incarnation"], -- [9]
				L["defaultRotation/druid/berserk"], -- [10]
				L["defaultRotation/druid/tiger_s_fury"], -- [11]
				L["defaultRotation/druid/savage_roar"], -- [12]
				L["defaultRotation/druid/ferocious_bite_rip"], -- [13]
				L["defaultRotation/druid/rip"], -- [14]
				L["defaultRotation/druid/ferocious_bite"], -- [15]
				L["defaultRotation/druid/faerie_fire"], -- [16]
				L["defaultRotation/druid/rake"], -- [17]
				L["defaultRotation/druid/shred"], -- [18]
				L["defaultRotation/druid/mangle"], -- [19]
			},
			["keybind"] = "<keybind>",
		},
		[L["defaultRotation/druid/guardian"]] = {
			["ActionList"] = {
				[L["defaultRotation/druid/mark_of_the_wild"]] = {
					["v_p_needbuff"] = "1126",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "1126",
					["b_p_needbuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "768",
					["v_actionicon"] = "1126",
				},
				[L["defaultRotation/druid/nature_s_vigil"]] = {
					["v_gcdspell"] = "0",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "124974",
					["v_spellname"] = "124974",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["v_checkothercdname"] = "124974",
				},
				[L["defaultRotation/druid/cenarion_ward"]] = {
					["v_gcdspell"] = "0",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "102351",
					["v_spellname"] = "102351",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["v_checkothercdname"] = "102351",
				},
				[L["defaultRotation/druid/bear_form"]] = {
					["v_p_needbuff"] = "5487",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "5487",
					["b_p_needbuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "768",
					["v_actionicon"] = "5487",
				},
				[L["defaultRotation/druid/bear_hug"]] = {
					["v_gcdspell"] = "0",
					["v_checkothercdvalue"] = "<2",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "102795",
					["v_spellname"] = "102795",
					["b_rangecheck"] = true,
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["v_checkothercdname"] = "102795",
				},
				[L["defaultRotation/druid/nature_s_swiftness"]] = {
					["v_p_needbuff"] = "132158",
					["b_p_needbuff"] = true,
					["v_gcdspell"] = "0",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "132158",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "132158",
					["v_checkothercdname"] = "108238",
				},
				[L["defaultRotation/druid/maul"]] = {
					["v_gcdspell"] = "768",
					["b_p_unitpower"] = true,
					["v_durationstartedtime"] = 0,
					["v_togglename"] = "Toggle 1",
					["v_p_unitpowertype"] = "1",
					["v_spellname"] = "6807",
					["v_actionicon"] = "6807",
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = ">=90%",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/druid/faerie_fire"]] = {
					["v_t_needsdebuff"] = "113746#3^5",
					["v_gcdspell"] = "768",
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "770",
					["v_spellname"] = "770",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/druid/incarnation"]] = {
					["v_p_needbuff"] = "50334",
					["b_p_needbuff"] = true,
					["v_checkothercdvalue"] = "<2",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "106731",
					["v_spellname"] = "106731",
					["b_rangecheck"] = true,
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["v_checkothercdname"] = "106731",
				},
				[L["defaultRotation/druid/enrage"]] = {
					["b_gunitpower"] = true,
					["v_gunitpowertype"] = "1",
					["v_toggleicon"] = "5229",
					["v_gcdspell"] = "768",
					["v_p_unitpower"] = "<=20%",
					["v_actionicon"] = "5229",
					["v_togglename"] = "Toggle 1",
					["v_p_unitpowertype"] = "1",
					["v_spellname"] = "5229",
					["b_p_unitpower"] = true,
					["v_keybind"] = "<keybind>",
					["v_gunitpower"] = "20",
					["v_durationstartedtime"] = 0,
				},
				[L["defaultRotation/druid/berserk"]] = {
					["v_p_needbuff"] = "106731",
					["b_p_needbuff"] = true,
					["v_gcdspell"] = "0",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "50334",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "50334",
					["v_checkothercdname"] = "50334",
				},
				[L["defaultRotation/druid/mangle"]] = {
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "33878",
					["v_actionicon"] = "33878",
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "768",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/druid/frenzied_regeneration"]] = {
					["v_togglename"] = "Toggle 1",
					["v_gcdspell"] = "768",
					["v_durationstartedtime"] = 0,
					["b_p_unitpower"] = true,
					["v_p_hp"] = "<60%",
					["v_p_unitpowertype"] = "1",
					["v_spellname"] = "22842",
					["v_actionicon"] = "22842",
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = ">60%",
					["b_p_hp"] = true,
				},
				[L["defaultRotation/druid/healing_touch"]] = {
					["v_gcdspell"] = "768",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_p_hp"] = "<50%",
					["b_p_havebuff"] = true,
					["v_spellname"] = "5185",
					["v_actionicon"] = "5185",
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "132158",
					["b_p_hp"] = true,
				},
				[L["defaultRotation/druid/savage_defense"]] = {
					["v_checkothercdvalue"] = "<3",
					["b_p_unitpower"] = true,
					["v_gcdspell"] = "768",
					["v_durationstartedtime"] = 0,
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_p_unitpowertype"] = "1",
					["v_spellname"] = "62606",
					["v_actionicon"] = "62606",
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = ">=60%",
					["v_checkothercdname"] = "62606",
				},
				[L["defaultRotation/druid/renewal"]] = {
					["v_checkothercdvalue"] = "<2",
					["v_gcdspell"] = "0",
					["v_togglename"] = "Toggle 1",
					["b_checkothercd"] = true,
					["v_p_hp"] = "<50%",
					["v_actionicon"] = "108238",
					["v_spellname"] = "108238",
					["v_keybind"] = "<keybind>",
					["b_p_hp"] = true,
					["v_durationstartedtime"] = 0,
					["v_checkothercdname"] = "108238",
				},
				[L["defaultRotation/druid/force_of_nature"]] = {
					["v_gcdspell"] = "0",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "102706",
					["v_spellname"] = "102706",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["v_checkothercdname"] = "102706",
				},
				[L["defaultRotation/druid/thrash"]] = {
					["v_t_needsdebuff"] = "115798^5",
					["v_gcdspell"] = "768",
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "77758",
					["v_spellname"] = "77758",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["b_t_dr"] = true,
					["v_durationstartedtime"] = 0,
				},
				[L["defaultRotation/druid/lacerate"]] = {
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "33745",
					["v_actionicon"] = "33745",
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "768",
					["b_rangecheck"] = true,
				},
			},
			["SortedActions"] = {
				L["defaultRotation/druid/mark_of_the_wild"], -- [1]
				L["defaultRotation/druid/bear_form"], -- [2]
				L["defaultRotation/druid/cenarion_ward"], -- [3]
				L["defaultRotation/druid/renewal"], -- [4]
				L["defaultRotation/druid/healing_touch"], -- [5]
				L["defaultRotation/druid/nature_s_swiftness"], -- [6]
				L["defaultRotation/druid/nature_s_vigil"], -- [7]
				L["defaultRotation/druid/frenzied_regeneration"], -- [8]
				L["defaultRotation/druid/savage_defense"], -- [9]
				L["defaultRotation/druid/thrash"], -- [10]
				L["defaultRotation/druid/mangle"], -- [11]
				L["defaultRotation/druid/force_of_nature"], -- [12]
				L["defaultRotation/druid/faerie_fire"], -- [13]
				L["defaultRotation/druid/incarnation"], -- [14]
				L["defaultRotation/druid/berserk"], -- [15]
				L["defaultRotation/druid/bear_hug"], -- [16]
				L["defaultRotation/druid/enrage"], -- [17]
				L["defaultRotation/druid/lacerate"], -- [18]
				L["defaultRotation/druid/maul"], -- [19]
			},
			["keybind"] = "<keybind>",
		},
	}

	-- Restore the true state of the saved data.
	--	return RotationBuilder:restoreTable({}, rotation);
	return rotation;
end

RotationBuilder:addDefaultRotationsGenerator("DRUID", druidRotationsGenerator);