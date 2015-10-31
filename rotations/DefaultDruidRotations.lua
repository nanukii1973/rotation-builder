-- The default rotations generator for DRUIDS.
local druidRotationsGenerator = function ()
	local rotation = {
		["defaultRotation/druid/feral"] = {
			["specID"] = 2,
			["ActionList"] = {
				["defaultRotation/druid/moonfire"] = {
					["v_t_needsdebuff"] = "_8921^3",
					["v_p_knowspell"] = "155580",
					["b_gcombopoints"] = true,
					["v_gcdspell"] = "768",
					["v_actionicon"] = "8921",
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "8921",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcombopoints"] = "1",
				},
				["defaultRotation/druid/force_of_nature"] = {
					["v_p_knowspell"] = "102703",
					["v_gcdspell"] = "0",
					["b_charges"] = true,
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "102703",
					["v_charges"] = ">=2",
					["v_keybind"] = "<keybind>",
					["v_spellname"] = "102703",
					["v_durationstartedtime"] = 0,
				},
				["defaultRotation/druid/rip"] = {
					["v_t_needsdebuff"] = "_1079^5",
					["b_p_needbuff"] = true,
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "768",
					["v_togglename"] = "Toggle 1",
					["v_p_needbuff"] = "69369",
					["v_p_combopoints"] = "=5",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "1079",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "1079",
				},
				["defaultRotation/druid/shred"] = {
					["b_gcombopoints"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "5221",
					["v_actionicon"] = "5221",
					["v_keybind"] = "<keybind>",
					["v_gcombopoints"] = "1",
				},
				["defaultRotation/druid/incarnation_king_of_the_jungle"] = {
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "102543",
					["v_p_knowspell"] = "102543",
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "0",
					["v_actionicon"] = "102543",
				},
				["defaultRotation/druid/ferocious_bite"] = {
					["v_p_needbuff"] = "69369",
					["b_p_needbuff"] = true,
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "768",
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "22568",
					["v_spellname"] = "22568",
					["v_durationstartedtime"] = 0,
					["v_keybind"] = "<keybind>",
					["v_p_combopoints"] = "=5",
				},
				["defaultRotation/druid/ferocious_bite_rip_urgent"] = {
					["v_t_needsdebuff"] = "_1079^3",
					["v_spellname"] = "22568",
					["b_p_needbuff"] = true,
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "768",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_p_combopoints"] = ">=1",
					["v_actionicon"] = "22568",
					["b_t_hp"] = true,
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_p_needbuff"] = "69369",
					["v_t_hp"] = "<=25%",
				},
				["defaultRotation/druid/berserk"] = {
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "106951",
					["v_spellname"] = "106951",
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "0",
					["v_durationstartedtime"] = 0,
				},
				["defaultRotation/druid/savage_roar"] = {
					["v_p_needbuff"] = "52610^5",
					["b_p_needbuff"] = true,
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "768",
					["v_p_combopoints"] = ">=1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "52610",
					["v_keybind"] = "<keybind>",
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "52610",
				},
				["defaultRotation/druid/mark_of_the_wild"] = {
					["v_p_needbuff"] = "1126|115921|116781|20217|160206|159988|160017|90363|106077|55610|167187|167188|172967|159735|35290|160045|50518|173035",
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "1126",
					["v_spellname"] = "1126",
					["b_p_needbuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "768",
					["v_durationstartedtime"] = 0,
				},
				["defaultRotation/druid/cat_form"] = {
					["v_p_needbuff"] = "768",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "768",
					["b_p_needbuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "768",
					["v_actionicon"] = "768",
				},
				["defaultRotation/druid/healing_touch"] = {
					["v_p_knowspell"] = "155672",
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "768",
					["v_actionicon"] = "5185",
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["b_p_havebuff"] = true,
					["v_spellname"] = "5185",
					["v_p_combopoints"] = ">=4",
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "69369",
					["v_durationstartedtime"] = 0,
				},
				["defaultRotation/druid/tiger_s_fury"] = {
					["v_gcdspell"] = "0",
					["v_durationstartedtime"] = 0,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "5217",
					["v_spellname"] = "5217",
					["v_p_unitpowertype"] = "3",
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = "<30",
					["b_p_unitpower"] = true,
				},
				["defaultRotation/druid/ferocious_bite_rip"] = {
					["v_p_needbuff"] = "69369",
					["v_t_hp"] = "<=25%",
					["b_t_hasdebuff"] = true,
					["b_p_needbuff"] = true,
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "768",
					["b_t_hp"] = true,
					["v_p_combopoints"] = "=5",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "22568",
					["v_togglename"] = "Toggle 1",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "22568",
					["v_t_hasdebuff"] = "_1079",
				},
				["defaultRotation/druid/thrash"] = {
					["v_togglename"] = "Toggle 1",
					["v_gcdspell"] = "768",
					["b_p_knownotspell"] = true,
					["v_p_knownotspell"] = "158476&155672",
					["v_actionicon"] = "77758",
					["v_spellname"] = "77758",
					["v_durationstartedtime"] = 0,
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "135700",
					["b_p_havebuff"] = true,
				},
				["defaultRotation/druid/rake"] = {
					["v_t_needsdebuff"] = "_1822^3",
					["v_gcdspell"] = "768",
					["v_actionicon"] = "1822",
					["v_durationstartedtime"] = 0,
					["v_togglename"] = "Toggle 1",
					["b_gcombopoints"] = true,
					["v_spellname"] = "1822",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcombopoints"] = "1",
				},
			},
			["SortedActions"] = {
				"defaultRotation/druid/mark_of_the_wild", -- [1]
				"defaultRotation/druid/cat_form", -- [2]
				"defaultRotation/druid/healing_touch", -- [3]
				"defaultRotation/druid/incarnation_king_of_the_jungle", -- [4]
				"defaultRotation/druid/berserk", -- [5]
				"defaultRotation/druid/tiger_s_fury", -- [6]
				"defaultRotation/druid/savage_roar", -- [7]
				"defaultRotation/druid/thrash", -- [8]
				"defaultRotation/druid/ferocious_bite_rip_urgent", -- [9]
				"defaultRotation/druid/ferocious_bite_rip", -- [10]
				"defaultRotation/druid/rip", -- [11]
				"defaultRotation/druid/ferocious_bite", -- [12]
				"defaultRotation/druid/rake", -- [13]
				"defaultRotation/druid/moonfire", -- [14]
				"defaultRotation/druid/force_of_nature", -- [15]
				"defaultRotation/druid/shred", -- [16]
			},
			["keybind"] = "<keybind>",
		},
		["defaultRotation/druid/guardian"] = {
			["specID"] = 3,
			["ActionList"] = {
				["defaultRotation/druid/mangle"] = {
					["v_gunitpowertype"] = "1",
					["v_gcdspell"] = "768",
					["v_durationstartedtime"] = 0,
					["v_togglename"] = "Toggle 1",
					["b_gunitpower"] = true,
					["v_spellname"] = "33917",
					["v_actionicon"] = "33917",
					["v_keybind"] = "<keybind>",
					["v_gunitpower"] = "15",
				},
				["defaultRotation/druid/force_of_nature"] = {
					["v_p_knowspell"] = "102706",
					["v_gcdspell"] = "0",
					["b_charges"] = true,
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "102706",
					["v_charges"] = ">=2",
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "102706",
				},
				["defaultRotation/druid/bear_form"] = {
					["v_p_needbuff"] = "5487",
					["b_p_needbuff"] = true,
					["v_gcdspell"] = "768",
					["v_actionicon"] = "5487",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "5487",
					["b_gunitpower"] = true,
					["v_keybind"] = "<keybind>",
					["v_gunitpower"] = "10",
					["v_gunitpowertype"] = "1",
				},
				["defaultRotation/druid/maul_tooth_and_claw"] = {
					["v_gcdspell"] = "0",
					["b_p_havebuff"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "6807",
					["v_spellname"] = "6807",
					["v_durationstartedtime"] = 0,
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "135286",
				},
				["defaultRotation/druid/berserk"] = {
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "50334",
					["v_actionicon"] = "50334",
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "0",
				},
				["defaultRotation/druid/maul"] = {
					["v_gcdspell"] = "0",
					["b_p_unitpower"] = true,
					["v_actionicon"] = "6807",
					["v_togglename"] = "Toggle 1",
					["v_p_unitpowertype"] = "1",
					["v_spellname"] = "6807",
					["v_durationstartedtime"] = 0,
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = ">=90",
				},
				["defaultRotation/druid/mark_of_the_wild"] = {
					["v_p_needbuff"] = "1126|115921|116781|20217|160206|159988|160017|90363|106077|55610|167187|167188|172967|159735|35290|160045|50518|173035",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "1126",
					["b_p_needbuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "768",
					["v_actionicon"] = "1126",
				},
				["defaultRotation/druid/frenzied_regeneration"] = {
					["b_p_unitpower"] = true,
					["v_gcdspell"] = "768",
					["b_p_hp"] = true,
					["v_actionicon"] = "22842",
					["v_p_hp"] = "<=50%",
					["v_p_unitpowertype"] = "1",
					["v_spellname"] = "22842",
					["v_togglename"] = "Toggle 1",
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = ">=60",
					["v_durationstartedtime"] = 0,
				},
				["defaultRotation/druid/thrash"] = {
					["v_t_needsdebuff"] = "_77758^3",
					["v_gcdspell"] = "768",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "77758",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "77758",
				},
				["defaultRotation/druid/savage_defense"] = {
					["v_p_needbuff"] = "132402",
					["b_p_needbuff"] = true,
					["v_gcdspell"] = "768",
					["v_durationstartedtime"] = 0,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "62606",
					["v_spellname"] = "62606",
					["b_p_unitpower"] = true,
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = ">=60",
					["v_p_unitpowertype"] = "1",
				},
				["defaultRotation/druid/lacerate"] = {
					["v_t_needsdebuff"] = "_33745#3^3",
					["v_p_needbuff"] = "102558",
					["b_p_needbuff"] = true,
					["b_gunitpower"] = true,
					["v_gcdspell"] = "768",
					["v_actionicon"] = "33745",
					["v_gunitpowertype"] = "1",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "33745",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gunitpower"] = "2",
				},
				["defaultRotation/druid/healing_touch"] = {
					["v_gcdspell"] = "768",
					["v_togglename"] = "Toggle 1",
					["b_p_hp"] = true,
					["v_p_hp"] = "<=50%",
					["b_p_havebuff"] = true,
					["v_spellname"] = "5185",
					["v_actionicon"] = "5185",
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "145162",
					["v_durationstartedtime"] = 0,
				},
				["defaultRotation/druid/pulverize"] = {
					["b_t_hasdebuff"] = true,
					["v_p_knowspell"] = "80313",
					["v_gcdspell"] = "768",
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "80313",
					["v_actionicon"] = "80313",
					["v_keybind"] = "<keybind>",
					["v_t_hasdebuff"] = "_33745#3",
				},
			},
			["SortedActions"] = {
				"defaultRotation/druid/mark_of_the_wild", -- [1]
				"defaultRotation/druid/bear_form", -- [2]
				"defaultRotation/druid/healing_touch", -- [3]
				"defaultRotation/druid/frenzied_regeneration", -- [4]
				"defaultRotation/druid/savage_defense", -- [5]
				"defaultRotation/druid/berserk", -- [6]
				"defaultRotation/druid/mangle", -- [7]
				"defaultRotation/druid/lacerate", -- [8]
				"defaultRotation/druid/pulverize", -- [9]
				"defaultRotation/druid/thrash", -- [10]
				"defaultRotation/druid/force_of_nature", -- [11]
				"defaultRotation/druid/maul_tooth_and_claw", -- [12]
				"defaultRotation/druid/maul", -- [13]
			},
			["keybind"] = "<keybind>",
		},
		["defaultRotation/druid/balance"] = {
			["specID"] = 1,
			["ActionList"] = {
				["defaultRotation/druid/celestial_alignment"] = {
					["b_p_eclipse"] = true,
					["v_gcdspell"] = "0",
					["b_p_unitpower"] = true,
					["v_p_eclipse"] = "sun",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "112071",
					["v_actionicon"] = "112071",
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = "<-80",
					["v_p_unitpowertype"] = "8",
				},
				["defaultRotation/druid/starsurge_lunar"] = {
					["b_p_eclipse"] = true,
					["b_p_unitpower"] = true,
					["v_p_eclipse"] = "moon",
					["v_gcdspell"] = "768",
					["v_actionicon"] = "78674",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "78674",
					["v_p_unitpowertype"] = "8",
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = "<-85",
				},
				["defaultRotation/druid/moonfire_celestial_alignment"] = {
					["v_p_needbuff"] = "112071^3",
					["b_p_needbuff"] = true,
					["b_p_havebuff"] = true,
					["b_maxcasts"] = true,
					["v_gcdspell"] = "768",
					["v_maxcasts"] = "1",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "8921",
					["v_actionicon"] = "8921",
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "112071",
				},
				["defaultRotation/druid/moonkin_form"] = {
					["v_p_needbuff"] = "24858",
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "24858",
					["v_spellname"] = "24858",
					["b_p_needbuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "768",
					["v_durationstartedtime"] = 0,
				},
				["defaultRotation/druid/sunfire"] = {
					["v_gcdspell"] = "768",
					["b_p_havebuff"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "93402",
					["v_spellname"] = "8921",
					["v_durationstartedtime"] = 0,
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "171744",
				},
				["defaultRotation/druid/sunfire_refresh"] = {
					["v_t_needsdebuff"] = "_164815^3",
					["v_actionicon"] = "93402",
					["v_gcdspell"] = "768",
					["v_p_unitpowertype"] = "8",
					["b_p_unitpower"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "8921",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = ">15",
				},
				["defaultRotation/druid/wrath_solar_to_lunar"] = {
					["b_p_eclipse"] = true,
					["v_p_eclipse"] = "moon",
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "5176",
					["v_spellname"] = "5176",
					["v_gcdspell"] = "768",
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
				},
				["defaultRotation/druid/moonfire"] = {
					["v_gcdspell"] = "768",
					["b_p_havebuff"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "8921",
					["v_spellname"] = "8921",
					["v_durationstartedtime"] = 0,
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "171743",
				},
				["defaultRotation/druid/incarnation_chosen_of_elune"] = {
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "102560",
					["v_actionicon"] = "102560",
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "0",
				},
				["defaultRotation/druid/starsurge"] = {
					["v_gcdspell"] = "768",
					["b_charges"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "78674",
					["v_spellname"] = "78674",
					["v_charges"] = "3",
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
				},
				["defaultRotation/druid/stellar_flare_lunar"] = {
					["v_t_needsdebuff"] = "_152221^3",
					["v_actionicon"] = "152221",
					["b_p_eclipse"] = true,
					["b_p_unitpower"] = true,
					["v_p_knowspell"] = "152221",
					["v_gcdspell"] = "768",
					["v_p_eclipse"] = "moon",
					["v_p_unitpowertype"] = "8",
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "152221",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = "<10",
				},
				["defaultRotation/druid/starfire_lunar_to_solar"] = {
					["b_p_eclipse"] = true,
					["v_p_eclipse"] = "sun",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "2912",
					["v_gcdspell"] = "768",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "2912",
				},
				["defaultRotation/druid/mark_of_the_wild"] = {
					["v_p_needbuff"] = "1126|115921|116781|20217|160206|159988|160017|90363|106077|55610|167187|167188|172967|159735|35290|160045|50518|173035",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "1126",
					["b_p_needbuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "768",
					["v_actionicon"] = "1126",
				},
				["defaultRotation/druid/starsurge_solar"] = {
					["b_p_eclipse"] = true,
					["b_p_unitpower"] = true,
					["v_p_eclipse"] = "sun",
					["v_gcdspell"] = "768",
					["v_actionicon"] = "78674",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "78674",
					["v_p_unitpowertype"] = "8",
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = ">85",
				},
				["defaultRotation/druid/stellar_flare_solar"] = {
					["v_t_needsdebuff"] = "_152221^3",
					["v_actionicon"] = "152221",
					["b_p_eclipse"] = true,
					["b_p_unitpower"] = true,
					["v_p_knowspell"] = "152221",
					["v_gcdspell"] = "768",
					["v_p_eclipse"] = "sun",
					["v_p_unitpowertype"] = "8",
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "152221",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_p_unitpower"] = ">-10",
				},
				["defaultRotation/druid/wrath"] = {
					["b_p_eclipse"] = true,
					["v_p_eclipse"] = "none",
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "5176",
					["v_spellname"] = "5176",
					["v_durationstartedtime"] = 0,
					["v_keybind"] = "<keybind>",
					["v_gcdspell"] = "768",
				},
				["defaultRotation/druid/force_of_nature"] = {
					["v_p_knowspell"] = "33831",
					["v_gcdspell"] = "0",
					["b_charges"] = true,
					["b_p_knowspell"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "33831",
					["v_spellname"] = "33831",
					["v_keybind"] = "<keybind>",
					["v_charges"] = ">=2",
					["v_durationstartedtime"] = 0,
				},
			},
			["SortedActions"] = {
				"defaultRotation/druid/mark_of_the_wild", -- [1]
				"defaultRotation/druid/moonkin_form", -- [2]
				"defaultRotation/druid/incarnation_chosen_of_elune", -- [3]
				"defaultRotation/druid/celestial_alignment", -- [4]
				"defaultRotation/druid/moonfire_celestial_alignment", -- [5]
				"defaultRotation/druid/sunfire_refresh", -- [6]
				"defaultRotation/druid/moonfire", -- [7]
				"defaultRotation/druid/sunfire", -- [8]
				"defaultRotation/druid/starsurge", -- [9]
				"defaultRotation/druid/starsurge_lunar", -- [10]
				"defaultRotation/druid/starsurge_solar", -- [11]
				"defaultRotation/druid/stellar_flare_lunar", -- [12]
				"defaultRotation/druid/stellar_flare_solar", -- [13]
				"defaultRotation/druid/force_of_nature", -- [14]
				"defaultRotation/druid/wrath_solar_to_lunar", -- [15]
				"defaultRotation/druid/starfire_lunar_to_solar", -- [16]
				"defaultRotation/druid/wrath", -- [17]
			},
			["keybind"] = "<keybind>",
		},
	}

	-- Restore the true state of the saved data.
	--	return RotationBuilder:restoreTable({}, rotation);
	return rotation;
end

local druidRotationsGeneratorData = {
	["version"] = 1, 
	["generator"] = druidRotationsGenerator
};

RotationBuilder:addDefaultRotationsGenerator("DRUID", druidRotationsGeneratorData);