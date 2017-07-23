-- The default rotations generator for MAGES.
local mageRotationsGenerator = function ()
	local rotation = {
		["defaultRotation/mage/arcane"] = {
			["version"] = 5,
			["ActionList"] = {
				["defaultRotation/mage/counterspell"] = {
					["b_t_interrupt"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "2139",
				},
				["defaultRotation/mage/arcane_barrage_mana_85"] = {
					["v_p_needbuff"] = "12042",
					["b_checkothercd2"] = true,
					["v_p_unitpower2type"] = "0",
					["b_p_unitpower"] = true,
					["b_p_needbuff"] = true,
					["v_checkothercd2name"] = "12042",
					["v_p_unitpower2"] = "<85%",
					["v_checkothercd2value"] = ">0",
					["b_checkothercd"] = true,
					["v_p_unitpowertype"] = "16",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "44425",
					["b_p_unitpower2"] = true,
					["v_checkothercdvalue"] = ">30",
					["v_p_unitpower"] = ">=2",
					["v_checkothercdname"] = "12051",
				},
				["defaultRotation/mage/charged_up"] = {
					["v_p_needbuff"] = "12042",
					["b_p_needbuff"] = true,
					["b_checkothercd"] = true,
					["v_p_unitpowertype"] = "16",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "205032",
					["b_p_unitpower"] = true,
					["v_checkothercdvalue"] = ">45",
					["v_p_unitpower"] = "=0",
					["v_checkothercdname"] = "12042",
				},
				["defaultRotation/mage/rune_of_power"] = {
					["v_p_needbuff"] = "116014",
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "116011",
					["b_p_needbuff"] = true,
					["b_p_unitpower"] = true,
					["v_p_unitpower"] = "=4",
					["v_durationstartedtime"] = 0,
				},
				["defaultRotation/mage/arcane_power"] = {
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "12042",
					["v_durationstartedtime"] = 0,
					["v_p_unitpower"] = "=4",
					["b_p_unitpower"] = true,
				},
				["defaultRotation/mage/arcane_orb"] = {
					["v_p_needbuff"] = "12042",
					["v_gunitpowertype"] = "16",
					["v_gunitpower"] = "1",
					["b_gunitpower"] = true,
					["b_p_unitpower"] = true,
					["v_spellname"] = "153626",
					["v_durationstartedtime"] = 0,
					["v_p_unitpowertype"] = "16",
					["v_p_unitpower"] = "=0",
					["b_p_needbuff"] = true,
				},
				["defaultRotation/mage/arcane_missiles"] = {
					["v_gunitpowertype"] = "16",
					["b_p_unitpower"] = true,
					["v_p_unitpower"] = "=4",
					["b_hasproc"] = true,
					["b_checkothercd"] = true,
					["v_durationstartedtime"] = 0,
					["b_gunitpower"] = true,
					["v_spellname"] = "5143",
					["v_p_unitpowertype"] = "16",
					["v_checkothercdvalue"] = "<30",
					["v_gunitpower"] = "1",
					["v_checkothercdname"] = "12042",
				},
				["defaultRotation/mage/rune_of_power_2_charges"] = {
					["v_charges"] = "2",
					["b_charges"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116011",
				},
				["defaultRotation/mage/arcane_barrage_arcane_power"] = {
					["v_p_needbuff"] = "12042^1.5",
					["b_p_knowspell"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "44425",
					["b_p_needbuff"] = true,
					["b_p_havebuff"] = true,
					["v_p_havebuff"] = "12042",
					["v_p_knowspell"] = "205032",
				},
				["defaultRotation/mage/nether_tempest"] = {
					["v_p_needbuff"] = "12042",
					["b_p_needbuff"] = true,
					["v_p_unitpowertype"] = "16",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "114923",
					["b_t_needsdebuff"] = true,
					["v_t_needsdebuff"] = "_114923^4",
					["v_p_unitpower"] = "=4",
					["b_p_unitpower"] = true,
				},
				["defaultRotation/mage/mark_of_aluneth"] = {
					["v_p_needbuff"] = "12042",
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "224968",
				},
				["defaultRotation/mage/arcane_blast"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "30451",
					["v_gunitpowertype"] = "16",
					["v_gunitpower"] = "1",
					["b_gunitpower"] = true,
				},
				["defaultRotation/mage/arcane_barrage_mana"] = {
					["v_p_needbuff"] = "12042",
					["b_checkothercd2"] = true,
					["v_p_unitpower2type"] = "0",
					["v_p_unitpowertype"] = "16",
					["b_p_needbuff"] = true,
					["b_checkothercd"] = true,
					["v_p_unitpower2"] = "<75%",
					["v_checkothercd2value"] = ">0",
					["v_checkothercd2name"] = "12042",
					["v_durationstartedtime"] = 0,
					["b_p_unitpower"] = true,
					["v_spellname"] = "44425",
					["b_p_unitpower2"] = true,
					["v_checkothercdvalue"] = ">30",
					["v_p_unitpower"] = ">=1",
					["v_checkothercdname"] = "12051",
				},
				["defaultRotation/mage/arcane_missiles_mana"] = {
					["v_p_unitpower2type"] = "0",
					["v_gunitpowertype"] = "16",
					["v_p_unitpower2"] = "<75%",
					["b_hasproc"] = true,
					["b_checkothercd"] = true,
					["v_durationstartedtime"] = 0,
					["b_p_unitpower2"] = true,
					["v_spellname"] = "5143",
					["b_gunitpower"] = true,
					["v_checkothercdvalue"] = ">30",
					["v_gunitpower"] = "1",
					["v_checkothercdname"] = "12051",
				},
				["defaultRotation/mage/presence_of_mind"] = {
					["v_p_needbuff"] = "205025",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "205025",
					["b_p_needbuff"] = true,
					["v_p_havebuff"] = "12042",
					["b_p_havebuff"] = true,
				},
				["defaultRotation/mage/arcane_missiles_mana_85"] = {
					["v_p_unitpower2type"] = "0",
					["b_p_unitpower"] = true,
					["v_p_unitpower"] = ">=2",
					["v_gunitpowertype"] = "16",
					["v_p_unitpowertype"] = "16",
					["v_p_unitpower2"] = "<85%",
					["b_hasproc"] = true,
					["b_checkothercd"] = true,
					["b_p_unitpower2"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "5143",
					["b_gunitpower"] = true,
					["v_checkothercdvalue"] = ">30",
					["v_gunitpower"] = "1",
					["v_checkothercdname"] = "12051",
				},
				["defaultRotation/mage/arcane_blast_evocation"] = {
					["v_lastcasted"] = "12051",
					["b_gunitpower"] = true,
					["v_spellname"] = "30451",
					["b_lastcasted"] = true,
					["v_durationstartedtime"] = 0,
					["v_gunitpower"] = "1",
					["v_gunitpowertype"] = "16",
				},
				["defaultRotation/mage/evocation"] = {
					["v_p_unitpowertype"] = "0",
					["v_spellname"] = "12051",
					["b_p_unitpower"] = true,
					["v_p_unitpower"] = "<15%",
					["v_durationstartedtime"] = 0,
				},
				["defaultRotation/mage/arcane_barrage"] = {
					["v_p_needbuff"] = "12042",
					["b_p_needbuff"] = true,
					["v_spellname"] = "44425",
					["b_p_unitpower"] = true,
					["v_checkothercd2value"] = ">0",
					["b_checkothercd"] = true,
					["v_checkothercd2name"] = "12042",
					["v_p_unitpowertype"] = "16",
					["b_checkothercd2"] = true,
					["v_durationstartedtime"] = 0,
					["v_checkothercdvalue"] = ">30",
					["v_p_unitpower"] = "=4",
					["v_checkothercdname"] = "12051",
				},
				["defaultRotation/mage/mirror_image"] = {
					["b_isCustomCase1"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "55342",
				},
				["defaultRotation/mage/arcane_missiles_3_charges"] = {
					["v_gunitpowertype"] = "16",
					["v_durationstartedtime"] = 0,
					["b_hasproc"] = true,
					["b_checkothercd"] = true,
					["v_gunitpower"] = "1",
					["b_gunitpower"] = true,
					["v_spellname"] = "5143",
					["b_p_havebuff"] = true,
					["v_checkothercdvalue"] = ">0",
					["v_p_havebuff"] = "79743#3",
					["v_checkothercdname"] = "12042",
				},
				["defaultRotation/mage/arcane_missiles_arcane_power"] = {
					["v_gunitpowertype"] = "16",
					["b_hasproc"] = true,
					["b_checkothercd"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "5143",
					["b_gunitpower"] = true,
					["v_checkothercdvalue"] = ">45",
					["v_gunitpower"] = "1",
					["v_checkothercdname"] = "12042",
				},
				["defaultRotation/mage/prismatic_barrier"] = {
					["v_p_needbuff"] = "235450||12042",
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "235450",
				},
				["defaultRotation/mage/supernova"] = {
					["b_p_needbuff"] = true,
					["v_p_needbuff"] = "12042",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "157980",
				},
				["defaultRotation/mage/arcane_familiar"] = {
					["v_p_needbuff"] = "210126",
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "205022",
				},
				["defaultRotation/mage/spellsteal"] = {
					["b_t_spellsteal"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "30449",
				},
			},
			["specID"] = 1,
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
		},
		["defaultRotation/mage/arcane_multi"] = {
			["version"] = 2,
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
			["ActionList"] = {
				["defaultRotation/mage/counterspell"] = {
					["b_t_interrupt"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "2139",
				},
				["defaultRotation/mage/arcane_barrage_mana_85"] = {
					["v_p_needbuff"] = "12042",
					["b_checkothercd2"] = true,
					["v_p_unitpower2type"] = "0",
					["v_durationstartedtime"] = 0,
					["b_checkothercd"] = true,
					["v_p_unitpower2"] = "<85%",
					["v_checkothercd2value"] = ">0",
					["v_checkothercd2name"] = "12042",
					["v_p_unitpowertype"] = "16",
					["b_p_unitpower"] = true,
					["v_spellname"] = "44425",
					["b_p_unitpower2"] = true,
					["v_checkothercdvalue"] = ">30",
					["v_p_unitpower"] = ">=2",
					["v_checkothercdname"] = "12051",
				},
				["defaultRotation/mage/charged_up"] = {
					["v_p_needbuff"] = "12042",
					["b_p_needbuff"] = true,
					["b_checkothercd"] = true,
					["v_p_unitpowertype"] = "16",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "205032",
					["b_p_unitpower"] = true,
					["v_checkothercdvalue"] = ">45",
					["v_p_unitpower"] = "=0",
					["v_checkothercdname"] = "12042",
				},
				["defaultRotation/mage/rune_of_power"] = {
					["v_p_needbuff"] = "116014",
					["b_p_unitpower"] = true,
					["v_spellname"] = "116011",
					["b_p_needbuff"] = true,
					["v_p_unitpowertype"] = "16",
					["v_p_unitpower"] = "=4",
					["v_durationstartedtime"] = 0,
				},
				["defaultRotation/mage/arcane_barrage_mana"] = {
					["v_p_needbuff"] = "12042",
					["b_checkothercd2"] = true,
					["v_p_unitpower2type"] = "0",
					["v_p_unitpowertype"] = "16",
					["b_p_needbuff"] = true,
					["v_checkothercd2name"] = "12042",
					["v_p_unitpower2"] = "<75%",
					["v_checkothercd2value"] = ">0",
					["b_checkothercd"] = true,
					["v_durationstartedtime"] = 0,
					["b_p_unitpower"] = true,
					["v_spellname"] = "44425",
					["b_p_unitpower2"] = true,
					["v_checkothercdvalue"] = ">30",
					["v_p_unitpower"] = ">=1",
					["v_checkothercdname"] = "12051",
				},
				["defaultRotation/mage/mark_of_aluneth"] = {
					["v_p_needbuff"] = "12042",
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "224968",
				},
				["defaultRotation/mage/arcane_missiles"] = {
					["v_gunitpowertype"] = "16",
					["b_p_unitpower"] = true,
					["v_p_unitpower"] = "=4",
					["b_hasproc"] = true,
					["b_checkothercd"] = true,
					["b_gunitpower"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "5143",
					["v_p_unitpowertype"] = "16",
					["v_checkothercdvalue"] = "<30",
					["v_gunitpower"] = "1",
					["v_checkothercdname"] = "12042",
				},
				["defaultRotation/mage/rune_of_power_2_charges"] = {
					["b_charges"] = true,
					["v_charges"] = "2",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116011",
				},
				["defaultRotation/mage/arcane_barrage_arcane_power"] = {
					["v_p_needbuff"] = "12042^1.5",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "44425",
					["b_p_needbuff"] = true,
					["v_p_havebuff"] = "12042",
					["b_p_havebuff"] = true,
				},
				["defaultRotation/mage/nether_tempest"] = {
					["v_p_needbuff"] = "12042",
					["b_p_needbuff"] = true,
					["b_p_unitpower"] = true,
					["v_p_unitpowertype"] = "16",
					["v_spellname"] = "114923",
					["b_t_needsdebuff"] = true,
					["v_t_needsdebuff"] = "_114923^4",
					["v_p_unitpower"] = "=4",
					["v_durationstartedtime"] = 0,
				},
				["defaultRotation/mage/arcane_orb"] = {
					["v_p_needbuff"] = "12042",
					["v_gunitpowertype"] = "16",
					["v_p_unitpower"] = "=0",
					["b_gunitpower"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "153626",
					["v_p_unitpowertype"] = "16",
					["b_p_unitpower"] = true,
					["v_gunitpower"] = "1",
					["b_p_needbuff"] = true,
				},
				["defaultRotation/mage/arcane_power"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "12042",
					["b_p_unitpower"] = true,
					["v_p_unitpower"] = "=4",
					["v_p_unitpowertype"] = "16",
				},
				["defaultRotation/mage/arcane_missiles_mana"] = {
					["v_p_unitpower2type"] = "0",
					["v_gunitpowertype"] = "16",
					["v_p_unitpower2"] = "<75%",
					["b_hasproc"] = true,
					["b_checkothercd"] = true,
					["b_gunitpower"] = true,
					["b_p_unitpower2"] = true,
					["v_spellname"] = "5143",
					["v_durationstartedtime"] = 0,
					["v_checkothercdvalue"] = ">30",
					["v_gunitpower"] = "1",
					["v_checkothercdname"] = "12051",
				},
				["defaultRotation/mage/arcane_blast_evocation"] = {
					["v_lastcasted"] = "12051",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "30451",
					["b_lastcasted"] = true,
					["b_gunitpower"] = true,
					["v_gunitpower"] = "1",
					["v_gunitpowertype"] = "16",
				},
				["defaultRotation/mage/arcane_barrage"] = {
					["v_p_needbuff"] = "12042",
					["b_p_needbuff"] = true,
					["b_p_unitpower"] = true,
					["v_checkothercd2name"] = "12042",
					["v_checkothercd2value"] = ">0",
					["b_checkothercd"] = true,
					["v_durationstartedtime"] = 0,
					["v_p_unitpowertype"] = "16",
					["b_checkothercd2"] = true,
					["v_spellname"] = "44425",
					["v_checkothercdvalue"] = ">30",
					["v_p_unitpower"] = "=4",
					["v_checkothercdname"] = "12051",
				},
				["defaultRotation/mage/prismatic_barrier"] = {
					["v_p_needbuff"] = "235450||12042",
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "235450",
				},
				["defaultRotation/mage/presence_of_mind"] = {
					["v_p_needbuff"] = "205025",
					["b_p_havebuff"] = true,
					["v_spellname"] = "205025",
					["b_p_needbuff"] = true,
					["v_p_havebuff"] = "12042",
					["v_durationstartedtime"] = 0,
				},
				["defaultRotation/mage/arcane_explosion"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "1449",
					["v_gunitpowertype"] = "16",
					["v_gunitpower"] = "1",
					["b_gunitpower"] = true,
				},
				["defaultRotation/mage/evocation"] = {
					["v_p_unitpowertype"] = "0",
					["v_spellname"] = "12051",
					["v_durationstartedtime"] = 0,
					["v_p_unitpower"] = "<15%",
					["b_p_unitpower"] = true,
				},
				["defaultRotation/mage/mirror_image"] = {
					["b_isCustomCase1"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "55342",
				},
				["defaultRotation/mage/arcane_missiles_3_charges"] = {
					["v_gunitpowertype"] = "16",
					["b_gunitpower"] = true,
					["b_hasproc"] = true,
					["b_checkothercd"] = true,
					["v_gunitpower"] = "1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "5143",
					["b_p_havebuff"] = true,
					["v_checkothercdvalue"] = ">0",
					["v_p_havebuff"] = "79743#3",
					["v_checkothercdname"] = "12042",
				},
				["defaultRotation/mage/arcane_missiles_arcane_power"] = {
					["v_gunitpowertype"] = "16",
					["b_hasproc"] = true,
					["b_checkothercd"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "5143",
					["b_gunitpower"] = true,
					["v_checkothercdvalue"] = ">45",
					["v_gunitpower"] = "1",
					["v_checkothercdname"] = "12042",
				},
				["defaultRotation/mage/arcane_missiles_mana_85"] = {
					["v_p_unitpower2type"] = "0",
					["b_p_unitpower2"] = true,
					["v_gunitpower"] = "1",
					["v_gunitpowertype"] = "16",
					["b_gunitpower"] = true,
					["v_p_unitpower2"] = "<85%",
					["b_hasproc"] = true,
					["b_checkothercd"] = true,
					["b_p_unitpower"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "5143",
					["v_p_unitpowertype"] = "16",
					["v_checkothercdvalue"] = ">30",
					["v_p_unitpower"] = ">=2",
					["v_checkothercdname"] = "12051",
				},
				["defaultRotation/mage/supernova"] = {
					["b_p_needbuff"] = true,
					["v_p_needbuff"] = "12042",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "157980",
				},
				["defaultRotation/mage/arcane_familiar"] = {
					["v_p_needbuff"] = "210126",
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "205022",
				},
				["defaultRotation/mage/spellsteal"] = {
					["b_t_spellsteal"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "30449",
				},
			},
			["specID"] = 1,
			["bindindex"] = 0,
			["isMultiTarget"] = true,
		},
		["defaultRotation/mage/fire"] = {
			["version"] = 5,
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
			["specID"] = 2,
			["ActionList"] = {
				["defaultRotation/mage/counterspell"] = {
					["b_t_interrupt"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "2139",
				},
				["defaultRotation/mage/cinderstorm"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "198929",
				},
				["defaultRotation/mage/pyroblast"] = {
					["v_spellname"] = "11366",
					["v_durationstartedtime"] = 0,
					["b_hasproc"] = true,
				},
				["defaultRotation/mage/fire_blast"] = {
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "48107^1.5",
					["b_p_havebuff"] = true,
					["v_spellname"] = "108853",
				},
				["defaultRotation/mage/combustion"] = {
					["v_p_havebuff"] = "48108",
					["b_p_havebuff"] = true,
					["v_otherchargesname"] = "194466",
					["v_spellname"] = "190319",
					["v_durationstartedtime"] = 0,
					["v_othercharges"] = ">1",
					["b_isCustomCase1"] = true,
					["b_othercharges"] = true,
				},
				["defaultRotation/mage/phoenix_flames_combustion_soon"] = {
					["v_p_needbuff"] = "190319",
					["b_p_needbuff"] = true,
					["b_charges"] = true,
					["b_checkothercd"] = true,
					["v_durationstartedtime"] = 0,
					["v_charges"] = "3",
					["v_checkothercdvalue"] = "<=45",
					["v_spellname"] = "194466",
					["v_checkothercdname"] = "190319",
				},
				["defaultRotation/mage/phoenix_flames_combustion"] = {
					["v_p_havebuff"] = "190319",
					["v_otherchargesname"] = "108853",
					["v_spellname"] = "194466",
					["b_p_havebuff"] = true,
					["v_durationstartedtime"] = 0,
					["b_othercharges"] = true,
					["v_othercharges"] = "0",
				},
				["defaultRotation/mage/fireball"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "133",
				},
				["defaultRotation/mage/scorch_combustion"] = {
					["b_p_havebuff"] = true,
					["v_p_havebuff"] = "190319",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "2948",
				},
				["defaultRotation/mage/scorch"] = {
					["b_moving"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "2948",
				},
				["defaultRotation/mage/phoenix_flames"] = {
					["v_p_needbuff"] = "190319",
					["b_p_needbuff"] = true,
					["b_charges"] = true,
					["b_checkothercd"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "194466",
					["v_checkothercdvalue"] = ">45",
					["v_charges"] = ">=2",
					["v_checkothercdname"] = "190319",
				},
				["defaultRotation/mage/rune_of_power_combustion"] = {
					["v_p_needbuff"] = "116014",
					["b_checkothercd"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116011",
					["b_p_needbuff"] = true,
					["v_checkothercdvalue"] = "<1.5",
					["b_isCustomCase1"] = true,
					["v_checkothercdname"] = "190319",
				},
				["defaultRotation/mage/blazing_barrier"] = {
					["b_p_needbuff"] = true,
					["v_p_needbuff"] = "235313",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "235313",
				},
				["defaultRotation/mage/rune_of_power"] = {
					["v_spellname"] = "116011",
					["v_charges"] = "2",
					["v_durationstartedtime"] = 0,
					["b_charges"] = true,
				},
				["defaultRotation/mage/mirror_image"] = {
					["v_durationstartedtime"] = 0,
					["b_isCustomCase1"] = true,
					["v_spellname"] = "55342",
				},
				["defaultRotation/mage/dragon_breath"] = {
					["b_p_knowspell"] = true,
					["v_p_knowspell"] = "235870",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "31661",
				},
				["defaultRotation/mage/spellsteal"] = {
					["b_t_spellsteal"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "30449",
				},
			},
			["bindindex"] = 0,
		},
		["defaultRotation/mage/fire_multi"] = {
			["version"] = 2,
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
			["ActionList"] = {
				["defaultRotation/mage/counterspell"] = {
					["v_spellname"] = "2139",
					["v_durationstartedtime"] = 0,
					["b_t_interrupt"] = true,
				},
				["defaultRotation/mage/cinderstorm"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "198929",
				},
				["defaultRotation/mage/rune_of_power"] = {
					["b_charges"] = true,
					["v_spellname"] = "116011",
					["v_durationstartedtime"] = 0,
					["v_charges"] = "2",
				},
				["defaultRotation/mage/meteor"] = {
					["v_togglename"] = "Toggle 1",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "153561",
				},
				["defaultRotation/mage/fire_blast"] = {
					["v_p_havebuff"] = "48107^1.5",
					["v_durationstartedtime"] = 0,
					["b_p_havebuff"] = true,
					["v_spellname"] = "108853",
				},
				["defaultRotation/mage/combustion"] = {
					["b_p_havebuff"] = true,
					["v_p_havebuff"] = "48108",
					["v_otherchargesname"] = "194466",
					["v_spellname"] = "190319",
					["v_durationstartedtime"] = 0,
					["b_isCustomCase1"] = true,
					["b_othercharges"] = true,
					["v_othercharges"] = ">1",
				},
				["defaultRotation/mage/phoenix_flames_combustion_soon"] = {
					["v_p_needbuff"] = "190319",
					["b_p_needbuff"] = true,
					["b_charges"] = true,
					["b_checkothercd"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "194466",
					["v_checkothercdvalue"] = "<=45",
					["v_charges"] = "3",
					["v_checkothercdname"] = "190319",
				},
				["defaultRotation/mage/phoenix_flames_combustion"] = {
					["v_otherchargesname"] = "108853",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "194466",
					["v_p_havebuff"] = "190319",
					["v_othercharges"] = "0",
					["b_othercharges"] = true,
					["b_p_havebuff"] = true,
				},
				["defaultRotation/mage/fireball"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "133",
				},
				["defaultRotation/mage/scorch_combustion"] = {
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "190319",
					["b_p_havebuff"] = true,
					["v_spellname"] = "2948",
				},
				["defaultRotation/mage/flamestrke"] = {
					["b_hasproc"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "2120",
				},
				["defaultRotation/mage/phoenix_flames"] = {
					["v_p_needbuff"] = "190319",
					["b_p_needbuff"] = true,
					["b_charges"] = true,
					["b_checkothercd"] = true,
					["v_durationstartedtime"] = 0,
					["v_charges"] = ">=2",
					["v_checkothercdvalue"] = ">45",
					["v_spellname"] = "194466",
					["v_checkothercdname"] = "190319",
				},
				["defaultRotation/mage/mirror_image"] = {
					["b_isCustomCase1"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "55342",
				},
				["defaultRotation/mage/dragon_breath"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "31661",
				},
				["defaultRotation/mage/living_bomb"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "44457",
				},
				["defaultRotation/mage/blazing_barrier"] = {
					["b_p_needbuff"] = true,
					["v_p_needbuff"] = "235313",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "235313",
				},
				["defaultRotation/mage/rune_of_power_combustion"] = {
					["v_p_needbuff"] = "116014",
					["b_checkothercd"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116011",
					["b_p_needbuff"] = true,
					["v_checkothercdvalue"] = "<1.5",
					["b_isCustomCase1"] = true,
					["v_checkothercdname"] = "190319",
				},
				["defaultRotation/mage/scorch"] = {
					["b_moving"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "2948",
				},
				["defaultRotation/mage/spellsteal"] = {
					["b_t_spellsteal"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "30449",
				},
			},
			["specID"] = 2,
			["isMultiTarget"] = true,
		},
		["defaultRotation/mage/frost"] = {
			["bindindex"] = 0,
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
				"defaultRotation/mage/flurry_glacial_spike", -- [14]
				"defaultRotation/mage/flurry", -- [15]
				"defaultRotation/mage/frost_bomb", -- [16]
				"defaultRotation/mage/ice_lance_fingers_of_frost", -- [17]
				"defaultRotation/mage/ebonbolt", -- [18]
				"defaultRotation/mage/rune_of_power_frozen_orb", -- [19]
				"defaultRotation/mage/frozen_orb", -- [20]
				"defaultRotation/mage/ice_nova", -- [21]
				"defaultRotation/mage/ice_lance", -- [22]
				"defaultRotation/mage/glacial_spike", -- [23]
				"defaultRotation/mage/frostbolt", -- [24]
			},
			["specID"] = 3,
			["version"] = 6,
			["ActionList"] = {
				["defaultRotation/mage/flurry"] = {
					["v_p_knownotspell"] = "199786",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "44614",
					["b_p_knownotspell"] = true,
					["v_p_havebuff"] = "190446",
					["b_p_havebuff"] = true,
				},
				["defaultRotation/mage/summon_water_elemental"] = {
					["v_p_knownotspell"] = "205024",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "31687",
					["b_p_knownotspell"] = true,
					["v_pet_hp"] = "=0",
					["b_pet_hp"] = true,
				},
				["defaultRotation/mage/rune_of_power_ray_of_frost"] = {
					["v_p_needbuff"] = "116014",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116011",
					["b_p_needbuff"] = true,
					["v_checkothercdvalue"] = "<1.5",
					["b_checkothercd"] = true,
					["v_checkothercdname"] = "205021",
				},
				["defaultRotation/mage/rune_of_power"] = {
					["b_charges"] = true,
					["v_charges"] = "2",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116011",
				},
				["defaultRotation/mage/frostbolt"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116",
				},
				["defaultRotation/mage/glacial_spike"] = {
					["b_hasproc"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "199786",
				},
				["defaultRotation/mage/icy_veins"] = {
					["b_isCustomCase1"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "12472",
				},
				["defaultRotation/mage/ice_barrier"] = {
					["v_p_needbuff"] = "11426",
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "11426",
				},
				["defaultRotation/mage/ice_nova"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "157997",
				},
				["defaultRotation/mage/frost_bomb"] = {
					["v_t_needsdebuff"] = "_112948",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "112948",
					["b_t_needsdebuff"] = true,
					["v_p_havebuff"] = "44544#1",
					["b_p_havebuff"] = true,
				},
				["defaultRotation/mage/spellsteal"] = {
					["b_t_spellsteal"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "30449",
				},
				["defaultRotation/mage/ray_of_frost"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "205021",
				},
				["defaultRotation/mage/flurry_glacial_spike"] = {
					["v_p_needbuff"] = "205473#3",
					["b_p_knowspell"] = true,
					["b_p_havebuff"] = true,
					["v_spellname"] = "44614",
					["v_p_knowspell"] = "199786",
					["v_durationstartedtime"] = 0,
					["v_p_havebuff"] = "190446",
					["b_p_needbuff"] = true,
				},
				["defaultRotation/mage/rune_of_power_frozen_orb"] = {
					["v_p_needbuff"] = "116014",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116011",
					["b_p_needbuff"] = true,
					["v_checkothercdvalue"] = "<1.5",
					["b_checkothercd"] = true,
					["v_checkothercdname"] = "84714",
				},
				["defaultRotation/mage/ice_lance"] = {
					["b_hasproc"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "30455",
				},
				["defaultRotation/mage/frozen_orb"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "84714",
				},
				["defaultRotation/mage/ice_nova_winter_chill"] = {
					["v_t_hasdebuff"] = "_228358",
					["v_spellname"] = "157997",
					["v_durationstartedtime"] = 0,
					["b_t_hasdebuff"] = true,
				},
				["defaultRotation/mage/mirror_image"] = {
					["b_isCustomCase1"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "55342",
				},
				["defaultRotation/mage/counterspell"] = {
					["b_t_interrupt"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "2139",
				},
				["defaultRotation/mage/water_jet"] = {
					["v_p_needbuff"] = "44544",
					["b_p_needbuff"] = true,
					["v_p_knownotspell"] = "205024",
					["v_durationstartedtime"] = 0,
					["v_pet_hp"] = ">0",
					["b_notinspellbook"] = true,
					["b_p_knownotspell"] = true,
					["v_spellname"] = "135029",
					["b_pet_hp"] = true,
				},
				["defaultRotation/mage/ice_lance_fingers_of_frost"] = {
					["b_checkothercd"] = true,
					["v_checkothercdname"] = "12472",
					["b_p_havebuff"] = true,
					["v_spellname"] = "30455",
					["v_durationstartedtime"] = 0,
					["v_checkothercdvalue"] = ">10",
					["v_p_havebuff"] = "44544#3",
					["b_hasproc"] = true,
				},
				["defaultRotation/mage/ebonbolt"] = {
					["v_p_needbuff"] = "190446",
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "214634",
				},
				["defaultRotation/mage/ice_lance_winter_chill"] = {
					["v_maxcasts"] = "1",
					["b_t_hasdebuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "30455",
					["b_maxcasts"] = true,
					["v_t_hasdebuff"] = "_228358",
				},
				["defaultRotation/mage/rune_of_power_icy_veins"] = {
					["v_p_needbuff"] = "116014",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116011",
					["b_p_needbuff"] = true,
					["v_p_havebuff"] = "12472",
					["b_p_havebuff"] = true,
				},
			},
		},
		["defaultRotation/mage/frost_multi"] = {
			["bindindex"] = 0,
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
				"defaultRotation/mage/flurry_glacial_spike", -- [14]
				"defaultRotation/mage/flurry", -- [15]
				"defaultRotation/mage/blizzard_frozen_rain", -- [16]
				"defaultRotation/mage/frost_bomb", -- [17]
				"defaultRotation/mage/ice_lance_fingers_of_frost", -- [18]
				"defaultRotation/mage/ebonbolt", -- [19]
				"defaultRotation/mage/rune_of_power_frozen_orb", -- [20]
				"defaultRotation/mage/frozen_orb", -- [21]
				"defaultRotation/mage/ice_nova", -- [22]
				"defaultRotation/mage/comet_storm", -- [23]
				"defaultRotation/mage/blizzard", -- [24]
				"defaultRotation/mage/ice_lance", -- [25]
				"defaultRotation/mage/glacial_spike", -- [26]
				"defaultRotation/mage/frostbolt", -- [27]
			},
			["ActionList"] = {
				["defaultRotation/mage/flurry"] = {
					["v_p_knownotspell"] = "199786",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "44614",
					["b_p_knownotspell"] = true,
					["v_p_havebuff"] = "190446",
					["b_p_havebuff"] = true,
				},
				["defaultRotation/mage/summon_water_elemental"] = {
					["v_p_knownotspell"] = "205024",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "31687",
					["b_p_knownotspell"] = true,
					["v_pet_hp"] = "=0",
					["b_pet_hp"] = true,
				},
				["defaultRotation/mage/rune_of_power_ray_of_frost"] = {
					["v_p_needbuff"] = "116014",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116011",
					["b_p_needbuff"] = true,
					["v_checkothercdvalue"] = "<1.5",
					["b_checkothercd"] = true,
					["v_checkothercdname"] = "205021",
				},
				["defaultRotation/mage/blizzard"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "190356",
				},
				["defaultRotation/mage/frostbolt"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116",
				},
				["defaultRotation/mage/glacial_spike"] = {
					["b_hasproc"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "199786",
				},
				["defaultRotation/mage/icy_veins"] = {
					["b_isCustomCase1"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "12472",
				},
				["defaultRotation/mage/ice_barrier"] = {
					["v_p_needbuff"] = "11426",
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "11426",
				},
				["defaultRotation/mage/ice_nova"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "157997",
				},
				["defaultRotation/mage/frost_bomb"] = {
					["v_t_needsdebuff"] = "_112948",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "112948",
					["b_t_needsdebuff"] = true,
					["v_p_havebuff"] = "44544#1",
					["b_p_havebuff"] = true,
				},
				["defaultRotation/mage/blizzard_frozen_rain"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "190356",
				},
				["defaultRotation/mage/rune_of_power_icy_veins"] = {
					["v_p_needbuff"] = "116014",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116011",
					["b_p_needbuff"] = true,
					["v_p_havebuff"] = "12472",
					["b_p_havebuff"] = true,
				},
				["defaultRotation/mage/rune_of_power"] = {
					["b_charges"] = true,
					["v_charges"] = "2",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116011",
				},
				["defaultRotation/mage/ebonbolt"] = {
					["v_p_needbuff"] = "190446",
					["b_p_needbuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "214634",
				},
				["defaultRotation/mage/flurry_glacial_spike"] = {
					["v_p_needbuff"] = "205473#3",
					["b_p_havebuff"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "44614",
					["v_p_knowspell"] = "199786",
					["b_p_knowspell"] = true,
					["v_p_havebuff"] = "190446",
					["b_p_needbuff"] = true,
				},
				["defaultRotation/mage/frozen_orb"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "84714",
				},
				["defaultRotation/mage/rune_of_power_frozen_orb"] = {
					["v_p_needbuff"] = "116014",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "116011",
					["b_p_needbuff"] = true,
					["v_checkothercdvalue"] = "<1.5",
					["b_checkothercd"] = true,
					["v_checkothercdname"] = "84714",
				},
				["defaultRotation/mage/ice_nova_winter_chill"] = {
					["v_t_hasdebuff"] = "_228358",
					["v_spellname"] = "157997",
					["v_durationstartedtime"] = 0,
					["b_t_hasdebuff"] = true,
				},
				["defaultRotation/mage/comet_storm"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "153595",
				},
				["defaultRotation/mage/ice_lance_winter_chill"] = {
					["v_durationstartedtime"] = 0,
					["b_t_hasdebuff"] = true,
					["v_maxcasts"] = "1",
					["v_spellname"] = "30455",
					["b_maxcasts"] = true,
					["v_t_hasdebuff"] = "_228358",
				},
				["defaultRotation/mage/mirror_image"] = {
					["b_isCustomCase1"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "55342",
				},
				["defaultRotation/mage/counterspell"] = {
					["b_t_interrupt"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "2139",
				},
				["defaultRotation/mage/water_jet"] = {
					["v_p_needbuff"] = "44544",
					["b_p_needbuff"] = true,
					["v_p_knownotspell"] = "205024",
					["v_durationstartedtime"] = 0,
					["v_pet_hp"] = ">0",
					["v_spellname"] = "135029",
					["b_p_knownotspell"] = true,
					["b_notinspellbook"] = true,
					["b_pet_hp"] = true,
				},
				["defaultRotation/mage/ice_lance_fingers_of_frost"] = {
					["b_checkothercd"] = true,
					["v_checkothercdname"] = "12472",
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "30455",
					["b_p_havebuff"] = true,
					["v_checkothercdvalue"] = ">10",
					["v_p_havebuff"] = "44544#3",
					["b_hasproc"] = true,
				},
				["defaultRotation/mage/ice_lance"] = {
					["v_spellname"] = "30455",
					["v_durationstartedtime"] = 0,
					["b_hasproc"] = true,
				},
				["defaultRotation/mage/ray_of_frost"] = {
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "205021",
				},
				["defaultRotation/mage/spellsteal"] = {
					["b_t_spellsteal"] = true,
					["v_durationstartedtime"] = 0,
					["v_spellname"] = "30449",
				},
			},
			["specID"] = 3,
			["version"] = 6,
			["isMultiTarget"] = true,
		},
	}

	return rotation;
end

local mageRotationsGeneratorData = {
	["generator"] = mageRotationsGenerator
};

RotationBuilder:addDefaultRotationsGenerator("MAGE", mageRotationsGeneratorData);