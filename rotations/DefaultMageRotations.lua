-- The default rotations generator for MAGES.
local mageRotationsGenerator = function ()
	local rotation = {
		["defaultRotation/mage/arcane"] = {
			["ActionList"] = {
				["defaultRotation/mage/arcane_barrage"] = {
					["b_checkothercd"] = true,
					["b_checkothercd2"] = true,
					["b_p_needbuff"] = true,
					["b_p_unitpower"] = true,
					["v_checkothercd2name"] = "12042",
					["v_checkothercd2value"] = ">0",
					["v_checkothercdname"] = "12051",
					["v_checkothercdvalue"] = ">30",
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "12042",
					["v_p_unitpower"] = "=4",
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "44425",
				},
				["defaultRotation/mage/arcane_barrage_arcane_power"] = {
					["b_p_havebuff"] = true,
					["b_p_knowspell"] = true,
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "12042",
					["v_p_knowspell"] = "205032",
					["v_p_needbuff"] = "12042^1.5",
					["v_spellname"] = "44425",
				},
				["defaultRotation/mage/arcane_barrage_mana"] = {
					["b_checkothercd"] = true,
					["b_checkothercd2"] = true,
					["b_p_needbuff"] = true,
					["b_p_unitpower"] = true,
					["b_p_unitpower2"] = true,
					["v_checkothercd2name"] = "12042",
					["v_checkothercd2value"] = ">0",
					["v_checkothercdname"] = "12051",
					["v_checkothercdvalue"] = ">30",
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "12042",
					["v_p_unitpower"] = ">=1",
					["v_p_unitpower2"] = "<75%",
					["v_p_unitpower2type"] = "0",
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "44425",
				},
				["defaultRotation/mage/arcane_barrage_mana_85"] = {
					["b_checkothercd"] = true,
					["b_checkothercd2"] = true,
					["b_p_needbuff"] = true,
					["b_p_unitpower"] = true,
					["b_p_unitpower2"] = true,
					["v_checkothercd2name"] = "12042",
					["v_checkothercd2value"] = ">0",
					["v_checkothercdname"] = "12051",
					["v_checkothercdvalue"] = ">30",
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "12042",
					["v_p_unitpower"] = ">=2",
					["v_p_unitpower2"] = "<85%",
					["v_p_unitpower2type"] = "0",
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "44425",
				},
				["defaultRotation/mage/arcane_blast"] = {
					["b_gunitpower"] = true,
					["v_durationstartedtime"] = 0,
					["v_gunitpower"] = "1",
					["v_gunitpowertype"] = "16",
					["v_spellname"] = "30451",
				},
				["defaultRotation/mage/arcane_blast_evocation"] = {
					["b_gunitpower"] = true,
					["b_lastcasted"] = true,
					["v_durationstartedtime"] = 0,
					["v_gunitpower"] = "1",
					["v_gunitpowertype"] = "16",
					["v_lastcasted"] = "12051",
					["v_spellname"] = "30451",
				},
				["defaultRotation/mage/arcane_familiar"] = {
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "210126",
					["v_spellname"] = "205022",
				},
				["defaultRotation/mage/arcane_missiles"] = {
					["b_checkothercd"] = true,
					["b_gunitpower"] = true,
					["b_hasproc"] = true,
					["b_p_unitpower"] = true,
					["v_checkothercdname"] = "12042",
					["v_checkothercdvalue"] = "<30",
					["v_durationstartedtime"] = 0,
					["v_gunitpower"] = "1",
					["v_gunitpowertype"] = "16",
					["v_p_unitpower"] = "=4",
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "5143",
				},
				["defaultRotation/mage/arcane_missiles_3_charges"] = {
					["b_checkothercd"] = true,
					["b_gunitpower"] = true,
					["b_hasproc"] = true,
					["b_p_havebuff"] = true,
					["v_checkothercdname"] = "12042",
					["v_checkothercdvalue"] = ">0",
					["v_durationstartedtime"] = 0,
					["v_gunitpower"] = "1",
					["v_gunitpowertype"] = "16",
					["v_p_havebuff"] = "79743#3",
					["v_spellname"] = "5143",
				},
				["defaultRotation/mage/arcane_missiles_arcane_power"] = {
					["b_checkothercd"] = true,
					["b_gunitpower"] = true,
					["b_hasproc"] = true,
					["v_checkothercdname"] = "12042",
					["v_checkothercdvalue"] = ">45",
					["v_durationstartedtime"] = 0,
					["v_gunitpower"] = "1",
					["v_gunitpowertype"] = "16",
					["v_spellname"] = "5143",
				},
				["defaultRotation/mage/arcane_missiles_mana"] = {
					["b_checkothercd"] = true,
					["b_gunitpower"] = true,
					["b_hasproc"] = true,
					["b_p_unitpower2"] = true,
					["v_checkothercdname"] = "12051",
					["v_checkothercdvalue"] = ">30",
					["v_durationstartedtime"] = 0,
					["v_gunitpower"] = "1",
					["v_gunitpowertype"] = "16",
					["v_p_unitpower2"] = "<75%",
					["v_p_unitpower2type"] = "0",
					["v_spellname"] = "5143",
				},
				["defaultRotation/mage/arcane_missiles_mana_85"] = {
					["b_checkothercd"] = true,
					["b_gunitpower"] = true,
					["b_hasproc"] = true,
					["b_p_unitpower"] = true,
					["b_p_unitpower2"] = true,
					["v_checkothercdname"] = "12051",
					["v_checkothercdvalue"] = ">30",
					["v_durationstartedtime"] = 0,
					["v_gunitpower"] = "1",
					["v_gunitpowertype"] = "16",
					["v_p_unitpower"] = ">=2",
					["v_p_unitpower2"] = "<85%",
					["v_p_unitpower2type"] = "0",
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "5143",
				},
				["defaultRotation/mage/arcane_orb"] = {
					["b_gunitpower"] = true,
					["b_p_needbuff"] = true,
					["b_p_unitpower"] = true,
					["v_durationstartedtime"] = 0,
					["v_gunitpower"] = "1",
					["v_gunitpowertype"] = "16",
					["v_p_needbuff"] = "12042",
					["v_p_unitpower"] = "=0",
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "153626",
				},
				["defaultRotation/mage/arcane_power"] = {
					["b_p_unitpower"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_unitpower"] = "=4",
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "12042",
				},
				["defaultRotation/mage/charged_up"] = {
					["b_checkothercd"] = true,
					["b_p_needbuff"] = true,
					["b_p_unitpower"] = true,
					["v_checkothercdname"] = "12042",
					["v_checkothercdvalue"] = ">45",
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "12042",
					["v_p_unitpower"] = "=0",
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "205032",
				},
				["defaultRotation/mage/counterspell"] = {
					["b_t_interrupt"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "2139",
				},
				["defaultRotation/mage/evocation"] = {
					["b_p_unitpower"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_unitpower"] = "<15%",
					["v_p_unitpowertype"] = "0",
					["v_spellname"] = "12051",
				},
				["defaultRotation/mage/mark_of_aluneth"] = {
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "12042",
					["v_spellname"] = "224968",
				},
				["defaultRotation/mage/mirror_image"] = {
					["b_isCustomCase1"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "55342",
				},
				["defaultRotation/mage/nether_tempest"] = {
					["b_p_needbuff"] = true,
					["b_p_unitpower"] = true,
					["b_t_needsdebuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "12042",
					["v_p_unitpower"] = "=4",
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "114923",
					["v_t_needsdebuff"] = "_114923^4",
				},
				["defaultRotation/mage/presence_of_mind"] = {
					["b_p_havebuff"] = true,
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "12042",
					["v_p_needbuff"] = "205025",
					["v_spellname"] = "205025",
				},
				["defaultRotation/mage/prismatic_barrier"] = {
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "235450||12042",
					["v_spellname"] = "235450",
				},
				["defaultRotation/mage/rune_of_power"] = {
					["b_p_needbuff"] = true,
					["b_p_unitpower"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "116014",
					["v_p_unitpower"] = "=4",
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "116011",
				},
				["defaultRotation/mage/rune_of_power_2_charges"] = {
					["b_charges"] = true,
					["v_charges"] = "2",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116011",
				},
				["defaultRotation/mage/spellsteal"] = {
					["b_t_spellsteal"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "30449",
				},
				["defaultRotation/mage/supernova"] = {
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "12042",
					["v_spellname"] = "157980",
				},
			},
			["SortedActions"] = {
				"defaultRotation/mage/arcane_blast_evocation", -- [1]
				"defaultRotation/mage/arcane_barrage_arcane_power", -- [2]
				"defaultRotation/mage/counterspell", -- [3]
				"defaultRotation/mage/spellsteal", -- [4]
				"defaultRotation/mage/arcane_familiar", -- [5]
				"defaultRotation/mage/mirror_image", -- [6]
				"defaultRotation/mage/prismatic_barrier", -- [7]
				"defaultRotation/mage/rune_of_power", -- [8]
				"defaultRotation/mage/evocation", -- [9]
				"defaultRotation/mage/arcane_power", -- [10]
				"defaultRotation/mage/presence_of_mind", -- [11]
				"defaultRotation/mage/rune_of_power_2_charges", -- [12]
				"defaultRotation/mage/mark_of_aluneth", -- [13]
				"defaultRotation/mage/arcane_orb", -- [14]
				"defaultRotation/mage/nether_tempest", -- [15]
				"defaultRotation/mage/arcane_missiles_arcane_power", -- [16]
				"defaultRotation/mage/arcane_missiles_3_charges", -- [17]
				"defaultRotation/mage/arcane_missiles_mana_85", -- [18]
				"defaultRotation/mage/arcane_missiles_mana", -- [19]
				"defaultRotation/mage/arcane_missiles", -- [20]
				"defaultRotation/mage/charged_up", -- [21]
				"defaultRotation/mage/supernova", -- [22]
				"defaultRotation/mage/arcane_barrage_mana_85", -- [23]
				"defaultRotation/mage/arcane_barrage_mana", -- [24]
				"defaultRotation/mage/arcane_barrage", -- [25]
				"defaultRotation/mage/arcane_blast", -- [26]
			},
			["bindindex"] = 0,
			["specID"] = 1,
			["version"] = 5,
		},
		["defaultRotation/mage/arcane_multi"] = {
			["ActionList"] = {
				["defaultRotation/mage/arcane_barrage"] = {
					["b_checkothercd"] = true,
					["b_checkothercd2"] = true,
					["b_p_needbuff"] = true,
					["b_p_unitpower"] = true,
					["v_checkothercd2name"] = "12042",
					["v_checkothercd2value"] = ">0",
					["v_checkothercdname"] = "12051",
					["v_checkothercdvalue"] = ">30",
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "12042",
					["v_p_unitpower"] = "=4",
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "44425",
				},
				["defaultRotation/mage/arcane_barrage_arcane_power"] = {
					["b_p_havebuff"] = true,
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "12042",
					["v_p_needbuff"] = "12042^1.5",
					["v_spellname"] = "44425",
				},
				["defaultRotation/mage/arcane_barrage_mana"] = {
					["b_checkothercd"] = true,
					["b_checkothercd2"] = true,
					["b_p_needbuff"] = true,
					["b_p_unitpower"] = true,
					["b_p_unitpower2"] = true,
					["v_checkothercd2name"] = "12042",
					["v_checkothercd2value"] = ">0",
					["v_checkothercdname"] = "12051",
					["v_checkothercdvalue"] = ">30",
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "12042",
					["v_p_unitpower"] = ">=1",
					["v_p_unitpower2"] = "<75%",
					["v_p_unitpower2type"] = "0",
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "44425",
				},
				["defaultRotation/mage/arcane_barrage_mana_85"] = {
					["b_checkothercd"] = true,
					["b_checkothercd2"] = true,
					["b_p_unitpower"] = true,
					["b_p_unitpower2"] = true,
					["v_checkothercd2name"] = "12042",
					["v_checkothercd2value"] = ">0",
					["v_checkothercdname"] = "12051",
					["v_checkothercdvalue"] = ">30",
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "12042",
					["v_p_unitpower"] = ">=2",
					["v_p_unitpower2"] = "<85%",
					["v_p_unitpower2type"] = "0",
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "44425",
				},
				["defaultRotation/mage/arcane_blast_evocation"] = {
					["b_gunitpower"] = true,
					["b_lastcasted"] = true,
					["v_durationstartedtime"] = 0,
					["v_gunitpower"] = "1",
					["v_gunitpowertype"] = "16",
					["v_lastcasted"] = "12051",
					["v_spellname"] = "30451",
				},
				["defaultRotation/mage/arcane_explosion"] = {
					["b_gunitpower"] = true,
					["v_durationstartedtime"] = 0,
					["v_gunitpower"] = "1",
					["v_gunitpowertype"] = "16",
					["v_spellname"] = "1449",
				},
				["defaultRotation/mage/arcane_familiar"] = {
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "210126",
					["v_spellname"] = "205022",
				},
				["defaultRotation/mage/arcane_missiles"] = {
					["b_checkothercd"] = true,
					["b_gunitpower"] = true,
					["b_hasproc"] = true,
					["b_p_unitpower"] = true,
					["v_checkothercdname"] = "12042",
					["v_checkothercdvalue"] = "<30",
					["v_durationstartedtime"] = 0,
					["v_gunitpower"] = "1",
					["v_gunitpowertype"] = "16",
					["v_p_unitpower"] = "=4",
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "5143",
				},
				["defaultRotation/mage/arcane_missiles_3_charges"] = {
					["b_checkothercd"] = true,
					["b_gunitpower"] = true,
					["b_hasproc"] = true,
					["b_p_havebuff"] = true,
					["v_checkothercdname"] = "12042",
					["v_checkothercdvalue"] = ">0",
					["v_durationstartedtime"] = 0,
					["v_gunitpower"] = "1",
					["v_gunitpowertype"] = "16",
					["v_p_havebuff"] = "79743#3",
					["v_spellname"] = "5143",
				},
				["defaultRotation/mage/arcane_missiles_arcane_power"] = {
					["b_checkothercd"] = true,
					["b_gunitpower"] = true,
					["b_hasproc"] = true,
					["v_checkothercdname"] = "12042",
					["v_checkothercdvalue"] = ">45",
					["v_durationstartedtime"] = 0,
					["v_gunitpower"] = "1",
					["v_gunitpowertype"] = "16",
					["v_spellname"] = "5143",
				},
				["defaultRotation/mage/arcane_missiles_mana"] = {
					["b_checkothercd"] = true,
					["b_gunitpower"] = true,
					["b_hasproc"] = true,
					["b_p_unitpower2"] = true,
					["v_checkothercdname"] = "12051",
					["v_checkothercdvalue"] = ">30",
					["v_durationstartedtime"] = 0,
					["v_gunitpower"] = "1",
					["v_gunitpowertype"] = "16",
					["v_p_unitpower2"] = "<75%",
					["v_p_unitpower2type"] = "0",
					["v_spellname"] = "5143",
				},
				["defaultRotation/mage/arcane_missiles_mana_85"] = {
					["b_checkothercd"] = true,
					["b_gunitpower"] = true,
					["b_hasproc"] = true,
					["b_p_unitpower"] = true,
					["b_p_unitpower2"] = true,
					["v_checkothercdname"] = "12051",
					["v_checkothercdvalue"] = ">30",
					["v_durationstartedtime"] = 0,
					["v_gunitpower"] = "1",
					["v_gunitpowertype"] = "16",
					["v_p_unitpower"] = ">=2",
					["v_p_unitpower2"] = "<85%",
					["v_p_unitpower2type"] = "0",
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "5143",
				},
				["defaultRotation/mage/arcane_orb"] = {
					["b_gunitpower"] = true,
					["b_p_needbuff"] = true,
					["b_p_unitpower"] = true,
					["v_durationstartedtime"] = 0,
					["v_gunitpower"] = "1",
					["v_gunitpowertype"] = "16",
					["v_p_needbuff"] = "12042",
					["v_p_unitpower"] = "=0",
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "153626",
				},
				["defaultRotation/mage/arcane_power"] = {
					["b_p_unitpower"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_unitpower"] = "=4",
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "12042",
				},
				["defaultRotation/mage/charged_up"] = {
					["b_checkothercd"] = true,
					["b_p_needbuff"] = true,
					["b_p_unitpower"] = true,
					["v_checkothercdname"] = "12042",
					["v_checkothercdvalue"] = ">45",
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "12042",
					["v_p_unitpower"] = "=0",
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "205032",
				},
				["defaultRotation/mage/counterspell"] = {
					["b_t_interrupt"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "2139",
				},
				["defaultRotation/mage/evocation"] = {
					["b_p_unitpower"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_unitpower"] = "<15%",
					["v_p_unitpowertype"] = "0",
					["v_spellname"] = "12051",
				},
				["defaultRotation/mage/mark_of_aluneth"] = {
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "12042",
					["v_spellname"] = "224968",
				},
				["defaultRotation/mage/mirror_image"] = {
					["b_isCustomCase1"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "55342",
				},
				["defaultRotation/mage/nether_tempest"] = {
					["b_p_needbuff"] = true,
					["b_p_unitpower"] = true,
					["b_t_needsdebuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "12042",
					["v_p_unitpower"] = "=4",
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "114923",
					["v_t_needsdebuff"] = "_114923^4",
				},
				["defaultRotation/mage/presence_of_mind"] = {
					["b_p_havebuff"] = true,
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "12042",
					["v_p_needbuff"] = "205025",
					["v_spellname"] = "205025",
				},
				["defaultRotation/mage/prismatic_barrier"] = {
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "235450||12042",
					["v_spellname"] = "235450",
				},
				["defaultRotation/mage/rune_of_power"] = {
					["b_p_needbuff"] = true,
					["b_p_unitpower"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "116014",
					["v_p_unitpower"] = "=4",
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "116011",
				},
				["defaultRotation/mage/rune_of_power_2_charges"] = {
					["b_charges"] = true,
					["v_charges"] = "2",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116011",
				},
				["defaultRotation/mage/spellsteal"] = {
					["b_t_spellsteal"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "30449",
				},
				["defaultRotation/mage/supernova"] = {
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "12042",
					["v_spellname"] = "157980",
				},
			},
			["SortedActions"] = {
				"defaultRotation/mage/arcane_blast_evocation", -- [1]
				"defaultRotation/mage/arcane_barrage_arcane_power", -- [2]
				"defaultRotation/mage/counterspell", -- [3]
				"defaultRotation/mage/spellsteal", -- [4]
				"defaultRotation/mage/arcane_familiar", -- [5]
				"defaultRotation/mage/mirror_image", -- [6]
				"defaultRotation/mage/prismatic_barrier", -- [7]
				"defaultRotation/mage/rune_of_power", -- [8]
				"defaultRotation/mage/evocation", -- [9]
				"defaultRotation/mage/arcane_power", -- [10]
				"defaultRotation/mage/presence_of_mind", -- [11]
				"defaultRotation/mage/rune_of_power_2_charges", -- [12]
				"defaultRotation/mage/mark_of_aluneth", -- [13]
				"defaultRotation/mage/arcane_orb", -- [14]
				"defaultRotation/mage/nether_tempest", -- [15]
				"defaultRotation/mage/arcane_missiles_arcane_power", -- [16]
				"defaultRotation/mage/arcane_missiles_3_charges", -- [17]
				"defaultRotation/mage/arcane_missiles_mana_85", -- [18]
				"defaultRotation/mage/arcane_missiles_mana", -- [19]
				"defaultRotation/mage/arcane_missiles", -- [20]
				"defaultRotation/mage/charged_up", -- [21]
				"defaultRotation/mage/supernova", -- [22]
				"defaultRotation/mage/arcane_barrage_mana_85", -- [23]
				"defaultRotation/mage/arcane_barrage_mana", -- [24]
				"defaultRotation/mage/arcane_barrage", -- [25]
				"defaultRotation/mage/arcane_explosion", -- [26]
			},
			["bindindex"] = 0,
			["isMultiTarget"] = true,
			["specID"] = 1,
			["version"] = 2,
		},
		["defaultRotation/mage/fire"] = {
			["ActionList"] = {
				["defaultRotation/mage/blazing_barrier"] = {
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "235313",
					["v_spellname"] = "235313",
				},
				["defaultRotation/mage/cinderstorm"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "198929",
				},
				["defaultRotation/mage/combustion"] = {
					["b_isCustomCase1"] = true,
					["b_othercharges"] = true,
					["b_p_havebuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_othercharges"] = ">1",
					["v_otherchargesname"] = "194466",
					["v_p_havebuff"] = "48108",
					["v_spellname"] = "190319",
				},
				["defaultRotation/mage/counterspell"] = {
					["b_t_interrupt"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "2139",
				},
				["defaultRotation/mage/dragon_breath"] = {
					["b_p_knowspell"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_knowspell"] = "235870",
					["v_spellname"] = "31661",
				},
				["defaultRotation/mage/fire_blast"] = {
					["b_p_havebuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "48107^1.5",
					["v_spellname"] = "108853",
				},
				["defaultRotation/mage/fireball"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "133",
				},
				["defaultRotation/mage/mirror_image"] = {
					["b_isCustomCase1"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "55342",
				},
				["defaultRotation/mage/phoenix_flames"] = {
					["b_charges"] = true,
					["b_checkothercd"] = true,
					["b_p_needbuff"] = true,
					["v_charges"] = ">=2",
					["v_checkothercdname"] = "190319",
					["v_checkothercdvalue"] = ">45",
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "190319",
					["v_spellname"] = "194466",
				},
				["defaultRotation/mage/phoenix_flames_combustion"] = {
					["b_othercharges"] = true,
					["b_p_havebuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_othercharges"] = "0",
					["v_otherchargesname"] = "108853",
					["v_p_havebuff"] = "190319",
					["v_spellname"] = "194466",
				},
				["defaultRotation/mage/phoenix_flames_combustion_soon"] = {
					["b_charges"] = true,
					["b_checkothercd"] = true,
					["b_p_needbuff"] = true,
					["v_charges"] = "3",
					["v_checkothercdname"] = "190319",
					["v_checkothercdvalue"] = "<=45",
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "190319",
					["v_spellname"] = "194466",
				},
				["defaultRotation/mage/pyroblast"] = {
					["b_hasproc"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "11366",
				},
				["defaultRotation/mage/rune_of_power"] = {
					["b_charges"] = true,
					["v_charges"] = "2",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116011",
				},
				["defaultRotation/mage/rune_of_power_combustion"] = {
					["b_checkothercd"] = true,
					["b_isCustomCase1"] = true,
					["b_p_needbuff"] = true,
					["v_checkothercdname"] = "190319",
					["v_checkothercdvalue"] = "<1.5",
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "116014",
					["v_spellname"] = "116011",
				},
				["defaultRotation/mage/scorch"] = {
					["b_moving"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "2948",
				},
				["defaultRotation/mage/scorch_combustion"] = {
					["b_p_havebuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "190319",
					["v_spellname"] = "2948",
				},
				["defaultRotation/mage/spellsteal"] = {
					["b_t_spellsteal"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "30449",
				},
			},
			["SortedActions"] = {
				"defaultRotation/mage/counterspell", -- [1]
				"defaultRotation/mage/spellsteal", -- [2]
				"defaultRotation/mage/blazing_barrier", -- [3]
				"defaultRotation/mage/rune_of_power_combustion", -- [4]
				"defaultRotation/mage/combustion", -- [5]
				"defaultRotation/mage/mirror_image", -- [6]
				"defaultRotation/mage/rune_of_power", -- [7]
				"defaultRotation/mage/phoenix_flames_combustion_soon", -- [8]
				"defaultRotation/mage/phoenix_flames", -- [9]
				"defaultRotation/mage/pyroblast", -- [10]
				"defaultRotation/mage/dragon_breath", -- [11]
				"defaultRotation/mage/fire_blast", -- [12]
				"defaultRotation/mage/phoenix_flames_combustion", -- [13]
				"defaultRotation/mage/cinderstorm", -- [14]
				"defaultRotation/mage/scorch_combustion", -- [15]
				"defaultRotation/mage/scorch", -- [16]
				"defaultRotation/mage/fireball", -- [17]
			},
			["bindindex"] = 0,
			["specID"] = 2,
			["version"] = 5,
		},
		["defaultRotation/mage/fire_multi"] = {
			["ActionList"] = {
				["defaultRotation/mage/blazing_barrier"] = {
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "235313",
					["v_spellname"] = "235313",
				},
				["defaultRotation/mage/cinderstorm"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "198929",
				},
				["defaultRotation/mage/combustion"] = {
					["b_isCustomCase1"] = true,
					["b_othercharges"] = true,
					["b_p_havebuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_othercharges"] = ">1",
					["v_otherchargesname"] = "194466",
					["v_p_havebuff"] = "48108",
					["v_spellname"] = "190319",
				},
				["defaultRotation/mage/counterspell"] = {
					["b_t_interrupt"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "2139",
				},
				["defaultRotation/mage/dragon_breath"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "31661",
				},
				["defaultRotation/mage/fire_blast"] = {
					["b_p_havebuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "48107^1.5",
					["v_spellname"] = "108853",
				},
				["defaultRotation/mage/fireball"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "133",
				},
				["defaultRotation/mage/flamestrke"] = {
					["b_hasproc"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "2120",
				},
				["defaultRotation/mage/living_bomb"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "44457",
				},
				["defaultRotation/mage/meteor"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "153561",
					["v_togglename"] = "Toggle 1",
				},
				["defaultRotation/mage/mirror_image"] = {
					["b_isCustomCase1"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "55342",
				},
				["defaultRotation/mage/phoenix_flames"] = {
					["b_charges"] = true,
					["b_checkothercd"] = true,
					["b_p_needbuff"] = true,
					["v_charges"] = ">=2",
					["v_checkothercdname"] = "190319",
					["v_checkothercdvalue"] = ">45",
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "190319",
					["v_spellname"] = "194466",
				},
				["defaultRotation/mage/phoenix_flames_combustion"] = {
					["b_othercharges"] = true,
					["b_p_havebuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_othercharges"] = "0",
					["v_otherchargesname"] = "108853",
					["v_p_havebuff"] = "190319",
					["v_spellname"] = "194466",
				},
				["defaultRotation/mage/phoenix_flames_combustion_soon"] = {
					["b_charges"] = true,
					["b_checkothercd"] = true,
					["b_p_needbuff"] = true,
					["v_charges"] = "3",
					["v_checkothercdname"] = "190319",
					["v_checkothercdvalue"] = "<=45",
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "190319",
					["v_spellname"] = "194466",
				},
				["defaultRotation/mage/rune_of_power"] = {
					["b_charges"] = true,
					["v_charges"] = "2",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116011",
				},
				["defaultRotation/mage/rune_of_power_combustion"] = {
					["b_checkothercd"] = true,
					["b_isCustomCase1"] = true,
					["b_p_needbuff"] = true,
					["v_checkothercdname"] = "190319",
					["v_checkothercdvalue"] = "<1.5",
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "116014",
					["v_spellname"] = "116011",
				},
				["defaultRotation/mage/scorch"] = {
					["b_moving"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "2948",
				},
				["defaultRotation/mage/scorch_combustion"] = {
					["b_p_havebuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "190319",
					["v_spellname"] = "2948",
				},
				["defaultRotation/mage/spellsteal"] = {
					["b_t_spellsteal"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "30449",
				},
			},
			["SortedActions"] = {
				"defaultRotation/mage/counterspell", -- [1]
				"defaultRotation/mage/spellsteal", -- [2]
				"defaultRotation/mage/blazing_barrier", -- [3]
				"defaultRotation/mage/rune_of_power_combustion", -- [4]
				"defaultRotation/mage/combustion", -- [5]
				"defaultRotation/mage/mirror_image", -- [6]
				"defaultRotation/mage/rune_of_power", -- [7]
				"defaultRotation/mage/phoenix_flames_combustion_soon", -- [8]
				"defaultRotation/mage/phoenix_flames", -- [9]
				"defaultRotation/mage/flamestrke", -- [10]
				"defaultRotation/mage/meteor", -- [11]
				"defaultRotation/mage/living_bomb", -- [12]
				"defaultRotation/mage/dragon_breath", -- [13]
				"defaultRotation/mage/fire_blast", -- [14]
				"defaultRotation/mage/phoenix_flames_combustion", -- [15]
				"defaultRotation/mage/cinderstorm", -- [16]
				"defaultRotation/mage/scorch_combustion", -- [17]
				"defaultRotation/mage/scorch", -- [18]
				"defaultRotation/mage/fireball", -- [19]
			},
			["bindindex"] = 0,
			["isMultiTarget"] = true,
			["specID"] = 2,
			["version"] = 2,
		},
		["defaultRotation/mage/frost"] = {
			["ActionList"] = {
				["defaultRotation/mage/counterspell"] = {
					["b_t_interrupt"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "2139",
				},
				["defaultRotation/mage/ebonbolt"] = {
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "190446",
					["v_spellname"] = "214634",
				},
				["defaultRotation/mage/flurry"] = {
					["b_p_havebuff"] = true,
					["b_p_knownotspell"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "190446",
					["v_p_knownotspell"] = "199786",
					["v_spellname"] = "44614",
				},
				["defaultRotation/mage/flurry_glacial_spike"] = {
					["b_p_havebuff"] = true,
					["b_p_knowspell"] = true,
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "190446",
					["v_p_knowspell"] = "199786",
					["v_p_needbuff"] = "205473#3",
					["v_spellname"] = "44614",
				},
				["defaultRotation/mage/frost_bomb"] = {
					["b_p_havebuff"] = true,
					["b_t_needsdebuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "44544#1",
					["v_spellname"] = "112948",
					["v_t_needsdebuff"] = "_112948",
				},
				["defaultRotation/mage/frostbolt"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116",
				},
				["defaultRotation/mage/frozen_orb"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "84714",
				},
				["defaultRotation/mage/glacial_spike"] = {
					["b_hasproc"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "199786",
				},
				["defaultRotation/mage/ice_barrier"] = {
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "11426",
					["v_spellname"] = "11426",
				},
				["defaultRotation/mage/ice_lance"] = {
					["b_hasproc"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "30455",
				},
				["defaultRotation/mage/ice_lance_brain_freeze"] = {
					["b_hasproc"] = true,
					["b_p_havebuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "190446",
					["v_spellname"] = "30455",
				},
				["defaultRotation/mage/ice_lance_fingers_of_frost"] = {
					["b_checkothercd"] = true,
					["b_hasproc"] = true,
					["b_p_havebuff"] = true,
					["v_checkothercdname"] = "12472",
					["v_checkothercdvalue"] = ">10",
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "44544#3",
					["v_spellname"] = "30455",
				},
				["defaultRotation/mage/ice_lance_winter_chill"] = {
					["b_maxcasts"] = true,
					["b_t_hasdebuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_maxcasts"] = "1",
					["v_spellname"] = "30455",
					["v_t_hasdebuff"] = "_228358",
				},
				["defaultRotation/mage/ice_nova"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "157997",
				},
				["defaultRotation/mage/ice_nova_winter_chill"] = {
					["b_t_hasdebuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "157997",
					["v_t_hasdebuff"] = "_228358",
				},
				["defaultRotation/mage/icy_veins"] = {
					["b_isCustomCase1"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "12472",
				},
				["defaultRotation/mage/mirror_image"] = {
					["b_isCustomCase1"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "55342",
				},
				["defaultRotation/mage/ray_of_frost"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "205021",
				},
				["defaultRotation/mage/rune_of_power"] = {
					["b_charges"] = true,
					["v_charges"] = "2",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116011",
				},
				["defaultRotation/mage/rune_of_power_frozen_orb"] = {
					["b_checkothercd"] = true,
					["b_p_needbuff"] = true,
					["v_checkothercdname"] = "84714",
					["v_checkothercdvalue"] = "<1.5",
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "116014",
					["v_spellname"] = "116011",
				},
				["defaultRotation/mage/rune_of_power_icy_veins"] = {
					["b_p_havebuff"] = true,
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "12472",
					["v_p_needbuff"] = "116014",
					["v_spellname"] = "116011",
				},
				["defaultRotation/mage/rune_of_power_ray_of_frost"] = {
					["b_checkothercd"] = true,
					["b_p_needbuff"] = true,
					["v_checkothercdname"] = "205021",
					["v_checkothercdvalue"] = "<1.5",
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "116014",
					["v_spellname"] = "116011",
				},
				["defaultRotation/mage/spellsteal"] = {
					["b_t_spellsteal"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "30449",
				},
				["defaultRotation/mage/summon_water_elemental"] = {
					["b_p_knownotspell"] = true,
					["b_pet_hp"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_knownotspell"] = "205024",
					["v_pet_hp"] = "=0",
					["v_spellname"] = "31687",
				},
				["defaultRotation/mage/water_jet"] = {
					["b_notinspellbook"] = true,
					["b_p_knownotspell"] = true,
					["b_p_needbuff"] = true,
					["b_pet_hp"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_knownotspell"] = "205024",
					["v_p_needbuff"] = "44544",
					["v_pet_hp"] = ">0",
					["v_spellname"] = "135029",
				},
			},
			["SortedActions"] = {
				"defaultRotation/mage/ice_lance_winter_chill", -- [1]
				"defaultRotation/mage/ice_nova_winter_chill", -- [2]
				"defaultRotation/mage/counterspell", -- [3]
				"defaultRotation/mage/spellsteal", -- [4]
				"defaultRotation/mage/ice_barrier", -- [5]
				"defaultRotation/mage/summon_water_elemental", -- [6]
				"defaultRotation/mage/rune_of_power", -- [7]
				"defaultRotation/mage/rune_of_power_icy_veins", -- [8]
				"defaultRotation/mage/icy_veins", -- [9]
				"defaultRotation/mage/mirror_image", -- [10]
				"defaultRotation/mage/water_jet", -- [11]
				"defaultRotation/mage/rune_of_power_ray_of_frost", -- [12]
				"defaultRotation/mage/ray_of_frost", -- [13]
				"defaultRotation/mage/ice_lance_brain_freeze", -- [14]
				"defaultRotation/mage/flurry_glacial_spike", -- [15]
				"defaultRotation/mage/flurry", -- [16]
				"defaultRotation/mage/frost_bomb", -- [17]
				"defaultRotation/mage/ice_lance_fingers_of_frost", -- [18]
				"defaultRotation/mage/ebonbolt", -- [19]
				"defaultRotation/mage/rune_of_power_frozen_orb", -- [20]
				"defaultRotation/mage/frozen_orb", -- [21]
				"defaultRotation/mage/ice_nova", -- [22]
				"defaultRotation/mage/ice_lance", -- [23]
				"defaultRotation/mage/glacial_spike", -- [24]
				"defaultRotation/mage/frostbolt", -- [25]
			},
			["bindindex"] = 0,
			["specID"] = 3,
			["version"] = 7,
		},
		["defaultRotation/mage/frost_multi"] = {
			["ActionList"] = {
				["defaultRotation/mage/blizzard"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "190356",
				},
				["defaultRotation/mage/blizzard_frozen_rain"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "190356",
				},
				["defaultRotation/mage/comet_storm"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "153595",
				},
				["defaultRotation/mage/counterspell"] = {
					["b_t_interrupt"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "2139",
				},
				["defaultRotation/mage/ebonbolt"] = {
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "190446",
					["v_spellname"] = "214634",
				},
				["defaultRotation/mage/flurry"] = {
					["b_p_havebuff"] = true,
					["b_p_knownotspell"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "190446",
					["v_p_knownotspell"] = "199786",
					["v_spellname"] = "44614",
				},
				["defaultRotation/mage/flurry_glacial_spike"] = {
					["b_p_havebuff"] = true,
					["b_p_knowspell"] = true,
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "190446",
					["v_p_knowspell"] = "199786",
					["v_p_needbuff"] = "205473#3",
					["v_spellname"] = "44614",
				},
				["defaultRotation/mage/frost_bomb"] = {
					["b_p_havebuff"] = true,
					["b_t_needsdebuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "44544#1",
					["v_spellname"] = "112948",
					["v_t_needsdebuff"] = "_112948",
				},
				["defaultRotation/mage/frostbolt"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116",
				},
				["defaultRotation/mage/frozen_orb"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "84714",
				},
				["defaultRotation/mage/glacial_spike"] = {
					["b_hasproc"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "199786",
				},
				["defaultRotation/mage/ice_barrier"] = {
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "11426",
					["v_spellname"] = "11426",
				},
				["defaultRotation/mage/ice_lance"] = {
					["b_hasproc"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "30455",
				},
				["defaultRotation/mage/ice_lance_brain_freeze"] = {
					["b_hasproc"] = true,
					["b_p_havebuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "190446",
					["v_spellname"] = "30455",
				},
				["defaultRotation/mage/ice_lance_fingers_of_frost"] = {
					["b_checkothercd"] = true,
					["b_hasproc"] = true,
					["b_p_havebuff"] = true,
					["v_checkothercdname"] = "12472",
					["v_checkothercdvalue"] = ">10",
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "44544#3",
					["v_spellname"] = "30455",
				},
				["defaultRotation/mage/ice_lance_winter_chill"] = {
					["b_maxcasts"] = true,
					["b_t_hasdebuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_maxcasts"] = "1",
					["v_spellname"] = "30455",
					["v_t_hasdebuff"] = "_228358",
				},
				["defaultRotation/mage/ice_nova"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "157997",
				},
				["defaultRotation/mage/ice_nova_winter_chill"] = {
					["b_t_hasdebuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "157997",
					["v_t_hasdebuff"] = "_228358",
				},
				["defaultRotation/mage/icy_veins"] = {
					["b_isCustomCase1"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "12472",
				},
				["defaultRotation/mage/mirror_image"] = {
					["b_isCustomCase1"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "55342",
				},
				["defaultRotation/mage/ray_of_frost"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "205021",
				},
				["defaultRotation/mage/rune_of_power"] = {
					["b_charges"] = true,
					["v_charges"] = "2",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116011",
				},
				["defaultRotation/mage/rune_of_power_frozen_orb"] = {
					["b_checkothercd"] = true,
					["b_p_needbuff"] = true,
					["v_checkothercdname"] = "84714",
					["v_checkothercdvalue"] = "<1.5",
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "116014",
					["v_spellname"] = "116011",
				},
				["defaultRotation/mage/rune_of_power_icy_veins"] = {
					["b_p_havebuff"] = true,
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "12472",
					["v_p_needbuff"] = "116014",
					["v_spellname"] = "116011",
				},
				["defaultRotation/mage/rune_of_power_ray_of_frost"] = {
					["b_checkothercd"] = true,
					["b_p_needbuff"] = true,
					["v_checkothercdname"] = "205021",
					["v_checkothercdvalue"] = "<1.5",
					["v_durationstartedtime"] = 0,
					["v_p_needbuff"] = "116014",
					["v_spellname"] = "116011",
				},
				["defaultRotation/mage/spellsteal"] = {
					["b_t_spellsteal"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "30449",
				},
				["defaultRotation/mage/summon_water_elemental"] = {
					["b_p_knownotspell"] = true,
					["b_pet_hp"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_knownotspell"] = "205024",
					["v_pet_hp"] = "=0",
					["v_spellname"] = "31687",
				},
				["defaultRotation/mage/water_jet"] = {
					["b_notinspellbook"] = true,
					["b_p_knownotspell"] = true,
					["b_p_needbuff"] = true,
					["b_pet_hp"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_knownotspell"] = "205024",
					["v_p_needbuff"] = "44544",
					["v_pet_hp"] = ">0",
					["v_spellname"] = "135029",
				},
			},
			["SortedActions"] = {
				"defaultRotation/mage/ice_lance_winter_chill", -- [1]
				"defaultRotation/mage/ice_nova_winter_chill", -- [2]
				"defaultRotation/mage/counterspell", -- [3]
				"defaultRotation/mage/spellsteal", -- [4]
				"defaultRotation/mage/ice_barrier", -- [5]
				"defaultRotation/mage/summon_water_elemental", -- [6]
				"defaultRotation/mage/rune_of_power", -- [7]
				"defaultRotation/mage/rune_of_power_icy_veins", -- [8]
				"defaultRotation/mage/icy_veins", -- [9]
				"defaultRotation/mage/mirror_image", -- [10]
				"defaultRotation/mage/water_jet", -- [11]
				"defaultRotation/mage/rune_of_power_ray_of_frost", -- [12]
				"defaultRotation/mage/ray_of_frost", -- [13]
				"defaultRotation/mage/ice_lance_brain_freeze", -- [14]
				"defaultRotation/mage/flurry_glacial_spike", -- [15]
				"defaultRotation/mage/flurry", -- [16]
				"defaultRotation/mage/blizzard_frozen_rain", -- [17]
				"defaultRotation/mage/frost_bomb", -- [18]
				"defaultRotation/mage/ice_lance_fingers_of_frost", -- [19]
				"defaultRotation/mage/ebonbolt", -- [20]
				"defaultRotation/mage/rune_of_power_frozen_orb", -- [21]
				"defaultRotation/mage/frozen_orb", -- [22]
				"defaultRotation/mage/ice_nova", -- [23]
				"defaultRotation/mage/comet_storm", -- [24]
				"defaultRotation/mage/blizzard", -- [25]
				"defaultRotation/mage/ice_lance", -- [26]
				"defaultRotation/mage/glacial_spike", -- [27]
				"defaultRotation/mage/frostbolt", -- [28]
			},
			["bindindex"] = 0,
			["isMultiTarget"] = true,
			["specID"] = 3,
			["version"] = 8,
		},
	}

	return rotation;
end

local mageRotationsGeneratorData = {
	["generator"] = mageRotationsGenerator
};

RotationBuilder:addDefaultRotationsGenerator("MAGE", mageRotationsGeneratorData);