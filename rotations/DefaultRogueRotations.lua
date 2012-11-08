-- The default rotations generator for ROGUES.
local rogueRotationsGenerator = function ()
	local rotation = {
		[L["defaultRotation/rogue/assassination"]] = {
			["ActionList"] = {
				[L["defaultRotation/rogue/dispatch"]] = {
					["v_gcdspell"] = "5938",
					["v_actionicon"] = "111240",
					["v_durationstartedtime"] = 0,
					["v_togglename"] = "Toggle 1",
					["b_gcombopoints"] = true,
					["v_spellname"] = "111240",
					["b_t_hp"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcombopoints"] = "1",
					["v_t_hp"] = "<35%",
				},
				[L["defaultRotation/rogue/tricks_of_the_trade"]] = {
					["v_f_needsbuff"] = "_57934",
					["v_keybind"] = "<keybind>",
					["b_f_pc"] = true,
					["v_f_hp"] = ">0%",
					["v_actionicon"] = "57934",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "57934",
					["b_f_needsbuff"] = true,
					["v_checkothercdvalue"] = "<2",
					["b_f_hp"] = true,
					["v_checkothercdname"] = "57934",
				},
				[L["defaultRotation/rogue/expose_armor"]] = {
					["v_t_needsdebuff"] = "113746#3^5",
					["v_gcdspell"] = "5938",
					["v_actionicon"] = "8647",
					["b_gcombopoints"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "8647",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcombopoints"] = "1",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/rogue/dispatch_blindside"]] = {
					["v_p_havebuff"] = "121153",
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "5938",
					["b_p_havebuff"] = true,
					["v_p_combopoints"] = "<5",
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "111240",
					["v_spellname"] = "111240",
					["v_durationstartedtime"] = 0,
					["v_keybind"] = "<keybind>",
					["v_gcombopoints"] = "1",
					["b_gcombopoints"] = true,
				},
				[L["defaultRotation/rogue/envenom_less_than_35_percent"]] = {
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "5938",
					["v_spellname"] = "32645",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["b_t_hp"] = true,
					["v_p_combopoints"] = "=5",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "32645",
					["v_t_hp"] = "<35%",
				},
				[L["defaultRotation/rogue/deadly_throw"]] = {
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "5938",
					["v_p_combopoints"] = "=5",
					["v_actionicon"] = "26679",
					["v_spellname"] = "26679",
					["v_durationstartedtime"] = 0,
					["v_keybind"] = "<keybind>",
					["v_togglename"] = "Toggle 1",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/rogue/shuriken_toss"]] = {
					["v_rangespell"] = "26679",
					["v_gcdspell"] = "5938",
					["b_gcombopoints"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "114014",
					["v_actionicon"] = "114014",
					["v_keybind"] = "<keybind>",
					["v_gcombopoints"] = "1",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/rogue/rupture"]] = {
					["v_t_needsdebuff"] = "_1943^5",
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "5938",
					["v_actionicon"] = "1943",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "1943",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_p_combopoints"] = ">=4",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/rogue/mutilate"]] = {
					["v_t_hp"] = ">=35%",
					["b_gcombopoints"] = true,
					["b_t_hp"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "1329",
					["v_actionicon"] = "1329",
					["v_keybind"] = "<keybind>",
					["v_gcombopoints"] = "2",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/rogue/shadow_blades"]] = {
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "121471",
					["v_actionicon"] = "121471",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_checkothercdname"] = "121471",
				},
				[L["defaultRotation/rogue/slice_and_dice"]] = {
					["v_p_needbuff"] = "_5171^3",
					["b_p_needbuff"] = true,
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "5938",
					["v_p_combopoints"] = ">2",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "5171",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "5171",
					["v_togglename"] = "Toggle 1",
				},
				[L["defaultRotation/rogue/envenom"]] = {
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "5938",
					["v_spellname"] = "32645",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["b_t_hp"] = true,
					["v_p_combopoints"] = ">=4",
					["v_keybind"] = "<keybind>",
					["v_actionicon"] = "32645",
					["v_t_hp"] = ">=35%",
				},
				[L["defaultRotation/rogue/vendetta"]] = {
					["v_durationstartedtime"] = 0,
					["v_checkothercdvalue"] = "<2",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["b_p_havebuff"] = true,
					["v_spellname"] = "79140",
					["v_actionicon"] = "79140",
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "_5171",
					["v_checkothercdname"] = "79140",
				},
			},
			["SortedActions"] = {
				L["defaultRotation/rogue/tricks_of_the_trade"], -- [1]
				L["defaultRotation/rogue/shadow_blades"], -- [2]
				L["defaultRotation/rogue/vendetta"], -- [3]
				L["defaultRotation/rogue/dispatch_blindside"], -- [4]
				L["defaultRotation/rogue/slice_and_dice"], -- [5]
				L["defaultRotation/rogue/rupture"], -- [6]
				L["defaultRotation/rogue/expose_armor"], -- [7]
				L["defaultRotation/rogue/envenom_less_than_35_percent"], -- [8]
				L["defaultRotation/rogue/envenom"], -- [9]
				L["defaultRotation/rogue/dispatch"], -- [10]
				L["defaultRotation/rogue/mutilate"], -- [11]
				L["defaultRotation/rogue/deadly_throw"], -- [12]
				L["defaultRotation/rogue/shuriken_toss"], -- [13]
			},
			["keybind"] = "<keybind>",
		},
		[L["defaultRotation/rogue/combat"]] = {
			["ActionList"] = {
				[L["defaultRotation/rogue/adrenaline_rush"]] = {
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "13750",
					["v_keybind"] = "<keybind>",
					["v_checkothercdvalue"] = "<2",
					["v_actionicon"] = "13750",
					["v_checkothercdname"] = "13750",
				},
				[L["defaultRotation/rogue/eviscerate"]] = {
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "5938",
					["v_p_combopoints"] = "=5",
					["v_actionicon"] = "2098",
					["v_spellname"] = "2098",
					["v_togglename"] = "Toggle 1",
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/rogue/tricks_of_the_trade"]] = {
					["v_f_needsbuff"] = "_57934",
					["b_f_pc"] = true,
					["b_f_needsbuff"] = true,
					["v_f_hp"] = ">0%",
					["v_keybind"] = "<keybind>",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "57934",
					["v_actionicon"] = "57934",
					["v_checkothercdvalue"] = "<2",
					["b_f_hp"] = true,
					["v_checkothercdname"] = "57934",
				},
				[L["defaultRotation/rogue/expose_armor"]] = {
					["v_t_needsdebuff"] = "113746#3^5",
					["v_gcdspell"] = "5938",
					["b_gcombopoints"] = true,
					["v_durationstartedtime"] = 0,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "8647",
					["v_spellname"] = "8647",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcombopoints"] = "1",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/rogue/killing_spree"]] = {
					["v_p_needbuff"] = "_13750",
					["b_p_needbuff"] = true,
					["v_actionicon"] = "51690",
					["v_durationstartedtime"] = 0,
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["b_p_havebuff"] = true,
					["v_spellname"] = "51690",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_p_havebuff"] = "_84747",
					["v_checkothercdname"] = "51690",
				},
				[L["defaultRotation/rogue/sinister_strike"]] = {
					["v_gcdspell"] = "5938",
					["v_actionicon"] = "1752",
					["v_togglename"] = "Toggle 1",
					["b_gcombopoints"] = true,
					["v_spellname"] = "1752",
					["v_durationstartedtime"] = 0,
					["v_keybind"] = "<keybind>",
					["v_gcombopoints"] = "1",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/rogue/shuriken_toss"]] = {
					["v_gcdspell"] = "5938",
					["v_rangespell"] = "26679",
					["v_actionicon"] = "114014",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "114014",
					["b_gcombopoints"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcombopoints"] = "1",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/rogue/deadly_throw"]] = {
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "5938",
					["v_p_combopoints"] = "=5",
					["v_actionicon"] = "26679",
					["v_spellname"] = "26679",
					["v_durationstartedtime"] = 0,
					["v_keybind"] = "<keybind>",
					["v_togglename"] = "Toggle 1",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/rogue/revealing_strike"]] = {
					["v_t_needsdebuff"] = "_84617^3",
					["v_gcdspell"] = "5938",
					["b_gcombopoints"] = true,
					["v_durationstartedtime"] = 0,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "84617",
					["v_spellname"] = "84617",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcombopoints"] = "1",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/rogue/shadow_blades"]] = {
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "121471",
					["v_spellname"] = "121471",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["v_checkothercdname"] = "121471",
				},
				[L["defaultRotation/rogue/slice_and_dice"]] = {
					["v_p_needbuff"] = "_5171^3",
					["b_p_needbuff"] = true,
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "5938",
					["v_p_combopoints"] = ">2",
					["v_actionicon"] = "5171",
					["v_spellname"] = "5171",
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["v_togglename"] = "Toggle 1",
				},
			},
			["SortedActions"] = {
				L["defaultRotation/rogue/tricks_of_the_trade"], -- [1]
				L["defaultRotation/rogue/shadow_blades"], -- [2]
				L["defaultRotation/rogue/adrenaline_rush"], -- [3]
				L["defaultRotation/rogue/killing_spree"], -- [4]
				L["defaultRotation/rogue/eviscerate"], -- [5]
				L["defaultRotation/rogue/slice_and_dice"], -- [6]
				L["defaultRotation/rogue/expose_armor"], -- [7]
				L["defaultRotation/rogue/revealing_strike"], -- [8]
				L["defaultRotation/rogue/sinister_strike"], -- [9]
				L["defaultRotation/rogue/deadly_throw"], -- [10]
				L["defaultRotation/rogue/shuriken_toss"], -- [11]
			},
			["keybind"] = "<keybind>",
		},
		[L["defaultRotation/rogue/subtlety"]] = {
			["ActionList"] = {
				[L["defaultRotation/rogue/eviscerate"]] = {
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "5938",
					["v_p_combopoints"] = "=5",
					["v_actionicon"] = "2098",
					["v_spellname"] = "2098",
					["v_togglename"] = "Toggle 1",
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/rogue/deadly_throw"]] = {
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "5938",
					["v_p_combopoints"] = "=5",
					["v_actionicon"] = "26679",
					["v_spellname"] = "26679",
					["v_durationstartedtime"] = 0,
					["v_keybind"] = "<keybind>",
					["v_togglename"] = "Toggle 1",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/rogue/tricks_of_the_trade"]] = {
					["v_f_needsbuff"] = "_57934",
					["b_f_pc"] = true,
					["v_durationstartedtime"] = 0,
					["v_f_hp"] = ">0%",
					["v_keybind"] = "<keybind>",
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["b_f_hp"] = true,
					["v_spellname"] = "57934",
					["b_f_needsbuff"] = true,
					["v_checkothercdvalue"] = "<2",
					["v_actionicon"] = "57934",
					["v_checkothercdname"] = "57934",
				},
				[L["defaultRotation/rogue/shadow_dance"]] = {
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "51713",
					["v_keybind"] = "<keybind>",
					["v_checkothercdvalue"] = "<2",
					["v_actionicon"] = "51713",
					["v_checkothercdname"] = "51713",
				},
				[L["defaultRotation/rogue/shadow_blades"]] = {
					["b_checkothercd"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "121471",
					["v_spellname"] = "121471",
					["v_checkothercdvalue"] = "<2",
					["v_keybind"] = "<keybind>",
					["v_durationstartedtime"] = 0,
					["v_checkothercdname"] = "121471",
				},
				[L["defaultRotation/rogue/backstab"]] = {
					["v_gcdspell"] = "5938",
					["b_gcombopoints"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "53",
					["v_actionicon"] = "53",
					["v_keybind"] = "<keybind>",
					["v_gcombopoints"] = "1",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/rogue/shuriken_toss"]] = {
					["v_gcdspell"] = "5938",
					["v_rangespell"] = "26679",
					["b_gcombopoints"] = true,
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "114014",
					["v_spellname"] = "114014",
					["v_durationstartedtime"] = 0,
					["v_keybind"] = "<keybind>",
					["v_gcombopoints"] = "1",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/rogue/rupture"]] = {
					["v_t_needsdebuff"] = "_1943^3",
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "5938",
					["v_actionicon"] = "1943",
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "1943",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_p_combopoints"] = "=5",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/rogue/ambush"]] = {
					["b_p_notstance"] = true,
					["v_gcdspell"] = "5938",
					["b_gcombopoints"] = true,
					["v_p_notstance"] = "0",
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "8676",
					["v_spellname"] = "8676",
					["v_durationstartedtime"] = 0,
					["v_keybind"] = "<keybind>",
					["v_gcombopoints"] = "2",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/rogue/slice_and_dice"]] = {
					["v_p_needbuff"] = "_5171^3",
					["b_p_needbuff"] = true,
					["b_p_combopoints"] = true,
					["v_gcdspell"] = "5938",
					["v_togglename"] = "Toggle 1",
					["v_actionicon"] = "5171",
					["v_spellname"] = "5171",
					["v_keybind"] = "<keybind>",
					["v_p_combopoints"] = ">2",
					["v_durationstartedtime"] = 0,
				},
				[L["defaultRotation/rogue/hemorrhage"]] = {
					["v_t_needsdebuff"] = "_89775^1",
					["v_rangespell"] = "1752",
					["v_gcdspell"] = "5938",
					["v_actionicon"] = "16511",
					["b_gcombopoints"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "16511",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcombopoints"] = "1",
					["b_rangecheck"] = true,
				},
				[L["defaultRotation/rogue/expose_armor"]] = {
					["v_t_needsdebuff"] = "113746#3^5",
					["v_gcdspell"] = "5938",
					["v_actionicon"] = "8647",
					["b_gcombopoints"] = true,
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "8647",
					["b_t_needsdebuff"] = true,
					["v_keybind"] = "<keybind>",
					["v_gcombopoints"] = "1",
					["b_rangecheck"] = true,
				},
			},
			["SortedActions"] = {
				L["defaultRotation/rogue/tricks_of_the_trade"], -- [1]
				L["defaultRotation/rogue/shadow_blades"], -- [2]
				L["defaultRotation/rogue/shadow_dance"], -- [3]
				L["defaultRotation/rogue/slice_and_dice"], -- [4]
				L["defaultRotation/rogue/rupture"], -- [5]
				L["defaultRotation/rogue/eviscerate"], -- [6]
				L["defaultRotation/rogue/ambush"], -- [7]
				L["defaultRotation/rogue/expose_armor"], -- [8]
				L["defaultRotation/rogue/hemorrhage"], -- [9]
				L["defaultRotation/rogue/backstab"], -- [10]
				L["defaultRotation/rogue/deadly_throw"], -- [11]
				L["defaultRotation/rogue/shuriken_toss"], -- [12]
			},
			["keybind"] = "<keybind>",
		},
	}

	-- Restore the true state of the saved data.
	--	return RotationBuilder:restoreTable({}, rotation);
	return rotation;
end

RotationBuilder:addDefaultRotationsGenerator("ROGUE", rogueRotationsGenerator);