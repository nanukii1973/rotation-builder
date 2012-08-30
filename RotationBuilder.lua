-- Action Options
-- Adding an Option instructions
-- 1. Add the new option to ROB_NewActionDefaults table below
-- 2. Create the gui control in RotationBuilder.xml search for "ADD_OPTIONS_BELOW_THIS_LINE"
-- 3. Create the on click, on_update functions for new option search IF NEEDED for "ADD_OPTION_FUNCTIONS_BELOW_THIS"
-- 4. Have to retrieve and set gui values search for "RETRIEVE_NEW_OPTIONS_BELOW"
-- 5. Make sure your script calls in XML dont call the wrong functions

-- Rotation Options
-- 1. Create the new option/gui in xml search for "ROB_RotationNameInputBox" as example
-- 2. Update the rotations options when user clicks create button search for "UPDATE_ROTATION_OPTIONS1"
-- 3. Update the rotations options when user clicks modify button search for "UPDATE_ROTATION_OPTIONS2"
-- 4. Create the functions for the xml search for "ROB_RotationNameInputBox_OnTextChanged" as example
-- 5. Add show new widgets in update ui search for "ADD_SHOW_ROTATION_OPTIONS"
-- 6. Add hide new widgeets in update ui search for "ADD_HIDE_ROTATION_OPTIONS"
-- 7. Add retrieve rotation settings search for "RETRIEVE_ROTATION_SETTINGS"
-- 8. Make sure your script calls in XML dont call the wrong functions



local ROB_VERSION                   = GetAddOnMetadata("RotationBuilder", "Version");
BINDING_HEADER_ROB                  = "Rotation Builder";
BINDING_NAME_ROB_TOGGLE             = "Show/Hide Rotation Builder";
ROB_UPDATE_INTERVAL                 = 0.2;      -- How often the OnUpdate code will run (in seconds)

local ROB_ROTATION_TYPE             = { EDITING=1, SELECTED=2 };

-- Scroll Frame Lines
local ROB_ROTATION_LIST_LINES       = 9;
local ROB_ACTION_LIST_LINES         = 21;
ROB_ROTATION_LIST_FRAME_HEIGHT      = 16;
ROB_ACTION_LIST_FRAME_HEIGHT        = 20;

ROB_TOGGLE_1                        = 0
ROB_TOGGLE_2                        = 0
ROB_TOGGLE_3                        = 0
ROB_TOGGLE_4                        = 0

-- Initial Options
local ROB_Options_Default           =
{
	MiniMap                          = true;
	MiniMapPos                       = 300;
	MiniMapRad                       = 80;
	LockIcons                        = true;
	AllowOverwrite                   = false;
	ExportBinds                      = false;
	HideCD                           = false;
	IconsX                           = 0;
	IconsY                           = 0;
	IconScale                        = 1;
	UIScale                          = 1;
	ToggleIconsA                     = 1;
	CurrentIconA                     = 1;
	NextIconA                        = 1;
	NextIconLocation                 = "BOTTOM";
	loaddefault                      = true;
	lastrotation                     = "";
	updaterate                       = 5;
	CABSkin                          = {};
	NABSkin                          = {};
	T1Skin                           = {};
	T2Skin                           = {};
	T3Skin                           = {};
	T4Skin                           = {};
}

local ROB_NewActionDefaults = {
	--General Options---------------
	b_toggle=false,
	v_togglename="Toggle 1",
	v_toggleicon="",
	b_toggleoff=false,
	b_toggleon=false,
	b_rangecheck=true,
	b_ccbreaker=false,
	b_holypower=false,
	v_keybind="<keybind>",
	v_spellname="<spell name>",
	v_actionicon="",
	v_gcdspell="",
	v_rangespell="",
	b_maxcasts=false,
	v_maxcasts="",
	b_mobcount=false,
	v_mobcount="",
	b_lastcasted=false,
	v_lastcasted="",
	b_breakchanneling=false,
	v_breakchanneling="",
	b_moving=false,
	b_notmoving=false,

	b_gunitpower=false,
	v_gunitpowertype="",
	v_gunitpower="",

	b_gcombopoints=false,
	v_gcombopoints="",

	b_gbloodrunes=false,
	v_gbloodrunes="",
	b_gfrostrunes=false,
	v_gfrostrunes="",
	b_gunholyrunes=false,
	v_gunholyrunes="",
	b_gdeathrunes=false,
	v_gdeathrunes="",

	b_checkothercd=false,
	v_checkothercdname="",
	v_checkothercdvalue="",

	b_duration=false,
	v_duration="",
	v_durationstartedtime=0,
	b_notaspell=false,
	v_oorspell="",
	b_oorspell=false,
	b_debug=false,
	b_disabled=false,
	--Player Options---------------
	b_p_hp=false,
	v_p_hp="",
	b_p_poison=false,
	b_p_magic=false,
	b_p_disease=false,
	b_p_curse=false,
	b_p_needbuff=false,
	v_p_needbuff="",
	b_p_havebuff=false,
	v_p_havebuff="",
	b_p_needdebuff=false,
	v_p_needdebuff="",
	b_p_havedebuff=false,
	v_p_havedebuff="",
	b_p_unitpower=false,
	v_p_unitpower="",
	v_p_unitpowertype="",
	b_p_bloodrunes=false,
	v_p_bloodrunes="",
	b_p_frostrunes=false,
	v_p_frostrunes="",
	b_p_unholyrunes=false,
	v_p_unholyrunes="",
	b_p_deathrunes=false,
	v_p_deathrunes="",

	b_p_combopoints=false,
	v_p_combopoints="",
	b_p_eclipse=false,
	v_p_eclipse="",

	b_p_firetotemactive=false,
	v_p_firetotemactive="",
	b_p_firetoteminactive=false,
	v_p_firetoteminactive="",
	b_p_firetotemtimeleft=false,
	v_p_firetotemtimeleft="",

	b_p_earthtotemactive=false,
	v_p_earthtotemactive="",
	b_p_earthtoteminactive=false,
	v_p_earthtoteminactive="",
	b_p_earthtotemtimeleft=false,
	v_p_earthtotemtimeleft="",

	b_p_watertotemactive=false,
	v_p_watertotemactive="",
	b_p_watertoteminactive=false,
	v_p_watertoteminactive="",
	b_p_watertotemtimeleft=false,
	v_p_watertotemtimeleft="",

	b_p_airtotemactive=false,
	v_p_airtotemactive="",
	b_p_airtoteminactive=false,
	v_p_airtoteminactive="",
	b_p_airtotemtimeleft=false,
	v_p_airtotemtimeleft="",

	b_p_nmh=false,
	v_p_nmh="",
	b_p_noh=false,
	v_p_noh="",
	b_p_stance=false,
	v_p_stance="",
	b_p_ooc=false,
	b_p_ic=false,
	--Target Options---------------
	b_t_hp=false,
	v_t_hp="",
	b_t_maxhp=false,
	v_t_maxhp="",
	b_t_needsbuff=false,
	v_t_needsbuff="",
	b_t_hasbuff=false,
	v_t_hasbuff="",
	b_t_needsdebuff=false,
	v_t_needsdebuff="",
	b_t_hasdebuff=false,
	v_t_hasdebuff="",
	b_t_class=false,
	v_t_class="",
	b_t_pc=false,
	b_t_interrupt=false,
	v_t_interrupt="",
	b_t_dr=false,
	--Pet Options---------------
	b_pet_hp=false,
	v_pet_hp="",
	b_pet_isac=false,
	v_pet_isac="",
	b_pet_nac=false,
	v_pet_nac="",
	b_pet_needsbuff=false,
	v_pet_needsbuff="",
	b_pet_hasbuff=false,
	v_pet_hasbuff="",
	b_pet_needsdebuff=false,
	v_pet_needsdebuff="",
	b_pet_hasdebuff=false,
	v_pet_hasdebuff="",
	b_pet_dr=false,
	--Focus Options---------------
	b_f_hp=false,
	v_f_hp="",
	b_f_maxhp=false,
	v_f_maxhp="",
	b_f_needsbuff=false,
	v_f_needsbuff="",
	b_f_hasbuff=false,
	v_f_hasbuff="",
	b_f_needsdebuff=false,
	v_f_needsdebuff="",
	b_f_hasdebuff=false,
	v_f_hasdebuff="",
	b_f_class=false,
	v_f_class="",
	b_f_pc=false,
	b_f_interrupt=false,
	v_f_interrupt="",
	b_f_dr=false,
	--Custom Unit Options---------------
	v_c_unitname="",
	b_c_hp=false,
	v_c_hp="",
	b_c_maxhp=false,
	v_c_maxhp="",
	b_c_needsbuff=false,
	v_c_needsbuff="",
	b_c_hasbuff=false,
	v_c_hasbuff="",
	b_c_needsdebuff=false,
	v_c_needsdebuff="",
	b_c_hasdebuff=false,
	v_c_hasdebuff="",
	b_c_class=false,
	v_c_class="",
	b_c_interrupt=false,
	v_c_interrupt="",
	b_c_dr=false,
}

-- Saved Options
ROB_Options                         = {};
ROB_Rotations                       = {};
ROB_Lists                           = {};
ROB_ActionClipboard                 = nil;

local ROB_Initialized               = false

local ROB_SortedRotations           = {};      -- Sorted rotation table
local ROB_EditingRotationTable      = nil;     -- Rotation table being edited
ROB_SelectedRotationName            = nil;     -- Selected Rotation Name
local ROB_SelectedRotationIndex     = nil;     -- Selected Rotation Index
local ROB_SelectedActionIndex       = nil;     -- Selected Action Index
local ROB_CurrentActionName         = nil;     -- The current selected ActionName

local ROB_SortedSpellLists          = {};      -- Sorted lists table
local ROB_SortedSpells              = {};      -- Sorted spell lists table
local ROB_EditingSpellListTable     = nil;     -- Spell List table being edited
ROB_SelectedSpellListName           = nil;     -- Selected SpellList Name
local ROB_SelectedSpellListIndex    = nil;     -- Selected SpellList Index
local ROB_SelectedSpellIndex        = nil;     -- Selected Spell Index
local ROB_CurrentSpellName          = nil;     -- The current selected SpellName

local ROB_DropDownTableTemp         = {};      -- Temporary drop down table to reuse
local ROB_DropDownStoreToTemp       = nil;     -- Temporary name of where to save dropdown selected value

local ROB_LAST_CASTED               = nil;     -- Last casted spell
local ROB_LAST_CASTED_TYPE          = nil;     -- Used to track if we updated the sequential casts on start or succeeded
local ROB_LAST_CASTED_COUNT         = 0;       -- How many time the last spell casted has been sequentially cast

ROB_CURRENT_ACTION                  = nil;     -- The name of current ready action
local ROB_NEXT_ACTION               = nil;     -- The name of the next action ready
local ROB_ACTION_CD                 = nil;     -- The cooldown of the current spell being checked
local ROB_ACTION_TIMELEFT           = nil;     -- The timeleft on the action debuff or buff used to sort which action is next
local ROB_TARGET_LAST_CASTED        = nil;     -- Used to output what spell was itnerrupted
local ROB_FOCUS_LAST_CASTED         = nil;     -- Used to output what spell was itnerrupted
local ROB_ACTION_GCD                = false;   -- ROB_ACTION_GCD is not used for anything yet but its there for future options that may need it

local ROB_LOCAL_UNITS               = {};      -- List of local units in the area, used for AoE stuff
local ROB_NUM_MOBS                  = 0        -- The number of attacking mobs in the area

--libDataBroker stuff
local ROB_MENU_FRAME                = nil;
local ROB_MENU                      = {};
local ROB_MENU_READY                = false;   -- The libDataBroker menu

local ROB_LAST_DEBUG                = GetTime();     -- Last time we output debug
local ROB_LAST_DEBUG_MSG            = nil;     -- Last message we output debug

--libMasque stuff
local ROB_LM                        = nil;     -- libMasque formerly called Button Facade
local ROB_LM_BG_CURRENT_ACTION      = nil;     -- Current action button group for libMasque
local ROB_LM_BG_NEXT_ACTION         = nil;     -- Next action button group for libMasque
local ROB_LM_BG_TOGGLE1             = nil;     -- Toggle1 button group for libMasque
local ROB_LM_BG_TOGGLE2             = nil;     -- Toggle2 button group for libMasque
local ROB_LM_BG_TOGGLE3             = nil;     -- Toggle3 button group for libMasque
local ROB_LM_BG_TOGGLE4             = nil;     -- Toggle4 button group for libMasque

-- Ignore these debbuffs for debuff type checking
local ROB_ArcaneExclusions = {
	[GetSpellInfo(15822)]   = true,                -- Dreamless Sleep
	[GetSpellInfo(24360)]   = true,                -- Greater Dreamless Sleep
	[GetSpellInfo(28504)]   = true,                -- Major Dreamless Sleep
	[GetSpellInfo(24306)]   = true,                -- Delusions of Jin'do
	[GetSpellInfo(46543)]   = true,                -- Ignite Mana
	[GetSpellInfo(16567)]   = true,                -- Tainted Mind
	[GetSpellInfo(39052)]   = true,                -- Sonic Burst
	[GetSpellInfo(30129)]   = true,                -- Charred Earth - Nightbane debuff, can't be cleansed, but shows as magic
	[GetSpellInfo(31651)]   = true,                -- Banshee Curse, Melee hit rating debuff
}

local _InvSlots = {
	["HeadSlot"] = 1,
	["NeckSlot"] = 2,
	["ShoulderSlot"] = 3,
	["ShirtSlot"] = 4,
	["ChestSlot"] = 5,
	["WaistSlot"] = 6,
	["LegsSlot"] = 7,
	["FeetSlot"] = 8,
	["WristSlot"] = 9,
	["HandsSlot"] = 10,
	["Finger0Slot"] = 11,
	["Finger1Slot"] = 12,
	["Trinket0Slot"] = 13,
	["Trinket1Slot"] = 14,
	["BackSlot"] = 15,
	["MainHandSlot"] = 16,
	["SecondaryHandSlot"] = 17,
	["RangedSlot"] = 18,
	["TabardSlot"] = 19
}

function ROB_NewRotation()
	return { SortedActions={}, ActionList={}, keybind="<keybind>", bindindex=0};
end

function ROB_LoadDefaultRotations()
	if (select(2, UnitClass("player")) == "DEATHKNIGHT") then
		ROB_ImportRotation("RotationBuilder,v1.45,[Sang V1.1],[Présence de sang],v_p_needbuff=48263,b_p_needbuff=true,v_spellname=48263,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=48263,v_gcdspell=48266,[Pestilence (Poussée de fièvre)],v_lastcasted=77575,b_lastcasted=true,v_spellname=50842,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=50842,v_gcdspell=48266,[Pestilence],v_lastcasted=45462,b_lastcasted=true,v_spellname=50842,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=50842,v_gcdspell=48266,[Cor de l'hiver],v_p_needbuff=57330,b_p_needbuff=true,v_spellname=57330,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=57330,v_gcdspell=48266,[Poussée de fièvre],b_duration=true,v_t_needsdebuff=_55078^2|_55095^2|_81130^2,v_spellname=77575,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_duration=60,v_actionicon=77575,v_gcdspell=48266,[Toucher de glace],v_checkothercdvalue=>3,b_checkothercd=true,v_t_needsdebuff=_55095^3,v_spellname=45477,b_t_needsdebuff=true,v_checkothercdname=77575,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=45477,v_gcdspell=48266,[Frappe de peste],v_checkothercdvalue=>3,b_checkothercd=true,v_t_needsdebuff=_55078^3|_81130^3,v_spellname=45462,b_t_needsdebuff=true,v_checkothercdname=77575,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=45462,v_gcdspell=48266,[Cor de l'hiver (Puissance)],v_p_unitpowertype=6,b_p_unitpower=true,v_spellname=57330,v_p_unitpower=<=50%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=57330,v_gcdspell=48266,[Mort et décomposition],v_spellname=43265,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=43265,v_gcdspell=48266,[Frappe de mort],v_spellname=49998,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=49998,v_gcdspell=48266,[Frappe runique],v_spellname=56815,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=56815,v_gcdspell=48266,[Furoncle sanglant],v_spellname=48721,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=48721,v_gcdspell=48266,[Frappe au coeur],v_spellname=55050,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=55050,v_gcdspell=48266")
		ROB_ImportRotation("RotationBuilder,v1.45,[Givre V1.1],[Présence de givre],v_p_needbuff=48266,b_p_needbuff=true,v_spellname=48266,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=48266,v_gcdspell=48266,[Pestilence (Poussée de fièvre)],v_lastcasted=77575,b_lastcasted=true,v_spellname=50842,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=50842,v_gcdspell=48266,[Pestilence],v_lastcasted=45462,b_duration=true,b_lastcasted=true,v_spellname=50842,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_duration=30,v_actionicon=50842,v_gcdspell=48266,[Cor de l'hiver],v_p_needbuff=57330,b_p_needbuff=true,v_spellname=57330,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=57330,v_gcdspell=48266,[Pillier de givre],v_lastcasted=45529,b_lastcasted=true,v_p_needbuff=51271,b_p_needbuff=true,v_spellname=51271,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=51271,v_gcdspell=48266,[Drain sanglant],v_p_needbuff=51271,b_p_needbuff=true,v_spellname=45529,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=45529,v_gcdspell=48266,[Réanimation morbide],v_spellname=46584,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=32182|2825|80353|90355|49016|10060|51271,b_rangecheck=false,b_p_havebuff=true,v_actionicon=46584,v_gcdspell=48266,[Renforcer l'arme runique],v_spellname=47568,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=32182|2825|80353|90355|49016|10060,b_rangecheck=false,b_p_havebuff=true,v_actionicon=47568,v_gcdspell=48266,[Rafale hurlante (AOE) (Runes mort)],v_p_deathrunes==2,b_p_deathrunes=true,v_spellname=49184,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=49184,v_gcdspell=48266,[Rafale hurlante (AOE) (Runes givre)],b_p_frostrunes=true,v_spellname=49184,v_p_frostrunes==2,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=49184,v_gcdspell=48266,[Mort et décomposition (Runes impies)],v_p_unholyrunes==2,v_spellname=43265,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,b_p_unholyrunes=true,v_actionicon=43265,v_gcdspell=48266,[Frappe de peste (AOE) (Runes impies)],v_p_unholyrunes==2,v_t_needsdebuff=_55078^3|_81130^3,v_spellname=45462,b_t_needsdebuff=true,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_p_unholyrunes=true,v_actionicon=45462,v_gcdspell=48266,[Rafale hurlante (AOE)],v_spellname=49184,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=49184,v_gcdspell=48266,[Mort et décomposition (AOE)],v_spellname=43265,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=43265,v_gcdspell=48266,[Frappe de peste (AOE)],v_t_needsdebuff=_55078^3|_81130^3,v_spellname=45462,b_t_needsdebuff=true,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=45462,v_gcdspell=48266,[Frappe de givre (AOE)],v_spellname=49143,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=49143,v_gcdspell=48266,[Cor de l'hiver (AOE) (Recharge)],v_spellname=57330,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=57330,v_gcdspell=48266,[Poussée de fièvre],b_duration=true,v_t_needsdebuff=_55078^2|_55095^2|_81130^2,v_spellname=77575,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_duration=60,v_actionicon=77575,v_gcdspell=48266,[Rafale hurlante],v_checkothercdvalue=>3,b_checkothercd=true,v_t_needsdebuff=_55095^3,v_spellname=49184,b_t_needsdebuff=true,v_checkothercdname=77575,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=49184,v_gcdspell=48266,[Frappe de peste],v_checkothercdvalue=>3,b_checkothercd=true,v_t_needsdebuff=_55078^3|_81130^3,v_spellname=45462,b_t_needsdebuff=true,v_checkothercdname=77575,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=45462,v_gcdspell=48266,[Anéantissement (Machine à tuer)],v_spellname=49020,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=51124,b_p_havebuff=true,v_actionicon=49020,v_gcdspell=48266,[Anéantissement (Runes de mort)],v_p_deathrunes==2,b_p_deathrunes=true,v_spellname=49020,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=49020,v_gcdspell=48266,[Anéantissement (Runes)],b_p_frostrunes=true,v_p_unholyrunes==2,v_spellname=49020,v_p_frostrunes==2,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_p_unholyrunes=true,v_actionicon=49020,v_gcdspell=48266,[Frappe de givre (Puissance >110)],v_p_unitpowertype=6,b_p_unitpower=true,v_spellname=49143,v_p_unitpower=>110,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=49143,v_gcdspell=48266,[Rafale hurlante (Brouillard)],v_spellname=49184,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=59052,b_p_havebuff=true,v_actionicon=49184,v_gcdspell=48266,[Anéantissement],v_spellname=49020,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=49020,v_gcdspell=48266,[Frappe de givre],v_spellname=49143,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=49143,v_gcdspell=48266,[Cor de l'hiver (Recharge)],v_spellname=57330,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=57330,v_gcdspell=48266")
		ROB_ImportRotation("RotationBuilder,v1.45,[Impie V1.2],[Présense impie],v_p_needbuff=48265,b_p_needbuff=true,v_spellname=48265,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=48265,v_gcdspell=48266,[Pestilence (Poussée de fièvre)],v_lastcasted=77575,b_lastcasted=true,v_spellname=50842,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=50842,v_gcdspell=48266,[Pestilence],v_lastcasted=45462,b_lastcasted=true,v_spellname=50842,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=50842,v_gcdspell=48266,[Cor de l'hiver],v_p_needbuff=57330,b_p_needbuff=true,v_spellname=57330,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=57330,v_gcdspell=48266,[Poussée de fièvre],b_duration=true,v_t_needsdebuff=_55078^2|_55095^2|_81130^2,v_spellname=77575,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_duration=60,v_actionicon=77575,v_gcdspell=48266,[Toucher de glace],v_checkothercdvalue=>3,b_checkothercd=true,v_t_needsdebuff=_55095^3,v_spellname=45477,b_t_needsdebuff=true,v_checkothercdname=77575,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=45477,v_gcdspell=48266,[Frappe de peste],v_checkothercdvalue=>3,b_checkothercd=true,v_t_needsdebuff=_55078^3|_81130^3,v_spellname=45462,b_t_needsdebuff=true,v_checkothercdname=77575,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=45462,v_gcdspell=48266,[Frénésie impie],v_p_needbuff=32182|2825|80353|90355|49016|10060,b_p_needbuff=true,v_spellname=49016,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=49016,v_gcdspell=48266,[Gargouille],v_spellname=49206,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=32182|2825|80353|90355|49016|10060,b_p_havebuff=true,v_actionicon=49206,v_gcdspell=48266,[Renforcer l'arme runique],v_spellname=47568,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=32182|2825|80353|90355|49016|10060,b_rangecheck=false,b_p_havebuff=true,v_actionicon=47568,v_gcdspell=48266,[Drain sanglant],v_p_bloodrunes=<2,b_p_bloodrunes=true,v_spellname=45529,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=45529,v_gcdspell=48266,[Sombre transformation],v_spellname=63560,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=63560,v_gcdspell=48266,[Mort et décomposition (Runes impies)],v_p_unholyrunes==2,v_spellname=43265,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,b_p_unholyrunes=true,v_actionicon=43265,v_gcdspell=48266,[Mort et décomposition (Runes de mort)],v_p_deathrunes==2,b_p_deathrunes=true,v_spellname=43265,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=43265,v_gcdspell=48266,[Frappe du Fléau (Runes impies)],v_p_unholyrunes==2,v_spellname=55090,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_p_unholyrunes=true,v_actionicon=55090,v_gcdspell=48266,[Frappe du Fléau (Runes de mort)],v_p_deathrunes==2,b_p_deathrunes=true,v_spellname=55090,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=55090,v_gcdspell=48266,[Furoncle sanglant],b_p_frostrunes=true,v_p_bloodrunes==2,b_p_bloodrunes=true,v_spellname=48721,v_p_frostrunes==2,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=48721,v_gcdspell=48266,[Frappe purulente (Runes)],b_p_frostrunes=true,v_p_bloodrunes==2,b_p_bloodrunes=true,v_spellname=85948,v_p_frostrunes==2,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=85948,v_gcdspell=48266,[Voile mortel (Puissance >90)],v_p_unitpowertype=6,b_p_unitpower=true,v_spellname=47541,v_p_unitpower=>90,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=47541,v_gcdspell=48266,[Voile mortel],v_spellname=47541,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=81340,b_p_havebuff=true,v_actionicon=47541,v_gcdspell=48266,[Toucher de glace (AOE)],v_spellname=45477,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=45477,v_gcdspell=48266,[Mort et décomposition],v_spellname=43265,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=43265,v_gcdspell=48266,[Frappe du Fléau],v_spellname=55090,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=55090,v_gcdspell=48266,[Frappe purulente],v_spellname=85948,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=85948,v_gcdspell=48266,[Cor de l'hiver (Puissance)],v_p_unitpowertype=6,b_p_unitpower=true,v_spellname=57330,v_p_unitpower=<=50%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=57330,v_gcdspell=48266")
	end
	if (select(2, UnitClass("player")) == "DRUID") then
		ROB_ImportRotation("RotationBuilder,v1.45,[Equilibre V1.1],[Marque du fauve],v_p_needbuff=79061,b_p_needbuff=true,v_spellname=1126,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=1126,v_gcdspell=768,[Forme de sélénien],v_p_needbuff=24858,b_p_needbuff=true,v_spellname=24858,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=24858,v_gcdspell=768,[Météores],v_spellname=48505,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=48505,v_gcdspell=768,[Détonation],v_spellname=88751,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=88751,v_gcdspell=768,[Champignon sauvage],b_maxcasts=true,v_spellname=88747,b_toggle=true,v_breakchanneling=All,[[All]],*,v_maxcasts=3,b_breakchanneling=true,v_actionicon=88747,v_gcdspell=768,[Eruption stellaire (Etoiles fillantes)],v_spellname=78674,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=93400,b_p_havebuff=true,v_actionicon=78674,v_gcdspell=768,[Essaim d'insectes],v_t_needsdebuff=_5570,v_spellname=5570,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=5570,v_gcdspell=768,[Eclat lunaire/solaire],v_t_needsdebuff=_8921|_93402,v_spellname=8921,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=8921,v_gcdspell=768,[Lucioles],v_t_needsdebuff=91565#3|58567,v_spellname=770,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=770,v_gcdspell=768,[Epines],v_spellname=467,b_f_needsbuff=true,v_f_needsbuff=_467,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=467,v_gcdspell=768,[Innervation],v_p_unitpowertype=0,b_p_unitpower=true,v_spellname=29166,v_p_unitpower=<=75%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=29166,v_gcdspell=765,[Force de la nature],v_spellname=33831,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=33831,v_gcdspell=768,[Eruption stellaire],v_spellname=78674,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=78674,v_gcdspell=768,[Colère (Solaire -> Lunaire)],b_p_eclipse=true,v_spellname=5176,v_p_eclipse=moon,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=5176,v_gcdspell=768,[Feu stellaire (Lunaire -> Solaire)],b_p_eclipse=true,v_spellname=2912,v_p_eclipse=sun,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=2912,v_gcdspell=768,[Colère],b_p_eclipse=true,v_spellname=5176,v_p_eclipse=none,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=5176,v_gcdspell=768")
		ROB_ImportRotation("RotationBuilder,v1.45,[Farouche (Félin) V1.2],[Marque du fauve],v_p_needbuff=79061,b_p_needbuff=true,v_spellname=1126,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=1126,v_gcdspell=768,[Lucioles (farouche)],v_t_needsdebuff=91565|58567,v_spellname=16857,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=16857,v_gcdspell=768,[Forme de félin],v_p_needbuff=768,b_p_needbuff=true,v_spellname=768,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=768,v_gcdspell=768,[Ravage],v_spellname=6785,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=81022,b_p_havebuff=true,v_actionicon=6785,v_gcdspell=768,[Mutilation],v_t_needsdebuff=33876|33878|46857,v_spellname=33876,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=33876,v_gcdspell=768,[Fureur du tigre],v_spellname=5217,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=5217,v_gcdspell=768,[Berserk],v_spellname=50334,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=50334,v_gcdspell=768,[Balayage],v_spellname=62078,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=62078,v_gcdspell=768,[Morsure féroce],b_t_hp=true,v_p_combopoints==5,b_p_combopoints=true,v_t_needsdebuff=_1079^5,v_spellname=22568,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,v_t_hp=<25%,b_breakchanneling=true,v_actionicon=22568,v_gcdspell=768,[Déchirure],v_p_combopoints==5,b_p_combopoints=true,v_t_needsdebuff=_1079^5,v_spellname=1079,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=1079,v_gcdspell=768,[Griffure],v_t_needsdebuff=_1822^3,v_spellname=1822,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=1822,v_gcdspell=768,[Rugissement sauvage],v_p_combopoints==5,v_p_needbuff=_52610^3,b_p_combopoints=true,b_p_needbuff=true,v_spellname=52610,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=52610,v_gcdspell=768,[Charge farouche],v_spellname=49376,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=49376,v_gcdspell=768,[Morsure féroce (Combos)],v_p_combopoints==5,b_p_combopoints=true,v_spellname=22568,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=22568,v_gcdspell=768,[Lambeau],v_spellname=5221,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=5221,v_gcdspell=768")
		ROB_ImportRotation("RotationBuilder,v1.45,[Farouche (Ours) V1.1],[Marque du fauve],v_p_needbuff=79061,b_p_needbuff=true,v_spellname=1126,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=1126,v_gcdspell=768,[Lucioles (farouche)],v_t_needsdebuff=91565|58567,v_spellname=16857,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=16857,v_gcdspell=768,[Forme d'ours],v_p_needbuff=5487,b_p_needbuff=true,v_spellname=5487,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=5487,v_gcdspell=768,[Berserk],v_spellname=50334,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=50334,v_gcdspell=768,[Rugissement démoralisant],v_t_needsdebuff=99,v_spellname=99,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=99,v_gcdspell=768,[Mutilation],v_spellname=33878,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=33878,v_gcdspell=768,[Rosser],v_spellname=77758,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=77758,v_gcdspell=768,[Balayage],v_spellname=62078,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=62078,v_gcdspell=768,[Lacérer],v_t_needsdebuff=_33745,v_spellname=33745,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=33745,v_gcdspell=768,[Pulvérisation],v_p_needbuff=80951^2,b_p_needbuff=true,v_spellname=80313,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=80313,v_gcdspell=768,[Lacérer (3 charges)],v_t_needsdebuff=_33745#3^2,v_spellname=33745,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=33745,v_gcdspell=768,[Mutiler],v_spellname=6807,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=6807,v_gcdspell=768")
	end
	if (select(2, UnitClass("player")) == "HUNTER") then
		ROB_ImportRotation("RotationBuilder,v1.45,[Maîtrise des bêtes V2.00],[Marque du chasseur],v_t_needsdebuff=1130,v_spellname=1130,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=1130,v_gcdspell=1462,[Tir rapide],v_p_needbuff=32182|2825|80353|90355|49016|34471,b_p_needbuff=true,v_spellname=3045,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=3045,v_gcdspell=0,[Ferveur],v_checkothercdvalue=<=3,v_p_unitpowertype=2,b_checkothercd=true,b_p_unitpower=true,v_spellname=82726,v_checkothercdname=19574,v_p_unitpower=<=40,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=82726,v_gcdspell=1462,[Courroux bestial],v_p_unitpowertype=2,b_p_unitpower=true,v_spellname=19574,v_p_unitpower=>80,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=19574,v_gcdspell=1462,[Focalisation du feu],v_checkothercdvalue=>15,v_p_needbuff=34471,b_checkothercd=true,v_pet_hasbuff=19615#5,b_p_needbuff=true,v_spellname=82692,v_checkothercdname=19574,b_pet_hasbuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=82692,v_gcdspell=1462,[Piège explosif],v_spellname=13813,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=13813,v_gcdspell=1462,[Flèches multiples],v_spellname=2643,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=2643,v_gcdspell=1462,[Tir du cobra (AOE)],v_spellname=77767,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=77767,v_gcdspell=1462,[Ordre de tuer],v_spellname=34026,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=34026,v_gcdspell=1462,[Morsure de serpent],v_p_unitpowertype=2,v_t_needsdebuff=_1978,b_p_unitpower=true,v_spellname=1978,b_t_needsdebuff=true,v_p_unitpower=>=25,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=1978,v_gcdspell=1462,[Tir mortel],b_t_hp=true,v_spellname=53351,v_breakchanneling=All,[[All]],*,v_t_hp=<=20%,b_breakchanneling=true,v_actionicon=53351,v_gcdspell=1462,[Venin de veuve],v_t_needsdebuff=82654|48301|56112|12294|13218|30213|54680,v_spellname=82654,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=82654,v_gcdspell=1462,[Tir des arcanes],v_p_needbuff=34692,v_p_unitpowertype=2,b_p_unitpower=true,b_p_needbuff=true,v_spellname=3044,v_p_unitpower=>=62,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=3044,v_gcdspell=1462,[Tir des arcanes (Bête intérieure)],v_p_unitpowertype=2,b_p_unitpower=true,v_spellname=3044,v_p_unitpower=>=33,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=34692,b_p_havebuff=true,v_actionicon=3044,v_gcdspell=1462,[Tir du cobra],v_spellname=77767,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=77767,v_gcdspell=1462")
		ROB_ImportRotation("RotationBuilder,v1.45,[Précision V2.00],[Marque du chasseur],v_t_needsdebuff=1130,v_spellname=1130,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=1130,v_gcdspell=1462,[Piège explosif],v_spellname=13813,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=13813,v_gcdspell=1462,[Tir multiple (Bombardement)],v_spellname=2643,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=82921,b_p_havebuff=true,v_actionicon=2643,v_gcdspell=1462,[Tir multiple],v_spellname=2643,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=2643,v_gcdspell=1462,[Visée (AOE)],v_spellname=19434,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=82926,b_p_havebuff=true,v_actionicon=19434,v_gcdspell=1462,[Tir mortel (AOE)],b_t_hp=true,v_spellname=53351,b_toggle=true,v_breakchanneling=All,[[All]],*,v_t_hp=<=20%,b_breakchanneling=true,v_actionicon=53351,v_gcdspell=1462,[Tir assuré (TAA) (AOE)],b_maxcasts=true,v_p_needbuff=53220,b_p_needbuff=true,v_spellname=56641,b_toggle=true,v_breakchanneling=All,[[All]],*,v_maxcasts=2,b_breakchanneling=true,v_actionicon=56641,v_gcdspell=1462,[Tir assuré (AOE)],v_spellname=56641,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=56641,v_gcdspell=1462,[Morsure du serpent],v_p_unitpowertype=2,v_t_needsdebuff=_1978,b_p_unitpower=true,v_spellname=1978,b_t_needsdebuff=true,v_p_unitpower=>=25,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=1978,v_gcdspell=1462,[Tir de la chimère],v_t_needsdebuff=88691|_1978^3,v_spellname=53209,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=53209,v_gcdspell=1462,[Visée],v_spellname=19434,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=82926,b_p_havebuff=true,v_actionicon=19434,v_gcdspell=1462,[Tir assuré (Tir assuré amélioré)],b_maxcasts=true,v_p_needbuff=53220,b_p_needbuff=true,v_spellname=56641,v_breakchanneling=All,[[All]],*,v_maxcasts=2,b_breakchanneling=true,v_actionicon=56641,v_gcdspell=1462,[Tir mortel],b_t_hp=true,v_spellname=53351,v_breakchanneling=All,[[All]],*,v_t_hp=<=20%,b_breakchanneling=true,v_actionicon=53351,v_gcdspell=1462,[Venin de veuve],v_t_needsdebuff=82654|48301|56112|12294|13218|30213|54680,v_spellname=82654,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=82654,v_gcdspell=1462,[Tir rapide],v_p_needbuff=32182|2825|80353|90355|49016|34471,b_p_needbuff=true,v_spellname=3045,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=3045,v_gcdspell=0,[Promptitude],v_spellname=23989,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=3045,b_rangecheck=false,b_p_havebuff=true,v_actionicon=23989,v_gcdspell=1462,[Tir des arcanes],v_spellname=3044,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=3044,v_gcdspell=1462,[Tir assuré (Recharge)],b_maxcasts=true,v_p_needbuff=53220^3.5,b_p_needbuff=true,v_spellname=56641,v_breakchanneling=All,[[All]],*,v_maxcasts=2,b_breakchanneling=true,v_actionicon=56641,v_gcdspell=1462,[Ordre de tuer],v_spellname=34026,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=82897,b_rangecheck=false,b_p_havebuff=true,v_actionicon=34026,v_gcdspell=1462,[Tir assuré],v_spellname=56641,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=56641,v_gcdspell=1462")
		ROB_ImportRotation("RotationBuilder,v1.45,[Survie V2.00],[Marque du chasseur],v_t_needsdebuff=1130,v_spellname=1130,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=1130,v_gcdspell=1462,[Tir rapide],v_p_needbuff=32182|2825|80353|90355|49016|34471,b_p_needbuff=true,v_spellname=3045,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=3045,v_gcdspell=0,[Piège explosif],v_spellname=13813,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=13813,v_gcdspell=1462,[Tir multiple],v_spellname=2643,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=2643,v_gcdspell=1462,[Tir du cobra (AOE)],v_spellname=77767,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=77767,v_gcdspell=1462,[Morsure de serpent],v_p_unitpowertype=2,v_t_needsdebuff=_1978,b_p_unitpower=true,v_spellname=1978,b_t_needsdebuff=true,v_p_unitpower=>=25,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=1978,v_gcdspell=1462,[Tir explosif],b_maxcasts=true,v_p_unitpowertype=2,b_p_unitpower=true,v_spellname=53301,v_p_unitpower=>=44,v_breakchanneling=All,[[All]],*,v_maxcasts=1,b_breakchanneling=true,v_actionicon=53301,v_gcdspell=1462,[Tir mortel],b_t_hp=true,v_spellname=53351,v_breakchanneling=All,[[All]],*,v_t_hp=<=20%,b_breakchanneling=true,v_actionicon=53351,v_gcdspell=1462,[Flèche noire],b_t_hp=true,v_spellname=3674,v_breakchanneling=All,[[All]],*,v_t_hp=>=10%,b_breakchanneling=true,v_actionicon=3674,v_gcdspell=1462,[Piège de glace],v_spellname=13809,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=13809,v_gcdspell=1462,[Tir des arcanes (Prêt à tirer)],v_spellname=3044,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=56453,b_p_havebuff=true,v_actionicon=3044,v_gcdspell=1462,[Venin de veuve],v_t_needsdebuff=82654|48301|56112|12294|13218|30213|54680,v_spellname=82654,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=82654,v_gcdspell=1462,[Tir des arcanes],v_p_unitpowertype=2,b_p_unitpower=true,v_spellname=3044,v_p_unitpower=>=75,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=3044,v_gcdspell=1462,[Tir du cobra],v_spellname=77767,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=77767,v_gcdspell=1462")
	end
	if (select(2, UnitClass("player")) == "MAGE") then
		ROB_ImportRotation("RotationBuilder,v1.45,[Arcane V1.0],[Illumination des Arcanes],v_p_needbuff=79058,b_p_needbuff=true,v_spellname=1459,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=1459,v_gcdspell=475,[Armure du mage],v_p_needbuff=6117,b_p_needbuff=true,v_spellname=6117,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=6117,v_gcdspell=475,[Gemme de mana],b_duration=true,v_p_unitpowertype=0,b_p_unitpower=true,v_spellname=759,v_p_unitpower=<=80%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_duration=120,v_actionicon=759,v_gcdspell=0,[Image miroir],b_t_hp=true,v_spellname=55342,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=12042,b_rangecheck=false,b_p_havebuff=true,v_actionicon=55342,v_gcdspell=475,[Image miroir (Recharge Pouvoir)],v_checkothercdvalue=<35,b_t_hp=true,b_checkothercd=true,v_spellname=55342,v_checkothercdname=12042,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=55342,v_gcdspell=475,[Pouvoir des Arcanes (Boss <10%)],v_checkothercdvalue=<40,b_t_hp=true,b_checkothercd=true,v_spellname=12042,v_checkothercdname=12051,v_breakchanneling=All,[[All]],*,v_t_hp=<=10%,b_breakchanneling=true,b_rangecheck=false,v_actionicon=12042,v_gcdspell=475,[Pouvoir des Arcanes],v_checkothercdvalue=<40,v_p_havedebuff=36032#4,b_p_havedebuff=true,b_checkothercd=true,v_spellname=12042,v_checkothercdname=12051,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=12042,v_gcdspell=475,[Orbe enflammé],b_disabled=true,v_spellname=82731,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=82731,v_gcdspell=475,[Présence spirituelle],v_spellname=12043,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=12043,v_gcdspell=475,[Déflagration des Arcanes (Neutre)],v_checkothercdvalue=<40,v_p_unitpowertype=0,b_checkothercd=true,b_p_unitpower=true,v_spellname=30451,v_checkothercdname=12042,v_p_unitpower=>=85%,v_breakchanneling=All,[[All]],*,b_p_needdebuff=true,b_breakchanneling=true,v_p_needdebuff=36032#4,v_actionicon=30451,v_gcdspell=475,[Barrage des Arcanes (Neutre)],v_checkothercdvalue=<40,v_p_unitpowertype=0,v_p_havedebuff=36032#4,b_p_havedebuff=true,b_checkothercd=true,b_p_unitpower=true,v_spellname=44425,v_checkothercdname=12042,v_p_unitpower=>=85%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=44425,v_gcdspell=475,[Projectiles des Arcanes (Neutre)],v_checkothercdvalue=<40,v_p_unitpowertype=0,v_p_havedebuff=36032#4,b_p_havedebuff=true,b_checkothercd=true,b_p_unitpower=true,v_spellname=30451,v_checkothercdname=12042,v_p_unitpower=>=85%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=30451,v_gcdspell=475,[Déflagration des Arcanes (Présence ou Idées)],v_spellname=30451,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=12043|12536,b_p_havebuff=true,v_actionicon=30451,v_gcdspell=475,[Déflagration des Arcanes (Boss <10%)],b_t_hp=true,v_p_unitpowertype=0,b_p_unitpower=true,v_spellname=30451,v_p_unitpower=>=5%,v_breakchanneling=All,[[All]],*,v_t_hp=<=10%,b_breakchanneling=true,v_actionicon=30451,v_gcdspell=475,[Déflagration des Arcanes (Pouvoir)],v_p_unitpowertype=0,b_p_unitpower=true,v_spellname=30451,v_p_unitpower=>=35%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=12042,b_p_havebuff=true,v_actionicon=30451,v_gcdspell=475,[Déflagration des Arcanes (Burst)],v_checkothercdvalue=<25,v_p_unitpowertype=0,b_checkothercd=true,b_p_unitpower=true,v_spellname=30451,v_checkothercdname=12051,v_p_unitpower=>=35%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=30451,v_gcdspell=475,[Evocation],v_spellname=12051,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=12051,v_gcdspell=475,[Projectiles des Arcanes (Regen)],v_checkothercdvalue=>=20,v_p_unitpowertype=0,b_checkothercd=true,b_p_unitpower=true,v_spellname=5143,v_checkothercdname=12042,v_p_unitpower=<95%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=79683,b_p_havebuff=true,v_actionicon=5143,v_gcdspell=475,[Déflagration des Arcanes (Regen)],v_checkothercdvalue=>=20,v_p_unitpowertype=0,b_checkothercd=true,b_p_unitpower=true,v_spellname=30451,v_checkothercdname=12042,v_p_unitpower=<95%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=30451,v_gcdspell=475")
		ROB_ImportRotation("RotationBuilder,v1.45,[Feu V1.2],[Illumination des Arcanes],v_p_needbuff=79058,b_p_needbuff=true,v_spellname=1459,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=1459,v_gcdspell=475,[Armure de la fournaise],v_p_needbuff=30482,b_p_needbuff=true,v_spellname=30482,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=30482,v_gcdspell=475,[Image miroir],v_spellname=55342,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=55342,v_gcdspell=475,[Evocation],v_p_unitpowertype=0,b_p_unitpower=true,v_spellname=12051,v_p_unitpower=<=35%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=12051,v_gcdspell=475,[Gemme de mana],b_notaspell=true,b_duration=true,v_p_unitpowertype=0,b_p_unitpower=true,v_spellname=759,v_p_unitpower=<=80%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_duration=120,v_actionicon=759,v_gcdspell=475,[Bombre vivante (AOE)],b_maxcasts=true,v_t_needsdebuff=_44457,v_spellname=44457,b_t_needsdebuff=true,b_toggle=true,v_breakchanneling=All,[[All]],*,v_maxcasts=3,b_breakchanneling=true,v_actionicon=44457,v_gcdspell=475,[Vague explosive (AOE)],v_spellname=11113,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=11113,v_gcdspell=475,[Trait de feu (Impact) (AOE)],v_spellname=2136,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=64343,b_p_havebuff=true,v_actionicon=2136,v_gcdspell=475,[Choc de flammes (AOE)],b_duration=true,v_spellname=2120,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_duration=8,v_actionicon=2120,v_gcdspell=475,[Combustion],b_t_hasdebuff=true,v_t_hasdebuff=_11366^2|_12654^1|_44457^2,v_spellname=11129,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=12654,b_rangecheck=false,b_p_havebuff=true,v_actionicon=11129,v_gcdspell=475,[Brûlure (Masse critique)],v_t_needsdebuff=22959^2.5,v_spellname=2948,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=2948,v_gcdspell=475,[Explosion pyrotechnique (Chaleur continue)],v_spellname=11366,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=48108,b_p_havebuff=true,v_actionicon=11366,v_gcdspell=475,[Trait de feu (Impact)],v_spellname=2136,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=64343,b_p_havebuff=true,v_actionicon=2136,v_gcdspell=475,[Bombre vivante],v_t_needsdebuff=_44457,v_spellname=44457,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=44457,v_gcdspell=475,[Orbe enflammé],v_spellname=82731,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=82731,v_gcdspell=475,[Brûlure],b_moving=true,v_spellname=2948,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=2948,v_gcdspell=475,[Boule de feu],b_notmoving=true,v_spellname=133,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=133,v_gcdspell=475")
		ROB_ImportRotation("RotationBuilder,v1.45,[Givre V2.01],[Illumination des Arcanes],v_p_needbuff=79058|61316,b_p_needbuff=true,v_spellname=1459,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=1459,v_gcdspell=475,[Armure de la fournaise],v_p_needbuff=30482,b_p_needbuff=true,v_spellname=30482,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=30482,v_gcdspell=475,[Barrière de glace],v_p_needbuff=11426,b_p_needbuff=true,v_spellname=11426,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=11426,v_gcdspell=475,[Morsure du froid],v_spellname=11958,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=32182|2825|80353|90355|10060,b_rangecheck=false,b_p_havebuff=true,v_actionicon=11958,v_gcdspell=475,[Veines glaciales],v_p_needbuff=32182|2825|80353|90355|10060|12472,b_p_needbuff=true,v_spellname=12472,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=12472,v_gcdspell=475,[Image miroir],v_spellname=55342,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=55342,v_gcdspell=475,[Evocation],v_p_unitpowertype=0,b_p_unitpower=true,v_spellname=12051,v_p_unitpower=<=35%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=12051,v_gcdspell=475,[Gemme de mana],b_notaspell=true,b_duration=true,v_p_unitpowertype=0,b_p_unitpower=true,v_spellname=759,v_p_unitpower=<=80%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_duration=120,v_actionicon=759,v_gcdspell=475,[Orbe de givrefeu],v_spellname=92283,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=92283,v_gcdspell=475,[Congélation (Gel)],b_t_hasdebuff=true,v_t_hasdebuff=44572|83301|83302|122|33395|55080|83073,v_spellname=44572,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=44572,v_gcdspell=475,[Congélation],v_spellname=44572,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=44544,b_p_havebuff=true,v_actionicon=44572,v_gcdspell=475,[Eclair de givrefeu],v_spellname=44614,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=57761,b_p_havebuff=true,v_actionicon=44614,v_gcdspell=475,[Javelot de glace (Gel)],b_t_hasdebuff=true,v_t_hasdebuff=44572|83301|83302|122|33395|55080|83073,v_spellname=30455,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=30455,v_gcdspell=475,[Javelot de glace],v_spellname=30455,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=44544,b_p_havebuff=true,v_actionicon=30455,v_gcdspell=475,[Gel],v_checkothercdvalue==0,v_p_needbuff=44544,b_checkothercd=true,b_p_needbuff=true,v_spellname=33395,v_checkothercdname=44572,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=33395,v_gcdspell=475,[Eclair de givre],v_spellname=116,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=116,v_gcdspell=475")
	end
	if (select(2, UnitClass("player")) == "PALADIN") then
		ROB_ImportRotation("RotationBuilder,v1.45,[Protection V1.1],[Bénédiction des rois],v_p_needbuff=79063|79061|90363,b_p_needbuff=true,v_spellname=20217,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=20217,v_gcdspell=465,[Bénédiction de puissance],v_p_needbuff=_79063|79102|30808|53138|19506,b_p_needbuff=true,v_spellname=19740,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=79063|79061|90363,b_rangecheck=false,b_p_havebuff=true,v_actionicon=19740,v_gcdspell=465,[Aura de dévotion],v_p_needbuff=465|8071,b_p_needbuff=true,v_spellname=465,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=465,v_gcdspell=0,[Aura de concentration],v_p_needbuff=_465|19746|87718,b_p_needbuff=true,v_spellname=19746,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=465|8071,b_rangecheck=false,b_p_havebuff=true,v_actionicon=19746,v_gcdspell=0,[Aura de résistance],v_p_needbuff=_465|_19746|19891|79061|79063,b_p_needbuff=true,v_spellname=19891,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=465|8071|19746|87718,b_rangecheck=false,b_p_havebuff=true,v_actionicon=19891,v_gcdspell=0,[Aura de vindicte],v_p_needbuff=_465|_19746|_19891,b_p_needbuff=true,v_spellname=7294,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=465|8071|19746|87718|19891|79061|79063,b_rangecheck=false,b_p_havebuff=true,v_actionicon=7294,v_gcdspell=0,[Fureur vertueuse],v_p_needbuff=25780,b_p_needbuff=true,v_spellname=25780,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=25780,v_gcdspell=465,[Sceau de clairvoyance],v_p_needbuff=20165,b_p_needbuff=true,v_spellname=20165,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=20165,v_gcdspell=465,[Inquisition],v_p_unitpowertype=9,b_p_unitpower=true,v_spellname=84963,v_p_unitpower==3,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=84963,v_gcdspell=465,[Marteau du vertueux],v_spellname=53595,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=53595,v_gcdspell=465,[Bouclier du vengeur (AOE)],v_spellname=31935,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=31935,v_gcdspell=465,[Consecration],v_spellname=26573,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=26573,v_gcdspell=465,[Colère divine],v_spellname=2812,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=2812,v_gcdspell=465,[Bouclier du vertueux],v_p_unitpowertype=9,b_p_unitpower=true,v_spellname=53600,v_p_unitpower==3,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=53600,v_gcdspell=465,[Frappe du croisé],v_spellname=35395,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=35395,v_gcdspell=465,[Bouclier du vengeur],v_spellname=31935,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=31935,v_gcdspell=465,[Marteau de courroux],v_spellname=24275,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=24275,v_gcdspell=465,[Jugement],v_spellname=20271,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=20271,v_gcdspell=465")
		ROB_ImportRotation("RotationBuilder,v1.45,[Vindicte V1.1],[Bénédiction des rois],v_p_needbuff=79063|79061|90363,b_p_needbuff=true,v_spellname=20217,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=20217,v_gcdspell=465,[Bénédiction de puissance],v_p_needbuff=_79063|79102|30808|53138|19506,b_p_needbuff=true,v_spellname=19740,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=79063|79061|90363,b_rangecheck=false,b_p_havebuff=true,v_actionicon=19740,v_gcdspell=465,[Aura de dévotion],v_p_needbuff=465|8071,b_p_needbuff=true,v_spellname=465,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=465,v_gcdspell=0,[Aura de concentration],v_p_needbuff=_465|19746|87718,b_p_needbuff=true,v_spellname=19746,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=465|8071,b_rangecheck=false,b_p_havebuff=true,v_actionicon=19746,v_gcdspell=0,[Aura de résistance],v_p_needbuff=_465|_19746|19891|79061|79063,b_p_needbuff=true,v_spellname=19891,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=465|8071|19746|87718,b_rangecheck=false,b_p_havebuff=true,v_actionicon=19891,v_gcdspell=0,[Aura de vindicte],v_p_needbuff=_465|_19746|_19891,b_p_needbuff=true,v_spellname=7294,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=465|8071|19746|87718|19891|79061|79063,b_rangecheck=false,b_p_havebuff=true,v_actionicon=7294,v_gcdspell=0,[Sceau de justice],v_p_needbuff=20164,b_p_needbuff=true,v_spellname=20164,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=20164,v_gcdspell=465,[Sceau de vérité],v_p_needbuff=31801,b_p_needbuff=true,v_spellname=31801,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=31801,v_gcdspell=465,[Fanatisme],v_spellname=85696,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=85696,v_gcdspell=465,[Inquisition],v_p_unitpowertype=9,b_p_unitpower=true,v_spellname=84963,v_p_unitpower==3,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=84963,v_gcdspell=465,[Tempête divine],v_spellname=53385,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=53385,v_gcdspell=465,[Marteau de courroux (AOE)],v_spellname=24275,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=24275,v_gcdspell=465,[Exorcisme (AOE)],v_spellname=879,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=59578,b_p_havebuff=true,v_actionicon=879,v_gcdspell=465,[Verdict du templier (AOE)],v_spellname=85256,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=85256,v_gcdspell=465,[Jugement (AOE)],v_spellname=20271,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=20271,v_gcdspell=465,[Colère divine (AOE)],v_spellname=2812,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=2812,v_gcdspell=465,[Consécration (AOE)],v_spellname=26573,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=26573,v_gcdspell=465,[Frappe du croisé],v_spellname=35395,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=35395,v_gcdspell=465,[Marteau de courroux],v_spellname=24275,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=24275,v_gcdspell=465,[Exorcisme],v_spellname=879,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=59578,b_p_havebuff=true,v_actionicon=879,v_gcdspell=465,[Verdict du templier],v_spellname=85256,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=85256,v_gcdspell=465,[Jugement],v_spellname=20271,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=20271,v_gcdspell=465,[Colère divine],v_spellname=2812,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=2812,v_gcdspell=465,[Consécration],v_spellname=26573,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=26573,v_gcdspell=465")
	end
	if (select(2, UnitClass("player")) == "PRIEST") then
		ROB_ImportRotation("RotationBuilder,v1.45,[Ombre V2.00],[Forme d'Ombre],v_p_needbuff=15473,b_p_needbuff=true,v_spellname=15473,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=15473,v_gcdspell=585,[Mot de pouvoir : Robustesse],v_p_needbuff=469|90364|6307|79105,b_p_needbuff=true,v_spellname=21562,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=21562,v_gcdspell=585,[Protection contre l'Ombre],v_p_needbuff=79106|79061|79063|19891,b_p_needbuff=true,v_spellname=27683,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=27683,v_gcdspell=585,[Etreinte vampirique],v_p_needbuff=15286,b_p_needbuff=true,v_spellname=15286,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=15286,v_gcdspell=585,[Volonté intérieure],v_p_needbuff=73413,v_p_unitpowertype=0,b_p_unitpower=true,b_p_needbuff=true,v_spellname=73413,v_p_unitpower=<=15%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=73413,v_gcdspell=585,[Feu intérieur],v_p_needbuff=588,v_p_unitpowertype=>=,b_p_unitpower=true,b_p_needbuff=true,v_spellname=588,v_p_unitpower=60%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=588,v_gcdspell=585,[Dispersion],v_p_unitpowertype=0,b_p_unitpower=true,v_spellname=47585,v_p_unitpower=<=5%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=47585,v_gcdspell=585,[Mot de l'ombre : Douleur],v_t_needsdebuff=_589^1.5,v_spellname=589,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=589,v_gcdspell=585,[Attaque mentale (Orbe d'ombre)],v_spellname=8092,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=77487#1,b_p_havebuff=true,v_actionicon=8092,v_gcdspell=585,[Toucher vampirique],v_t_needsdebuff=_34914^3,v_spellname=34914,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=34914,v_gcdspell=585,[Peste dévorante],v_t_needsdebuff=_2944^1.5,v_spellname=2944,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=2944,v_gcdspell=585,[Incandescence mentale],v_spellname=48045,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=48045,v_gcdspell=585,[Attaque mentale],v_p_needbuff=77487#1,b_p_needbuff=true,v_spellname=8092,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=8092,v_gcdspell=585,[Mot de l'ombre : Mort],v_spellname=32379,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=32379,v_gcdspell=585,[Archange],b_t_hasdebuff=true,v_t_hasdebuff=_34914^5&_2944^5,v_spellname=87151,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=87117#5|87118#5,b_rangecheck=false,b_p_havebuff=true,v_actionicon=87151,v_gcdspell=585,[Ombrefiel],v_p_unitpowertype=0,b_p_unitpower=true,v_spellname=34433,v_p_unitpower=<=80%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=34433,v_gcdspell=585,[Fouet mental],b_t_hasdebuff=true,v_t_hasdebuff=_34914^3&_2944^1.5&_589^1.5,v_spellname=15407,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=15407,v_gcdspell=585")
	end

	if (select(2, UnitClass("player")) == "ROGUE") then
		ROB_ImportRotation("RotationBuilder,v1.45,[Assassinat v1.1],[Ficelles du métier],v_checkothercdvalue=<3,b_checkothercd=true,b_f_pc=true,v_spellname=57934,v_checkothercdname=57934,b_f_needsbuff=true,v_f_needsbuff=_57934,b_rangecheck=false,v_actionicon=57934,[Garrot],v_spellname=703,b_p_stance=true,v_p_stance=1,b_rangecheck=false,v_actionicon=703,[Vendetta],v_checkothercdvalue=<6,b_checkothercd=true,v_spellname=79140,v_checkothercdname=79140,v_p_havebuff=_5171,b_rangecheck=false,b_p_havebuff=true,v_actionicon=79140,[Envenimer (Débiter)],v_p_combopoints=>=2,v_t_hasdebuff=_2818#5,v_spellname=32645,v_t_hp=>=35%,v_p_havebuff=_5171^4,b_rangecheck=false,b_p_havebuff=true,v_actionicon=32645,v_gcdspell=5938,[Débiter],v_p_combopoints=>=1,v_p_needbuff=_5171,b_p_combopoints=true,b_p_needbuff=true,v_spellname=5171,b_rangecheck=false,v_actionicon=5171,v_gcdspell=5938,[Rupture],v_p_combopoints=>=4,b_p_combopoints=true,v_t_hasdebuff=16511|33878|33876|57386|50271|35290|46857,v_t_needsdebuff=_1943^5,v_spellname=1943,b_t_needsdebuff=true,b_rangecheck=false,v_actionicon=1943,v_gcdspell=5938,[Exposer l'armure],v_p_combopoints=>=4,b_p_combopoints=true,v_t_needsdebuff=8647|58567#3|95467#3|91565#3|95466f#3,v_spellname=8647,b_t_needsdebuff=true,b_rangecheck=false,v_actionicon=8647,v_gcdspell=5938,[Sang froid],v_checkothercdvalue=<6,v_p_combopoints==5,b_p_combopoints=true,v_p_unitpowertype=3,b_checkothercd=true,b_p_unitpower=true,v_spellname=14177,v_checkothercdname=14177,v_p_unitpower=<60%,b_rangecheck=false,v_actionicon=14177,[Envenimer (<35%)],b_t_hasdebuff=true,b_t_hp=true,v_p_combopoints==5,b_p_combopoints=true,v_t_hasdebuff=_2818#5,v_spellname=32645,v_t_hp=<35%,b_rangecheck=false,v_actionicon=32645,v_gcdspell=5938,[Envenimer],b_t_hasdebuff=true,b_t_hp=true,v_p_combopoints=>=4,b_p_combopoints=true,v_t_hasdebuff=_2818#4,v_spellname=32645,v_t_hp=>=35%,b_rangecheck=false,v_actionicon=32645,v_gcdspell=5938,[Eviscération],v_p_combopoints=>=4,b_p_combopoints=true,v_spellname=2098,b_rangecheck=false,v_actionicon=2098,[Attaque sournoise],b_t_hp=true,v_spellname=53,v_t_hp=<35%,b_gcombopoints=true,b_rangecheck=false,v_actionicon=53,v_gcombopoints=1,v_gcdspell=5938,[Estropier],b_t_hp=true,v_spellname=1329,v_t_hp=>=35%,b_gcombopoints=true,b_rangecheck=false,v_actionicon=1329,v_gcombopoints=2")
		ROB_ImportRotation("RotationBuilder,v1.45,[Combat v1.1],[Ficelles du métier],v_checkothercdvalue=<3,b_checkothercd=true,b_f_pc=true,v_spellname=57934,v_checkothercdname=57934,b_f_needsbuff=true,v_f_needsbuff=_57934,b_rangecheck=false,v_actionicon=57934,[Poussée d'adrénaline],v_checkothercdvalue=<5,b_checkothercd=true,v_spellname=13750,v_checkothercdname=13750,b_rangecheck=false,v_duration=150,v_actionicon=13750,[Série meurtrière],v_checkothercdvalue=<5,b_checkothercd=true,v_spellname=51690,v_checkothercdname=51690,v_p_havebuff=_Compréhension profonde,b_rangecheck=false,b_p_havebuff=true,v_duration=100,v_actionicon=51690,[Rupture],b_t_hasdebuff=true,v_p_combopoints==5,b_p_combopoints=true,v_t_hasdebuff=16511|33878|33876|57386|50271|35290|46857,v_t_needsdebuff=_1943,v_spellname=1943,b_t_needsdebuff=true,b_rangecheck=false,v_actionicon=1943,v_gcdspell=5938,[Exposer l'armure],v_p_combopoints==5,b_p_combopoints=true,v_t_needsdebuff=8647|58567#3|95467#3|91565#3|95466f#3,v_spellname=8647,b_t_needsdebuff=true,b_rangecheck=false,v_actionicon=8647,v_gcdspell=5938,[Eviscération],v_p_combopoints==5,b_p_combopoints=true,v_spellname=2098,b_rangecheck=false,v_actionicon=2098,v_gcdspell=5938,[Débiter],v_p_combopoints=>=1,v_p_needbuff=_5171^2,b_p_needbuff=true,v_spellname=5171,b_rangecheck=false,v_actionicon=5171,v_gcdspell=5938,[Frappe révélatrice],v_p_combopoints==4,b_p_combopoints=true,v_spellname=84617,b_gcombopoints=true,b_rangecheck=false,v_actionicon=84617,v_gcombopoints=1,v_gcdspell=5938,[Attaque pernicieuse],v_p_combopoints=<4,b_p_combopoints=true,v_spellname=1752,b_gcombopoints=true,b_rangecheck=false,v_actionicon=1752,v_gcombopoints=1,v_gcdspell=5938")
		ROB_ImportRotation("RotationBuilder,v1.45,[Finesse v1.1],[Ficelles du métier],v_checkothercdvalue=<3,b_checkothercd=true,b_f_pc=true,v_spellname=57934,v_checkothercdname=57934,b_f_needsbuff=true,v_f_needsbuff=_57934,b_rangecheck=false,v_actionicon=57934,[Embuscade],v_p_unitpowertype=3,v_spellname=8676,v_p_unitpower=>=40,b_p_stance=true,v_p_stance=1,b_gcombopoints=true,b_rangecheck=false,v_actionicon=8676,v_gcombopoints=2,v_gcdspell=5938,[Hémorragie],v_t_needsdebuff=16511|33878|33876|57386|50271|35290|46857,v_spellname=16511,b_t_needsdebuff=true,b_gcombopoints=true,b_rangecheck=false,v_actionicon=16511,v_gcombopoints=1,v_gcdspell=5938,[Eviscération (rupture)],b_t_hasdebuff=true,v_p_combopoints==5,v_t_hasdebuff=_1943,v_t_needsdebuff=_1943^7,v_spellname=2098,b_t_needsdebuff=true,b_rangecheck=false,v_actionicon=2098,v_gcdspell=5938,[Danse de l'ombre],v_checkothercdvalue=<3,b_checkothercd=true,v_spellname=51713,v_checkothercdname=51713,v_p_havebuff=_73651,b_rangecheck=false,b_p_havebuff=true,v_actionicon=51713,[Conversion],v_p_combopoints=>=2,v_p_needbuff=_73651^4,b_p_needbuff=true,v_spellname=73651,b_rangecheck=false,v_actionicon=73651,v_gcdspell=5938,[Débiter],v_p_combopoints=>=1,v_p_needbuff=_5171^2,b_p_needbuff=true,v_spellname=5171,b_rangecheck=false,v_actionicon=5171,v_gcdspell=5938,[Rupture],b_t_hasdebuff=true,v_p_combopoints==5,b_p_combopoints=true,v_t_hasdebuff=16511|33878|33876|57386|50271|35290|46857,v_t_needsdebuff=_1943,v_spellname=1943,b_t_needsdebuff=true,b_rangecheck=false,v_actionicon=1943,v_gcdspell=5938,[Exposer l'armure],v_p_combopoints==5,b_p_combopoints=true,v_t_needsdebuff=8647|58567#3|95467#3|91565#3|95466f#3,v_spellname=8647,b_t_needsdebuff=true,b_rangecheck=false,v_actionicon=8647,v_gcdspell=5938,[Eviscération],b_t_hasdebuff=true,v_p_combopoints==5,b_p_combopoints=true,v_t_hasdebuff=_1943,v_spellname=2098,b_rangecheck=false,v_actionicon=2098,v_gcdspell=5938,[Embuscade (DdlO)],v_spellname=8676,b_p_stance=true,v_p_stance=3,b_gcombopoints=true,b_rangecheck=false,v_actionicon=8676,v_gcombopoints=2,v_gcdspell=5938,[Attaque Sournoise],v_spellname=53,b_gcombopoints=true,b_rangecheck=false,v_actionicon=53,v_gcombopoints=1,v_gcdspell=5938")
	end
	if (select(2, UnitClass("player")) == "SHAMAN") then
		ROB_ImportRotation("RotationBuilder,v1.45,[Elementaire V2.00],[Bouclier de foudre],v_p_needbuff=_324,b_p_needbuff=true,v_spellname=324,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=324,v_gcdspell=324,[Maîtrise élémentaire],v_spellname=16166,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=32182|2825|80353|90355|10060,b_rangecheck=false,b_p_havebuff=true,v_actionicon=16166,v_gcdspell=324,[Totem de magma],v_checkothercdvalue=<480,b_checkothercd=true,b_p_firetoteminactive=true,v_spellname=8190,v_checkothercdname=2894,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_p_firetoteminactive=8190,v_actionicon=8190,v_gcdspell=324,[Totem incendiare],v_checkothercdvalue=<480,b_checkothercd=true,b_p_firetoteminactive=true,v_spellname=3599,v_checkothercdname=2894,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_p_firetoteminactive=3599,v_actionicon=3599,v_gcdspell=324,[Déchaînement des éléments (Nova)],v_checkothercdvalue=<2,b_checkothercd=true,v_spellname=73680,v_checkothercdname=1535,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=73680,v_gcdspell=324,[Nova de feu],b_t_hasdebuff=true,v_t_hasdebuff=_8050,v_spellname=1535,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=1535,v_gcdspell=324,[Horion de flammes],v_t_needsdebuff=_8050^5,v_spellname=8050,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=8050,v_gcdspell=324,[Séisme],v_spellname=61882,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=61882,v_gcdspell=324,[Déchaînement des éléments],v_checkothercdvalue=<3,b_checkothercd=true,v_spellname=73680,v_checkothercdname=51505,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=73680,v_gcdspell=324,[Orage],v_p_unitpowertype=0,b_p_unitpower=true,v_spellname=51490,v_p_unitpower=<92%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=51490,v_gcdspell=324,[Chaîne d'éclairs],v_spellname=421,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=421,v_gcdspell=324,[Explosion de lave],v_spellname=Explosion de lave,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=51505,v_gcdspell=324,[Horion de terre],b_t_hasdebuff=true,v_t_hasdebuff=_8050^6,v_spellname=8042,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=_324#7,b_p_havebuff=true,v_actionicon=8042,v_gcdspell=324,[Eclair],v_spellname=403,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=403,v_gcdspell=324")
		ROB_ImportRotation("RotationBuilder,v1.45,[Amélioration V2.00],[Totem incendiaire],v_checkothercdvalue=<480,b_checkothercd=true,b_p_firetoteminactive=true,b_mobcount=true,v_mobcount=<3,v_spellname=3599,v_checkothercdname=2894,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_p_firetoteminactive=3599,v_actionicon=3599,v_gcdspell=324,[Totem de magma],v_checkothercdvalue=<480,b_checkothercd=true,b_p_firetoteminactive=true,v_spellname=8190,v_checkothercdname=2894,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_p_firetoteminactive=8190,v_actionicon=8190,v_gcdspell=324,[Frappe-tempête],v_spellname=17364,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=17364,v_gcdspell=324,[Fouet de lave],b_t_hasdebuff=true,v_t_hasdebuff=_8050,v_spellname=60103,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=60103,v_gcdspell=324,[Chaîne d'éclairs (Maelström X5)],v_spellname=421,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=_53817#5,b_p_havebuff=true,v_actionicon=421,v_gcdspell=324,[Eclair (Maelström X5)],v_spellname=403,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=_53817#5,b_p_havebuff=true,v_actionicon=403,v_gcdspell=324,[Horion de flammes],v_t_needsdebuff=_8050^3,v_spellname=8050,b_t_needsdebuff=true,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=8050,v_gcdspell=324,[Nova de feu (Déchaînement)],b_t_hasdebuff=true,v_t_hasdebuff=_8050,v_spellname=1535,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=_73683,b_rangecheck=false,b_p_havebuff=true,v_actionicon=1535,v_gcdspell=324,[Horion de flammes (Déchaînement)],v_spellname=8050,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=_73683,b_p_havebuff=true,v_actionicon=8050,v_gcdspell=324,[Déchaînement des éléments],v_spellname=73680,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=73680,v_gcdspell=324,[Nova de feu],b_t_hasdebuff=true,v_t_hasdebuff=_8050,v_spellname=1535,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=1535,v_gcdspell=324,[Horion de terre],v_spellname=8042,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=8042,v_gcdspell=324,[Esprit farouche],v_spellname=51533,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=51533,v_gcdspell=324,[Totem de magma (5 sec)],v_p_firetotemtimeleft=<=5,v_spellname=8190,b_p_firetotemtimeleft=true,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_p_firetotemactive=8190,b_p_firetotemactive=true,v_actionicon=8190,v_gcdspell=324,[Totem incendiaire (5 sec)],v_p_firetotemtimeleft=<=5,v_spellname=3599,b_p_firetotemtimeleft=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_p_firetotemactive=3599,b_p_firetotemactive=true,v_actionicon=3599,v_gcdspell=324,[Bouclier de foudre],v_p_needbuff=_324^5,b_p_needbuff=true,v_spellname=324,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=324,v_gcdspell=324,[Chaîne d'éclairs (Maelström X2)],v_checkothercdvalue=>3,b_checkothercd=true,v_spellname=421,v_checkothercdname=17364,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=_53817#2,b_p_havebuff=true,v_actionicon=421,v_gcdspell=324,[Eclair (Maelström X2)],v_checkothercdvalue=>3,b_checkothercd=true,v_spellname=403,v_checkothercdname=17364,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=_53817#2,b_p_havebuff=true,v_actionicon=403,v_gcdspell=324")
	end
	if (select(2, UnitClass("player")) == "WARLOCK") then
		ROB_ImportRotation("RotationBuilder,v1.45,[Affliction V2.01],[Connexion (Mouvement)],b_p_hp=true,b_duration=true,b_moving=true,v_p_unitpowertype=0,b_p_unitpower=true,v_spellname=1454,v_p_unitpower=<80%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_p_hp=>=80%,v_duration=2,v_actionicon=1454,v_gcdspell=687,[Connexion (Mana)],b_p_hp=true,b_duration=true,v_p_unitpowertype=0,b_p_unitpower=true,v_spellname=1454,v_p_unitpower=<20%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_p_hp=>=80%,v_duration=2,v_actionicon=1454,v_gcdspell=687,[Gangrarmure],v_p_needbuff=28176,b_p_needbuff=true,v_spellname=28176,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=28176,v_gcdspell=687,[Sombre intention],v_p_needbuff=_80398,b_p_needbuff=true,v_spellname=80398,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=80398,v_gcdspell=687,[Lien spirituel],v_p_needbuff=25228,b_p_needbuff=true,v_spellname=19028,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=19028,v_gcdspell=768,[Infernal],v_spellname=1122,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=32182|2825|80353|90355|10060,b_rangecheck=false,b_p_havebuff=true,v_actionicon=1122,v_gcdspell=687,[Garde funeste],v_spellname=18540,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=32182|2825|80353|90355|10060,b_rangecheck=false,b_p_havebuff=true,v_actionicon=18540,v_gcdspell=687,[Malédiction des éléments],v_t_needsdebuff=1490|93068|60433|65142|24844|34889,v_spellname=1490,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=1490,v_gcdspell=687,[Malédiction de faiblesse],b_t_hasdebuff=true,v_t_hasdebuff=1490|93068|60433|65142|24844|34889,v_t_needsdebuff=_1490|1160|26017|99|50256|81130|702|24423,v_spellname=702,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=702,v_gcdspell=687,[Ame du démon],v_spellname=77801,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=77801,v_gcdspell=687,[Malédiction des langages],b_t_hasdebuff=true,v_t_hasdebuff=1490|93068|60433|65142|241490|93068|60433|65142|24844|34889|1160|26017|99|50256|81130|702|24423,v_t_needsdebuff=_1490|_702|31589|5760|50274|73975|1714,v_spellname=1714,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=1714,v_gcdspell=687,[Brûlure d'âme],v_p_unitpowertype=7,b_p_unitpower=true,v_spellname=74434,v_p_unitpower=>0,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=74434,v_gcdspell=687,[Graine de Corruption],v_spellname=27243,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=27243,v_gcdspell=387,[Corruption],v_t_needsdebuff=_172^3,v_spellname=172,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=172,v_gcdspell=687,[Affliction instable],v_t_needsdebuff=_30108^3,v_spellname=30108,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=30108,v_gcdspell=687,[Plaie funeste],v_t_needsdebuff=_603^3,v_spellname=603,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=603,v_gcdspell=687,[Hanter],v_spellname=48181,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=48181,v_gcdspell=687,[Drain d'âme],b_t_hp=true,v_spellname=1120,v_breakchanneling=All,[[All]],*,v_t_hp=<=25%,b_breakchanneling=true,v_actionicon=1120,v_gcdspell=687,[Ombreflamme],v_spellname=47897,b_t_dr=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=47897,v_gcdspell=687,[Trait de l'ombre],v_spellname=686,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=686,v_gcdspell=687")
		ROB_ImportRotation("RotationBuilder,v1.45,[Démonologie V2.01],[Connexion (Mouvement)],b_p_hp=true,b_duration=true,b_moving=true,v_p_unitpowertype=0,b_p_unitpower=true,v_spellname=1454,v_p_unitpower=<80%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_p_hp=>=80%,v_duration=2,v_actionicon=1454,v_gcdspell=687,[Connexion (Mana)],b_p_hp=true,b_duration=true,v_p_unitpowertype=0,b_p_unitpower=true,v_spellname=1454,v_p_unitpower=<20%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_p_hp=>=80%,v_duration=2,v_actionicon=1454,v_gcdspell=687,[Gangrarmure],v_p_needbuff=28176,b_p_needbuff=true,v_spellname=28176,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=28176,v_gcdspell=687,[Sombre intention],v_p_needbuff=_80398,b_p_needbuff=true,v_spellname=80398,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=80398,v_gcdspell=687,[Lien spirituel],v_p_needbuff=25228,b_p_needbuff=true,v_spellname=19028,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=19028,v_gcdspell=768,[Infernal],v_spellname=1122,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=32182|2825|80353|90355|10060,b_rangecheck=false,b_p_havebuff=true,v_actionicon=1122,v_gcdspell=687,[Garde funeste],v_spellname=18540,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=32182|2825|80353|90355|10060,b_rangecheck=false,b_p_havebuff=true,v_actionicon=18540,v_gcdspell=687,[Malédiction des éléments],v_t_needsdebuff=1490|93068|60433|65142|24844|34889,v_spellname=1490,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=1490,v_gcdspell=687,[Malédiction de faiblesse],b_t_hasdebuff=true,v_t_hasdebuff=1490|93068|60433|65142|24844|34889,v_t_needsdebuff=_1490|1160|26017|99|50256|81130|702|24423,v_spellname=702,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=702,v_gcdspell=687,[Métamorphose],v_spellname=47241,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=47241,v_gcdspell=687,[Ame du démon(Gangregarde)],v_spellname=77801,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=77801,v_gcdspell=687,[Malédiction des langages],b_t_hasdebuff=true,v_t_hasdebuff=1490|93068|60433|65142|241490|93068|60433|65142|24844|34889|1160|26017|99|50256|81130|702|24423,v_t_needsdebuff=_1490|_702|31589|5760|50274|73975|1714,v_spellname=1714,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=1714,v_gcdspell=687,[Gangreflamme],b_moving=true,v_spellname=77799,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=77799,v_gcdspell=687,[Gangrorage],v_spellname=89751,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=89751,v_gcdspell=687,[Flammes infernales],v_spellname=1949,b_toggle=true,b_t_dr=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=1949,v_gcdspell=687,[Pluie de feu],v_spellname=5740,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=5740,v_gcdspell=687,[Immolation],v_t_needsdebuff=_348^3,v_spellname=348,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=348,v_gcdspell=687,[Main de Gul'dan],v_spellname=71521,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=71521,v_gcdspell=687,[Ame du démon (Chasseur corrompu)],v_spellname=77801,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=77801,v_gcdspell=687,[Plaie funeste],v_t_needsdebuff=_603^3,v_spellname=603,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=603,v_gcdspell=687,[Aura d'immolation],v_spellname=50589,b_t_dr=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=47241,b_rangecheck=false,b_p_havebuff=true,v_actionicon=50589,v_gcdspell=687,[Corruption],v_t_needsdebuff=_172^3,v_spellname=172,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=172,v_gcdspell=687,[Ombreflamme],v_spellname=47897,b_t_dr=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=47897,v_gcdspell=687,[Incinérer],v_spellname=29722,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=47383|71162|71165,b_p_havebuff=true,v_actionicon=29722,v_gcdspell=687,[Feu de l'âme],v_spellname=6353,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=63165|63167,b_p_havebuff=true,v_actionicon=6353,v_gcdspell=687,[Trait de l'ombre],v_spellname=686,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=686,v_gcdspell=687")
		ROB_ImportRotation("RotationBuilder,v1.45,[Destruction V2.01],[Connexion (Mouvement)],b_p_hp=true,b_duration=true,b_moving=true,v_p_unitpowertype=0,b_p_unitpower=true,v_spellname=1454,v_p_unitpower=<80%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_p_hp=>=80%,v_duration=2,v_actionicon=1454,v_gcdspell=687,[Connexion (Mana)],b_p_hp=true,b_duration=true,v_p_unitpowertype=0,b_p_unitpower=true,v_spellname=1454,v_p_unitpower=<20%,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_p_hp=>=80%,v_duration=2,v_actionicon=1454,v_gcdspell=687,[Gangrarmure],v_p_needbuff=28176,b_p_needbuff=true,v_spellname=28176,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=28176,v_gcdspell=687,[Sombre intention],v_p_needbuff=_80398,b_p_needbuff=true,v_spellname=80398,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=80398,v_gcdspell=687,[Lien spirituel],v_p_needbuff=25228,b_p_needbuff=true,v_spellname=19028,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=19028,v_gcdspell=768,[Infernal],v_spellname=1122,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=32182|2825|80353|90355|10060,b_rangecheck=false,b_p_havebuff=true,v_actionicon=1122,v_gcdspell=687,[Garde funeste],v_spellname=18540,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=32182|2825|80353|90355|10060,b_rangecheck=false,b_p_havebuff=true,v_actionicon=18540,v_gcdspell=687,[Malédiction des éléments],v_t_needsdebuff=1490|93068|60433|65142|24844|34889,v_spellname=1490,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=1490,v_gcdspell=687,[Malédiction de faiblesse],b_t_hasdebuff=true,v_t_hasdebuff=1490|93068|60433|65142|24844|34889,v_t_needsdebuff=_1490|1160|26017|99|50256|81130|702|24423,v_spellname=702,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=702,v_gcdspell=687,[Brûlure d'âme],v_p_needbuff=85383^2,v_p_unitpowertype=7,b_p_unitpower=true,b_p_needbuff=true,v_spellname=74434,v_p_unitpower=>0,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=74434,v_gcdspell=687,[Feu de l'âme],v_p_needbuff=85383^2,b_p_needbuff=true,v_spellname=6353,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=6353,v_gcdspell=687,[Ame du démon],v_spellname=77801,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=77801,v_gcdspell=687,[Malédiction des langages],b_t_hasdebuff=true,v_t_hasdebuff=1490|93068|60433|65142|241490|93068|60433|65142|24844|34889|1160|26017|99|50256|81130|702|24423,v_t_needsdebuff=_1490|_702|31589|5760|50274|73975|1714,v_spellname=1714,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=1714,v_gcdspell=687,[Plaie de tumulte],b_duration=true,v_spellname=80240,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_duration=300,v_actionicon=80240,v_gcdspell=687,[Pluie de feu],v_spellname=5740,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=5740,v_gcdspell=687,[Immolation],v_t_needsdebuff=_348^3,v_spellname=348,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=348,v_gcdspell=687,[Conflagration],v_spellname=17962,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=17962,v_gcdspell=687,[Plaie funeste],v_t_needsdebuff=_603^3,v_spellname=603,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=603,v_gcdspell=687,[Corruption],v_t_needsdebuff=_172^3,v_spellname=172,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=172,v_gcdspell=687,[Ombreflamme],v_spellname=47897,b_t_dr=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=47897,v_gcdspell=687,[Feu de l'âme (Diablotin surpuissant)],v_spellname=6353,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=47283,b_p_havebuff=true,v_actionicon=6353,v_gcdspell=687,[Trait du chaos],v_spellname=50796,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=50796,v_gcdspell=687,[Brûlure de l'ombre],b_t_hp=true,v_spellname=17877,v_breakchanneling=All,[[All]],*,v_t_hp=<=20%,b_breakchanneling=true,v_actionicon=17877,v_gcdspell=687,[Incinérer],v_spellname=29722,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=29722,v_gcdspell=687")
	end
	if (select(2, UnitClass("player")) == "WARRIOR") then
		ROB_ImportRotation("RotationBuilder,v1.45,[Arme V2.00],[Posture de combat (Berserker)],v_spellname=2457,v_breakchanneling=All,[[All]],*,b_p_stance=true,v_p_stance=3,b_breakchanneling=true,b_rangecheck=false,v_actionicon=2457,v_gcdspell=0,[Posture de combat (Défensive)],v_spellname=2457,v_breakchanneling=All,[[All]],*,b_p_stance=true,v_p_stance=2,b_breakchanneling=true,b_rangecheck=false,v_actionicon=2457,v_gcdspell=0,[Cri de guerre],v_p_needbuff=6673|8076|93435|57330,b_p_needbuff=true,v_spellname=6673,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=6673,v_gcdspell=0,[Cri de commandement],v_p_needbuff=469|90364|6307|79105,b_p_needbuff=true,v_spellname=469,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=8076|93435|57330,b_rangecheck=false,b_p_havebuff=true,v_actionicon=469,v_gcdspell=0,[Témérité],v_spellname=1719,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=32182|2825|80353|90355|49016,b_rangecheck=false,b_p_havebuff=true,v_actionicon=1719,v_gcdspell=1715,[Lancer fracassant],v_spellname=64382,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=32182|2825|80353|90355|49016,b_p_havebuff=true,v_actionicon=64382,v_gcdspell=1715,[Calme mortel],v_spellname=85730,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=85730,v_gcdspell=1715,[Rage berserker],v_spellname=18499,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=18499,v_gcdspell=1715,[Attaque circulaire],v_spellname=12328,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=12328,v_gcdspell=1715,[Tempête de lames],v_spellname=46924,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=46924,v_gcdspell=1715,[Enchaînement],v_spellname=845,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=845,v_gcdspell=1715,[Pourfendre],v_t_needsdebuff=_772,v_spellname=772,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=772,v_gcdspell=1715,[Exécution],b_t_hp=true,v_p_needbuff=90806#5^1.5,b_p_needbuff=true,v_spellname=5308,v_breakchanneling=All,[[All]],*,v_t_hp=<=25%,b_breakchanneling=true,v_actionicon=5308,v_gcdspell=1715,[Cri de guerre (Rage)],v_p_unitpowertype=1,b_p_unitpower=true,v_spellname=6673,v_p_unitpower=<50,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=_6673,b_rangecheck=false,b_p_havebuff=true,v_actionicon=6673,v_gcdspell=0,[Cri de commandement (Rage)],v_p_unitpowertype=1,b_p_unitpower=true,v_spellname=469,v_p_unitpower=<50,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=_469,b_rangecheck=false,b_p_havebuff=true,v_actionicon=469,v_gcdspell=0,[Frappe Héroïque (Transe)],v_spellname=78,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=12964,b_p_havebuff=true,v_actionicon=78,v_gcdspell=1715,[Frappe Héroïque (Rage > 70)],v_p_unitpowertype=1,b_p_unitpower=true,v_spellname=78,v_p_unitpower=>=70,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=78,v_gcdspell=1715,[Frappe du colosse],v_spellname=86346,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=86346,v_gcdspell=1715,[Frappe mortelle],v_spellname=12294,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=12294,v_gcdspell=1715,[Fulgurance],v_spellname=7384,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=60503,b_p_havebuff=true,v_actionicon=7384,v_gcdspell=1715,[Fracasser armure],v_t_needsdebuff=58567#3^3|95467|95466|91565|8647,v_spellname=7386,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=7386,v_gcdspell=1715,[Cri démoralisant],v_t_needsdebuff=1160|26017|99|50256|81130|702|24423,v_spellname=1160,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=1160,v_gcdspell=1715,[Coup de tonnerre],v_t_needsdebuff=6343|58180|8042|54404|90315|55095|51693|68055,v_spellname=6343,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=6343,v_gcdspell=1715,[Heurtoir],v_checkothercdvalue=>1.5,b_checkothercd=true,v_spellname=1464,v_checkothercdname=12294,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=1464,v_gcdspell=1715")
		ROB_ImportRotation("RotationBuilder,v1.45,[Fureur Armes à 1 Main V2.00],[Posture berserker (Combat)],v_spellname=2458,v_breakchanneling=All,[[All]],*,b_p_stance=true,v_p_stance=1,b_breakchanneling=true,b_rangecheck=false,v_actionicon=2458,[Posture berserker (Défensive)],v_spellname=2458,v_breakchanneling=All,[[All]],*,b_p_stance=true,v_p_stance=2,b_breakchanneling=true,b_rangecheck=false,v_actionicon=2458,[Cri de guerre],v_p_needbuff=6673|8076|93435|57330,b_p_needbuff=true,v_spellname=6673,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=6673,v_gcdspell=0,[Cri de commandement],v_p_needbuff=469|90364|6307|79104,b_p_needbuff=true,v_spellname=469,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=8076|93435|57330,b_rangecheck=false,b_p_havebuff=true,v_actionicon=469,v_gcdspell=0,[Témérité],v_spellname=1719,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=32182|2825|80353|90355|49016,b_rangecheck=false,b_p_havebuff=true,v_actionicon=1719,v_gcdspell=1715,[Souhait mortel],v_spellname=12292,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=32182|2825|80353|90355|49016,b_rangecheck=false,b_p_havebuff=true,v_actionicon=12292,v_gcdspell=1715,[Lancer fracassant],v_spellname=64382,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=32182|2825|80353|90355|49016,b_p_havebuff=true,v_actionicon=64382,v_gcdspell=1715,[Exécution],b_t_hp=true,v_p_needbuff=90806#5^1.5,b_p_needbuff=true,v_spellname=5308,v_breakchanneling=All,[[All]],*,v_t_hp=<=25%,b_breakchanneling=true,v_actionicon=5308,v_gcdspell=1715,[Cri de guerre (Rage)],v_p_unitpowertype=1,b_p_unitpower=true,v_spellname=6673,v_p_unitpower=<50,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=_6673,b_rangecheck=false,b_p_havebuff=true,v_actionicon=6673,v_gcdspell=0,[Cri de commandement (Rage)],v_p_unitpowertype=1,b_p_unitpower=true,v_spellname=469,v_p_unitpower=<50,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=_469,b_rangecheck=false,b_p_havebuff=true,v_actionicon=469,v_gcdspell=0,[Sanguinaire],v_spellname=23881,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=23881,v_gcdspell=1715,[Tourbillon],v_spellname=1680,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=1680,v_gcdspell=1715,[Frappe du colosse],v_spellname=86346,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=86346,v_gcdspell=1715,[Enchaînement],v_p_unitpowertype=1,b_p_unitpower=true,v_spellname=845,v_p_unitpower=>=90,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=845,v_gcdspell=1715,[Frappe héroïque],v_p_unitpowertype=1,b_p_unitpower=true,v_spellname=78,v_p_unitpower=>=90,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=78,v_gcdspell=1715,[Heurtoir],v_spellname=1464,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=46916,b_p_havebuff=true,v_actionicon=1464,v_gcdspell=1715,[Rage berserker],v_checkothercdvalue=<1,v_p_needbuff=18499|14202|49016|12292,b_checkothercd=true,b_p_needbuff=true,v_spellname=18499,v_checkothercdname=85288,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=18499,v_gcdspell=1715,[Coup déchaîné],v_spellname=85288,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=85288,v_gcdspell=1715,[Exécution (Recharge)],b_t_hp=true,v_spellname=5308,v_breakchanneling=All,[[All]],*,v_t_hp=<=25%,b_breakchanneling=true,v_actionicon=5308,v_gcdspell=1715,[Fracasser armure],v_t_needsdebuff=58567#3^3|95467|95466|91565|8647,v_spellname=7386,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=7386,v_gcdspell=1715,[Cri démoralisant],v_t_needsdebuff=1160|26017|99|50256|81130|702|24423,v_spellname=1160,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=1160,v_gcdspell=1715")
		ROB_ImportRotation("RotationBuilder,v1.45,[Fureur Armes à 2 Mains V2.00],[Posture berserker (Combat)],v_spellname=2458,v_breakchanneling=All,[[All]],*,b_p_stance=true,v_p_stance=1,b_breakchanneling=true,b_rangecheck=false,v_actionicon=2458,[Posture berserker (Défensive)],v_spellname=2458,v_breakchanneling=All,[[All]],*,b_p_stance=true,v_p_stance=2,b_breakchanneling=true,b_rangecheck=false,v_actionicon=2458,[Cri de guerre],v_p_needbuff=6673|8076|93435|57330,b_p_needbuff=true,v_spellname=6673,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=6673,v_gcdspell=0,[Cri de commandement],v_p_needbuff=469|90364|6307|79104,b_p_needbuff=true,v_spellname=469,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=8076|93435|57330,b_rangecheck=false,b_p_havebuff=true,v_actionicon=469,v_gcdspell=0,[Témérité],v_spellname=1719,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=32182|2825|80353|90355|49016,b_rangecheck=false,b_p_havebuff=true,v_actionicon=1719,v_gcdspell=1715,[Souhait mortel],v_spellname=12292,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=32182|2825|80353|90355|49016,b_rangecheck=false,b_p_havebuff=true,v_actionicon=12292,v_gcdspell=1715,[Lancer fracassant],v_spellname=64382,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=32182|2825|80353|90355|49016,b_p_havebuff=true,v_actionicon=64382,v_gcdspell=1715,[Exécution],b_t_hp=true,v_p_needbuff=90806#5^1.5,b_p_needbuff=true,v_spellname=5308,v_breakchanneling=All,[[All]],*,v_t_hp=<=25%,b_breakchanneling=true,v_actionicon=5308,v_gcdspell=1715,[Cri de guerre (Rage)],v_p_unitpowertype=1,b_p_unitpower=true,v_spellname=6673,v_p_unitpower=<50,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=_6673,b_rangecheck=false,b_p_havebuff=true,v_actionicon=6673,v_gcdspell=0,[Cri de commandement (Rage)],v_p_unitpowertype=1,b_p_unitpower=true,v_spellname=469,v_p_unitpower=<50,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=_469,b_rangecheck=false,b_p_havebuff=true,v_actionicon=469,v_gcdspell=0,[Sanguinaire],v_spellname=23881,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=23881,v_gcdspell=1715,[Tourbillon],v_spellname=1680,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=1680,v_gcdspell=1715,[Frappe du colosse],v_spellname=86346,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=86346,v_gcdspell=1715,[Enchaînement],v_p_unitpowertype=1,b_p_unitpower=true,v_spellname=845,v_p_unitpower=>=90,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=845,v_gcdspell=1715,[Frappe héroïque],v_p_unitpowertype=1,b_p_unitpower=true,v_spellname=78,v_p_unitpower=>=90,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=78,v_gcdspell=1715,[Rage berserker],v_checkothercdvalue=<1,v_p_needbuff=18499|14202|49016|12292,b_checkothercd=true,b_p_needbuff=true,v_spellname=18499,v_checkothercdname=85288,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=18499,v_gcdspell=1715,[Coup déchaîné],v_spellname=85288,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=85288,v_gcdspell=1715,[Heurtoir],v_spellname=1464,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=46916,b_p_havebuff=true,v_actionicon=1464,v_gcdspell=1715,[Exécution (Recharge)],b_t_hp=true,v_spellname=5308,v_breakchanneling=All,[[All]],*,v_t_hp=<=25%,b_breakchanneling=true,v_actionicon=5308,v_gcdspell=1715,[Fracasser armure],v_t_needsdebuff=58567#3^3|95467|95466|91565|8647,v_spellname=7386,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=7386,v_gcdspell=1715,[Cri démoralisant],v_t_needsdebuff=1160|26017|99|50256|81130|702|24423,v_spellname=1160,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=1160,v_gcdspell=1715")
		ROB_ImportRotation("RotationBuilder,v1.45,[Protection V2.00],[Posture défensive (Combat)],v_spellname=71,v_breakchanneling=All,[[All]],*,b_p_stance=true,v_p_stance=1,b_breakchanneling=true,b_rangecheck=false,v_actionicon=71,[Posture défensive (Berserker)],v_spellname=71,v_breakchanneling=All,[[All]],*,b_p_stance=true,v_p_stance=3,b_breakchanneling=true,b_rangecheck=false,v_actionicon=71,[Cri de commandement],v_p_needbuff=469|90364|6307|79104,b_p_needbuff=true,v_spellname=469,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=469,v_gcdspell=0,[Cri de commandement (Rage)],v_p_unitpowertype=1,b_p_unitpower=true,v_spellname=469,v_p_unitpower=<60,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=_469,b_rangecheck=false,b_p_havebuff=true,v_actionicon=469,v_gcdspell=0,[Cri de guerre],v_p_needbuff=6673|8076|93435|57330,b_p_needbuff=true,v_spellname=6673,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=90364|6307|79104,b_rangecheck=false,b_p_havebuff=true,v_actionicon=6673,v_gcdspell=0,[Cri de guerre (Rage)],v_p_unitpowertype=1,b_p_unitpower=true,v_spellname=6673,v_p_unitpower=<60,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=_6673,b_rangecheck=false,b_p_havebuff=true,v_actionicon=6673,v_gcdspell=0,[Lancer fracassant],v_spellname=64382,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_p_havebuff=32182|2825|80353|90355|49016,b_p_havebuff=true,v_actionicon=64382,v_gcdspell=1715,[Enchaînement],v_p_unitpowertype=1,b_p_unitpower=true,v_spellname=845,v_p_unitpower=>=60,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=845,v_gcdspell=1715,[Frappe héroïque],v_p_unitpowertype=1,b_p_unitpower=true,v_spellname=Frappe héroïque,v_p_unitpower=>=60,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=78,v_gcdspell=1715,[Pourfendre (AOE)],v_t_needsdebuff=_772^3,v_spellname=772,b_t_needsdebuff=true,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=772,v_gcdspell=1715,[Coup de tonnerre (AOE)],v_spellname=6343,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=6343,v_gcdspell=1715,[Onde de choc],v_spellname=46968,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=46968,v_gcdspell=1715,[Revanche (AOE)],v_spellname=6572,b_toggle=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=6572,v_gcdspell=1715,[Heur de bouclier],v_spellname=23922,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=23922,v_gcdspell=1715,[Revanche],v_spellname=6572,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=6572,v_gcdspell=1715,[Pourfendre],v_t_needsdebuff=_772^2,v_spellname=772,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=772,v_gcdspell=1715,[Cri démoralisant],v_t_needsdebuff=1160|26017|99|50256|81130|702|24423,v_spellname=1160,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=1160,v_gcdspell=1715,[Coup de tonnerre],v_t_needsdebuff=6343|58180|8042|54404|90315|55095|51693|68055,v_spellname=6343,b_t_needsdebuff=true,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,b_rangecheck=false,v_actionicon=6343,v_gcdspell=1715,[Dévaster],v_spellname=20243,v_breakchanneling=All,[[All]],*,b_breakchanneling=true,v_actionicon=20243,v_gcdspell=1715")
	end
	-- update rotation list
	ROB_SortRotationList()
	-- update the action list
	ROB_ActionList_Update()
	-- update rotation modify buttons
	ROB_RotationModifyButtons_UpdateUI()
	-- update rotation ui stuff
	ROB_Rotation_Edit_UpdateUI()
end

------------------------------------------------------------------------
--  Menu functions
------------------------------------------------------------------------
local function ROB_SortMenu(item1, item2)
	return item1.id < item2.id
end

local function ROB_MenuChangeRotation(self,_arg1)
	ROB_SwitchRotation(_arg1,true)
end

local function ROB_MenuCreate(self, _level)
	local level = _level or 1
	local id = 1
	local info = {}
	ROB_MENU = {}
	for id = 1, #ROB_SortedRotations, 1 do
		info = {}
		info.id = id
		info.text = ROB_SortedRotations[id]
		info.icon = nil
		info.arg1 = ROB_SortedRotations[id]
		info.func = ROB_MenuChangeRotation
		info.notCheckable = true
		ROB_MENU[id] = info
	end
	table.sort(ROB_MENU, ROB_SortMenu)
end

local function ROB_MenuInit(self, _level)
	local level = _level or 1
	for _, value in pairs(ROB_MENU) do
		UIDropDownMenu_AddButton(value, level)
	end
end

function ROB_MenuOnClick(self, button)
	if button == "LeftButton" then
		GameTooltip:Hide()
		if (not ROB_MENU_FRAME) then
			ROB_MENU_FRAME = CreateFrame("Frame", "ROB_Menu", UIParent, "UIDropDownMenuTemplate")
		end

		ROB_MenuCreate()
		UIDropDownMenu_Initialize(ROB_MENU_FRAME, ROB_MenuInit, "MENU")
		ToggleDropDownMenu(1, nil, ROB_MENU_FRAME, self, 20, 4)
	elseif button == "RightButton" then
		ROB_OnToggle();
	end
end

function ROB_LoadDataBrokerPlugin()
	LibStub:GetLibrary('LibDataBroker-1.1'):NewDataObject(ROB_ADDON_NAME, {
		type = 'launcher',
		text = ROB_ADDON_NAME,
		icon = 'Interface\\Icons\\Spell_Arcane_PortalOrgrimmar',
		OnClick = ROB_MenuOnClick,
		OnTooltipShow = function(tooltip)
			if not tooltip or not tooltip.AddLine then return end
			tooltip:AddLine(ROB_UI_TITLE)
			tooltip:AddLine(ROB_UI_LDB_TT1)
			tooltip:AddLine(ROB_UI_LDB_TT2)
		end,
	})
end

function ROB_OnSkin(_addon, _skinid, _gloss, _backdrop, _group, _button, _colors)
	local _ROBSkin = {}
	if _group == 'Current Action' then
		_ROBSkin = ROB_Options["CABSkin"]
	elseif _group == 'Next Action' then
		_ROBSkin = ROB_Options["NABSkin"]
	elseif _group == 'Toggle1' then
		_ROBSkin = ROB_Options["T1Skin"]
	elseif _group == 'Toggle2' then
		_ROBSkin = ROB_Options["T2Skin"]
	elseif _group == 'Toggle3' then
		_ROBSkin = ROB_Options["T3Skin"]
	elseif _group == 'Toggle4' then
		_ROBSkin = ROB_Options["T4Skin"]
	end
	if _ROBSkin then
		_ROBSkin[1] = _skinid
		_ROBSkin[2] = _gloss
		_ROBSkin[3] = _backdrop
		_ROBSkin[4] = _group
		_ROBSkin[5] = _button
		_ROBSkin[6] = _colors
	end
end

function ROB_LoadMasquePlugin()
	if (LibMasque) then
		ROB_LM = LibMasque("Button")
	else
		ROB_LM = LibStub('LibButtonFacade', true)
		ROB_LM:RegisterSkinCallback(ROB_ADDON_NAME, ROB_OnSkin, _skinid, _gloss, _backdrop, _group, _button, _colors)
	end

	ROB_LM:Group(ROB_ADDON_NAME, 'Current Action'):AddButton(ROB_CurrentActionButton)
	ROB_LM:Group(ROB_ADDON_NAME, 'Current Action'):AddButton(ROB_NextActionButton)
	ROB_LM:Group(ROB_ADDON_NAME, 'Toggle1'):AddButton(ROB_RotationToggle1Button)
	ROB_LM:Group(ROB_ADDON_NAME, 'Toggle2'):AddButton(ROB_RotationToggle2Button)
	ROB_LM:Group(ROB_ADDON_NAME, 'Toggle3'):AddButton(ROB_RotationToggle3Button)
	ROB_LM:Group(ROB_ADDON_NAME, 'Toggle4'):AddButton(ROB_RotationToggle4Button)

	if ROB_Options['CABSkin'] then ROB_LM:Group(ROB_ADDON_NAME, 'Current Action'):Skin(unpack(ROB_Options["CABSkin"])) end
	if ROB_Options['NABSkin'] then ROB_LM:Group(ROB_ADDON_NAME, 'Next Action'):Skin(unpack(ROB_Options['NABSkin'])) end
	if ROB_Options['T1Skin'] then ROB_LM:Group(ROB_ADDON_NAME, 'Toggle1'):Skin(unpack(ROB_Options['T1Skin'])) end
	if ROB_Options['T2Skin'] then ROB_LM:Group(ROB_ADDON_NAME, 'Toggle2'):Skin(unpack(ROB_Options['T2Skin'])) end
	if ROB_Options['T3Skin'] then ROB_LM:Group(ROB_ADDON_NAME, 'Toggle3'):Skin(unpack(ROB_Options['T3Skin'])) end
	if ROB_Options['T4Skin'] then ROB_LM:Group(ROB_ADDON_NAME, 'Toggle4'):Skin(unpack(ROB_Options['T4Skin'])) end
end

function ROB_OnLoad(self)
	-- hook events
	self:RegisterEvent("ADDON_LOADED");
	self:RegisterEvent("PLAYER_ENTERING_WORLD");

	self:RegisterEvent("UNIT_SPELLCAST_START")
	self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START")

	self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
	self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP")

	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

	-- hook command handler
	SLASH_ROB1 = "/rob";

	SlashCmdList["ROB"] = ROB_OnCommand;

	-- create a dialog for list deletion
	StaticPopupDialogs["ROB_PROMPT_LIST_DELETE"] =
	{
		text                 = TEXT(ROB_PROMPT_LIST_DELETE),
		button1              = TEXT(YES),
		button2              = TEXT(CANCEL),
		OnAccept             =  function(self)
			ROB_RotationDelete_OnAccept();
		end,
		OnCancel             =  function(self)
			ROB_RotationDelete_OnCancel();
		end,
		timeout              = 0,
		exclusive            = 1,
		whileDead            = 1,
		hideOnEscape         = 1
	}

	StaticPopupDialogs["ROB_PROMPT_SPELLLIST_DELETE"] =
	{
		text                 = TEXT(ROB_PROMPT_SPELLLIST_DELETE),
		button1              = TEXT(YES),
		button2              = TEXT(CANCEL),
		OnAccept             =  function(self)
			ROB_SpellListDelete_OnAccept();
		end,
		OnCancel             =  function(self)
			ROB_SpellListDelete_OnCancel();
		end,
		timeout              = 0,
		exclusive            = 1,
		whileDead            = 1,
		hideOnEscape         = 1
	}
	print(string.format(ROB_LOADED, ROB_VERSION));
end

function ROB_SpellIsInRotation(_spellname)
	local _foundspell = false
	if (ROB_SelectedRotationName and ROB_Rotations[ROB_SelectedRotationName] ~= nil and ROB_Rotations[ROB_SelectedRotationName].SortedActions ~= nil) then
		for key, value in pairs(ROB_Rotations[ROB_SelectedRotationName].SortedActions) do
			if (string.find(tostring(_spellname), tostring(ROB_Rotations[ROB_SelectedRotationName].ActionList[value].v_spellname))) then
				_foundspell = true
			end
			if (GetSpellInfo(ROB_Rotations[ROB_SelectedRotationName].ActionList[value].v_spellname) and (string.find(tostring(GetSpellInfo(ROB_Rotations[ROB_SelectedRotationName].ActionList[value].v_spellname)), tostring(ROB_Rotations[ROB_SelectedRotationName].ActionList[value].v_spellname)))) then
				_foundspell = true
			end
		end
	end
	return _foundspell
end

function ROB_OnEvent(self, event, ...)
	local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16 = ...;
	local _spellname = nil

	local _eventSpellname = nil
	local _eventEvent = nil
	local _sourceFlags = nil
	--                                  arg1       arg2   arg3        arg4        arg5         arg6         arg7             arg8       arg9       arg10      arg11          arg12
	--4.0.6 COMBAT_LOG_EVENT_UNFILTERED(timestamp, event, sourceGUID, sourceName, sourceFlags, destGUID,    destName,        destFlags, ...)
	--4.1   COMBAT_LOG_EVENT_UNFILTERED(timestamp, event, hideCaster, sourceGUID, sourceName,  sourceFlags, destGUID,        destName,  destFlags, ...)
	--4.2   COMBAT_LOG_EVENT_UNFILTERED(timestamp, event, hideCaster, sourceGUID, sourceName,  sourceFlags, sourceRaidFlags, destGUID,  destName,  destFlags, destRaidFlags, ...)
	if tonumber((select(4, GetBuildInfo()))) >= 50001 then
		_eventSpellname = arg12
		_eventEvent = arg2
		_sourceFlags = arg6
	end
	
	if (event == "ADDON_LOADED") then
		ROB_ADDON_Load(...);
	elseif (event == "PLAYER_ENTERING_WORLD") then
		ROB_PLAYER_Enter();
	elseif (event == "UNIT_SPELLCAST_SUCCEEDED" or event == "UNIT_SPELLCAST_START" or event == "UNIT_SPELLCAST_CHANNEL_START") then
		if (arg1 == "player") then
			if (ROB_SpellIsInRotation(arg2)) then
				--if we update the count in the START event then dont update the count in the SUCCEEDED event
				if (event == "UNIT_SPELLCAST_START" or event == "UNIT_SPELLCAST_CHANNEL_START") then
					if (arg2 == ROB_LAST_CASTED) then
						--increment the last casted count
						ROB_LAST_CASTED_COUNT = ROB_LAST_CASTED_COUNT + 1
						if (ROB_SpellIsInRotation(arg2)) then ROB_LAST_CASTED = arg2; end
					else
						--start the count over
						ROB_LAST_CASTED_COUNT = 1
						if (ROB_SpellIsInRotation(arg2)) then ROB_LAST_CASTED = arg2; end
					end
					--end
					if (event == "UNIT_SPELLCAST_START") then
						ROB_LAST_CASTED_TYPE = "NORMAL"
					else
						ROB_LAST_CASTED_TYPE = "CHANNEL"
					end
				end
				if (event == "UNIT_SPELLCAST_SUCCEEDED" or event == "UNIT_SPELLCAST_CHANNEL_STOP") then
					if (not ROB_LAST_CASTED_TYPE) then
						if (arg2 == ROB_LAST_CASTED) then
							--increment the last casted count
							ROB_LAST_CASTED_COUNT = ROB_LAST_CASTED_COUNT + 1
							if (ROB_SpellIsInRotation(arg2)) then ROB_LAST_CASTED = arg2; end
						else
							--start the count over
							ROB_LAST_CASTED_COUNT = 1
							if (ROB_SpellIsInRotation(arg2)) then ROB_LAST_CASTED = arg2; end
						end
					else
					--The last casted type was something besides nil but for spells that have a UNIT_SPELLCAST_START or UNIT_SPELLCAST_CHANNEL_START
					--they get their count incremented in those events so dont do it here
					end

					if (event == "UNIT_SPELLCAST_SUCCEEDED" and ROB_LAST_CASTED_TYPE and ROB_LAST_CASTED_TYPE == "CHANNEL") then
					--If ROB_LAST_CASTED_TYPE was CHANNEL then dont update the last casted because blizzard fires a UNIT_SPELLCAST_SUCCEEDED while channel is still going
					else
						ROB_LAST_CASTED_TYPE = nil
					end
				end

				-- Turn off the toggle if this toggleoff is enabled
				if (ROB_SelectedRotationName and ROB_Rotations[ROB_SelectedRotationName] ~= nil and ROB_Rotations[ROB_SelectedRotationName].SortedActions ~= nil) then
					for key, value in pairs(ROB_Rotations[ROB_SelectedRotationName].SortedActions) do
						if (ROB_Rotations[ROB_SelectedRotationName].ActionList[value].v_spellname == ROB_LAST_CASTED and ROB_Rotations[ROB_SelectedRotationName].ActionList[value].b_toggle and ROB_Rotations[ROB_SelectedRotationName].ActionList[value].b_toggleoff) then
							_G["ROB_TOGGLE_"..string.sub(ROB_Rotations[ROB_SelectedRotationName].ActionList[value].v_togglename, 8)] = 0
						end
						--Set the last casted for the duration checking
						if (ROB_Rotations[ROB_SelectedRotationName].ActionList[value].v_spellname == arg2) then
							ROB_Rotations[ROB_SelectedRotationName].ActionList[value].v_durationstartedtime = GetTime()
						end
						if (GetSpellInfo(ROB_Rotations[ROB_SelectedRotationName].ActionList[value].v_spellname) and GetSpellInfo(ROB_Rotations[ROB_SelectedRotationName].ActionList[value].v_spellname) == arg2) then
							ROB_Rotations[ROB_SelectedRotationName].ActionList[value].v_durationstartedtime = GetTime()
						end
					end
				end
			end
		end
	elseif (event == "COMBAT_LOG_EVENT_UNFILTERED" and arg4 == UnitGUID("player")) then
		--First check if we need to add to the ROB_LOCAL_UNITS
		local _unitguid   = nil
		local member = UnitGUID("player")
		local _sourceisnpc = false
		local _destisnpc = false
		if (string.sub(arg4,9,11)~="000") then _sourceisnpc = true; end
		if (string.sub(arg8,9,11)~="000") then _destisnpc = true; end

		--if the source is a friendly and the destination is a npc _unitguid = destinationguid
		if (arg4 == member and arg8 and _destisnpc) then _unitguid = arg8; end
		--if the destination is a friendly and the source is a npc _unitguid = sourceguid
		--if (arg8 == member and arg4 and _sourceisnpc) then _unitguid = arg4; end
		member = UnitGUID("pet")
		--if the source is a friendly pet and the destination is a npc _unitguid = destinationguid
		if (arg4 == member and arg8 and _destisnpc) then _unitguid = arg8; end
		--if the destination is a friendly pet and the source is a npc _unitguid = sourceguid
		--if (arg8 == member and arg4 and _sourceisnpc) then _unitguid = arg4; end
		if GetNumRaidMembers() > 0 then
			for i = 1, GetNumRaidMembers() do
				member = UnitGUID("raid" .. i)
				--if the source is a friendly and the destination is a npc _unitguid = destinationguid
				if (arg4 == member and arg8 and _destisnpc) then _unitguid = arg8;break; end
				--if the destination is a friendly and the source is a npc _unitguid = sourceguid
				--if (arg8 == member and arg4 and _sourceisnpc) then _unitguid = arg4;break; end
				member = UnitGUID("raid" .. i.."pet")
				--if the source is a friendly and the destination is a npc _unitguid = destinationguid
				if (arg4 == member and arg8 and _destisnpc) then _unitguid = arg8;break; end
				--if the destination is a friendly pet and the source is a npc _unitguid = sourceguid
				--if (arg8 == member and arg4 and _sourceisnpc) then _unitguid = arg4;break; end
			end
		else
			for i = 1, GetNumPartyMembers() do
				member = UnitGUID("party" .. i)
				--if the source is a friendly and the destination is a npc _unitguid = destinationguid
				if (arg4 == member and arg8 and _destisnpc) then _unitguid = arg8;break; end
				--if the destination is a friendly and the source is a npc _unitguid = sourceguid
				--if (arg8 == member and arg4 and _sourceisnpc) then _unitguid = arg4;break; end
				member = UnitGUID("party" .. i.."pet")
				--if the source is a friendly pet and the destination is a npc _unitguid = destinationguid
				if (arg4 == member and arg8 and _destisnpc) then _unitguid = arg8;break; end
				--if the destination is a friendly pet and the source is a npc _unitguid = sourceguid
				--if (arg8 == member and arg4 and _sourceisnpc) then _unitguid = arg4;break; end
			end
		end
		--Dont count certain things like totems
		if (string.find(tostring(arg9),"Totem")) then _unitguid = nil; end

		--print("_eventEvent=".._eventEvent)
		--if ((not string.find(tostring(arg5),"Totem")) and (not string.find(tostring(arg9),"Totem")) and _unitguid and (not ROB_LOCAL_UNITS[_unitguid])) then
		if ( string.find(tostring(_eventEvent),"DAMAGE") and _unitguid and (not ROB_LOCAL_UNITS[_unitguid])) then
			ROB_LOCAL_UNITS[_unitguid] = {}
			ROB_LOCAL_UNITS[_unitguid]["LastUpdate"] = GetTime()
			--print("adding "..tostring(arg5).."|"..tostring(arg9)..":"..tostring(_unitguid)..":".._eventEvent.." time="..tostring(ROB_LOCAL_UNITS[_unitguid]["LastUpdate"]))
			--elseif ((not string.find(tostring(arg5),"Totem")) and (not string.find(tostring(arg9),"Totem")) and _unitguid and ROB_LOCAL_UNITS[_unitguid]) then
		elseif (string.find(tostring(_eventEvent),"DAMAGE") and _unitguid and ROB_LOCAL_UNITS[_unitguid]) then
			ROB_LOCAL_UNITS[_unitguid]["LastUpdate"] = GetTime()

			--print("updating time for "..tostring(_unitguid)..":"..tostring(ROB_LOCAL_UNITS[_unitguid]["LastUpdate"]))
		end

		if (_eventEvent == "UNIT_DIED" or _eventEvent == "UNIT_DESTROYED") then
			--print("unit ".._eventEvent..arg8.." died")
			--print("removing="..arg9)
			ROB_LOCAL_UNITS[arg8] = nil
		end
		if (not ROB_SelectedRotationName) then
			--If we cant compare spells to a rotation to get the interrupt then exit
			return
		end
		if _eventEvent == "SPELL_INTERRUPT" then
			if arg5 ~= UnitName("player") then return end
			if not GetSpellLink(arg15) then return end
			if not GetSpellLink(_eventSpellname) then return end
			_message = (""..GetSpellLink(_eventSpellname).." "..ROB_UI_INTERRUPTED_MSG.." "..GetSpellLink(arg15))
			print(_message)
		end
	end

end

function ROB_CheckLocalUnits()
	--ROB_LOCAL_UNITS
	--print("unitcount="..tostring(#ROB_LOCAL_UNITS))
	for i,v  in pairs(ROB_LOCAL_UNITS) do
		--print("timesince="..(GetTime() - ROB_LOCAL_UNITS[i]["LastUpdate"]))
		if (GetTime() - ROB_LOCAL_UNITS[i]["LastUpdate"] > 12) then
			--table.remove(ROB_LOCAL_UNITS, i)
			--print("removing from timeout 12 seconds"..tostring(i))
			ROB_LOCAL_UNITS[i] = nil
		end
		--		print("time="..ROB_LOCAL_UNITS[i]["LastUpdate"])
	end

	local _ROB_NUM_MOBS = 0
	for k,v  in pairs(ROB_LOCAL_UNITS) do    _ROB_NUM_MOBS = _ROB_NUM_MOBS + 1 end
	ROB_NUM_MOBS = _ROB_NUM_MOBS
	--print("unitcount1="..ROB_NUM_MOBS)
end

function ROB_LoadDefaultInterruptList()
	if (not ROB_Lists) then
		ROB_Lists = {}
	end

	ROB_Lists["Interrupt"] = {}
	ROB_Lists["Interrupt"]["SortedSpells"] ={}

	ROB_Lists["PvP"] = {}
	ROB_Lists["PvP"]["SortedSpells"] ={}

	ROB_Lists["Interrupt"]["SortedSpells"] = {
		"Arcane Annihilator", -- [1]
		"Arcane Infusion", -- [2]
		"Arcane Storm", -- [3]
		"Cauterize", -- [4]
		"Chain Heal", -- [5]
		"Corrupted Flame", -- [6]
		"Crimson Flames", -- [7]
		"Cursed Bullets", -- [8]
		"Cyclone", -- [9]
		"Dark Mending", -- [10]
		"Depravity", -- [11]
		"Divine Light", -- [12]
		"Fear", -- [13]
		"Fieroblast", -- [14]
		"Fireball Volley", -- [15]
		"Flash of Light", -- [16]
		"Force of Earth", -- [17]
		"Frostbolt", -- [18]
		"Frostfire Bolt", -- [19]
		"Gale Wind", -- [20]
		"Harden Skin", -- [21]
		"Holy Light", -- [22]
		"Howl of Terror", -- [23]
		"Ignition", -- [24]
		"Inferno Leap", -- [25]
		"Lava Bolt", -- [26]
		"Mend Rotten Flesh", -- [27]
		"Molten Burst", -- [28]
		"Pact of Darkness", -- [29]
		"Scorch", -- [30]
		"Seaswell", -- [31]
		"Shadow Nova", -- [32]
		"Summon Sun Orb", -- [33]
		"Tears of Blood", -- [34]
		"Tranquility", -- [35]
		"Water Shell", -- [36]
		"Whispers of Hethiss", -- [37]
	}

	ROB_Lists["PvP"]["SortedSpells"] = {
		"Divine Light", -- [1]
		"Entangling Roots", -- [2]
		"Fear", -- [3]
		"Flash of Light", -- [4]
		"Healing Surge", -- [5]
		"Hex", -- [6]
		"Holy Light", -- [7]
		"Howl of Terror", -- [8]
		"Mind Blast", -- [9]
		"Mind Flay", -- [10]
		"Penance", -- [11]
		"Polymorph", -- [12]
		"Regrowth", -- [13]
	}

end

function ROB_ADDON_Load(addon)
	local key, value;

	if (addon ~= "RotationBuilder") then return end

	-- Initialize
	for key, value in pairs(ROB_Options_Default) do
		if (ROB_Options[key] == nil) then
			ROB_Options[key] = value;
		end
	end

	if (not ROB_Lists or #ROB_Lists < 1) then
		ROB_LoadDefaultInterruptList()
	end

	--After loading the options check if we have loaded once before if not then load default rotations
	if (ROB_Options["loaddefault"]) then
		ROB_LoadDefaultRotations()
		ROB_Options["loaddefault"] = false
		--Do we have a spell list?
	else
		--Weve loaded once before do we have a last loaded rotation?
		if (ROB_Options["lastrotation"] and ROB_Options["lastrotation"] ~= "" and ROB_Options["lastrotation"] ~= nil) then
			ROB_SwitchRotation(ROB_Options["lastrotation"], true)
		end
	end

	if (LibStub and LibStub:GetLibrary('LibDataBroker-1.1', true)) then
		ROB_LoadDataBrokerPlugin()
	end

	if (LibStub and LibStub:GetLibrary('LibButtonFacade', true)) then
		ROB_LoadMasquePlugin()
	end

	-- Initialize frame
	ROB_FrameVersionFrameVersion:SetText(ROB_VERSION);

end

function ROB_PLAYER_Enter()
	if (ROB_Initialized == true) then
		return;
	end

	ROB_Initialized = true;



	-- Initialize options tab
	ROB_OptionsTabMiniMapButton:SetChecked(ROB_Options.MiniMap);

	ROB_OptionsTabMiniMapPosSlider:SetValue(ROB_Options.MiniMapPos);
	ROB_OptionsTabMiniMapPosSliderText:SetText(ROB_Options.MiniMapPos);

	ROB_OptionsTabMiniMapRadSlider:SetValue(ROB_Options.MiniMapRad);
	ROB_OptionsTabMiniMapRadSliderText:SetText(ROB_Options.MiniMapRad);

	if ROB_Options.LockIcons then
		ROB_IconsFrame:SetMovable(false);
		ROB_IconsFrame:EnableMouse(false);
		ROB_OptionsTabLockIconsButton:SetChecked(true);
	else
		ROB_IconsFrame:SetMovable(true);
		ROB_IconsFrame:EnableMouse(true);
		ROB_OptionsTabLockIconsButton:SetChecked(false);
	end

	ROB_SetNextActionLocation();

	if (ROB_Options.IconsX == 0 and ROB_Options.IconsY == 0) then
		ROB_IconsFrame:ClearAllPoints();
		ROB_IconsFrame:SetPoint("CENTER");
		ROB_Options.IconsX = ROB_IconsFrame:GetLeft() * ROB_Options.IconScale
		ROB_Options.IconsY = ROB_IconsFrame:GetBottom() * ROB_Options.IconScale
	else
		ROB_IconsFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", ROB_Options.IconsX / ROB_IconsFrame:GetEffectiveScale(), ROB_Options.IconsY / ROB_IconsFrame:GetEffectiveScale())
	end
	ROB_Frame:SetScale(ROB_Options.UIScale)
	ROB_OptionsUIScaleValue:SetText(ROB_Options.UIScale)

	ROB_IconsFrame:SetScale(ROB_Options.IconScale)
	ROB_CurrentActionButton:SetScale(ROB_Options.IconScale)
	ROB_CurrentActionButton:EnableMouse(false)
	ROB_NextActionButton:SetScale(ROB_Options.IconScale)
	ROB_NextActionButton:EnableMouse(false)
	ROB_OptionsTabIconScaleSlider:SetValue(ROB_Options.IconScale);
	ROB_OptionsTabIconScaleSliderText:SetText(ROB_Options.IconScale);

	ROB_OptionsTabToggleIconsAlpha:SetText(ROB_Options.ToggleIconsA);
	ROB_RotationToggle1Button:SetAlpha(ROB_Options.ToggleIconsA);
	ROB_RotationToggle2Button:SetAlpha(ROB_Options.ToggleIconsA);
	ROB_RotationToggle3Button:SetAlpha(ROB_Options.ToggleIconsA);
	ROB_RotationToggle4Button:SetAlpha(ROB_Options.ToggleIconsA);

	ROB_OptionsTabCurrentIconAlpha:SetText(ROB_Options.CurrentIconA);
	ROB_CurrentActionButton:SetAlpha(ROB_Options.CurrentIconA);

	ROB_OptionsTabNextIconAlpha:SetText(ROB_Options.NextIconA);
	ROB_NextActionButton:SetAlpha(ROB_Options.NextIconA);


	ROB_RotationToggle1Button:SetScale(ROB_Options.IconScale);
	ROB_RotationToggle2Button:SetScale(ROB_Options.IconScale);
	ROB_RotationToggle3Button:SetScale(ROB_Options.IconScale);
	ROB_RotationToggle4Button:SetScale(ROB_Options.IconScale);
	ROB_RotationToggle1Button:EnableMouse(false)
	ROB_RotationToggle2Button:EnableMouse(false)
	ROB_RotationToggle3Button:EnableMouse(false)
	ROB_RotationToggle4Button:EnableMouse(false)

	ROB_CurrentActionButtonNormalTexture:Hide()
	ROB_NextActionButtonNormalTexture:Hide()
	ROB_RotationToggle1ButtonNormalTexture:Hide()
	ROB_RotationToggle2ButtonNormalTexture:Hide()
	ROB_RotationToggle3ButtonNormalTexture:Hide()
	ROB_RotationToggle4ButtonNormalTexture:Hide()

	ROB_OptionsTabAllowOverwriteButton:SetChecked(ROB_Options.AllowOverwrite);
	ROB_OptionsTabExportBindsButton:SetChecked(ROB_Options.ExportBinds);
	ROB_OptionsTabHideCooldownsButton:SetChecked(ROB_Options.HideCD);

	ROB_UPDATE_INTERVAL = 1 / ROB_Options.updaterate
	ROB_OptionsTabUpdateRateSlider:SetValue(ROB_Options.updaterate);
	ROB_OptionsTabUpdateRateSliderText:SetText(ROB_Options.updaterate);

	ROB_MiniMapButton_Update();

	-- sort rotation list
	ROB_SortRotationList();

	-- update the action list
	ROB_ActionList_Update();

	-- sort spell lists
	ROB_SortSpellLists();

	-- sort spells
	ROB_SortSpells();

	-- update the spells list
	ROB_SpellList_Update();

	-- update rotation modify buttons
	ROB_RotationModifyButtons_UpdateUI();

	-- update spell lists modify buttons
	ROB_SpellListsModifyButtons_UpdateUI()

	-- update rotation ui stuff
	ROB_Rotation_Edit_UpdateUI();

	-- update spell lists ui stuff
	ROB_SpellLists_Edit_UpdateUI();

end

function ROB_OnCommand(cmd)
	local help, helpIx, msg;

	if    (cmd == "") then
		help = true;
	elseif   (cmd == "help") then
		help = true;
	elseif   (cmd == "show") then
		ROB_OnToggle(self, true);
	elseif   (string.sub(cmd,1,2) == "r ") then
		ROB_SwitchRotation(string.sub(cmd,3), true);
	elseif   (cmd == "hide") then
		ROB_OnToggle(self, false);
	elseif   (cmd == "resetui") then
		ROB_Options_ResetUI_OnClick(self);
	else
		help = true;
	end

	if (help == true) then
		print("Rotation Builder commands:")
		print(" help - display this help")
		print(" show - show Rotation Builder")
		print(" r ShadowMelt - Selects the ShadowMelt rotation")
		print(" hide - hide Rotation Builder")
		print(" resetui - reset Rotation Builder window positions")
	end
end

function ROB_OnToggle(self, visible)
	_G["ROB_RotationKeyBindButton"]:EnableKeyboard(false)
	_G["ROB_AO_ActionKeyBindButton"]:EnableKeyboard(false)
	_G["ROB_SpellNameInputBox"]:SetFocus()
	_G["ROB_SpellNameInputBox"]:ClearFocus()

	if    ((visible == false) or ((visible == nil) and ROB_Frame:IsVisible())) then
		PlaySound("igMiniMapClose");
		ROB_Frame:Hide();

	elseif   ((visible == true) or ((visible == nil) and not ROB_Frame:IsVisible())) then
		PlaySound("igMiniMapOpen");
		ROB_Frame:Show();
		ROB_RotationTab:Show()
		ROB_MainWindowSwitchToTab(ROB_FrameTab1)
		ROB_SpellListsTab:Hide()
		ROB_OptionsTab:Hide()
	end
end

function ROB_ToggleIconsFrame()
	--toggle button frames
	if (ROB_IconsFrame:IsShown()) then
		ROB_IconsFrame:Hide();
	else
		ROB_IconsFrame:Show();
	end
end

function ROB_MainWindowSwitchToTab(self)
	ROB_RotationTab:Hide()
	ROB_SpellListsTab:Hide()
	ROB_OptionsTab:Hide()

	ROB_FrameTab1:UnlockHighlight()
	ROB_FrameTab2:UnlockHighlight()
	ROB_FrameTab3:UnlockHighlight()

	self:LockHighlight()

	if (self:GetName() == "ROB_FrameTab1") then ROB_RotationTab:Show() end
	if (self:GetName() == "ROB_FrameTab2") then ROB_SpellListsTab:Show() end
	if (self:GetName() == "ROB_FrameTab3") then ROB_OptionsTab:Show() end
end

function ROB_ActionOptionsSwitchToTab(self)
	ROB_GeneralActionOptionsTab:Hide()
	ROB_PlayerActionOptionsTab:Hide()
	ROB_TargetActionOptionsTab:Hide()
	ROB_PetActionOptionsTab:Hide()
	ROB_FocusActionOptionsTab:Hide()
	ROB_CustomActionOptionsTab:Hide()

	ROB_RotationTabTab1:UnlockHighlight()
	ROB_RotationTabTab2:UnlockHighlight()
	ROB_RotationTabTab3:UnlockHighlight()
	ROB_RotationTabTab4:UnlockHighlight()
	ROB_RotationTabTab5:UnlockHighlight()
	ROB_RotationTabTab6:UnlockHighlight()

	self:LockHighlight()

	if (self:GetName() == "ROB_RotationTabTab1") then ROB_GeneralActionOptionsTab:Show(); end
	if (self:GetName() == "ROB_RotationTabTab2") then ROB_PlayerActionOptionsTab:Show(); end
	if (self:GetName() == "ROB_RotationTabTab3") then ROB_TargetActionOptionsTab:Show(); end
	if (self:GetName() == "ROB_RotationTabTab4") then ROB_PetActionOptionsTab:Show(); end
	if (self:GetName() == "ROB_RotationTabTab5") then ROB_FocusActionOptionsTab:Show(); end
	if (self:GetName() == "ROB_RotationTabTab6") then ROB_CustomActionOptionsTab:Show(); end
end

function ROB_Close_OnClick(self)
	ROB_OnToggle(self, false);
end

function ROB_RotationListButton_OnClick(self)
	-- ignore if we are editing
	if (ROB_EditingRotationTable ~= nil) then
		return;
	end

	ROB_SelectedRotationIndex = self:GetID() + FauxScrollFrame_GetOffset(ROB_RotationScrollFrame);
	ROB_SelectedRotationName = ROB_SortedRotations[ROB_SelectedRotationIndex]
	ROB_SwitchRotation(ROB_SelectedRotationName, true)

	-- update rotation list
	ROB_SortRotationList();

	-- update the action list
	ROB_ActionList_Update();

	-- update rotation modify buttons
	ROB_RotationModifyButtons_UpdateUI();

	-- update rotation ui stuff
	ROB_Rotation_Edit_UpdateUI();
end

function ROB_SpellListsButton_OnClick(self)
	-- ignore if we are editing
	if (ROB_EditingSpellListTable ~= nil) then
		return;
	end

	ROB_SelectedSpellListIndex = self:GetID() + FauxScrollFrame_GetOffset(ROB_SpellListsScrollFrame);
	ROB_SelectedSpellListName = ROB_SortedSpellLists[ROB_SelectedSpellListIndex]
	ROB_SwitchSpellList(ROB_SelectedSpellListName)

	-- sort spell lists
	ROB_SortSpellLists();
	-- sort spells
	ROB_SortSpells();

	-- update the spells list
	ROB_SpellList_Update();

	-- update spelllist modify buttons
	ROB_SpellListsModifyButtons_UpdateUI();

	-- update spelllist ui stuff
	ROB_SpellLists_Edit_UpdateUI()
end

function ROB_SwitchRotation(RotationID,_byName)
	local _MatchingRotationName = nil
	--if we are modififying a rotation dont switch to a different one
	if (ROB_EditingRotationTable ~= nil) then
		--print("Cant switch rotations while you are editing one")

		--just force a save and switch the rotation
		ROB_Save_OnClick(self)
	end


	if (_byName) then
		ROB_SelectedRotationName = RotationID
	else
		for _RotationName,_value in pairs(ROB_Rotations) do
			if (not ROB_Rotations[_RotationName].bindindex) then
				ROB_Rotations[_RotationName]["bindindex"] = 0
			else
				--this rotation has a bind index so check if it matches the one we pressed
				if (ROB_Rotations[_RotationName].bindindex == RotationID) then
					_MatchingRotationName = _RotationName
					break
				end
			end
		end
		if (_MatchingRotationName == nil) then
			print(ROB_UI_DEBUG_PREFIX..ROB_UI_ROTATION_E1)
			return;
		end
		ROB_SelectedRotationName = _MatchingRotationName
	end

	if (ROB_Rotations[ROB_SelectedRotationName] ~= nil and ROB_Rotations[ROB_SelectedRotationName].SortedActions ~= nil) then
		for key, value in pairs(ROB_Rotations[ROB_SelectedRotationName].SortedActions) do
			if (ROB_Rotations[ROB_SelectedRotationName].ActionList[value].b_toggle and ROB_Rotations[ROB_SelectedRotationName].ActionList[value].b_toggleon) then
				_G["ROB_TOGGLE_"..string.sub(ROB_Rotations[ROB_SelectedRotationName].ActionList[value].v_togglename, 8)] = 1
			end
			--reset the last casted time for spells that wait specified durations
			ROB_Rotations[ROB_SelectedRotationName].ActionList[value].v_durationstartedtime = 0
		end


		print("Rotation switched to -----["..ROB_SelectedRotationName.."]-----")

		ROB_CURRENT_ACTION = nil
		ROB_NEXT_ACTION = nil
		ROB_SetButtonTexture(ROB_CurrentActionButton, GetTexturePath(""))
		ROB_CurrentActionButtonCooldown:Hide();
		ROB_CurrentActionButtonHotKey:SetText("")
		ROB_CurrentActionButton:Show()
		ROB_SetButtonTexture(ROB_NextActionButton, GetTexturePath(""))
		ROB_NextActionButtonCooldown:Hide();
		ROB_NextActionButtonHotKey:SetText("")
		ROB_NextActionButton:Show()
		ROB_RotationToggle1Button:Hide()
		ROB_RotationToggle2Button:Hide()
		ROB_RotationToggle3Button:Hide()
		ROB_RotationToggle4Button:Hide()
		ROB_SetButtonTexture(ROB_RotationToggle1Button, "")
		ROB_SetButtonTexture(ROB_RotationToggle2Button, "")
		ROB_SetButtonTexture(ROB_RotationToggle3Button, "")
		ROB_SetButtonTexture(ROB_RotationToggle4Button, "")

		ROB_Options["lastrotation"] = ROB_SelectedRotationName
	else
		print(ROB_UI_DEBUG_PREFIX..RotationID.." "..ROB_UI_ROTATION_E2)
	end

	ROB_RotationModifyButtons_UpdateUI()
	-- update rotation list
	ROB_SortRotationList();
	-- update the action list
	ROB_ActionList_Update();
	-- update rotation ui stuff
	ROB_Rotation_Edit_UpdateUI();
end

function ROB_SwitchSpellList(SpellListID)
	--if we are modififying a spell list dont switch to a different one
	if (ROB_EditingSpellListTable ~= nil) then
		--print("Cant switch rotations while you are editing one")
		--just force a save and switch the rotation
		ROB_SpellListsSave_OnClick(self)
	end

	ROB_SelectedSpellListName = SpellListID

	ROB_SpellListsModifyButtons_UpdateUI()
	-- update spell lists
	ROB_SortSpellLists();
	-- update the spells list
	ROB_SpellList_Update();
	-- update spell lists ui stuff
	ROB_SpellLists_Edit_UpdateUI();
end

function ROB_RotationCreateButton_OnClick(self)
	-- start a new empty list
	ROB_EditingRotationTable = ROB_NewRotation();

	-- new name prompt
	ROB_SelectedRotationName = "<rotation name>";

	-- UPDATE_ROTATION_OPTIONS1
	ROB_RotationNameInputBox:SetText(ROB_SelectedRotationName);
	ROB_RotationKeyBindButton:SetText(ROB_EditingRotationTable.keybind);

	-- update the action list
	ROB_ActionList_Update();

	-- update rotation modify buttons
	ROB_RotationModifyButtons_UpdateUI();

	-- update rotation ui stuff
	ROB_Rotation_Edit_UpdateUI();

	-- set focus to name and highlight current text
	ROB_RotationNameInputBox:SetFocus(true);
	ROB_RotationNameInputBox:HighlightText();

end

function ROB_SpellListCreateButton_OnClick(self)
	-- start a new empty list
	ROB_EditingSpellListTable = { SortedSpells={} };

	-- new name prompt
	ROB_SelectedSpellListName = "<spell list name>";

	-- UPDATE_ROTATION_OPTIONS1
	ROB_SpellListNameInputBox:SetText(ROB_SelectedSpellListName);

	-- update the spell list
	ROB_SpellList_Update();

	-- update rotation modify buttons
	ROB_SpellListsModifyButtons_UpdateUI();

	-- update rotation ui stuff
	ROB_SpellLists_Edit_UpdateUI();

	-- set focus to name and highlight current text
	ROB_SpellListNameInputBox:SetFocus(true);
	ROB_SpellListNameInputBox:HighlightText();

end

function ROB_ModifyRotationButton_OnClick(self)
	-- copy the selected list
	ROB_EditingRotationTable = ROB_CopyTable(ROB_Rotations[ROB_SortedRotations[ROB_SelectedRotationIndex]]);

	-- copy name
	ROB_SelectedRotationName = ROB_SortedRotations[ROB_SelectedRotationIndex];

	-- UPDATE_ROTATION_OPTIONS2
	ROB_RotationNameInputBox:SetText(ROB_SelectedRotationName);

	ROB_RotationKeyBindButton:SetText(ROB_EditingRotationTable.keybind);

	--Always clear the current action because it may be leftover from a previous rotation
	ROB_CurrentActionName = nil

	-- update the action list
	ROB_ActionList_Update();

	-- update rotation modify buttons
	ROB_RotationModifyButtons_UpdateUI();

	-- update rotation ui stuff
	ROB_Rotation_Edit_UpdateUI();

end

function ROB_ModifySpellListsButton_OnClick(self)
	-- copy the selected list
	ROB_EditingSpellListTable = ROB_CopyTable(ROB_Lists[ROB_SortedSpellLists[ROB_SelectedSpellListIndex]]);
	--ROB_SortedSpells = ROB_CopyTable(ROB_Lists[ROB_SortedSpellLists[ROB_SelectedSpellListIndex]]["Sorted Spells"]);

	-- copy name
	ROB_SelectedSpellListName = ROB_SortedSpellLists[ROB_SelectedSpellListIndex];

	-- UPDATE_ROTATION_OPTIONS2
	ROB_SpellListNameInputBox:SetText(ROB_SelectedSpellListName);


	--Always clear the current spell because it may be leftover from a previous rotation
	ROB_CurrentSpellName = nil

	-- update the spells list
	ROB_SpellList_Update();

	-- update spells list modify buttons
	ROB_SpellListsModifyButtons_UpdateUI();

	-- update spells list ui stuff
	ROB_SpellLists_Edit_UpdateUI();

end

function ROB_RotationListDeleteButton_OnClick(self)
	StaticPopup_Show("ROB_PROMPT_LIST_DELETE");
end

function ROB_SpellListsDeleteButton_OnClick(self)
	StaticPopup_Show("ROB_PROMPT_SPELLLIST_DELETE");
end

function ROB_RotationDelete_OnAccept()
	ROB_Rotations[ROB_SortedRotations[ROB_SelectedRotationIndex]] = nil;

	ROB_SelectedRotationIndex = nil;
	ROB_SelectedRotationName = nil;

	-- update rotation list
	ROB_SortRotationList();

	-- update the action list
	ROB_ActionList_Update();

	-- update rotation modify buttons
	ROB_RotationModifyButtons_UpdateUI();

	-- update rotation ui stuff
	ROB_Rotation_Edit_UpdateUI();

	-- recreate the menu
	ROB_MenuCreate()
end

function ROB_SpellListDelete_OnAccept()
	ROB_Lists[ROB_SortedSpellLists[ROB_SelectedSpellListIndex]] = nil;

	ROB_SelectedSpellListIndex = nil;
	ROB_SelectedSpellListName = nil;

	-- update spells list
	ROB_SortSpellLists();

	-- update the spell list
	ROB_SpellList_Update();

	-- update spell lists modify buttons
	ROB_SpellListsModifyButtons_UpdateUI();

	-- update spell lists ui stuff
	ROB_SpellLists_Edit_UpdateUI();
end

function ROB_RotationDelete_OnCancel()
end

function ROB_SpellListDelete_OnCancel()
end

function ROB_SpellListNameInputBox_OnTextChanged(self)
	local _text = self:GetText()
	if (string.find(_text, "%[") or string.find(_text, "%]") or string.find(_text, ",")) then
		print(ROB_UI_ADD_ROTATION_CFAIL)
		return
	end
	ROB_SelectedSpellListName = ROB_SpellListNameInputBox:GetText();
	ROB_Rotation_Edit_UpdateUI();
end

function ROB_RotationNameInputBox_OnTextChanged(self)
	local _text = self:GetText()
	if (string.find(_text, "%[") or string.find(_text, "%]") or string.find(_text, ",")) then
		print(ROB_UI_ADD_ROTATION_CFAIL)
		return
	end
	ROB_SelectedRotationName = ROB_RotationNameInputBox:GetText();
	ROB_Rotation_Edit_UpdateUI();
end

function ROB_Save_OnClick(self)
	local _lastEditedRotation = ROB_SelectedRotationName
	ROB_Rotations[ROB_SelectedRotationName] = ROB_EditingRotationTable;
	-- update rotation list
	ROB_SortRotationList();

	-- and discard to reset editing
	ROB_Discard_OnClick(self);

	ROB_SwitchRotation(_lastEditedRotation, true)
end

function ROB_SpellListsSave_OnClick(self)
	local _lastEditedSpellList = ROB_SelectedSpellListName
	ROB_Lists[ROB_SelectedSpellListName] = ROB_EditingSpellListTable;
	-- update spell lists
	ROB_SortSpellLists();

	-- and discard to reset editing
	ROB_SpellListsDiscard_OnClick(self);

	ROB_SwitchSpellList(_lastEditedSpellList)
end

function ROB_Discard_OnClick(self)
	-- smoke the edit list and edit name
	ROB_EditingRotationTable = nil;

	ROB_SelectedActionIndex = nil;
	ROB_SelectedRotationName = nil;

	table.wipe(ROB_DropDownTableTemp)
	ROB_DropDownStoreToTemp = nil;

	-- update lists edit
	ROB_ActionList_Update();

	-- update rotation modify buttons
	ROB_RotationModifyButtons_UpdateUI();

	-- update rotation ui stuff
	ROB_Rotation_Edit_UpdateUI();
end

function ROB_SpellListsDiscard_OnClick(self)
	-- smoke the edit list and edit name
	ROB_EditingSpellListTable = nil;

	ROB_SelectedSpellIndex = nil;
	ROB_SelectedSpellListName = nil;

	-- update spells
	ROB_SpellList_Update();

	-- update spell lists modify buttons
	ROB_SpellListsModifyButtons_UpdateUI();

	-- update spell lists ui stuff
	ROB_SpellLists_Edit_UpdateUI();
end

function ROB_ActionListButton_OnClick(self, button)
	if (ROB_EditingRotationTable == nil) then
		return
	end

	ROB_SelectedActionIndex = self:GetID() + FauxScrollFrame_GetOffset(ROB_ActionListScrollFrame);
	ROB_CurrentActionName = ROB_EditingRotationTable["SortedActions"][ROB_SelectedActionIndex]

	-- update the action list
	ROB_ActionList_Update();

	-- update the ui stuff
	ROB_Rotation_Edit_UpdateUI();
end

function ROB_SpellListButton_OnClick(self, button)
	if (ROB_EditingSpellListTable == nil) then
		return
	end
	ROB_SelectedSpellIndex = self:GetID() + FauxScrollFrame_GetOffset(ROB_SpellNamesListScrollFrame);
	ROB_CurrentSpellName = ROB_EditingSpellListTable["SortedSpells"][ROB_SelectedSpellIndex]
	-- update the spells list
	ROB_SpellList_Update();
	-- update the ui stuff
	ROB_SpellLists_Edit_UpdateUI();
end

function ROB_ActionListButton_OnLeave(self)
	-- hide tooltips
	GameTooltip:Hide();
	ROB_Tooltip:Hide();
end

function ROB_SpellListTrash_OnClick(self)
	local SpellID;
	if (ROB_EditingSpellListTable == nil) then
		return;
	end
	-- calculate selected item
	SpellID = self:GetParent():GetID() + FauxScrollFrame_GetOffset(ROB_SpellNamesListScrollFrame);

	table.remove(ROB_EditingSpellListTable.SortedSpells, SpellID);
	table.remove(ROB_SortedSpells, SpellID);

	local scrollOffset = #ROB_EditingSpellListTable.SortedSpells
	if (scrollOffset > ROB_ACTION_LIST_LINES) then
		scrollOffset = (#ROB_EditingSpellListTable.SortedSpells - ROB_ACTION_LIST_LINES) * ROB_ACTION_LIST_FRAME_HEIGHT
	else
		scrollOffset = 1
	end
	FauxScrollFrame_OnVerticalScroll(ROB_SpellNamesListScrollFrame, scrollOffset, ROB_ACTION_LIST_FRAME_HEIGHT, ROB_SpellList_Update)

	ROB_SelectedSpellIndex = nil
	ROB_CurrentSpellName = nil
	-- update the action list
	ROB_SpellList_Update();
	-- update rotation ui stuff
	ROB_SpellLists_Edit_UpdateUI();
end

function ROB_ActionListTrash_OnClick(self)
	local ActionID;

	if (ROB_EditingRotationTable == nil) then
		return;
	end

	-- calculate selected item
	ActionID = self:GetParent():GetID() + FauxScrollFrame_GetOffset(ROB_ActionListScrollFrame);

	-- first, kill the list's item selectedrotation
	ROB_EditingRotationTable.ActionList[ROB_EditingRotationTable["SortedActions"][ActionID]] = nil;

	-- and remove from the sort
	table.remove(ROB_EditingRotationTable.SortedActions, ActionID);

	ROB_SelectedActionIndex = nil
	ROB_CurrentActionName = nil

	-- update the action list
	ROB_ActionList_Update();

	-- update rotation ui stuff
	ROB_Rotation_Edit_UpdateUI();

end

function ROB_Lists_Edit_MoveUp(self)
	local itemID;

	-- cannot move above first row
	if (ROB_SelectedActionIndex > 1) then
		-- swap the item order in the edit list
		itemID = ROB_EditingRotationTable["SortedActions"][ROB_SelectedActionIndex];
		ROB_EditingRotationTable["SortedActions"][ROB_SelectedActionIndex] = ROB_EditingRotationTable["SortedActions"][ROB_SelectedActionIndex - 1];
		ROB_EditingRotationTable["SortedActions"][ROB_SelectedActionIndex - 1] = itemID;

		-- decrement selected item
		ROB_SelectedActionIndex = ROB_SelectedActionIndex - 1;

		-- update ui stuff
		ROB_ActionList_Update();
		ROB_Rotation_Edit_UpdateUI();
	end
end

function ROB_Lists_Edit_MoveDown(self)
	local itemID;

	-- cannot move below last row
	if (ROB_SelectedActionIndex < #ROB_EditingRotationTable.SortedActions) then
		-- swap the item order in the edit list
		itemID = ROB_EditingRotationTable["SortedActions"][ROB_SelectedActionIndex];
		ROB_EditingRotationTable["SortedActions"][ROB_SelectedActionIndex] = ROB_EditingRotationTable["SortedActions"][ROB_SelectedActionIndex + 1];
		ROB_EditingRotationTable["SortedActions"][ROB_SelectedActionIndex + 1] = itemID;

		-- increment selected item
		ROB_SelectedActionIndex = ROB_SelectedActionIndex + 1;

		-- update ui stuff
		ROB_ActionList_Update();
		ROB_Rotation_Edit_UpdateUI();
	end
end

function ROB_PasteActionOnAccept(_text)
	local NewActionAlreadyExists = false
	if (_text == nil or _text == "" or ROB_EditingRotationTable == nil) then
		return
	end

	if (string.find(_text, "%[") or string.find(_text, "%]") or string.find(_text, ",") or string.find(_text, "=")) then
		print(ROB_UI_ADD_ACTION_CFAIL)
	end

	for key, value in pairs(ROB_EditingRotationTable.SortedActions) do
		--we found our new action ID so we cant use it because it already exists
		if (value == _text) then
			--we found our new action ID so we cant use it
			print("Action name already exists, try a different name")
			NewActionAlreadyExists = true
			return
		end
	end

	if (NewActionAlreadyExists == false and ROB_ActionClipboard ~= nil) then
		ROB_AddAction((#ROB_EditingRotationTable.SortedActions + 1), _text);
		for key, value in pairs(ROB_ActionClipboard) do
			ROB_EditingRotationTable.ActionList[_text][key] = value
		end
		ROB_SelectedActionIndex = (#ROB_EditingRotationTable.SortedActions)
		ROB_CurrentActionName = _text
		local scrollOffset = #ROB_EditingRotationTable.SortedActions
		if (scrollOffset > ROB_ACTION_LIST_LINES) then
			scrollOffset = (#ROB_EditingRotationTable.SortedActions - ROB_ACTION_LIST_LINES) * ROB_ACTION_LIST_FRAME_HEIGHT
		else
			scrollOffset = 1
		end
		FauxScrollFrame_OnVerticalScroll(ROB_ActionListScrollFrame, scrollOffset, ROB_ACTION_LIST_FRAME_HEIGHT, ROB_ActionList_Update);
		ROB_ActionList_Update();
		ROB_Rotation_Edit_UpdateUI();
	end
end

function ROB_AddActionOnAccept(_text)
	local NewActionAlreadyExists = false
	if (_text == nil or _text == "" or ROB_EditingRotationTable == nil) then
		return
	end

	for key, value in pairs(ROB_EditingRotationTable.SortedActions) do
		--we found our new action ID so we cant use it because it already exists
		if (value == _text) then
			--we found our new action ID so we cant use it
			print("Action name already exists")
			NewActionAlreadyExists = true
			return
		end
	end

	if (NewActionAlreadyExists == false) then
		ROB_CurrentActionName = _text
		ROB_SelectedActionIndex = (#ROB_EditingRotationTable.SortedActions + 1)
		ROB_AddAction(ROB_SelectedActionIndex, _text);
		-- update the action list
		ROB_ActionList_Update();
		-- update the ui stuff
		ROB_Rotation_Edit_UpdateUI();
	end
end

function ROB_AddSpellOnAccept(_text)
	local NewSpellAlreadyExists = false
	if (_text == nil or _text == "" or ROB_EditingSpellListTable == nil) then
		return
	end

	for key, value in pairs(ROB_EditingSpellListTable.SortedSpells) do
		--we found our new spell so we cant use it because it already exists
		if (value == _text) then
			--we found our new action ID so we cant use it
			print("Spell already exists")
			NewSpellAlreadyExists = true
			return
		end
	end

	if (NewSpellAlreadyExists == false) then
		ROB_CurrentSpellName = _text
		ROB_SelectedSpellIndex = (#ROB_EditingSpellListTable.SortedSpells + 1)
		ROB_AddSpell(ROB_SelectedSpellIndex, _text);
		--Sort the spell list
		ROB_SortSpells();
		local scrollOffset = #ROB_EditingSpellListTable.SortedSpells
		if (scrollOffset > ROB_ACTION_LIST_LINES) then
			scrollOffset = (scrollOffset - ROB_ACTION_LIST_LINES) * ROB_ACTION_LIST_FRAME_HEIGHT
		else
			scrollOffset = 1
		end
		FauxScrollFrame_OnVerticalScroll(ROB_SpellNamesListScrollFrame, scrollOffset, ROB_ACTION_LIST_FRAME_HEIGHT, ROB_SpellList_Update)
		-- update the list
		ROB_SpellList_Update();
		-- update the ui stuff
		ROB_SpellLists_Edit_UpdateUI();
	end
end

function ROB_AddActionButton_OnClick(self)
	ROB_GetString("Enter new name for action", "", true, ROB_AddActionOnAccept, _cancelcallback)
end

function ROB_AddSpellButton_OnClick(self)
	ROB_GetString("Enter spell name or number", "", true, ROB_AddSpellOnAccept, _cancelcallback)
end

function ROB_CopyActionButton_OnClick(self)
	local selectedrotation = ROB_EditingRotationTable
	if ((ROB_SelectedActionIndex ~= nil) and ROB_EditingRotationTable ~= nil) then
		ROB_ActionClipboard = selectedrotation.ActionList[selectedrotation.SortedActions[ROB_SelectedActionIndex]]
		print(selectedrotation.SortedActions[ROB_SelectedActionIndex].." copied to clipboard")
	end
end

function ROB_PasteActionButton_OnClick(self)
	ROB_GetString("Enter new name for action", "", true, ROB_PasteActionOnAccept, _cancelcallback)
end

function GetTexturePath(v_spellname)
	local texpath;
	if not v_spellname then return ""; end
	texpath = select(3, GetSpellInfo(v_spellname));

	if not texpath then texpath = "" end
	return texpath;
end

function ROB_IconsFrameOnMouseDown(self, button)
	if (button == "LeftButton" and (not self.isMoving) and (ROB_Options.LockIcons == false)) then
		self:StartMoving();
		self.isMoving = true;
	end
end

function ROB_IconsFrameOnMouseUp(self, button)
	if (button == "LeftButton" and (self.isMoving) and (ROB_Options.LockIcons == false)) then
		self:StopMovingOrSizing();
		self.isMoving = false;

		ROB_Options.IconsX = self:GetLeft() * self:GetEffectiveScale()
		ROB_Options.IconsY = self:GetBottom() * self:GetEffectiveScale()
	end
end

function ROB_SpellValidate(_spell)
	local _spellingCheckPassed = false
	local _parsedSpellID = nil
	local _link = nil

	--Get the spell id
	if (GetSpellLink(_spell)) then
		_parsedSpellID = string.sub(GetSpellLink(_spell),string.find(GetSpellLink(_spell), ":")+1)
		_parsedSpellID = string.sub(_parsedSpellID,1,   string.find(_parsedSpellID, "\124")-1)
		_link = GetSpellLink(_spell)
	else
		--Is it a inventory slot?
		if (_InvSlots[_spell] and GetInventoryItemID("player",_InvSlots[_spell])) then
			_parsedSpellID = GetInventoryItemID("player",_InvSlots[_spell])
			_link = GetInventoryItemLink("player",_InvSlots[_spell])
			--if it found the itemid from the inventory slot then it must have been spelled correctly
			_spellingCheckPassed = true
		end
	end

	if (not (_spell == _parsedSpellID)) then
		--The spell is string so check spelling
		if (GetSpellInfo(_spell) == _spell) then _spellingCheckPassed = true; end
	else
		--The spell does not match the spell name check if the spell id matches the spelllink idwhat is it?
		if (GetSpellLink(_spell) and _spell == _parsedSpellID) then
			_spellingCheckPassed = true
		end
	end

	if (_parsedSpellID and _spellingCheckPassed) then
		ROB_SpellNameInputBoxIcon:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")
		ROB_SpellNameValidateText:SetText(_link.." ".._parsedSpellID)
		GameTooltip:SetHyperlink(_link)
	else
		ROB_SpellNameInputBoxIcon:SetTexture("Interface\\RaidFrame\\ReadyCheck-NotReady")
		ROB_SpellNameValidateText:SetText(ROB_UI_AO_G_SID_VFAIL)
	end
end

function ROB_OptionsTabToggleIconsAlpha_OnTextChanged(self)
	if (self:GetText() == nil) then
		return
	end
	if (tonumber(self:GetText()) and tonumber(self:GetText()) >= 0.1 and tonumber(self:GetText()) <= 1) then
		ROB_Options.ToggleIconsA = tonumber(self:GetText())
		ROB_RotationToggle1Button:SetAlpha(ROB_Options.ToggleIconsA);
		ROB_RotationToggle2Button:SetAlpha(ROB_Options.ToggleIconsA);
		ROB_RotationToggle3Button:SetAlpha(ROB_Options.ToggleIconsA);
		ROB_RotationToggle4Button:SetAlpha(ROB_Options.ToggleIconsA);
	end
end

function ROB_OptionsTabCurrentIconAlpha_OnTextChanged(self)
	if (self:GetText() == nil) then
		return
	end
	if (tonumber(self:GetText()) and tonumber(self:GetText()) >= 0.1 and tonumber(self:GetText()) <= 1) then
		ROB_Options.CurrentIconA = tonumber(self:GetText())
		ROB_CurrentActionButton:SetAlpha(ROB_Options.CurrentIconA);
	end
end

function ROB_OptionsTabNextIconAlpha_OnTextChanged(self)
	if (self:GetText() == nil) then
		return
	end
	if (tonumber(self:GetText()) and tonumber(self:GetText()) >= 0.1 and tonumber(self:GetText()) <= 1) then
		ROB_Options.NextIconA = tonumber(self:GetText())
		ROB_NextActionButton:SetAlpha(ROB_Options.NextIconA);
	end
end

-- ADD_OPTION_FUNCTIONS_BELOW_THIS

function ROB_AO_CheckButton_OnToggle(self,field)
	if (ROB_CurrentActionName and field) then
		ROB_EditingRotationTable.ActionList[ROB_CurrentActionName][field] = (self:GetChecked() ~= nil);
	end
end

function ROB_AO_InputBox_OnTextChanged(self,field,validate)
	local _inputstring = nil
	if (self:GetText() == nil or ROB_CurrentActionName == nil or ROB_EditingRotationTable == nil) then
		return
	else
		_inputstring = self:GetText()

		ROB_EditingRotationTable.ActionList[ROB_CurrentActionName][field] = _inputstring
		if (validate) then ROB_SpellValidate(_inputstring); end
	end
end

function ROB_AO_ToggleOffCheckButton_OnToggle(self)
	ROB_EditingRotationTable.ActionList[ROB_CurrentActionName].b_toggleoff = (self:GetChecked() ~= nil);
end

function ROB_AO_ToggleIconInputBox_OnTextChanged(self)
	if (self:GetText() == nil or ROB_CurrentActionName == nil or ROB_EditingRotationTable == nil) then
		return
	else
		ROB_EditingRotationTable.ActionList[ROB_CurrentActionName].v_toggleicon = self:GetText()
		ROB_AO_ToggleIconTexture:SetTexture(GetTexturePath(ROB_EditingRotationTable.ActionList[ROB_CurrentActionName].v_toggleicon))
	end
end

function ROB_AO_ActionIcon_OnTextChanged(self)
	if (self:GetText() == nil or ROB_CurrentActionName == nil or ROB_EditingRotationTable == nil) then
		return
	else
		ROB_EditingRotationTable.ActionList[ROB_CurrentActionName].v_actionicon = self:GetText()
		ROB_AO_ActionIconTexture:SetTexture(GetTexturePath(ROB_EditingRotationTable.ActionList[ROB_CurrentActionName].v_actionicon))
	end
end

function ROB_GetString(_prompt, _defaultvalue, _cancelable, _okcallback, _cancelcallback)
	ROB_StringDialog_PromptText:SetText(_prompt)
	ROB_StringDialog_TextBox:SetText("") -- Causes the insertion point to move to the end on the next SetText
	ROB_StringDialog_TextBox:SetText(_defaultvalue)
	if _cancelable then
		ROB_StringDialog_OKButton:Show()
		ROB_StringDialog_OKButton:SetText(ROB_UI_OK_BUTTON)
		ROB_StringDialog_CancelButton:SetText(ROB_UI_CANCEL_BUTTON)
	else
		ROB_StringDialog_OKButton:Hide()
		ROB_StringDialog_CancelButton:SetText(ROB_UI_CLOSE_BUTTON)
	end
	ROB_StringDialog.OKCallbackFunction = _okcallback
	ROB_StringDialog.CancelCallbackFunction = _cancelcallback
	ROB_StringDialog:Show()
	ROB_StringDialog_TextBox:SetFocus()
end

function ROB_StringDialog_OKButton_OnClick()
	ROB_StringDialog:Hide()
	if ROB_StringDialog.OKCallbackFunction then ROB_StringDialog.OKCallbackFunction(ROB_StringDialog_TextBox:GetText()) end
end

function ROB_StringDialog_CancelButton_OnClick()
	ROB_StringDialog:Hide()
	if ROB_StringDialog.CancelCallbackFunction then ROB_StringDialog.CancelCallbackFunction() end
end

function ROB_StringDialog_TextBox_OnTextChanged()
	if ROB_StringDialog_TextBox:GetText() ~= "" then
		ROB_StringDialog_OKButton:Enable()
	else
		ROB_StringDialog_OKButton:Disable()
	end
end

function ROB_AO_ToggleDropDownButton_OnLoad(frame)
	local ToggleName = ""
	UIDropDownMenu_SetWidth(frame, 75)
	UIDropDownMenu_JustifyText(frame, "LEFT");

	ROB_DropDownStoreToTemp = "v_togglename"

	local i=0
	for i=1, 4 do
		table.wipe(ROB_DropDownTableTemp)
		ToggleName = "Toggle "..i;

		ROB_DropDownTableTemp.text  = ToggleName
		ROB_DropDownTableTemp.value = ToggleName
		ROB_DropDownTableTemp.func  = ROB_ActionOptionDropDown_Selected
		UIDropDownMenu_AddButton(ROB_DropDownTableTemp);
	end
end

function ROB_AO_BreakChannelingDropDownButton_OnLoad(frame)
	if (not ROB_Lists) then
		return
	end
	local ToggleName = ""
	UIDropDownMenu_SetWidth(frame, 75)
	UIDropDownMenu_JustifyText(frame, "LEFT");

	ROB_DropDownStoreToTemp = "v_breakchanneling"

	for key, value in pairs(ROB_Lists) do
		table.wipe(ROB_DropDownTableTemp)
		ROB_DropDownTableTemp.text  = key
		ROB_DropDownTableTemp.value = key
		ROB_DropDownTableTemp.func  = ROB_BreakChannelingDropDown_Selected
		UIDropDownMenu_AddButton(ROB_DropDownTableTemp);
	end
end

function ROB_AO_T_InterruptDropDownButton_OnLoad(frame)
	if (not ROB_Lists) then
		return
	end
	local ToggleName = ""
	UIDropDownMenu_SetWidth(frame, 75)
	UIDropDownMenu_JustifyText(frame, "LEFT");

	ROB_DropDownStoreToTemp = "v_t_interrupt"

	for key, value in pairs(ROB_Lists) do
		table.wipe(ROB_DropDownTableTemp)
		ROB_DropDownTableTemp.text  = key
		ROB_DropDownTableTemp.value = key
		ROB_DropDownTableTemp.func  = ROB_TargetInterruptDropDown_Selected
		UIDropDownMenu_AddButton(ROB_DropDownTableTemp);
	end
end

function ROB_AO_F_InterruptDropDownButton_OnLoad(frame)
	if (not ROB_Lists) then
		return
	end
	local ToggleName = ""
	UIDropDownMenu_SetWidth(frame, 75)
	UIDropDownMenu_JustifyText(frame, "LEFT");

	ROB_DropDownStoreToTemp = "v_f_interrupt"

	for key, value in pairs(ROB_Lists) do
		table.wipe(ROB_DropDownTableTemp)
		ROB_DropDownTableTemp.text  = key
		ROB_DropDownTableTemp.value = key
		ROB_DropDownTableTemp.func  = ROB_FocusInterruptDropDown_Selected
		UIDropDownMenu_AddButton(ROB_DropDownTableTemp);
	end
end

function ROB_AO_C_InterruptDropDownButton_OnLoad(frame)
	if (not ROB_Lists) then
		return
	end
	local ToggleName = ""
	UIDropDownMenu_SetWidth(frame, 75)
	UIDropDownMenu_JustifyText(frame, "LEFT");

	ROB_DropDownStoreToTemp = "v_c_interrupt"

	for key, value in pairs(ROB_Lists) do
		table.wipe(ROB_DropDownTableTemp)
		ROB_DropDownTableTemp.text  = key
		ROB_DropDownTableTemp.value = key
		ROB_DropDownTableTemp.func  = ROB_CustomInterruptDropDown_Selected
		UIDropDownMenu_AddButton(ROB_DropDownTableTemp);
	end
end

function ROB_ActionOptionDropDown_Selected(self)
	if (ROB_EditingRotationTable ~= nil and ROB_CurrentActionName ~= nil and ROB_DropDownStoreToTemp ~= nil) then
		ROB_EditingRotationTable.ActionList[ROB_CurrentActionName][ROB_DropDownStoreToTemp] = self.value
		UIDropDownMenu_SetSelectedValue(ROB_AO_ToggleDropDownButton, ROB_EditingRotationTable.ActionList[ROB_CurrentActionName][ROB_DropDownStoreToTemp]);
	end
end

function ROB_BreakChannelingDropDown_Selected(self)
	if (ROB_EditingRotationTable ~= nil and ROB_CurrentActionName ~= nil and ROB_DropDownStoreToTemp ~= nil) then
		ROB_EditingRotationTable.ActionList[ROB_CurrentActionName][ROB_DropDownStoreToTemp] = self.value
		UIDropDownMenu_SetSelectedValue(ROB_AO_BreakChannelingDropDownButton, ROB_EditingRotationTable.ActionList[ROB_CurrentActionName][ROB_DropDownStoreToTemp]);
	end
end

function ROB_TargetInterruptDropDown_Selected(self)
	if (ROB_EditingRotationTable ~= nil and ROB_CurrentActionName ~= nil and ROB_DropDownStoreToTemp ~= nil) then
		ROB_EditingRotationTable.ActionList[ROB_CurrentActionName][ROB_DropDownStoreToTemp] = self.value
		UIDropDownMenu_SetSelectedValue(ROB_AO_T_InterruptDropDownButton, ROB_EditingRotationTable.ActionList[ROB_CurrentActionName][ROB_DropDownStoreToTemp]);
	end
end

function ROB_FocusInterruptDropDown_Selected(self)
	if (ROB_EditingRotationTable ~= nil and ROB_CurrentActionName ~= nil and ROB_DropDownStoreToTemp ~= nil) then
		ROB_EditingRotationTable.ActionList[ROB_CurrentActionName][ROB_DropDownStoreToTemp] = self.value
		UIDropDownMenu_SetSelectedValue(ROB_AO_F_InterruptDropDownButton, ROB_EditingRotationTable.ActionList[ROB_CurrentActionName][ROB_DropDownStoreToTemp]);
	end
end

function ROB_CustomInterruptDropDown_Selected(self)
	if (ROB_EditingRotationTable ~= nil and ROB_CurrentActionName ~= nil and ROB_DropDownStoreToTemp ~= nil) then
		ROB_EditingRotationTable.ActionList[ROB_CurrentActionName][ROB_DropDownStoreToTemp] = self.value
		UIDropDownMenu_SetSelectedValue(ROB_AO_C_InterruptDropDownButton, ROB_EditingRotationTable.ActionList[ROB_CurrentActionName][ROB_DropDownStoreToTemp]);
	end
end

function ROB_SetNextActionLocation()
	ROB_NextActionButton:ClearAllPoints();
	ROB_RotationToggle1Button:ClearAllPoints();
	ROB_RotationToggle2Button:ClearAllPoints();
	ROB_RotationToggle3Button:ClearAllPoints();
	ROB_RotationToggle4Button:ClearAllPoints();

	UIDropDownMenu_SetSelectedValue(ROB_OptionsNextActionLocationDropDownButton, ROB_Options.NextIconLocation)
	UIDropDownMenu_SetText(ROB_OptionsNextActionLocationDropDownButton, ROB_Options.NextIconLocation)


	if (ROB_Options.NextIconLocation == "BOTTOM" or ROB_Options.NextIconLocation == "TOP") then
		if (ROB_Options.NextIconLocation == "BOTTOM") then ROB_NextActionButton:SetPoint("TOP","ROB_CurrentActionButton","BOTTOM"); end
		if (ROB_Options.NextIconLocation == "TOP") then ROB_NextActionButton:SetPoint("BOTTOM","ROB_CurrentActionButton","TOP"); end
		ROB_RotationToggle1Button:SetPoint("TOPRIGHT","ROB_CurrentActionButton","TOPLEFT")
		ROB_RotationToggle2Button:SetPoint("TOPLEFT","ROB_CurrentActionButton","TOPRIGHT")
		ROB_RotationToggle3Button:SetPoint("BOTTOMRIGHT","ROB_CurrentActionButton", "BOTTOMLEFT")
		ROB_RotationToggle4Button:SetPoint("BOTTOMLEFT","ROB_CurrentActionButton", "BOTTOMRIGHT")
	end

	if (ROB_Options.NextIconLocation == "RIGHT" or ROB_Options.NextIconLocation == "LEFT") then
		if (ROB_Options.NextIconLocation == "RIGHT") then ROB_NextActionButton:SetPoint("LEFT","ROB_CurrentActionButton","RIGHT"); end
		if (ROB_Options.NextIconLocation == "LEFT") then ROB_NextActionButton:SetPoint("RIGHT","ROB_CurrentActionButton","LEFT"); end
		ROB_RotationToggle1Button:SetPoint("BOTTOMLEFT","ROB_CurrentActionButton","TOPLEFT")
		ROB_RotationToggle2Button:SetPoint("BOTTOMRIGHT","ROB_CurrentActionButton","TOPRIGHT")
		ROB_RotationToggle3Button:SetPoint("TOPLEFT","ROB_CurrentActionButton", "BOTTOMLEFT")
		ROB_RotationToggle4Button:SetPoint("TOPRIGHT","ROB_CurrentActionButton", "BOTTOMRIGHT")
	end
end

function ROB_NextActionLocation_Selected(self)
	ROB_Options.NextIconLocation = self.value
	ROB_SetNextActionLocation()
end

function ROB_OptionsNextActionLocationDropDownButton_OnLoad(frame)
	local ToggleName = ""
	UIDropDownMenu_SetWidth(frame, 75)
	UIDropDownMenu_JustifyText(frame, "LEFT");

	local i=0
	for i=1, 4 do
		table.wipe(ROB_DropDownTableTemp)
		if (i == 1) then ToggleName = "BOTTOM"; end
		if (i == 2) then ToggleName = "RIGHT"; end
		if (i == 3) then ToggleName = "TOP"; end
		if (i == 4) then ToggleName = "LEFT"; end

		ROB_DropDownTableTemp.text  = ToggleName
		ROB_DropDownTableTemp.value = ToggleName
		ROB_DropDownTableTemp.func  = ROB_NextActionLocation_Selected
		UIDropDownMenu_AddButton(ROB_DropDownTableTemp);
	end
end


local function ClearBindings(...)
	for i = 1, select('#', ...) do
		SetBinding(select(i, ...), nil)
	end
end

local function Keybinding_OnClick(frame, button)
	if button == "LeftButton" or button == "RightButton" then
		local self = frame.obj
		if self.waitingForKey then
			frame:EnableKeyboard(false)
			self.msgframe:Hide()
			frame:UnlockHighlight()
			self.waitingForKey = nil
		else
			frame:EnableKeyboard(true)
			self.msgframe:Show()
			frame:LockHighlight()
			self.waitingForKey = true
		end
	end
end

function ROB_ActionKeyBindButton_OnClick(self, button)
	local selectedrotation = ROB_EditingRotationTable
	if ((ROB_SelectedActionIndex ~= nil) and selectedrotation ~= nil) then
		_G["ROB_SpellNameInputBox"]:SetFocus()
		_G["ROB_SpellNameInputBox"]:ClearFocus()

		if self.waitingForKey then
			local keyPressed = button
			local selectedrotation = ROB_EditingRotationTable

			--[[local ignoreKeys = {
			["BUTTON1"] = true, ["BUTTON2"] = true,
			["UNKNOWN"] = true,
			["LSHIFT"] = true, ["LCTRL"] = true, ["LALT"] = true,
			["RSHIFT"] = true, ["RCTRL"] = true, ["RALT"] = true,
			}--]]

			local ignoreKeys = {
				["UNKNOWN"] = true,
				["LSHIFT"] = true, ["LCTRL"] = true, ["LALT"] = true,
				["RSHIFT"] = true, ["RCTRL"] = true, ["RALT"] = true,
			}

			if keyPressed == "ESCAPE" then
				keyPressed = ROB_UI_KEYBIND
			else
				if ignoreKeys[keyPressed] then return end
				if IsAltKeyDown() then
					--Blue pixel modifier is 1 for ALT
					keyPressed = "ALT-"..keyPressed
				end
				if IsShiftKeyDown() then
					--Blue pixel modifier is 2 for SHIFT
					keyPressed = "SHIFT-"..keyPressed
				end
				if IsControlKeyDown() then
					--Blue pixel modifier is 3 for CTRL
					keyPressed = "CTRL-"..keyPressed
				end
			end

			_G["ROB_AO_ActionKeyBindButton"]:EnableKeyboard(false)
			_G["ROB_AO_ActionKeyBindButton"]:UnlockHighlight()
			self.waitingForKey = nil

			if not self.disabled then
				_G["ROB_AO_ActionKeyBindButton"]:SetText(keyPressed)
				--self:Fire("OnKeyChanged", keyPressed)
			end

			if ((ROB_SelectedActionIndex ~= nil) and selectedrotation ~= nil) then
				selectedrotation.ActionList[selectedrotation.SortedActions[ROB_SelectedActionIndex]].v_keybind = keyPressed
			end

			-- update lists edit
			ROB_ActionList_Update();

			-- update rotation ui stuff
			ROB_Rotation_Edit_UpdateUI();



		else
			_G["ROB_AO_ActionKeyBindButton"]:EnableKeyboard(true)
			_G["ROB_AO_ActionKeyBindButton"]:LockHighlight()
			_G["ROB_AO_ActionKeyBindButton"]:SetText(ROB_UI_PRESSKEY)
			self.waitingForKey = true
		end
	end
end

function ROB_RotationKeyBindButton_OnClick(self)
	if (ROB_EditingRotationTable ~= nil) then
		_G["ROB_SpellNameInputBox"]:SetFocus()
		_G["ROB_SpellNameInputBox"]:ClearFocus()

		if self.waitingForKey then
			_G["ROB_RotationKeyBindButton"]:EnableKeyboard(false)
			_G["ROB_RotationKeyBindButton"]:UnlockHighlight()
			self.waitingForKey = nil
			-- update ui stuff
			ROB_ActionList_Update()
			ROB_Rotation_Edit_UpdateUI()
		else
			_G["ROB_RotationKeyBindButton"]:EnableKeyboard(true)
			_G["ROB_RotationKeyBindButton"]:LockHighlight()
			_G["ROB_RotationKeyBindButton"]:SetText(ROB_UI_PRESSKEY)
			self.waitingForKey = true
		end
	end
end


function ROB_RotationKeyBindButton_OnKeyDown(self, key)
	if self.waitingForKey then
		local keyPressed = key
		local _BindSlotAvailable = true
		local _BindSlotAvailableID = 0
		--[[local ignoreKeys = {
		["BUTTON1"] = true, ["BUTTON2"] = true,
		["UNKNOWN"] = true,
		["LSHIFT"] = true, ["LCTRL"] = true, ["LALT"] = true,
		["RSHIFT"] = true, ["RCTRL"] = true, ["RALT"] = true,
		}--]]
		local ignoreKeys = {
			["UNKNOWN"] = true,
			["LSHIFT"] = true, ["LCTRL"] = true, ["LALT"] = true,
			["RSHIFT"] = true, ["RCTRL"] = true, ["RALT"] = true,
		}


		if (ROB_EditingRotationTable ~= nil) then

			if keyPressed == "ESCAPE" then
				keyPressed = ROB_UI_KEYBIND
			else
				if ignoreKeys[keyPressed] then return end
				if IsAltKeyDown() then
					--Blue pixel modifier is 1 for ALT
					keyPressed = "ALT-"..keyPressed
				end
				if IsShiftKeyDown() then
					--Blue pixel modifier is 2 for SHIFT
					keyPressed = "SHIFT-"..keyPressed
				end
				if IsControlKeyDown() then
					--Blue pixel modifier is 3 for CTRL
					keyPressed = "CTRL-"..keyPressed
				end
			end

			_G["ROB_RotationKeyBindButton"]:EnableKeyboard(false)
			_G["ROB_RotationKeyBindButton"]:UnlockHighlight()
			self.waitingForKey = nil

			if not self.disabled then
				_G["ROB_RotationKeyBindButton"]:SetText(keyPressed)
			end

			for i=1, 10 do
				_BindSlotAvailable = true
				--Loop through the rotations to find a bindslot available
				for _RotationName,_value in pairs(ROB_Rotations) do
					if (not ROB_Rotations[_RotationName].bindindex) then
						ROB_Rotations[_RotationName]["bindindex"] = 0
					else
						--this rotation has a bind index but if it matches the one we are checking then its not available
						if (ROB_Rotations[_RotationName].bindindex == i) then
							_BindSlotAvailable = false
						end
					end
				end
				--After we have looped through the rotations if bindslot is available then we can use it
				if (_BindSlotAvailable) then
					_BindSlotAvailableID = i
					break
				end
			end

			if (keyPressed == ROB_UI_KEYBIND) then
				ClearBindings(ROB_EditingRotationTable.keybind);
				_G["ROB_RotationKeyBindButton"]:SetText(keyPressed)
				ROB_EditingRotationTable.keybind = keyPressed
				ROB_EditingRotationTable["bindindex"] = 0
				ClearBindings(ROB_EditingRotationTable.keybind);
			elseif (_BindSlotAvailableID == 0) then
				print("Rotation bind failed: All 10 key bind slots are used by other rotations, unbind keys from other rotations to bind this rotation")
				_G["ROB_RotationKeyBindButton"]:SetText(keyPressed)
			else
				ClearBindings(keyPressed);

				local ok = SetBinding(keyPressed,"Use rotation ".._BindSlotAvailableID);
				if (ok==nil) then
					print("error binding rotation")
				else
					print("Bound "..keyPressed.." to Rotation:"..ROB_SortedRotations[ROB_SelectedRotationIndex])
				end
				ROB_EditingRotationTable.keybind = keyPressed
				ROB_EditingRotationTable["bindindex"] = _BindSlotAvailableID


				SaveBindings(GetCurrentBindingSet())
			end
		end

		-- update lists edit
		ROB_ActionList_Update();

		-- update rotation ui stuff
		ROB_Rotation_Edit_UpdateUI();

	else
		_G["ROB_RotationKeyBindButton"]:EnableKeyboard(false)
		_G["ROB_RotationKeyBindButton"]:UnlockHighlight()
		self.waitingForKey = nil
	end
end

function ROB_AO_ActionKeyBindButton_OnKeyDown(self, key)
	if self.waitingForKey then
		local keyPressed = key
		local selectedrotation = ROB_EditingRotationTable

		--[[local ignoreKeys = {
		["BUTTON1"] = true, ["BUTTON2"] = true,
		["UNKNOWN"] = true,
		["LSHIFT"] = true, ["LCTRL"] = true, ["LALT"] = true,
		["RSHIFT"] = true, ["RCTRL"] = true, ["RALT"] = true,
		}--]]

		local ignoreKeys = {
			["UNKNOWN"] = true,
			["LSHIFT"] = true, ["LCTRL"] = true, ["LALT"] = true,
			["RSHIFT"] = true, ["RCTRL"] = true, ["RALT"] = true,
		}

		if keyPressed == "ESCAPE" then
			keyPressed = ROB_UI_KEYBIND
		else
			if ignoreKeys[keyPressed] then return end
			if IsAltKeyDown() then
				--Blue pixel modifier is 1 for ALT
				keyPressed = "ALT-"..keyPressed
			end
			if IsShiftKeyDown() then
				--Blue pixel modifier is 2 for SHIFT
				keyPressed = "SHIFT-"..keyPressed
			end
			if IsControlKeyDown() then
				--Blue pixel modifier is 3 for CTRL
				keyPressed = "CTRL-"..keyPressed
			end
		end

		_G["ROB_AO_ActionKeyBindButton"]:EnableKeyboard(false)
		_G["ROB_AO_ActionKeyBindButton"]:UnlockHighlight()
		self.waitingForKey = nil

		if not self.disabled then
			_G["ROB_AO_ActionKeyBindButton"]:SetText(keyPressed)
			--self:Fire("OnKeyChanged", keyPressed)
		end

		if ((ROB_SelectedActionIndex ~= nil) and selectedrotation ~= nil) then
			selectedrotation.ActionList[selectedrotation.SortedActions[ROB_SelectedActionIndex]].v_keybind = keyPressed
		end

		-- update lists edit
		ROB_ActionList_Update();

		-- update rotation ui stuff
		ROB_Rotation_Edit_UpdateUI();

	else
		_G["ROB_AO_ActionKeyBindButton"]:EnableKeyboard(false)
		_G["ROB_AO_ActionKeyBindButton"]:UnlockHighlight()
		self.waitingForKey = nil
	end
end

function ROB_Option_MiniMapButton_OnToggle(self)
	-- retrieve value
	ROB_Options.MiniMap = (ROB_OptionsTabMiniMapButton:GetChecked() ~= nil);

	-- and show/hide the actual button
	if (ROB_Options.MiniMap == true) then
		-- on she goes
		PlaySound("igMainMenuOptionCheckBoxOn");
	else
		-- off she goes
		PlaySound("igMainMenuOptionCheckBoxOff");
	end

	-- and show/hide the MiniMap button
	ROB_MiniMapButton_Update();
end

function ROB_OptionsTabLockIconsButton_OnToggle(self)
	ROB_Options.LockIcons = (self:GetChecked() ~= nil);

	if (ROB_Options.LockIcons) then
		ROB_IconsFrame:SetMovable(false)
		ROB_IconsFrame:EnableMouse(false)
	else
		ROB_IconsFrame:SetMovable(true)
		ROB_IconsFrame:EnableMouse(true)
	end
end

function ROB_OptionsTabAllowOverwriteButton_OnToggle(self)
	ROB_Options.AllowOverwrite = (self:GetChecked() ~= nil);
end

function ROB_OptionsTabExportBindsButton_OnToggle(self)
	ROB_Options.ExportBinds = (self:GetChecked() ~= nil);
end

function ROB_OptionsTabHideCooldownsButton_OnToggle(self)
	ROB_Options.HideCD = (self:GetChecked() ~= nil);
end

function ROB_Option_MiniMapButtonPos_OnValueChanged(self)
	-- retrieve value
	ROB_Options.MiniMapPos = ROB_OptionsTabMiniMapPosSlider:GetValue();

	-- update slidertext
	ROB_OptionsTabMiniMapPosSliderText:SetText(ROB_Options.MiniMapPos);

	-- reflect the position
	ROB_MiniMapButton_Update();
end

function ROB_Option_IconScale_OnValueChanged(self)
	-- retrieve value
	ROB_Options.IconScale = string.format("%.1f", self:GetValue());

	-- update slidertext
	ROB_OptionsTabIconScaleSliderText:SetText(ROB_Options.IconScale);

	-- update the scale
	ROB_IconsFrame:SetScale(ROB_Options.IconScale)
	ROB_CurrentActionButton:SetScale(ROB_Options.IconScale)
	ROB_NextActionButton:SetScale(ROB_Options.IconScale)
	ROB_RotationToggle1Button:SetScale(ROB_Options.IconScale);
	ROB_RotationToggle2Button:SetScale(ROB_Options.IconScale);
	ROB_RotationToggle3Button:SetScale(ROB_Options.IconScale);
	ROB_RotationToggle4Button:SetScale(ROB_Options.IconScale);
	--ROB_MiniMapButton_Update();
	ROB_IconsFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", ROB_Options.IconsX / ROB_IconsFrame:GetEffectiveScale(), ROB_Options.IconsY / ROB_IconsFrame:GetEffectiveScale())
end

function ROB_Option_UpdateRate_OnValueChanged(self)
	-- retrieve value
	ROB_Options.updaterate = tonumber(self:GetValue())
	-- update slidertext
	ROB_OptionsTabUpdateRateSliderText:SetText(ROB_Options.updaterate)
	ROB_UPDATE_INTERVAL = 1 / ROB_Options.updaterate
	-- update the scale
end

function ROB_Option_MiniMapButtonRad_OnValueChanged(self)
	-- retrieve value
	ROB_Options.MiniMapRad = ROB_OptionsTabMiniMapRadSlider:GetValue();

	-- update slidertext
	ROB_OptionsTabMiniMapRadSliderText:SetText(ROB_Options.MiniMapRad);

	-- reflect the position
	ROB_MiniMapButton_Update();
end

function ROB_Options_UIScaleAdd_OnClick(self)
	if (ROB_Options.UIScale + .05 < 1.3) then
		ROB_Options.UIScale = ROB_Options.UIScale + .05
		ROB_Frame:SetScale(ROB_Options.UIScale)
		ROB_OptionsUIScaleValue:SetText(ROB_Options.UIScale)
	end
end

function ROB_Options_UIScaleSub_OnClick(self)
	if (ROB_Options.UIScale - .05 > .5) then
		ROB_Options.UIScale = ROB_Options.UIScale - .05
		ROB_Frame:SetScale(ROB_Options.UIScale)
		ROB_OptionsUIScaleValue:SetText(ROB_Options.UIScale)
	end
end

function ROB_Options_ResetUI_OnClick(self)
	-- reset UI, the user has lost the window off the screen.  Reset the anchors to center
	ROB_Frame:ClearAllPoints();
	ROB_Frame:SetPoint("CENTER");
	ROB_IconsFrame:ClearAllPoints();
	ROB_IconsFrame:SetPoint("CENTER");
	ROB_IconsFrame:Show();
end

function ROB_ToggleToggle(Toggle)
	if (_G["ROB_TOGGLE_"..Toggle] == 0) then
		_G["ROB_TOGGLE_"..Toggle] = 1
	else
		_G["ROB_TOGGLE_"..Toggle] = 0
	end
end

function ROB_MiniMapButton_Update()
	-- update the MiniMap button position
	ROB_MiniMapButton:SetPoint("TOPLEFT", "Minimap", "TOPLEFT",(52 - (ROB_Options.MiniMapRad * cos(ROB_Options.MiniMapPos))),((ROB_Options.MiniMapRad * sin(ROB_Options.MiniMapPos)) - 52));

	-- show/hide the button according to toggle
	if (ROB_Options.MiniMap == false) then
		-- hide the mini map frames
		ROB_MiniMapButton:Hide();
	else
		-- show the mini map button frame
		ROB_MiniMapButton:Show();
	end

end

function ROB_RotationList_Update()
	local offset, row, listIx, rowButton, rowName;

	-- retrieve the scroll offset for editing hierarchy view
	offset = FauxScrollFrame_GetOffset(ROB_RotationScrollFrame);

	-- handle each list row
	for row=1, ROB_ROTATION_LIST_LINES, 1 do
		-- calculate actual the list item index
		listIx = row + offset;

		-- retrieve the list row
		rowButton = _G["ROB_RotationListButton"..row];

		-- do we have a list for this guy?
		if (listIx <= #ROB_SortedRotations) then
			-- get the name button
			rowName = _G["ROB_RotationListButton"..row.."Name"];

			-- set the list name
			rowName:SetText(ROB_SortedRotations[listIx]);

			-- is this the current list?
			if (listIx == ROB_SelectedRotationIndex) then
				-- highlight the row
				rowButton:LockHighlight();
			else
				-- normalise the row
				rowButton:UnlockHighlight();
			end

			-- show the button
			rowButton:Show();
		else
			-- hide this row
			rowButton:Hide();
		end
	end

	-- update the scroll frame appropriately
	FauxScrollFrame_Update(ROB_RotationScrollFrame, #ROB_SortedRotations, ROB_ROTATION_LIST_LINES, ROB_ROTATION_LIST_FRAME_HEIGHT);
end

function ROB_SpellLists_Update()
	local offset, row, listIx, rowButton, rowName;

	-- retrieve the scroll offset for editing hierarchy view
	offset = FauxScrollFrame_GetOffset(ROB_SpellListsScrollFrame);

	-- handle each list row
	for row=1, ROB_ROTATION_LIST_LINES, 1 do
		-- calculate actual the list item index
		listIx = row + offset;

		-- retrieve the list row
		rowButton = _G["ROB_SpellListsButton"..row];

		-- do we have a list for this guy?
		if (listIx <= #ROB_SortedSpellLists) then
			-- get the name button
			rowName = _G["ROB_SpellListsButton"..row.."Name"];

			-- set the list name
			rowName:SetText(ROB_SortedSpellLists[listIx]);

			-- is this the current list?
			if (listIx == ROB_SelectedSpellListIndex) then
				-- highlight the row
				rowButton:LockHighlight();
			else
				-- normalise the row
				rowButton:UnlockHighlight();
			end

			-- show the button
			rowButton:Show();
		else
			-- hide this row
			rowButton:Hide();
		end
	end

	-- update the scroll frame appropriately
	FauxScrollFrame_Update(ROB_SpellListsScrollFrame, #ROB_SortedSpellLists, ROB_ROTATION_LIST_LINES, ROB_ROTATION_LIST_FRAME_HEIGHT);
end

function ROB_ActionList_Update()
	local offset, selectedrotation, count, ActionID, row, rowButton, rowAction, rowTrash
	local savedActionName, savedValue


	-- retrieve the scroll offset for editing source view
	offset = FauxScrollFrame_GetOffset(ROB_ActionListScrollFrame);
	-- get action selectedrotation
	selectedrotation = ROB_EditingRotationTable
	if (not ROB_EditingRotationTable) then
		selectedrotation = ROB_Rotations[ROB_SortedRotations[ROB_SelectedRotationIndex]]
	end
	-- get count of items in list
	if (selectedrotation ~= nil) then
		count = #selectedrotation.SortedActions;
	else
		count = 0;
	end

	-- Build the Action List
	for row=1, ROB_ACTION_LIST_LINES, 1 do
		-- calculate actual the Action index
		ActionID = row + offset;
		-- retrieve the source row
		rowButton = _G["ROB_ActionListButton"..row];
		-- do we have a action for this interval count?
		if (ActionID <= count) then
			rowAction = _G["ROB_ActionListButton"..row.."ActionName"];
			rowTrash = _G["ROB_ActionListButton"..row.."Trash"];
			--Get the saved Action name based upon the sorted table
			savedActionName = selectedrotation.SortedActions[ActionID]

			-- set the button name to stored table value
			rowAction:SetText(savedActionName);

			if (selectedrotation.ActionList[savedActionName].b_disabled) then
				rowAction:SetTextColor(.5,.5,.5)
			else
				rowAction:SetTextColor(1,1,1)
			end


			-- show trash/hide complete if we are editing
			if (ROB_EditingRotationTable ~= nil) then
				-- show trash
				rowTrash:Show();
			else
				-- hide trash
				rowTrash:Hide();
			end
			-- is this the current list?
			if (ActionID == ROB_SelectedActionIndex) then
				rowButton:LockHighlight();
			else
				rowButton:UnlockHighlight();
			end
			-- show the row button
			rowButton:Show();
		else
			-- hide this row
			rowButton:Hide();
		end
	end

	-- update the scroll frame appropriately
	FauxScrollFrame_Update(ROB_ActionListScrollFrame, count, ROB_ACTION_LIST_LINES, ROB_ACTION_LIST_FRAME_HEIGHT);
end

function ROB_SpellList_Update()
	local offset, _SelectedList, count, SpellID, row, rowButton, rowSpell, rowTrash, savedSpellName;

	--[[
	local scrollOffset = #ROB_EditingSpellListTable.SortedSpells
	print("ROB_AddSpellOnAccept scrollOffset="..scrollOffset)
	if (offset > ROB_ACTION_LIST_LINES) then
	print("ROB_AddSpellOnAccept scrollOffset>ROB_ACTION_LIST_LINES="..ROB_ACTION_LIST_LINES)
	scrollOffset = (#_SelectedList.SortedSpells - ROB_ACTION_LIST_LINES) * ROB_ACTION_LIST_FRAME_HEIGHT
	else
	scrollOffset = 1
	end
	FauxScrollFrame_OnVerticalScroll(ROB_SpellNamesListScrollFrame, scrollOffset, ROB_ACTION_LIST_FRAME_HEIGHT, ROB_SpellList_Update)
	--]]

	--print("ROB_SpellList_Update called")
	-- retrieve the scroll offset for editing source view
	offset = FauxScrollFrame_GetOffset(ROB_SpellNamesListScrollFrame);
	-- get selected list
	_SelectedList = ROB_EditingSpellListTable
	if (not _SelectedList) then
		--print("ROB_EditingSpellListTable was empty")
		_SelectedList = ROB_Lists[ROB_SelectedSpellListName]
		--selectedrotation = ROB_Rotations[ROB_SortedRotations[ROB_SelectedRotationIndex]]

	end
	--print("offset="..offset)
	-- get count of items in list
	if (_SelectedList and _SelectedList.SortedSpells) then
		count = #_SelectedList.SortedSpells;
	else
		count = 0;
	end




	--print("count="..count.." ROB_ACTION_LIST_LINES:"..offset)
	-- Build the spell List
	for row=1, ROB_ACTION_LIST_LINES, 1 do
		-- calculate actual the spell index
		SpellID = row + offset;
		-- retrieve the source row
		rowButton = _G["ROB_SpellNamesListButton"..row];
		-- do we have a action for this interval count?
		if (SpellID <= count) then
			rowSpell = _G["ROB_SpellNamesListButton"..row.."SpellName"];
			rowTrash = _G["ROB_SpellNamesListButton"..row.."Trash"];
			--Get the saved Action name based upon the sorted table

			--print("ROB_SpellList_Update SpellID="..SpellID)

			savedSpellName = _SelectedList.SortedSpells[SpellID]
			--if (ROB_SortedSpells and savedSpellName) then
			--print(GetTime().."savedSpellName row="..row..savedSpellName)
			--end
			-- set the button name to stored table value
			rowSpell:SetText(savedSpellName);

			-- show trash/hide complete if we are editing
			if (ROB_EditingSpellListTable ~= nil) then
				-- show trash
				rowTrash:Show();
			else
				-- hide trash
				rowTrash:Hide();
			end
			-- is this the current list?
			if (SpellID == ROB_SelectedSpellIndex) then
				rowButton:LockHighlight();
			else
				rowButton:UnlockHighlight();
			end
			-- show the row button
			rowButton:Show();
		else
			-- hide this row
			rowButton:Hide();
		end
	end

	-- update the scroll frame appropriately
	if _SelectedList then
		FauxScrollFrame_Update(ROB_SpellNamesListScrollFrame, #_SelectedList.SortedSpells, ROB_ACTION_LIST_LINES, ROB_ACTION_LIST_FRAME_HEIGHT);
	end
end

function ROB_SortRotationList()
	local key, value;

	-- setup sort indirection
	ROB_SortedRotations = {};

	-- get each of the list records
	for key, value in pairs(ROB_Rotations) do
		ROB_SortedRotations[#ROB_SortedRotations + 1] = key;
	end

	-- resort the lists list.  We use a sorted indirection table
	table.sort(ROB_SortedRotations, ROB_SortTest);

	-- and update screen
	ROB_RotationList_Update();
end

function ROB_SortSpellLists()
	local key, value;
	-- setup sort indirection
	ROB_SortedSpellLists = {};
	-- get each of the list records
	if ROB_Lists then
		for key, value in pairs(ROB_Lists) do
			ROB_SortedSpellLists[#ROB_SortedSpellLists + 1] = key;
		end
		-- resort the lists list.  We use a sorted indirection table
		table.sort(ROB_SortedSpellLists, ROB_SortTest);
		-- and update screen
		ROB_SpellLists_Update()
	end
end

function ROB_SortSpells()
	local key, value;
	-- setup sort indirection
	ROB_SortedSpells = {};
	--print("ROB_SortSpells called")
	-- get each of the list records
	if (ROB_Lists and ROB_SelectedSpellListName) then

		table.sort(ROB_Lists[ROB_SelectedSpellListName].SortedSpells, ROB_SortTest);
		for key, value in pairs(ROB_Lists[ROB_SelectedSpellListName].SortedSpells) do
			ROB_SortedSpells[#ROB_SortedSpells + 1] = value;
		--print("Creating row in ROB_SortedSpells:"..value)
		end
		-- resort the lists list.  We use a sorted indirection table
		--print("ROB_SortSpells sorted the ROB_SortedSpells table ")
		table.sort(ROB_SortedSpells, ROB_SortTest);
	-- and update screen
	--ROB_SpellList_Update()
	end
	if ROB_EditingSpellListTable ~= nil then
		table.sort(ROB_EditingSpellListTable.SortedSpells, ROB_SortTest)
	end
end

function ROB_SortTest(i1, i2)
	return i1 < i2
end

function ROB_RotationModifyButtons_UpdateUI()
	-- do we have an existing edit or selected list?
	if (ROB_EditingRotationTable ~= nil) then
		-- disable create, modify and remove
		ROB_RotationCreateButton:Disable();
		ROB_RotationImportButton:Disable();
		ROB_RotationExportButton:Disable();
		ROB_RotationListModifyButton:Hide();
		ROB_RotationListDeleteButton:Hide();
	elseif (ROB_SelectedRotationIndex ~= nil) then
		-- enable create, modify and remove
		ROB_RotationCreateButton:Enable();
		ROB_RotationImportButton:Enable();
		ROB_RotationExportButton:Enable();
		ROB_RotationListModifyButton:Show();
		ROB_RotationListDeleteButton:Show();
		-- retrieve rotation value from saved options
		ROB_RotationNameROText:SetText(ROB_SortedRotations[ROB_SelectedRotationIndex]);
	else
		-- enable create, disable modify and remove
		ROB_RotationCreateButton:Enable();
		ROB_RotationImportButton:Enable();
		ROB_RotationExportButton:Enable();
		ROB_RotationListModifyButton:Hide();
		ROB_RotationListDeleteButton:Hide();
		-- reset rotation values
		ROB_RotationNameROText:SetText("");
	end
end

function ROB_SpellListsModifyButtons_UpdateUI()
	-- do we have an existing edit or selected list?
	if (ROB_EditingSpellListTable ~= nil) then
		-- disable create, modify and remove
		ROB_SpellListsCreateButton:Disable();
		ROB_SpellListsModifyButton:Hide();
		ROB_SpellListsDeleteButton:Hide();
	elseif (ROB_SelectedSpellListIndex ~= nil) then
		-- enable create, modify and remove
		ROB_SpellListsCreateButton:Enable();
		ROB_SpellListsModifyButton:Show();
		ROB_SpellListsDeleteButton:Show();
		ROB_SpellListNameROText:SetText(ROB_SortedSpellLists[ROB_SelectedSpellListIndex]);
	else
		-- enable create, disable modify and remove
		ROB_SpellListsCreateButton:Enable();
		ROB_SpellListsModifyButton:Hide();
		ROB_SpellListsDeleteButton:Hide();
		ROB_SpellListNameROText:SetText("");
	end
end

function ROB_Rotation_GUI_SetText(_controlname,_value,_default)
	if (_value ~= nil) then
		_G[_controlname]:SetText(_value)
	else
		_G[_controlname]:SetText(_default)
	end
end

function ROB_Rotation_GUI_SetChecked(_controlname,_value,_default)
	if (_value ~= nil) then
		_G[_controlname]:SetChecked(_value)
	else
		_G[_controlname]:SetChecked(_default)
	end
end

-- Lists Edit Update UI handler
function ROB_Rotation_Edit_UpdateUI()
	ROB_RotationTabTab1:Hide()
	ROB_RotationTabTab2:Hide()
	ROB_RotationTabTab3:Hide()
	ROB_RotationTabTab4:Hide()
	ROB_RotationTabTab5:Hide()
	ROB_RotationTabTab6:Hide()
	-- do we have a list being edited?

	if (ROB_EditingRotationTable ~= nil) then
		-- have we a list name?
		--if (ROB_SelectedRotationName ~= "") then
		-- enable save
		ROB_RotationSaveButton:Show();
		ROB_RotationDiscardButton:Show();
		ROB_AddActionButton:Show();
		ROB_CopyActionButton:Show();
		ROB_PasteActionButton:Show();
		--else
		-- hide save
		--ROB_RotationSaveButton:Hide();
		--ROB_RotationDiscardButton:Hide();
		--ROB_AddActionButton:Hide();
		--ROB_CopyActionButton:Hide();
		--ROB_PasteActionButton:Hide();
		--end

		-- enable discard


		-- selected action row is after top row or before last row?
		if (ROB_SelectedActionIndex == nil) then
			-- disable item row move buttons
			ROB_ActionListMoveUpButton:Disable();
			ROB_ActionListMoveDownButton:Disable();
		elseif   (ROB_SelectedActionIndex <= 1) then
			-- disable item row move up and enable row move down buttons
			ROB_ActionListMoveUpButton:Disable();
			ROB_ActionListMoveDownButton:Enable();
		elseif   (ROB_SelectedActionIndex >= #ROB_EditingRotationTable.SortedActions) then
			-- enable item row move up and disable row move down buttons
			ROB_ActionListMoveUpButton:Enable();
			ROB_ActionListMoveDownButton:Disable();
		else
			-- enable item row move buttons
			ROB_ActionListMoveUpButton:Enable();
			ROB_ActionListMoveDownButton:Enable();
		end



		if (ROB_EditingRotationTable.ActionList[ROB_CurrentActionName] ~= nil) then
			local _ActionDB = ROB_EditingRotationTable.ActionList[ROB_CurrentActionName]
			-- RETRIEVE_NEW_OPTIONS_BELOW
			ROB_Rotation_GUI_SetText("ROB_AO_ActionKeyBindButton",_ActionDB.v_keybind,ROB_UI_KEYBIND)
			ROB_Rotation_GUI_SetText("ROB_SpellNameInputBox",_ActionDB.v_spellname,"<spellname>")
			ROB_SpellValidate(_ActionDB.v_spellname)

			ROB_Rotation_GUI_SetText("ROB_AO_ActionIconInputBox",_ActionDB.v_actionicon,"")
			ROB_AO_ActionIconTexture:SetTexture(GetTexturePath(_ActionDB.v_actionicon))

			ROB_Rotation_GUI_SetChecked("ROB_AO_ToggleCheckButton",_ActionDB.b_toggle,false)
			ROB_Rotation_GUI_SetChecked("ROB_AO_ToggleOffCheckButton",_ActionDB.b_toggleoff,false)
			ROB_Rotation_GUI_SetChecked("ROB_AO_ToggleOnCheckButton",_ActionDB.b_toggleon,false)

			UIDropDownMenu_SetSelectedValue(ROB_AO_ToggleDropDownButton, _ActionDB.v_togglename)
			UIDropDownMenu_SetText(ROB_AO_ToggleDropDownButton, _ActionDB.v_togglename)

			ROB_Rotation_GUI_SetText("ROB_AO_ToggleIconInputBox",_ActionDB.v_toggleicon,"")
			ROB_AO_ToggleIconTexture:SetTexture(GetTexturePath(_ActionDB.v_toggleicon))

			ROB_Rotation_GUI_SetText("ROB_AO_GCDSpellInputBox",_ActionDB.v_gcdspell,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_RangeCheckButton",_ActionDB.b_rangecheck,true)
			ROB_Rotation_GUI_SetText("ROB_AO_RangeSpellInputBox",_ActionDB.v_rangespell,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_MaxCastsCheckButton",_ActionDB.b_maxcasts,false)
			ROB_Rotation_GUI_SetText("ROB_AO_MaxCastsInputBox",_ActionDB.v_maxcasts,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_MobCountCheckButton",_ActionDB.b_mobcount,false)
			ROB_Rotation_GUI_SetText("ROB_AO_MobCountInputBox",_ActionDB.v_mobcount,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_LastCastedCheckButton",_ActionDB.b_lastcasted,false)
			ROB_Rotation_GUI_SetText("ROB_AO_LastCastedInputBox",_ActionDB.v_lastcasted,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_BreakChannelingCheckButton",_ActionDB.b_breakchanneling,false)
			UIDropDownMenu_SetSelectedValue(ROB_AO_BreakChannelingDropDownButton, _ActionDB.v_breakchanneling)
			UIDropDownMenu_SetText(ROB_AO_BreakChannelingDropDownButton, _ActionDB.v_breakchanneling)

			ROB_Rotation_GUI_SetChecked("ROB_AO_MovingCheckButton",_ActionDB.b_moving,false)

			ROB_Rotation_GUI_SetChecked("ROB_AO_NMovingCheckButton",_ActionDB.b_notmoving,false)

			ROB_Rotation_GUI_SetChecked("ROB_AO_CheckOtherCDCheckButton",_ActionDB.b_checkothercd,false)
			ROB_Rotation_GUI_SetText("ROB_AO_CheckOtherCDNameInputBox",_ActionDB.v_checkothercdname,"")
			ROB_Rotation_GUI_SetText("ROB_AO_CheckOtherCDValueInputBox",_ActionDB.v_checkothercdvalue,"")

			ROB_Rotation_GUI_SetText("ROB_AO_DurationInputBox",_ActionDB.v_duration,"")
			ROB_Rotation_GUI_SetChecked("ROB_AO_DurationCheckButton",_ActionDB.b_duration,false)

			ROB_Rotation_GUI_SetChecked("ROB_AO_NotASpellCheckButton",_ActionDB.b_notaspell,false)

			ROB_Rotation_GUI_SetText("ROB_AO_OORInputBox",_ActionDB.v_oorspell,"")
			ROB_Rotation_GUI_SetChecked("ROB_AO_OORCheckButton",_ActionDB.b_oorspell,false)


			ROB_Rotation_GUI_SetChecked("ROB_AO_DebugCheckButton",_ActionDB.b_debug,false)
			ROB_Rotation_GUI_SetChecked("ROB_AO_DisableCheckButton",_ActionDB.b_disabled,false)

			ROB_Rotation_GUI_SetChecked("ROB_AO_GUnitPowerCheckButton",_ActionDB.b_gunitpower,false)
			ROB_Rotation_GUI_SetText("ROB_AO_GUnitPowerTypeInputBox",_ActionDB.v_gunitpowertype,"")
			ROB_Rotation_GUI_SetText("ROB_AO_GUnitPowerInputBox",_ActionDB.v_gunitpower,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_GComboPointsCheckButton",_ActionDB.b_gcombopoints,false)
			ROB_Rotation_GUI_SetText("ROB_AO_GComboPointsInputBox",_ActionDB.v_gcombopoints,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_GBloodRunesCheckButton",_ActionDB.b_gbloodrunes,false)
			ROB_Rotation_GUI_SetText("ROB_AO_GBloodRunesInputBox",_ActionDB.v_gbloodrunes,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_GFrostRunesCheckButton",_ActionDB.b_gfrostrunes,false)
			ROB_Rotation_GUI_SetText("ROB_AO_GFrostRunesInputBox",_ActionDB.v_gfrostrunes,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_GUnholyRunesCheckButton",_ActionDB.b_gunholyrunes,false)
			ROB_Rotation_GUI_SetText("ROB_AO_GUnholyRunesInputBox",_ActionDB.v_gunholyrunes,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_GDeathRunesCheckButton",_ActionDB.b_gdeathrunes,false)
			ROB_Rotation_GUI_SetText("ROB_AO_GDeathRunesInputBox",_ActionDB.v_gdeathrunes,"")

			--Player options-------------------------
			ROB_Rotation_GUI_SetChecked("ROB_AO_NeedBuffCheckButton",_ActionDB.b_p_needbuff,false)
			ROB_Rotation_GUI_SetText("ROB_AO_NeedBuffInputBox",_ActionDB.v_p_needbuff,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_HaveBuffCheckButton",_ActionDB.b_p_havebuff,false)
			ROB_Rotation_GUI_SetText("ROB_AO_HaveBuffInputBox",_ActionDB.v_p_havebuff,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_NeedDebuffCheckButton",_ActionDB.b_p_needdebuff,false)
			ROB_Rotation_GUI_SetText("ROB_AO_NeedDebuffInputBox",_ActionDB.v_p_needdebuff,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_HaveDebuffCheckButton",_ActionDB.b_p_havedebuff,false)
			ROB_Rotation_GUI_SetText("ROB_AO_HaveDebuffInputBox",_ActionDB.v_p_havedebuff,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_PlayerHPCheckButton",_ActionDB.b_p_hp,false)
			ROB_Rotation_GUI_SetText("ROB_AO_PlayerHPInputBox",_ActionDB.v_p_hp,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_UnitPowerCheckButton",_ActionDB.b_p_unitpower,false)
			ROB_Rotation_GUI_SetText("ROB_AO_UnitPowerTypeInputBox",_ActionDB.v_p_unitpowertype,"")
			ROB_Rotation_GUI_SetText("ROB_AO_UnitPowerInputBox",_ActionDB.v_p_unitpower,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_BloodRunesCheckButton",_ActionDB.b_p_bloodrunes,false)
			ROB_Rotation_GUI_SetText("ROB_AO_BloodRunesInputBox",_ActionDB.v_p_bloodrunes,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_FrostRunesCheckButton",_ActionDB.b_p_frostrunes,false)
			ROB_Rotation_GUI_SetText("ROB_AO_FrostRunesInputBox",_ActionDB.v_p_frostrunes,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_UnholyRunesCheckButton",_ActionDB.b_p_unholyrunes,false)
			ROB_Rotation_GUI_SetText("ROB_AO_UnholyRunesInputBox",_ActionDB.v_p_unholyrunes,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_DeathRunesCheckButton",_ActionDB.b_p_deathrunes,false)
			ROB_Rotation_GUI_SetText("ROB_AO_DeathRunesInputBox",_ActionDB.v_p_deathrunes,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_CurseCheckButton",_ActionDB.b_p_curse,false)
			ROB_Rotation_GUI_SetChecked("ROB_AO_DiseaseCheckButton",_ActionDB.b_p_disease,false)
			ROB_Rotation_GUI_SetChecked("ROB_AO_MagicCheckButton",_ActionDB.b_p_magic,false)
			ROB_Rotation_GUI_SetChecked("ROB_AO_PoisonCheckButton",_ActionDB.b_p_poison,false)

			ROB_Rotation_GUI_SetChecked("ROB_AO_ComboPointsCheckButton",_ActionDB.b_p_combopoints,false)
			ROB_Rotation_GUI_SetText("ROB_AO_ComboPointsInputBox",_ActionDB.v_p_combopoints,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_EclipeDirectionCheckButton",_ActionDB.b_p_eclipse,false)
			ROB_Rotation_GUI_SetText("ROB_AO_EclipeDirectionInputBox",_ActionDB.v_p_eclipse,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_FireTotemActiveCheckButton",_ActionDB.b_p_firetotemactive,false)
			ROB_Rotation_GUI_SetText("ROB_AO_FireTotemActiveInputBox",_ActionDB.v_p_firetotemactive,"")
			ROB_Rotation_GUI_SetChecked("ROB_AO_FireTotemInactiveCheckButton",_ActionDB.b_p_firetoteminactive,false)
			ROB_Rotation_GUI_SetText("ROB_AO_FireTotemInactiveInputBox",_ActionDB.v_p_firetoteminactive,"")
			ROB_Rotation_GUI_SetChecked("ROB_AO_FireTotemTimeleftCheckButton",_ActionDB.b_p_firetotemtimeleft,false)
			ROB_Rotation_GUI_SetText("ROB_AO_FireTotemTimeleftInputBox",_ActionDB.v_p_firetotemtimeleft,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_EarthTotemActiveCheckButton",_ActionDB.b_p_earthtotemactive,false)
			ROB_Rotation_GUI_SetText("ROB_AO_EarthTotemActiveInputBox",_ActionDB.v_p_earthtotemactive,"")
			ROB_Rotation_GUI_SetChecked("ROB_AO_EarthTotemInactiveCheckButton",_ActionDB.b_p_earthtoteminactive,false)
			ROB_Rotation_GUI_SetText("ROB_AO_EarthTotemInactiveInputBox",_ActionDB.v_p_earthtoteminactive,"")
			ROB_Rotation_GUI_SetChecked("ROB_AO_EarthTotemTimeleftCheckButton",_ActionDB.b_p_earthtotemtimeleft,false)
			ROB_Rotation_GUI_SetText("ROB_AO_EarthTotemTimeleftInputBox",_ActionDB.v_p_earthtotemtimeleft,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_WaterTotemActiveCheckButton",_ActionDB.b_p_watertotemactive,false)
			ROB_Rotation_GUI_SetText("ROB_AO_WaterTotemActiveInputBox",_ActionDB.v_p_watertotemactive,"")
			ROB_Rotation_GUI_SetChecked("ROB_AO_WaterTotemInactiveCheckButton",_ActionDB.b_p_watertoteminactive,false)
			ROB_Rotation_GUI_SetText("ROB_AO_WaterTotemInactiveInputBox",_ActionDB.v_p_watertoteminactive,"")
			ROB_Rotation_GUI_SetChecked("ROB_AO_WaterTotemTimeleftCheckButton",_ActionDB.b_p_watertotemtimeleft,false)
			ROB_Rotation_GUI_SetText("ROB_AO_WaterTotemTimeleftInputBox",_ActionDB.v_p_watertotemtimeleft,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_AirTotemActiveCheckButton",_ActionDB.b_p_airtotemactive,false)
			ROB_Rotation_GUI_SetText("ROB_AO_AirTotemActiveInputBox",_ActionDB.v_p_airtotemactive,"")
			ROB_Rotation_GUI_SetChecked("ROB_AO_AirTotemInactiveCheckButton",_ActionDB.b_p_airtoteminactive,false)
			ROB_Rotation_GUI_SetText("ROB_AO_AirTotemInactiveInputBox",_ActionDB.v_p_airtoteminactive,"")
			ROB_Rotation_GUI_SetChecked("ROB_AO_AirTotemTimeleftCheckButton",_ActionDB.b_p_airtotemtimeleft,false)
			ROB_Rotation_GUI_SetText("ROB_AO_AirTotemTimeleftInputBox",_ActionDB.v_p_airtotemtimeleft,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_NeedMainhandEnchantCheckButton",_ActionDB.b_p_nmh,false)
			ROB_Rotation_GUI_SetText("ROB_AO_NeedMainhandEnchantInputBox",_ActionDB.v_p_nmh,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_NeedOffhandEnchantCheckButton",_ActionDB.b_p_noh,false)
			ROB_Rotation_GUI_SetText("ROB_AO_NeedOffhandEnchantInputBox",_ActionDB.v_p_noh,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_StanceCheckButton",_ActionDB.b_p_stance,false)
			ROB_Rotation_GUI_SetText("ROB_AO_StanceInputBox",_ActionDB.v_p_stance,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_OOCombatCheckButton",_ActionDB.b_p_ooc,false)
			ROB_Rotation_GUI_SetChecked("ROB_AO_ICombatCheckButton",_ActionDB.b_p_ic,false)
			--Target options-------------------------
			ROB_Rotation_GUI_SetChecked("ROB_AO_TargetHPCheckButton",_ActionDB.b_t_hp,false)
			ROB_Rotation_GUI_SetText("ROB_AO_TargetHPInputBox",_ActionDB.v_t_hp,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_TargetMaxHPCheckButton",_ActionDB.b_t_maxhp,false)
			ROB_Rotation_GUI_SetText("ROB_AO_TargetMaxHPInputBox",_ActionDB.v_t_maxhp,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_TargetNeedsBuffCheckButton",_ActionDB.b_t_needsbuff,false)
			ROB_Rotation_GUI_SetText("ROB_AO_TargetNeedsBuffInputBox",_ActionDB.v_t_needsbuff,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_TargetHasBuffCheckButton",_ActionDB.b_t_hasbuff,false)
			ROB_Rotation_GUI_SetText("ROB_AO_TargetHasBuffInputBox",_ActionDB.v_t_hasbuff,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_TargetNeedsDebuffCheckButton",_ActionDB.b_t_needsdebuff,false)
			ROB_Rotation_GUI_SetText("ROB_AO_TargetNeedsDebuffInputBox",_ActionDB.v_t_needsdebuff,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_TargetHasDebuffCheckButton",_ActionDB.b_t_hasdebuff,false)
			ROB_Rotation_GUI_SetText("ROB_AO_TargetHasDebuffInputBox",_ActionDB.v_t_hasdebuff,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_TargetClassCheckButton",_ActionDB.b_t_class,false)
			ROB_Rotation_GUI_SetText("ROB_AO_TargetClassInputBox",_ActionDB.v_t_class,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_TargetPCCheckButton",_ActionDB.b_t_pc,false)

			ROB_Rotation_GUI_SetChecked("ROB_AO_InterruptTargetCheckButton",_ActionDB.b_t_interrupt,false)
			UIDropDownMenu_SetSelectedValue(ROB_AO_T_InterruptDropDownButton, _ActionDB.v_t_interrupt)
			UIDropDownMenu_SetText(ROB_AO_T_InterruptDropDownButton, _ActionDB.v_t_interrupt)

			ROB_Rotation_GUI_SetChecked("ROB_AO_TargetDRCheckButton",_ActionDB.b_t_dr,false)

			--Pet options-------------------------
			ROB_Rotation_GUI_SetChecked("ROB_AO_PetHPCheckButton",_ActionDB.b_pet_hp,false)
			ROB_Rotation_GUI_SetText("ROB_AO_PetHPInputBox",_ActionDB.v_pet_hp,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_PetISACCheckButton",_ActionDB.b_pet_isac,false)
			ROB_Rotation_GUI_SetText("ROB_AO_PetISACInputBox",_ActionDB.v_pet_isac,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_PetNACCheckButton",_ActionDB.b_pet_nac,false)
			ROB_Rotation_GUI_SetText("ROB_AO_PetNACInputBox",_ActionDB.v_pet_nac,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_PetNeedsBuffCheckButton",_ActionDB.b_pet_needsbuff,false)
			ROB_Rotation_GUI_SetText("ROB_AO_PetNeedsBuffInputBox",_ActionDB.v_pet_needsbuff,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_PetHasBuffCheckButton",_ActionDB.b_pet_hasbuff,false)
			ROB_Rotation_GUI_SetText("ROB_AO_PetHasBuffInputBox",_ActionDB.v_pet_hasbuff,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_PetNeedsDebuffCheckButton",_ActionDB.b_pet_needsdebuff,false)
			ROB_Rotation_GUI_SetText("ROB_AO_PetNeedsDebuffInputBox",_ActionDB.v_pet_needsdebuff,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_PetHasDebuffCheckButton",_ActionDB.b_pet_hasdebuff,false)
			ROB_Rotation_GUI_SetText("ROB_AO_PetHasDebuffInputBox",_ActionDB.v_pet_hasdebuff,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_PetDRCheckButton",_ActionDB.b_pet_dr,false)
			--Focus options-------------------------
			ROB_Rotation_GUI_SetChecked("ROB_AO_FocusHPCheckButton",_ActionDB.b_f_hp,false)
			ROB_Rotation_GUI_SetText("ROB_AO_FocusHPInputBox",_ActionDB.v_f_hp,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_FocusMaxHPCheckButton",_ActionDB.b_f_maxhp,false)
			ROB_Rotation_GUI_SetText("ROB_AO_FocusMaxHPInputBox",_ActionDB.v_f_maxhp,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_FocusNeedsBuffCheckButton",_ActionDB.b_f_needsbuff,false)
			ROB_Rotation_GUI_SetText("ROB_AO_FocusNeedsBuffInputBox",_ActionDB.v_f_needsbuff,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_FocusHasBuffCheckButton",_ActionDB.b_f_hasbuff,false)
			ROB_Rotation_GUI_SetText("ROB_AO_FocusHasBuffInputBox",_ActionDB.v_f_hasbuff,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_FocusNeedsDebuffCheckButton",_ActionDB.b_f_needsdebuff,false)
			ROB_Rotation_GUI_SetText("ROB_AO_FocusNeedsDebuffInputBox",_ActionDB.v_f_needsdebuff,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_FocusHasDebuffCheckButton",_ActionDB.b_f_hasdebuff,false)
			ROB_Rotation_GUI_SetText("ROB_AO_FocusHasDebuffInputBox",_ActionDB.v_f_hasdebuff,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_FocusClassCheckButton",_ActionDB.b_f_class,false)
			ROB_Rotation_GUI_SetText("ROB_AO_FocusClassInputBox",_ActionDB.v_f_class,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_FocusPCCheckButton",_ActionDB.b_f_pc,false)

			ROB_Rotation_GUI_SetChecked("ROB_AO_InterruptFocusCheckButton",_ActionDB.b_f_interrupt,false)
			UIDropDownMenu_SetSelectedValue(ROB_AO_F_InterruptDropDownButton, _ActionDB.v_f_interrupt)
			UIDropDownMenu_SetText(ROB_AO_F_InterruptDropDownButton, _ActionDB.v_f_interrupt)

			ROB_Rotation_GUI_SetChecked("ROB_AO_FocusDRCheckButton",_ActionDB.b_f_dr,false)
			--Custom Unit options-------------------------
			ROB_Rotation_GUI_SetText("ROB_AO_CustomUnitNameInputBox",_ActionDB.v_c_unitname,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_CustomNeedsBuffCheckButton",_ActionDB.b_c_needsbuff,false)
			ROB_Rotation_GUI_SetText("ROB_AO_CustomNeedsBuffInputBox",_ActionDB.v_c_needsbuff,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_CustomHasBuffCheckButton",_ActionDB.b_c_hasbuff,false)
			ROB_Rotation_GUI_SetText("ROB_AO_CustomHasBuffInputBox",_ActionDB.v_c_hasbuff,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_CustomNeedsDebuffCheckButton",_ActionDB.b_c_needsdebuff,false)
			ROB_Rotation_GUI_SetText("ROB_AO_CustomNeedsDebuffInputBox",_ActionDB.v_c_needsdebuff,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_CustomHasDebuffCheckButton",_ActionDB.b_c_hasdebuff,false)
			ROB_Rotation_GUI_SetText("ROB_AO_CustomHasDebuffInputBox",_ActionDB.v_c_hasdebuff,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_CustomHPCheckButton",_ActionDB.b_c_hp,false)
			ROB_Rotation_GUI_SetText("ROB_AO_CustomHPInputBox",_ActionDB.v_c_hp,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_CustomMaxHPCheckButton",_ActionDB.b_c_maxhp,false)
			ROB_Rotation_GUI_SetText("ROB_AO_CustomMaxHPInputBox",_ActionDB.v_c_maxhp,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_CustomClassCheckButton",_ActionDB.b_c_class,false)
			ROB_Rotation_GUI_SetText("ROB_AO_CustomClassInputBox",_ActionDB.v_c_class,"")

			ROB_Rotation_GUI_SetChecked("ROB_AO_InterruptCustomCheckButton",_ActionDB.b_c_interrupt,false)
			UIDropDownMenu_SetSelectedValue(ROB_AO_C_InterruptDropDownButton, _ActionDB.v_c_interrupt)
			UIDropDownMenu_SetText(ROB_AO_C_InterruptDropDownButton, _ActionDB.v_c_interrupt)

			ROB_Rotation_GUI_SetChecked("ROB_AO_CustomDRCheckButton",_ActionDB.b_c_dr,false)

			-- show action options frames because we have a current selected action
			if ((not ROB_GeneralActionOptionsTab:IsShown()) and (not ROB_PlayerActionOptionsTab:IsShown()) and (not ROB_TargetActionOptionsTab:IsShown()) and (not ROB_PetActionOptionsTab:IsShown()) and (not ROB_FocusActionOptionsTab:IsShown()) and (not ROB_CustomActionOptionsTab:IsShown())) then
				ROB_GeneralActionOptionsTab:Show()
				ROB_ActionOptionsSwitchToTab(ROB_RotationTabTab1)
			end
			ROB_RotationTabTab1:Show()
			ROB_RotationTabTab2:Show()
			ROB_RotationTabTab3:Show()
			ROB_RotationTabTab4:Show()
			ROB_RotationTabTab5:Show()
			ROB_RotationTabTab6:Show()
		end

		-- ADD_SHOW_ROTATION_OPTIONS
		ROB_RotationNameInputBox:Show();
		ROB_RotationNameRO:Hide();
		ROB_RotationKeyBindButton:Enable();

	else
		-- ADD_HIDE_ROTATION_OPTIONS
		ROB_RotationNameInputBox:Hide();
		ROB_RotationNameRO:Show();

		ROB_RotationKeyBindButton:Disable();

		-- disable save and discard
		ROB_RotationSaveButton:Hide();
		ROB_RotationDiscardButton:Hide();
		ROB_AddActionButton:Hide();
		ROB_CopyActionButton:Hide();
		ROB_PasteActionButton:Hide();

		-- disable item row move buttons
		ROB_ActionListMoveUpButton:Disable();
		ROB_ActionListMoveDownButton:Disable();

		-- hide action options tabs
		ROB_GeneralActionOptionsTab:Hide()
		ROB_PlayerActionOptionsTab:Hide()
		ROB_TargetActionOptionsTab:Hide()
		ROB_PetActionOptionsTab:Hide()
		ROB_FocusActionOptionsTab:Hide()
		ROB_CustomActionOptionsTab:Hide()

		-- RETRIEVE_ROTATION_SETTINGS
		if (ROB_SelectedRotationName ~= nil and ROB_Rotations[ROB_SelectedRotationName]) then
			ROB_RotationKeyBindButton:SetText(ROB_Rotations[ROB_SelectedRotationName].keybind)
		end
	end

	-- update the menu
	if (LibStub and LibStub:GetLibrary('LibDataBroker-1.1', true)) then
		local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
		local mymenu = ldb:GetDataObjectByName(ROB_ADDON_NAME)
		if (ROB_SelectedRotationName and mymenu) then
			mymenu.label = ROB_ADDON_NAME.." ["..ROB_SelectedRotationName.."]"
		elseif (not ROB_SelectedRotationName and mymenu) then
			mymenu.label = ROB_ADDON_NAME
		end
	end
end

function ROB_SpellLists_Edit_UpdateUI()
	if (ROB_EditingSpellListTable ~= nil) then
		ROB_SpellListsSaveButton:Show()
		ROB_SpellListsDiscardButton:Show()
		ROB_AddSpellButton:Show()
		ROB_SpellListNameInputBox:Show();
		ROB_SpellListNameRO:Hide();
	else
		ROB_SpellListNameInputBox:Hide();
		ROB_SpellListNameRO:Show();
		-- disable save and discard
		ROB_SpellListsSaveButton:Hide();
		ROB_SpellListsDiscardButton:Hide();
		ROB_AddSpellButton:Hide();
	end
end

function ROB_AddAction(ActionID, ActionName)
	-- first, add Action's key to sort
	table.insert(ROB_EditingRotationTable.SortedActions, ActionID, ActionName);
	ROB_EditingRotationTable.ActionList[ActionName] = {}

	for key, val in pairs(ROB_NewActionDefaults) do
		ROB_EditingRotationTable.ActionList[ActionName][key] = val
	end
end

function ROB_AddSpell(_SpellID, _SpellName)
	-- first, add Action's key to sort
	--print("adding new spell at end:".._SpellID..":".._SpellName)
	table.insert(ROB_EditingSpellListTable.SortedSpells, _SpellID, _SpellName);
--table.insert(SortedSpells, _SpellID, _SpellName);
--ROB_EditingSpellListTable.SortedSpells[_SpellName] = true
end

function ROB_RotationImportButton_OnClick()
	ROB_GetString(ROB_UI_IMPORT_MESSAGE, "", true, ROB_RotationImport)
end

function ROB_RotationImport(_RotationBuild)
	ROB_ImportRotation(_RotationBuild)
end

function ROB_ImportRotation(_RotationBuild)
	local _parsedRotationName = nil
	local _parsedRangeSpell = nil
	local _AlreadyExists = false
	local _RotationBuildRemaining = nil

	if (_RotationBuild) then
		--First check that the import string is from Rotation Builder or Rotation Builder for down compatibility purpose.
		-- TODO PEL : find a better way to match a correct import.
		if (string.sub(_RotationBuild, 1,15) ~= "RotationBuilder") then
			print(ROB_UI_IMPORT_ERROR3)
			return
		end

		_parsedRotationName = string.sub(_RotationBuild, string.find(_RotationBuild,"%[")+1,string.find(_RotationBuild,"%]")-1)
		_RotationBuildRemaining = string.sub(_RotationBuild, string.find(_RotationBuild,"%]")+2)
	end

	if ((not _parsedRotationName) or _parsedRotationName == "" or (not _RotationBuild) or _RotationBuild == "") then
		print(ROB_UI_IMPORT_ERROR1)
		return
	end

	if (ROB_Rotations[_parsedRotationName]) then
		_AlreadyExists = true

	end

	--Removed overwrite ability, it was confusing better to just not allow import overwriting
	--if (_AlreadyExists and not ROB_Options.AllowOverwrite) then
	if (_AlreadyExists) then
		print(ROB_UI_DEBUG_PREFIX.._parsedRotationName..":"..ROB_UI_IMPORT_ERROR2)
		return
		--elseif (_AlreadyExists and ROB_Options.AllowOverwrite) then
		--   ROB_Rotations[_parsedRotationName].rangespell = {}
		--   ROB_Rotations[_parsedRotationName]["rangespell"] = _parsedRangeSpell
	elseif (not _AlreadyExists) then
		ROB_Rotations[_parsedRotationName] = {}
		ROB_Rotations[_parsedRotationName]["keybind"] = {}
		ROB_Rotations[_parsedRotationName]["keybind"] = ROB_UI_KEYBIND
		ROB_Rotations[_parsedRotationName]["rangespell"] = {}
		ROB_Rotations[_parsedRotationName]["rangespell"] = _parsedRangeSpell
		ROB_Rotations[_parsedRotationName]["SortedActions"] = {}
		ROB_Rotations[_parsedRotationName]["ActionList"] = {}
	end

	local _data = { strsplit(",", _RotationBuildRemaining) }
	local _actionname = nil
	local _keyname = nil
	local _keyvalue = nil
	local _spelllistname = nil
	_AlreadyExists = false
	for _key,_value in pairs(_data) do
		--print("   _value=".._value)
		if (string.sub(_value,1,2) == "[[" and string.find(_value,"%]")) then
			--we found a value that has a subtable that needs importing
			_spelllistname = string.sub(_value, 3, string.find(_value,"%]")-1)
			--print("_spelllistname=".._spelllistname)

			--Check if spell list exists if it does not create it
			if (ROB_Lists[_spelllistname]) then
			--Spell list exists no need to create it
			else
				--print("create spell list:".._spelllistname)
				ROB_Lists[_spelllistname] = {}
				ROB_Lists[_spelllistname]["SortedSpells"] ={}
			end
		elseif (_value ~= "" and (not (string.sub(_value,1,1) == "[")) and (not(string.find(_value,"=")))) then
			--print("Spell :".._value.." needs to go into the ".._spelllistname.." spell list")
			local spellexistscheck = false
			for _key1, _value1 in pairs(ROB_Lists[_spelllistname]["SortedSpells"]) do
				--we found our new spell so we cant use it because it already exists
				if (_value1 == _value) then
					--we found the spell already exists in the spell list dont add it
					--print("Spell already exists")
					spellexistscheck = true
				end
			end
			if (not spellexistscheck) then
				--print("Adding spell ".._value.." to "..)
				--if (#ROB_Lists[_spelllistname]["SortedSpells"]) then
				local _spellindex = (#ROB_Lists[_spelllistname]["SortedSpells"] + 1)
				--else
				--ROB_SelectedSpellIndex = 1
				--end
				table.insert(ROB_Lists[_spelllistname]["SortedSpells"], _spellindex, _value);

			end

			--print("_spelllistname=".._spelllistname)
		elseif (string.sub(_value,1,1) == "[" and string.find(_value,"%]")) then
			_actionname = string.sub(_value, 2, string.find(_value,"%]")-1)
			--print("   Found Actionname=".._actionname)
			if (ROB_Rotations[_parsedRotationName]["SortedActions"][_actionname]) then _AlreadyExists = true; end
			if (not _AlreadyExists) then
				table.insert(ROB_Rotations[_parsedRotationName].SortedActions, _actionname);
				ROB_Rotations[_parsedRotationName].ActionList[_actionname] = {}
				for _defaultskey, _defaultsval in pairs(ROB_NewActionDefaults) do
					ROB_Rotations[_parsedRotationName].ActionList[_actionname][_defaultskey] = _defaultsval
				end
			end
		elseif (string.sub(_value,1,1) == "[" and (not string.find(_value,"%]"))) then
			--Added some robustness to deal with a new action that doesnt have the ending bracket ]
			_actionname = string.sub(_value, 2)
			--print("   Found bad Actionname=".._actionname)
			if (ROB_Rotations[_parsedRotationName]["SortedActions"][_actionname]) then _AlreadyExists = true; end
			if (not _AlreadyExists) then
				table.insert(ROB_Rotations[_parsedRotationName].SortedActions, _actionname);
				ROB_Rotations[_parsedRotationName].ActionList[_actionname] = {}
				for _defaultskey, _defaultsval in pairs(ROB_NewActionDefaults) do
					ROB_Rotations[_parsedRotationName].ActionList[_actionname][_defaultskey] = _defaultsval
				end
			end
		elseif (_actionname and _value ~= "" and string.find(_value,"=")) then
			--print("trying _value=".._value)
			_keyname = string.sub(_value,1,string.find(_value,"=")-1)
			_keyvalue = string.sub(_value,string.find(_value,"=")+1)
			_keyvalue = string.gsub(_keyvalue, "\\n", "\n")
			if (_keyvalue == "true") then _keyvalue = true; end
			if (_keyvalue == "false") then _keyvalue = false; end
			--this value is a setting for the actionname
			ROB_Rotations[_parsedRotationName].ActionList[_actionname][_keyname] = _keyvalue
		end
	end

	-- update rotation list
	ROB_SortRotationList();

	-- update the action list
	ROB_ActionList_Update();

	-- sort spell lists
	ROB_SortSpellLists();

	-- sort spells
	ROB_SortSpells();

	-- update the spells list
	ROB_SpellList_Update();

	-- update rotation modify buttons
	ROB_RotationModifyButtons_UpdateUI();

	-- update rotation ui stuff
	ROB_Rotation_Edit_UpdateUI();

	print(ROB_UI_IMPORT_SUCCESS..":".._parsedRotationName)
end

function ROB_RotationExportButton_OnClick()
	local RotationBuild = ROB_ExportRotation(ROB_SortedRotations[ROB_SelectedRotationIndex])
	if RotationBuild then
		ROB_GetString(ROB_UI_EXPORT_MESSAGE, RotationBuild)
	end
end

function ROB_ExportRotation(_RotationName)
	if (not _RotationName) or (_RotationName == "") then
		print("No rotation name specified for export")
		return
	elseif not ROB_Rotations[_RotationName] then
		print("Rotation name must be the name of an rotation build, and is case-sensitive.")
		return
	end

	-- Concatenate the rotation
	local RotationBuild = "RotationBuilder,v" .. ROB_VERSION .. ",[" .. _RotationName .. "]"

	local AddComma = false
	local SkipValue = false

	for ActionIndex, ActionName in pairs(ROB_Rotations[_RotationName].SortedActions) do
		RotationBuild = RotationBuild..",["..ActionName.."]"
		--print("Actionname:"..ActionName)
		for DefaultKey, DefaultValue in pairs(ROB_NewActionDefaults) do
			--print("DefaultKey:"..DefaultKey)

			SkipValue = false
			if (ROB_Rotations[_RotationName].ActionList[ActionName][DefaultKey] == DefaultValue) then
				SkipValue = true
				--if (string.find(DefaultKey,"b_rangecheck")) then print("    DefaultKey:"..DefaultKey.."=DefaultValue"); end
				--print("  DefaultKey:"..DefaultKey.."=DefaultValue")
			end
			if (ROB_Rotations[_RotationName].ActionList[ActionName][DefaultKey] == nil) then
				SkipValue = true
			end
			if (DefaultKey == "v_durationstartedtime" or DefaultKey == "b_debug") then
				SkipValue = true
			end
			if (DefaultKey == "v_keybind" and (not ROB_Options.ExportBinds)) then
				SkipValue = true
			end
			if (not SkipValue) then
				if (string.sub(DefaultKey,1,2) == "b_") then
					if (ROB_Rotations[_RotationName].ActionList[ActionName][DefaultKey] == true) then
						--print("    DefaultKey:"..DefaultKey.."getting set to true")
						RotationBuild = RotationBuild..","..DefaultKey.."=true"
					else
						--print("    DefaultKey:"..DefaultKey.."getting set to false")
						RotationBuild = RotationBuild..","..DefaultKey.."=false"
					end
				else
					--Check if the DefaultKey value matches the name of a spell list, if so export it
					--print("DefaultKey1="..DefaultKey)
					if (ROB_Lists[ROB_Rotations[_RotationName].ActionList[ActionName][DefaultKey]]) then
						RotationBuild = RotationBuild..","..DefaultKey.."="..ROB_Rotations[_RotationName].ActionList[ActionName][DefaultKey]
						RotationBuild = RotationBuild..",[["..ROB_Rotations[_RotationName].ActionList[ActionName][DefaultKey].."]]"
						for key, value in pairs(ROB_Lists[ROB_Rotations[_RotationName].ActionList[ActionName][DefaultKey]].SortedSpells) do
							RotationBuild = RotationBuild..","..value
							--print("DefaultKey2="..ROB_Rotations[_RotationName].ActionList[ActionName][DefaultKey])
							--print("value="..value)
							--[[if (value == "*" and _notInterruptible == false) then
							return true
							elseif ROB_SpellsMatch(value,_unitCasting) then
							return true
							end]]--
						end
					else
						--print("    DefaultKey:"..DefaultKey)
						--print("    DefaultKey:"..DefaultKey.."getting set to"..ROB_Rotations[_RotationName].ActionList[ActionName][DefaultKey])
						RotationBuild = RotationBuild..","..DefaultKey.."="..ROB_Rotations[_RotationName].ActionList[ActionName][DefaultKey]
					end
				end
			else
			--print("skipping value:"..DefaultKey)
			end
		end
	end

	RotationBuild = RotationBuild
	return RotationBuild
end

function ROB_CopyTable(object)
	local lookup_table = {}
	local function _copy(object)
		if type(object) ~= "table" then
			return object
		elseif lookup_table[object] then
			return lookup_table[object]
		end
		local new_table = {}
		lookup_table[object] = new_table
		for index, value in pairs(object) do
			new_table[_copy(index)] = _copy(value)
		end
		return setmetatable(new_table, _copy(object))
	end
	return _copy(object)
end

function ROB_EclipseDirection(_checkstring,_getnextspell)
	local direction = GetEclipseDirection()

	if direction == _checkstring then
		return true
	else
		return false
	end
end

function ROB_TotemActive(_totemname,_totemslot,_getnextspell)
	local _haveTotem, _totemName, _startTime, _duration = GetTotemInfo(_totemslot)
	if (not _totemName or _totemName== "") then
		return false
	else
		if (GetSpellInfo(_totemname) == _totemName) then return true; end
	end

	return false
end

function ROB_MOBsInArea(_checkstring)
	local _mobcountparsed = _checkstring

	if (string.sub(_checkstring,1,1) == "<" and string.sub(_checkstring,1,2) ~= "<=") then
		_mobcountparsed = tonumber(string.sub(_checkstring,2))
		if (ROB_NUM_MOBS < _mobcountparsed) then return true; end
	end
	if (string.sub(_checkstring,1,1) == ">" and string.sub(_checkstring,1,2) ~= ">=") then
		_mobcountparsed = tonumber(string.sub(_checkstring,2))
		if (ROB_NUM_MOBS > _mobcountparsed) then return true; end
	end
	if (string.sub(_checkstring,1,2) == ">=") then
		_mobcountparsed = tonumber(string.sub(_checkstring,3))
		if (ROB_NUM_MOBS >= _mobcountparsed) then return true; end
	end
	if (string.sub(_checkstring,1,2) == "<=") then
		_mobcountparsed = tonumber(string.sub(_checkstring,3))
		if (ROB_NUM_MOBS <= _mobcountparsed) then return true; end
	end
	if (string.sub(_checkstring,1,1) == "=") then
		_mobcountparsed = tonumber(string.sub(_checkstring,2))
		if (ROB_NUM_MOBS == _mobcountparsed) then return true; end
	end

	return false
end

function ROB_PetIsAutocasting(_spellname,_getnextspell)
	-- Iterate through the spells in the pet spellbook, if we have one.
	local i = 1;
	local _spellslot = nil;
	local _spellType, _spellID
	local _convertedSpellName = nil


	--First try to get the spell info from the spellname
	if (GetSpellInfo(_spellname)) then
		_convertedSpellName = GetSpellInfo(_spellname)
	else
		--If the getspellinfo failed then use spellname
		_convertedSpellName = _spellname
	end

	--Now find the spellslot in the pet book
	while true do
		_spellID = nil

		if (not GetSpellBookItemInfo(i, BOOKTYPE_PET)) then
			do break end
		end

		_spellType, _spellID = GetSpellBookItemInfo(i, BOOKTYPE_PET);
		if (_spellID) then
			if (GetSpellInfo(_spellID) == _convertedSpellName) then
				_spellslot = i;
				do break end
			end
		end
		i=i+1;
	end

	--Now if we have a spellslot for the pet spell check if it is autocasting
	if (_spellslot) then
		if (select(2, GetSpellAutocast(_spellslot, "pet")) == 1) then
			return true
		end
	end

	return false
end

function ROB_TotemTimeleft(_totemtimeleft,_totemslot,_getnextspell)
	local _timeleftparsed = nil
	local _haveTotem, _totemName, _startTime, _duration = GetTotemInfo(_totemslot)

	if (_startTime == nil) then
		return false
	end

	local _TotemTimeleft = (_startTime + _duration - GetTime())
	if _TotemTimeleft < 0 then _TotemTimeleft = 0 end

	if (string.sub(_totemtimeleft,1,1) == "<" and string.sub(_totemtimeleft,1,2) ~= "<=") then
		_timeleftparsed = tonumber(string.sub(_totemtimeleft,2))
		if (_TotemTimeleft < _timeleftparsed) then return true; end
	end
	if (string.sub(_totemtimeleft,1,1) == ">" and string.sub(_totemtimeleft,1,2) ~= ">=") then
		_timeleftparsed = tonumber(string.sub(_totemtimeleft,2))
		if (_TotemTimeleft > _timeleftparsed) then return true; end
	end
	if (string.sub(_totemtimeleft,1,2) == ">=") then
		_timeleftparsed = tonumber(string.sub(_totemtimeleft,3))
		if (_TotemTimeleft >= _timeleftparsed) then return true; end
	end
	if (string.sub(_totemtimeleft,1,2) == "<=") then
		_timeleftparsed = tonumber(string.sub(_totemtimeleft,3))
		if (_TotemTimeleft <= _timeleftparsed) then return true; end
	end
	if (string.sub(_totemtimeleft,1,1) == "=") then
		_timeleftparsed = tonumber(string.sub(_totemtimeleft,2))
		if (_TotemTimeleft == _timeleftparsed) then return true; end
	end

	return false
end

function ROB_PlayerHasComboPoints(_checkstring,_getnextspell)
	local _parsedCP = _checkstring
	local _unitCP = GetComboPoints("player", "target")

	if (string.sub(_parsedCP,1,1) == "<" and string.sub(_parsedCP,1,2) ~= "<=") then
		_parsedCP = tonumber(string.sub(_parsedCP,2))
		if (_getnextspell and ROB_CURRENT_ACTION) then
			--Check if the current action generates a combo point
			local _generatesCP = ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].b_gcombopoints
			if (_generatesCP and ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gcombopoints and ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gcombopoints ~= "") then
				_generatesCP = tonumber(ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gcombopoints)
				if ((_unitCP + _generatesCP) < _parsedCP) then return true; end
			else
				if (_unitCP < _parsedCP) then return true; end
			end
		else
			if (_unitCP < _parsedCP) then return true; end
		end
	end
	if (string.sub(_parsedCP,1,1) == ">" and string.sub(_parsedCP,1,2) ~= ">=") then
		_parsedCP = tonumber(string.sub(_parsedCP,2))
		if (_getnextspell and ROB_CURRENT_ACTION) then
			--Check if the current action generates a combo point
			local _generatesCP = ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].b_gcombopoints
			if (_generatesCP and ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gcombopoints and ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gcombopoints ~= "") then
				_generatesCP = tonumber(ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gcombopoints)
				if ((_unitCP + _generatesCP) > _parsedCP) then return true; end
			else
				if (_unitCP > _parsedCP) then return true; end
			end
		else
			if (_unitCP > _parsedCP) then return true; end
		end
	end
	if (string.sub(_parsedCP,1,2) == ">=") then
		_parsedCP = tonumber(string.sub(_parsedCP,3))
		if (_getnextspell and ROB_CURRENT_ACTION) then
			--Check if the current action generates a combo point
			local _generatesCP = ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].b_gcombopoints
			if (_generatesCP and ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gcombopoints and ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gcombopoints ~= "") then
				_generatesCP = tonumber(ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gcombopoints)
				if ((_unitCP + _generatesCP) >= _parsedCP) then return true; end
			else
				if (_unitCP >= _parsedCP) then return true; end
			end
		else
			if (_unitCP >= _parsedCP) then return true; end
		end
	end
	if (string.sub(_parsedCP,1,2) == "<=") then
		_parsedCP = tonumber(string.sub(_parsedCP,3))
		if (_getnextspell and ROB_CURRENT_ACTION) then
			--Check if the current action generates a combo point
			local _generatesCP = ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].b_gcombopoints
			if (_generatesCP and ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gcombopoints and ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gcombopoints ~= "") then
				_generatesCP = tonumber(ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gcombopoints)
				if ((_unitCP + _generatesCP) <= _parsedCP) then return true; end
			else
				if (_unitCP <= _parsedCP) then return true; end
			end
		else
			if (_unitCP <= _parsedCP) then return true; end
		end
	end
	if (string.sub(_parsedCP,1,1) == "=") then
		_parsedCP = tonumber(string.sub(_parsedCP,2))
		if (_getnextspell and ROB_CURRENT_ACTION) then
			--Check if the current action generates a combo point
			local _generatesCP = ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].b_gcombopoints
			if (_generatesCP and ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gcombopoints and ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gcombopoints ~= "") then
				_generatesCP = tonumber(ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gcombopoints)
				if ((_unitCP + _generatesCP) == _parsedCP) then return true; end
			else
				if (_unitCP == _parsedCP) then return true; end
			end
		else
			if (_unitCP == _parsedCP) then return true; end
		end
	end

	return false
end

function ROB_CheckForDebuffType(_unitName,_magic,_poison,_disease,_curse)
	local debuffCount = 0
	for i = 1, 40 do
		local debuffName,_, debuff, debuffStack, debuffType = UnitDebuff("player", i)
		if (not debuff) then
			break
		end
		-- Types are Magic, Disease, Poison, Curse
		if (_magic and debuffType == "Magic") then
			local exclude = ROB_ArcaneExclusions[debuffName]
			if (not exclude) then
				debuffCount = debuffCount + 1
			end
		end
		if (_poison and debuffType == "Poison") then
			local exclude = ROB_ArcaneExclusions[debuffName]
			if (not exclude) then
				debuffCount = debuffCount + 1
			end
		end
		if (_disease and debuffType == "Disease") then
			local exclude = ROB_ArcaneExclusions[debuffName]
			if (not exclude) then
				debuffCount = debuffCount + 1
			end
		end
		if (_curse and debuffType == "Curse") then
			local exclude = ROB_ArcaneExclusions[debuffName]
			if (not exclude) then
				debuffCount = debuffCount + 1
			end
		end
	end

	if (debuffCount > 0) then
		return true
	else
		return false
	end
end

function ROB_UnitIsCasting(_unitName, _spelllist)
	local _unitCasting, _startTime
	--local _convertedSpellName = nil
	local _notInterruptible = nil

	_unitCasting, _, _, _, _startTime, _, _, _, _notInterruptible = UnitCastingInfo(_unitName)
	if (not _unitCasting) then
		--unit is not casting so check if is channeling
		_unitCasting, _, _, _, _, _startTime, _, _notInterruptible = UnitChannelInfo(_unitName)
	end

	if (_unitCasting) then
		_hasbeencasting =  GetTime() - (_startTime/1000)
		if (ROB_Lists[_spelllist] and ROB_Lists[_spelllist].SortedSpells) then
			for key, value in pairs(ROB_Lists[_spelllist].SortedSpells) do
				--First try to get the spell info from the spellname
				--[[_convertedSpellName = GetSpellInfo(value)
				if (not _convertedSpellName) then
				--If the getspellinfo failed then use spellname
				_convertedSpellName = value
				end
				if (_convertedSpellName and (string.find(_unitCasting, _convertedSpellName))) then
				return true
				end--]]
				--print("ROB_UnitIsCasting _spelllist:".._spelllist)
				if (value == "*" and _notInterruptible == false) then
					return true
				elseif ROB_SpellsMatch(value,_unitCasting) then
					return true
				end
			end
		end
	end
	return false
end

function ROB_UnitPassesLifeCheck(_checkstring,_unitName,_checkMax)
	local _lifeparsed = nil
	local _unitHP = 0

	if (string.find(_checkstring, "%%")) then
		_unitHP = math.floor(UnitHealth(_unitName)/UnitHealthMax(_unitName) * 100)
		_lifeparsed = string.sub(_checkstring,1,(string.find(_checkstring, "%%")-1))
	else
		if (_checkMax) then
			_unitHP = UnitHealthMax(_unitName)
		else
			_unitHP = UnitHealth(_unitName)
		end
		_lifeparsed = _checkstring
	end

	if (string.sub(_lifeparsed,1,1) == "<" and string.sub(_lifeparsed,1,2) ~= "<=") then
		_lifeparsed = tonumber(string.sub(_lifeparsed,2))
		if (_unitHP < _lifeparsed) then return true; end
	end
	if (string.sub(_lifeparsed,1,1) == ">" and string.sub(_lifeparsed,1,2) ~= ">=") then
		_lifeparsed = tonumber(string.sub(_lifeparsed,2))
		if (_unitHP > _lifeparsed) then return true; end
	end
	if (string.sub(_lifeparsed,1,2) == ">=") then
		_lifeparsed = tonumber(string.sub(_lifeparsed,3))
		if (_unitHP >= _lifeparsed) then return true; end
	end
	if (string.sub(_lifeparsed,1,2) == "<=") then
		_lifeparsed = tonumber(string.sub(_lifeparsed,3))
		if (_unitHP <= _lifeparsed) then return true; end
	end
	if (string.sub(_lifeparsed,1,1) == "=") then
		_lifeparsed = tonumber(string.sub(_lifeparsed,2))
		if (_unitHP == _lifeparsed) then return true; end
	end

	return false
end

function ROB_UnitPassesPowerCheck(_checkstring,_unitName,_powerType,_getnextspell)
	local _powerparsed = nil
	local _unitPower = 0

	if (string.find(_checkstring, "%%")) then
		_unitPower = math.floor(UnitPower(_unitName, _powerType)/UnitPowerMax(_unitName, _powerType) * 100)
		_powerparsed = string.sub(_checkstring,1,(string.find(_checkstring, "%%")-1))
	else
		_unitPower = UnitPower(_unitName, _powerType)
		_powerparsed = _checkstring
	end

	--After we get our unit power see if we should add some to predict next spell
	if (_getnextspell and ROB_CURRENT_ACTION) then
		local _generatesUP = ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].b_gunitpower
		local _generatesUPtype = ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gunitpowertype
		local _generatesUPamount = ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gunitpower
		if (_generatesUP and _generatesUPtype and _generatesUPamount and (_generatesUPtype == _powerType)) then
			--Check if it generates a percentage
			if (string.find(_generatesUPamount, "%%")) then
				_generatesUPamount = string.sub(_generatesUPamount,1,(string.find(_generatesUPamount, "%%")-1))
			end
			_unitPower = _unitPower + tonumber(_generatesUPamount)
		end
	end


	if (string.sub(_powerparsed,1,1) == "<" and string.sub(_powerparsed,1,2) ~= "<=") then
		_powerparsed = tonumber(string.sub(_powerparsed,2))
		if (_unitPower < _powerparsed) then return true; end
	end
	if (string.sub(_powerparsed,1,1) == ">" and string.sub(_powerparsed,1,2) ~= ">=") then
		_powerparsed = tonumber(string.sub(_powerparsed,2))
		if (_unitPower > _powerparsed) then return true; end
	end
	if (string.sub(_powerparsed,1,2) == ">=") then
		_powerparsed = tonumber(string.sub(_powerparsed,3))
		if (_unitPower >= _powerparsed) then return true; end
	end
	if (string.sub(_powerparsed,1,2) == "<=") then
		_powerparsed = tonumber(string.sub(_powerparsed,3))
		if (_unitPower <= _powerparsed) then return true; end
	end
	if (string.sub(_powerparsed,1,1) == "=") then
		_powerparsed = tonumber(string.sub(_powerparsed,2))
		if (_unitPower == _powerparsed) then return true; end
	end

	return false
end

function ROB_UnitPassesRuneCheck(_blood, _frost, _unholy, _death, _getnextspell)
	local _runeparsed = nil
	local _runeCount = nil

	if (select(2, UnitClass("player")) == "DEATHKNIGHT") then
		deathRuneCount = 0
		bloodRuneCount = 0
		frostRuneCount = 0
		unholyRuneCount = 0

		--1 : RUNETYPE_BLOOD
		--2 : RUNETYPE_CHROMATIC
		--3 : RUNETYPE_FROST
		--4 : RUNETYPE_DEATH

		for i = 1, 6 do
			_start, _duration, _runeReady = GetRuneCooldown(i)
			if (GetRuneType(i) == 1 and _runeReady) then
				bloodRuneCount = bloodRuneCount + 1
			elseif (GetRuneType(i) == 2 and _runeReady) then
				unholyRuneCount = unholyRuneCount + 1
			elseif (GetRuneType(i) == 3 and _runeReady) then
				frostRuneCount = frostRuneCount + 1
			elseif (GetRuneType(i) == 4 and _runeReady) then
				deathRuneCount = deathRuneCount + 1
			end
		end

		--After we have our rune counts check if the current action is going to add a rune
		if (_getnextspell and ROB_CURRENT_ACTION) then
			local _generatesBlood  = ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].b_gbloodrunes
			local _generatesFrost  = ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].b_gfrostrunes
			local _generatesUnholy = ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].b_gunholyrunes
			local _generatesDeath  = ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].b_gdeathrunes
			if (_generatesBlood and ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gbloodrunes) then
				_generatesBlood = tonumber(ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gbloodrunes)
				bloodRuneCount = bloodRuneCount + _generatesBlood
			end
			if (_generatesFrost and ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gfrostrunes) then
				_generatesFrost = tonumber(ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gfrostrunes)
				frostRuneCount = frostRuneCount + _generatesFrost
			end
			if (_generatesUnholy and ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gunholyrunes) then
				_generatesUnholy = tonumber(ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gunholyrunes)
				unholyRuneCount = unholyRuneCount + _generatesUnholy
			end
			if (_generatesDeath and ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gdeathrunes) then
				_generatesDeath = tonumber(ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_gdeathrunes)
				deathRuneCount = deathRuneCount + _generatesDeath
			end
		end

		if (_blood) then
			_runeparsed = _blood
			_runeCount = bloodRuneCount
		end
		if (_frost) then
			_runeparsed = _frost
			_runeCount = frostRuneCount
		end
		if (_unholy) then
			_runeparsed = _unholy
			_runeCount = unholyRuneCount
		end
		if (_death) then
			_runeparsed = _death
			_runeCount = deathRuneCount
		end

		if (string.sub(_runeparsed,1,1) == "<" and string.sub(_runeparsed,1,2) ~= "<=") then
			_runeparsed = tonumber(string.sub(_runeparsed,2))
			if (_runeCount < _runeparsed) then return true; end
		end
		if (string.sub(_runeparsed,1,1) == ">" and string.sub(_runeparsed,1,2) ~= ">=") then
			_runeparsed = tonumber(string.sub(_runeparsed,2))
			if (_runeCount > _runeparsed) then return true; end
		end
		if (string.sub(_runeparsed,1,2) == ">=") then
			_runeparsed = tonumber(string.sub(_runeparsed,3))
			if (_runeCount >= _runeparsed) then return true; end
		end
		if (string.sub(_runeparsed,1,2) == "<=") then
			_runeparsed = tonumber(string.sub(_runeparsed,3))
			if (_runeCount <= _runeparsed) then return true; end
		end
		if (string.sub(_runeparsed,1,1) == "=") then
			_runeparsed = tonumber(string.sub(_runeparsed,2))
			if (_runeCount == _runeparsed) then return true; end
		end
	end

	return false
end

function ROB_SpellPassesOtherCooldownCheck(_othercd, _checkstring)
	local _cooldownparsed = nil

	local _start, _duration = GetSpellCooldown(_othercd)
	if (_start == nil) then
		return false
	end

	local _cooldownLeft = (_start + _duration - GetTime())
	if _cooldownLeft < 0 then _cooldownLeft = 0 end

	if (string.sub(_checkstring,1,1) == "<" and string.sub(_checkstring,1,2) ~= "<=") then
		_cooldownparsed = tonumber(string.sub(_checkstring,2))
		if (_cooldownLeft < _cooldownparsed) then return true; end
	end
	if (string.sub(_checkstring,1,1) == ">" and string.sub(_checkstring,1,2) ~= ">=") then
		_cooldownparsed = tonumber(string.sub(_checkstring,2))
		if (_cooldownLeft > _cooldownparsed) then return true; end
	end
	if (string.sub(_checkstring,1,2) == ">=") then
		_cooldownparsed = tonumber(string.sub(_checkstring,3))
		if (_cooldownLeft >= _cooldownparsed) then return true; end
	end
	if (string.sub(_checkstring,1,2) == "<=") then
		_cooldownparsed = tonumber(string.sub(_checkstring,3))
		if (_cooldownLeft <= _cooldownparsed) then return true; end
	end
	if (string.sub(_checkstring,1,1) == "=") then
		_cooldownparsed = tonumber(string.sub(_checkstring,2))
		if (_cooldownLeft == _cooldownparsed) then return true; end
	end

	return false
end

function ROB_UnitHasDebuff(_debuffNeeded, _unitName, _getnextspell)
	local _unithasdebuffs = false
	local _spellexists = false
	local _sourcecheckpassed = false
	local _stackcheckpassed = false

	local _unparsedDebuff = nil
	local _remainingDebuffs = _debuffNeeded
	local _spellparsedstacks = 0
	local _timeleft = 0
	local _debuffcount = 0
	local _debuffsfound = 0
	local _doneparsing = false
	local _stringtype = 0
	local _name, _rank, _icon, _count, _debuffType, _duration, _expirationTime, _unitCaster, _isStealable, _shouldConsolidate, _spellId

	while not _doneparsing do
		_unparsedDebuff = nil
		--print("parsing _remainingDebuffs=".._remainingDebuffs)
		if (string.find(_remainingDebuffs, "|")) then
			_unparsedDebuff   = string.sub(_remainingDebuffs,1,string.find(_remainingDebuffs, "|")-1)
			--print("  found| so _unparsedDebuff=".._unparsedDebuff)
			_debuffcount      = _debuffcount + 1
			_remainingDebuffs = string.sub(_remainingDebuffs,string.find(_remainingDebuffs, "|")+2)
			--print("  found| so _remainingDebuffs=".._remainingDebuffs)
			_stringtype = 1
		elseif (string.find(_remainingDebuffs, "&")) then
			--print("  found & so _remainingDebuffs=".._remainingDebuffs)
			_unparsedDebuff   = string.sub(_remainingDebuffs,1,string.find(_remainingDebuffs, "&")-1)
			_debuffcount      = _debuffcount + 1
			_remainingDebuffs = string.sub(_remainingDebuffs,string.find(_remainingDebuffs, "&")+1)
			_stringtype = 2
		else
			--print("  foundnothing so we are done")
			_unparsedDebuff   = _remainingDebuffs
			_debuffcount      = _debuffcount + 1
			_doneparsing      = true
		end


		--print("_unparsedDebuff=".._unparsedDebuff)
		_spellexists = false
		_sourcecheckpassed = false
		_stackcheckpassed = false
		_timeleftcheckpassed = false

		--if the debuff has a _ in it that means source needs to be the player
		if (string.find(_unparsedDebuff, "_")) then
			_unparsedDebuff = string.sub(_unparsedDebuff,2)
			_sourceunitparsed = "player"
		else
			--_unparsedDebuff = _unparsedDebuff
			_sourceunitparsed = nil
		end

		if (string.find(_unparsedDebuff, "%^")) then
			_spellparsedseconds = tonumber(string.sub(_unparsedDebuff,(string.find(_unparsedDebuff, "%^")+1)))
			_unparsedDebuff = string.sub(_unparsedDebuff,1,(string.find(_unparsedDebuff, "%^")-1))
		else
			_spellparsedseconds = 0
		end

		if (string.find(_unparsedDebuff, "#")) then
			_spellparsedstacks = tonumber(string.sub(_unparsedDebuff,(string.find(_unparsedDebuff, "#")+1)))
			_unparsedDebuff = string.sub(_unparsedDebuff,1,(string.find(_unparsedDebuff, "#")-1))
		else
			_spellparsedstacks = 0
		end

		if (_unparsedDebuff ~= nil) then
			for i = 1, 40 do
				_name, _rank, _icon, _count, _debuffType, _duration, _expirationTime, _unitCaster, _isStealable, _shouldConsolidate, _spellId = UnitDebuff(_unitName, i)
				if (_name ~= nil and ROB_SpellsMatch(_name, _unparsedDebuff)) then
					_spellexists = true

					if (_sourceunitparsed ~= nil) then
						if (_sourceunitparsed == _unitCaster) then
							_sourcecheckpassed = true
						end
					else
						_sourcecheckpassed = true
					end

					if (_spellparsedstacks > 0) then
						if (_count and _count >= _spellparsedstacks) then
							_stackcheckpassed = true
						end
					else
						_stackcheckpassed = true
					end

					_timeleft = _expirationTime - GetTime()
					if _timeleft < 0 then _timeleft = 0; end

					--set the action cooldown to the time left on the debuff minus the refresh time specified
					--print(_spellparsedseconds)
					if (_timeleft < _spellparsedseconds) then
						ROB_ACTION_TIMELEFT = _timeleft
					else
						ROB_ACTION_TIMELEFT = _timeleft - _spellparsedseconds
					end

					if (_spellparsedseconds > 0) then
						if (_timeleft >= _spellparsedseconds) then
							_timeleftcheckpassed = true
						end
					else
						_timeleftcheckpassed = true
					end

					if (_spellexists and _sourcecheckpassed and _stackcheckpassed and _timeleftcheckpassed) then  _debuffsfound = _debuffsfound +1; end
				end
			end
		else
		--spellparsed does not exist maybe warn the player in the future they need to retype in the debuffs field
		end
	end

	if (_stringtype == 0 and (_debuffsfound >= 1)) then
		_unithasdebuffs = true
	end
	if (_stringtype == 1 and (_debuffsfound >= 1)) then
		_unithasdebuffs = true
	end
	if (_stringtype == 2 and (_debuffsfound == _debuffcount)) then
		_unithasdebuffs = true
	end

	return _unithasdebuffs
end

function ROB_CheckForWeaponEnchant(_slot, _checkstring)
	local _enchantparsedseconds = 0
	local _timeleftpassed = false
	local _timeleft = 0
	local _enchantpassed = false
	local _enchantparsed = _checkstring


	local _hasMainHandEnchant, _mainHandExpiration, _mainHandCharges, _hasOffHandEnchant, _offHandExpiration, _offHandCharges = GetWeaponEnchantInfo()

	if (_slot == 16 and (not _hasMainHandEnchant)) then return false; end
	if (_slot == 17 and (not _hasOffHandEnchant)) then return false; end

	if (_slot == 16) then _timeleft = GetTime() + _mainHandExpiration / 1000; end
	if (_slot == 17) then _timeleft = GetTime() + _offHandExpiration / 1000; end

	if (string.find(_enchantparsed, "%^")) then
		_enchantparsedseconds = tonumber(string.sub(_spellparsed,(string.find(_spellparsed, "%^")+1)))
		_enchantparsed = string.sub(_enchantparsed,1,(string.find(_enchantparsed, "%^")-1))
	else
		_enchantparsedseconds = 0
	end

	ROB_Tooltip:SetOwner(UIParent, "ANCHOR_NONE");
	ROB_Tooltip:SetInventoryItem("player", _slot);

	local _lefttext = nil
	local _righttext = nil
	local _parsedline = nil
	for _ttline = 1, ROB_Tooltip:NumLines() do
		_lefttext = getglobal("ROB_TooltipTextLeft".._ttline);
		_lefttext = _lefttext:GetText()
		if _lefttext then _parsedline = "".._lefttext; end

		_righttext = getglobal("ROB_TooltipTextLeft".._ttline);
		_righttext = _righttext:GetText()
		if _righttext then _parsedline = _parsedline.._righttext; end

		if (_parsedline ~= "") then
			if (string.find(_parsedline, _enchantparsed)) then
				ROB_Tooltip:Hide();
				_enchantpassed = true
			end
		end
	end
	ROB_Tooltip:Hide();

	if (_timeleft >= _enchantparsedseconds and _enchantpassed) then
		return true;
	end

	return false;
end

function ROB_UnitHasBuff(_buffNeeded, _unitName, _getnextspell)
	local _unithasbuffs = false
	local _spellexists = false
	local _sourcecheckpassed = false
	local _stackcheckpassed = false

	local _unparsedBuff = nil
	local _remainingBuffs = _buffNeeded
	local _spellparsedstacks = 0
	local _timeleft = 0
	local _buffcount = 0
	local _buffsfound = 0
	local _doneparsing = false
	local _name, _rank, _icon, _count, _debuffType, _duration, _expirationTime, _unitCaster, _isStealable, _shouldConsolidate, _spellId
	local _stringtype = 0

	while not _doneparsing do
		_unparsedBuff = nil
		if (string.find(_remainingBuffs, "|")) then
			_unparsedBuff   = string.sub(_remainingBuffs,1,string.find(_remainingBuffs, "|")-1)
			_buffcount      = _buffcount + 1
			_remainingBuffs = string.sub(_remainingBuffs,string.find(_remainingBuffs, "|")+2)
			_stringtype = 1
		elseif (string.find(_remainingBuffs, "&")) then
			_unparsedBuff   = string.sub(_remainingBuffs,1,string.find(_remainingBuffs, "&")-1)
			_buffcount      = _buffcount + 1
			_remainingBuffs = string.sub(_remainingBuffs,string.find(_remainingBuffs, "&")+1)
			_stringtype = 2
		else
			_unparsedBuff   = _remainingBuffs
			_buffcount      = _buffcount + 1
			_doneparsing    = true
		end
		--print("Checking for _unparsedBuff=".._unparsedBuff)

		_spellexists = false
		_sourcecheckpassed = false
		_stackcheckpassed = false
		_timeleftcheckpassed = false

		--if the buff has a _ in it that means source needs to be the player
		if (string.find(_unparsedBuff, "_")) then
			_unparsedBuff = string.sub(_unparsedBuff,2)
			_sourceunitparsed = "player"
		else
			_unparsedBuff = _unparsedBuff
			_sourceunitparsed = nil
		end

		if (string.find(_unparsedBuff, "%^")) then
			_spellparsedseconds = tonumber(string.sub(_unparsedBuff,(string.find(_unparsedBuff, "%^")+1)))
			_unparsedBuff = string.sub(_unparsedBuff,1,(string.find(_unparsedBuff, "%^")-1))
		else
			_spellparsedseconds = 0
		end

		if (string.find(_unparsedBuff, "#")) then
			_spellparsedstacks = tonumber(string.sub(_unparsedBuff,(string.find(_unparsedBuff, "#")+1)))
			_unparsedBuff = string.sub(_unparsedBuff,1,(string.find(_unparsedBuff, "#")-1))
		else
			_spellparsedstacks = 0
		end

		if (_unparsedBuff ~= nil) then
			--Unitbuff can not take a spellid as a parameter so we have to try the _unparsedBuff first and if that fails then try to convert the _unparsedBuff to a spellname
			_name, _rank, _icon, _count, _debuffType, _duration, _expirationTime, _unitCaster, _isStealable, _shouldConsolidate, _spellId = UnitBuff(_unitName, _unparsedBuff)
			if (not _name and GetSpellInfo(_unparsedBuff)) then
				_name, _rank, _icon, _count, _debuffType, _duration, _expirationTime, _unitCaster, _isStealable, _shouldConsolidate, _spellId = UnitBuff(_unitName, GetSpellInfo(_unparsedBuff))
			end

			if (_name ~= nil and ROB_SpellsMatch(_name, _unparsedBuff)) then
				_spellexists = true


				if (_sourceunitparsed ~= nil) then
					if (_sourceunitparsed == _unitCaster) then
						_sourcecheckpassed = true
					end
				else
					_sourcecheckpassed = true
				end

				if (_spellparsedstacks > 0) then
					if (_count and _count >= _spellparsedstacks) then
						_stackcheckpassed = true
					end
				else
					_stackcheckpassed = true
				end

				_timeleft = _expirationTime - GetTime()
				if _timeleft < 0 then _timeleft = 0; end

				--set the action cooldown to the time left on the buff minus the refresh time specified
				if (_timeleft < _spellparsedseconds) then
					ROB_ACTION_TIMELEFT = _timeleft
				else
					ROB_ACTION_TIMELEFT = _timeleft - _spellparsedseconds
				end

				if (_spellparsedseconds > 0) then
					if (_timeleft >= _spellparsedseconds) then
						_timeleftcheckpassed = true
					end
				else
					_timeleftcheckpassed = true
				end

				if (_spellexists and _sourcecheckpassed and _stackcheckpassed and _timeleftcheckpassed) then
					_buffsfound = _buffsfound +1
				end

			end

		else
		--spellparsed does not exist maybe warn the player in the future
		end
	end

	if (_stringtype == 0 and (_buffsfound >= 1)) then
		_unithasbuffs = true
	end
	if (_stringtype == 1 and (_buffsfound >= 1)) then
		_unithasbuffs = true
	end
	if (_stringtype == 2 and (_buffsfound == _buffcount)) then
		_unithasbuffs = true
	end

	return _unithasbuffs
end

function ROB_GetActionTintColor(_actionname)
	local _ActionDB = ROB_Rotations[ROB_SelectedRotationName].ActionList[_actionname]
	local _r = nil
	local _g = nil
	local _b = nil
	local _i = 1
	if (_ActionDB.v_rangespell and _ActionDB.v_rangespell ~=nil and _ActionDB.v_rangespell ~="") then
		--We have a rotation range spellname lets parse out the hex code if needed
		if (string.find(_ActionDB.v_rangespell, "%#")) then
			local _data = { strsplit("#", string.sub(_ActionDB.v_rangespell, string.find(_ActionDB.v_rangespell, "%#")+1)) }
			for _key,_value in pairs(_data) do
				if (_i == 1) then _r = _value; end
				if (_i == 2) then _g = _value; end
				if (_i == 3) then _b = _value; end
				_i = _i + 1
			end
		else
		--no hex color code in the rangespell so let the function return nil
		end
	end
	return _r, _g, _b
end

--[[function ROB_ClearNextAction()
ROB_CurrentActionTint:SetTexture()
ROB_NextActionTint:SetTexture()
ROB_NextActionButtonHotKey:SetText()
ROB_SetButtonTexture(ROB_NextActionButton, nil)

if (ROB_NextActionButtonIcon:GetTexture() ~= "") then ROB_NextActionButtonCooldown:Hide(); end
end]]--

function ROB_GetActionTexture(_actionname)
	local _ActionDB = ROB_Rotations[ROB_SelectedRotationName].ActionList[_actionname]
	if not _ActionDB then
		return nil
	end

	if (_InvSlots[_ActionDB.v_spellname]) then
		local _, _textureName = GetInventorySlotInfo(_ActionDB.v_spellname)
		return _textureName
	elseif ((not GetTexturePath(_ActionDB.v_actionicon)) or (_ActionDB.v_actionicon == "")) then
		return GetTexturePath(_ActionDB.v_spellname)
	else
		return GetTexturePath(_ActionDB.v_actionicon)
	end
end

function ROB_SetButtonTexture(_button, _texture)
	if (not _button) then
		return
	end
	if (_G[_button:GetName().."Icon"]) then
		--print("_button.icon worked")
		_G[_button:GetName().."Icon"]:SetTexture(_texture)
	end
end

function ROB_SetNextActionTexture(_compareaction)
	local _ActionDB = ROB_Rotations[ROB_SelectedRotationName].ActionList[_compareaction]
	local _r = nil
	local _g = nil
	local _b = nil
	local _texture = nil

	if (not UnitExists("target")) then
		ROB_SetButtonTexture(ROB_NextActionButton, nil)
	else
		if (not _compareaction) then
			ROB_SetButtonTexture(ROB_NextActionButton, nil)
			return
		end
		if (_ActionDB.b_rangecheck) then
			--range check turned on : have ready next action : determine if _compareaction is in range
			if (ROB_ActionInRange(_compareaction,"target")) then
				--range check turned on : action in range
				if (ROB_NextActionButtonIcon:GetTexture() ~= ROB_GetActionTexture(_compareaction)) then ROB_SetButtonTexture(ROB_NextActionButton, ROB_GetActionTexture(_compareaction)); end
			else
				--range check turned on : action oor : determine if we display tint or oor texture
				_r, _g, _b = ROB_GetActionTintColor(_compareaction)
				if (_r) then
					--range check turned on : action oor : tint color specified : set the texture to the action texture
					if (ROB_NextActionButtonIcon:GetTexture() ~= ROB_GetActionTexture(_compareaction)) then ROB_SetButtonTexture(ROB_NextActionButton, ROB_GetActionTexture(_compareaction)); end
				else
					--range check turned on : action oor : no tint color specified : set the texture to the oor texture
					--print("Next Action Texuture ActionName:"..tostring(_compareaction).." has range check turned on action oor : no tint color specified : set the texture to the oor texture")
					if (ROB_NextActionButtonIcon:GetTexture() ~= GetTexturePath("6544")) then ROB_SetButtonTexture(ROB_NextActionButton, GetTexturePath("6544")); end
				end
			end
		else
			--range check turned off : display action texture
			if (ROB_NextActionButtonIcon:GetTexture() ~= ROB_GetActionTexture(_compareaction)) then ROB_SetButtonTexture(ROB_NextActionButton, ROB_GetActionTexture(_compareaction)); end
		end
	end
end

function ROB_SetCurrentActionTexture(_compareaction)
	if (not UnitExists("target")) then
		ROB_SetButtonTexture(ROB_CurrentActionButton, nil)
	else
		if (not _compareaction) then
			ROB_SetButtonTexture(ROB_CurrentActionButton, nil)
			return
		end
		if (ROB_CurrentActionButtonIcon:GetTexture() ~= ROB_GetActionTexture(_compareaction)) then
			ROB_SetButtonTexture(ROB_CurrentActionButton, ROB_GetActionTexture(_compareaction));

		end
	end
end

function ROB_SetNextActionTint(_compareaction)
	local _r = nil
	local _g = nil
	local _b = nil
	local _texture = nil
	if (not UnitExists("target")) then
		ROB_NextActionTint:SetTexture()
	else
		if (not _compareaction) then
			-- have target but no next action ready so clear it
			ROB_NextActionTint:SetTexture()
			return
		end
		if (ROB_ActionInRange(_compareaction,"target")) then
			-- action in range
			ROB_NextActionTint:SetTexture()
		else
			--range check turned on : action oor : determine if we display tint or oor texture
			_r, _g, _b = ROB_GetActionTintColor(_compareaction)
			if (_r) then
				--tint turned on : action oor : tint color specified : set the tint
				ROB_NextActionTint:SetTexture(_r, _g, _b, .3)
			else
				--tint turned off : action oor : no tint color specified : clear tint
				ROB_NextActionTint:SetTexture()
			end
		end
	end
end

function ROB_SetCurrentActionTint(_compareaction)
	local _r = nil
	local _g = nil
	local _b = nil
	local _texture = nil
	if (not UnitExists("target")) then
		ROB_CurrentActionTint:SetTexture()
	else
		if (not _compareaction) then
			-- have target but no next action ready so clear it
			ROB_CurrentActionTint:SetTexture()
			return
		end
		if (ROB_ActionInRange(_compareaction,"target")) then
			-- action in range
			ROB_CurrentActionTint:SetTexture()
		else
			--action oor : determine if we display tint or oor texture
			_r, _g, _b = ROB_GetActionTintColor(_compareaction)
			if (_r) then
				--tint turned on : action oor : tint color specified : set the tint
				ROB_CurrentActionTint:SetTexture(_r, _g, _b, .3)
			else
				--tint turned off : action oor : no tint color specified : clear tint
				ROB_CurrentActionTint:SetTexture()
			end
		end
	end
end

function ROB_SetNextActionLabel(_compareaction)
	local _ActionDB = ROB_Rotations[ROB_SelectedRotationName].ActionList[_compareaction]
	local _r = nil
	local _g = nil
	local _b = nil
	local _texture = nil


	if (not UnitExists("target")) then
		ROB_NextActionButtonHotKey:SetText()
	else
		if (not _compareaction) then
			ROB_NextActionButtonHotKey:SetText()
			return
		end
		if (_ActionDB.b_rangecheck) then
			--range check turned on : have ready next action : determine if _compareaction is in range
			if (ROB_ActionInRange(_compareaction,"target")) then
				--range check turned on : action in range
				if (ROB_NextActionButtonHotKey:GetText() ~= _ActionDB.v_keybind and _ActionDB.v_keybind ~= ROB_UI_KEYBIND) then ROB_NextActionButtonHotKey:SetText(_ActionDB.v_keybind); end
			else
				--range check turned on : action oor : determine if we display tint or oor texture
				_r, _g, _b = ROB_GetActionTintColor(_compareaction)
				if (_r) then
					--range check turned on : action oor : tint color specified : set the text to the action keybind
					if (ROB_NextActionButtonHotKey:GetText() ~= _ActionDB.v_keybind and _ActionDB.v_keybind ~= ROB_UI_KEYBIND) then ROB_NextActionButtonHotKey:SetText(_ActionDB.v_keybind); end
				else
					--range check turned on : action oor : no tint color specified : clear the text
					ROB_NextActionButtonHotKey:SetText()
				end
			end
		else
			--range check turned off : display action keybind
			if (ROB_NextActionButtonHotKey:GetText() ~= _ActionDB.v_keybind and _ActionDB.v_keybind ~= ROB_UI_KEYBIND) then ROB_NextActionButtonHotKey:SetText(_ActionDB.v_keybind); end
		end
	end
end

function ROB_SetCurrentActionLabel(_compareaction)
	local _ActionDB = ROB_Rotations[ROB_SelectedRotationName].ActionList[_compareaction]
	local _r = nil
	local _g = nil
	local _b = nil
	local _texture = nil


	if (not UnitExists("target")) then
		ROB_CurrentActionButtonHotKey:SetText()
	else
		if (not _compareaction) then
			ROB_CurrentActionButtonHotKey:SetText()
			return
		end
		if (ROB_CurrentActionButtonHotKey:GetText() ~= _ActionDB.v_keybind and _ActionDB.v_keybind ~= ROB_UI_KEYBIND) then ROB_CurrentActionButtonHotKey:SetText(_ActionDB.v_keybind); end
	end
end

function ROB_SetActionCooldown(_buttoncd, _cooldown)
	local _icon = _G[_buttoncd]:GetParent():GetName().."Icon"
	_icon = _G[_icon]:GetTexture()
	if (ROB_Options.HideCD or tostring(_icon) == "nil" or _icon == GetTexturePath("6544")) then
		--print(_G[_buttoncd]:GetParent():GetName().." hiding")
		_G[_buttoncd]:SetCooldown(0,0)
		_G[_buttoncd]:Hide()
	else
		--print("cooldown"..tostring(_cooldown))
		--print(_G[_buttoncd]:GetParent():GetName().." IsShown="..tostring(_G[_buttoncd]:IsShown()))
		if (_cooldown and _cooldown > 0 and not _G[_buttoncd]:IsShown()) then
			--print(_G[_buttoncd]:GetParent():GetName().." setting cooldown="..tostring(_cooldown))
			_G[_buttoncd]:SetCooldown(GetTime(),_cooldown)
			_G[_buttoncd]:Show()
		elseif (_cooldown == 0) then
			_G[_buttoncd]:Hide()
		end
	end
end

function ROB_SpellsMatch(_spell1, _spell2)
	--print("Checking if ROB_SpellsMatch "..tostring(_spell1)..":"..tostring(_spell2))
	if not _spell1 then return false end
	if not _spell2 then return false end
	if _spell1 == "" then return false end
	if _spell2 == "" then return false end


	--print("Checking if ROB_SpellsMatch1 "..tostring(_spell1)..":"..tostring(_spell2))
	--Try to compare just the strings first
	if tostring(_spell1) == tostring(_spell2) then return true end
	--print("Checking if ROB_SpellsMatch2 "..tostring(_spell1)..":"..tostring(_spell2))
	--Try to compare the getspellinfo
	--	if (GetSpellInfo(_spell1) and GetSpellInfo(_spell2) and (GetSpellInfo(_spell21) == GetSpellInfo(_spell2))) then
	--		return true
	--	end
	--print("Checking if ROB_SpellsMatch3 "..tostring(_spell1)..":"..tostring(_spell2))
	if GetSpellInfo(_spell2) and _spell1 == GetSpellInfo(_spell2) then return true end
	--print("Checking if ROB_SpellsMatch4 "..tostring(_spell1)..":"..tostring(_spell2))
	if GetSpellInfo(_spell1) and GetSpellInfo(_spell1) == _spell2 then return true end
	--print("Checking if ROB_SpellsMatch5 "..tostring(_spell1)..":"..tostring(_spell2))

	return false
end

function ROB_ActionInRange(_actionname,_unit)
	if (not _actionname or not ROB_SelectedRotationName) then return false end
	local _ActionDB = ROB_Rotations[ROB_SelectedRotationName].ActionList[_actionname]
	if (not _ActionDB) then return false end
	local _rangespell = _ActionDB.v_rangespell

	--there is no target so return true we are in range
	--if (not UnitExists("target")) then return true end

	if (_rangespell and _rangespell ~=nil and _rangespell ~="") then
		--We have a rotation range spellname lets parse out the hex code if needed
		if (string.find(_rangespell, "%#")) then
			--rangespell has tint color parse it
			_rangespell = string.sub(_rangespell, 1, string.find(_rangespell, "%#")-1)
			--after we strip the hex color if there is nothing left use the spellname instead
			if (not _rangespell or _rangespell == "") then
				_rangespell = _ActionDB.v_spellname
			end
			--remove the next line to allow range checking in tinted actions
			--return true
		else
		--rangespell does not have tint color but is already set to v_rangespell so no further actions necessary
		end
	else
		--rangespell is blank but checkrange is true set the range spell to the spellname
		_rangespell = _ActionDB.v_spellname
	end

	--This is a out of range action so use the out of range spell name instead
	if (_ActionDB.b_oorspell and _ActionDB.v_oorspell ~=nil and _ActionDB.v_oorspell ~= "") then
		_rangespell = _ActionDB.v_oorspell
	end

	--Try to use the getspellinfo to get the spell range
	if (_rangespell and GetSpellInfo(_rangespell) and IsSpellInRange(GetSpellInfo(_rangespell),_unit) == 1) then return true end
	--The getspellinfo failed so try just the spell name
	--if (_rangespell and GetSpellInfo(_rangespell) and IsSpellInRange(GetSpellInfo(_rangespell),_unit) == 1) then return true end
	return false
end

function ROB_SpellReady(_actionname,_getnextspell)
	local _ready          = true
	local _GCDleft        = nil
	local _cooldownLeft   = nil
	local _startGCD       = nil
	local _inGCD          = nil
	local _start          = nil
	local _duration       = nil
	local _myHPP          = math.floor(UnitHealth("player")/UnitHealthMax("player") * 100)
	local _moHPP          = math.floor(UnitHealth("mouseover")/UnitHealthMax("mouseover") * 100)
	local _targetHPP      = math.floor(UnitHealth("target")/UnitHealthMax("target") * 100)
	local _targetCasting  = nil
	local _focusCasting   = nil
	local _hasbeencasting = nil
	local _startTime      = nil
	local _endTime        = nil
	local _timeLeft       = nil
	local _debugon        = false
	local _spellname      = nil
	local _spellincdbuffer= false
	local deathRuneCount  = 0
	local bloodRuneCount  = 0
	local frostRuneCount  = 0
	local unholyRuneCount = 0
	local _name, _rank, _nomana, _usable, _channeling, _icon, _cost, _isFunnel, _powerType, _castTime, _minRange, _maxRange
	local _checkmagic     = false
	local _checkpoison    = false
	local _checkdisease   = false
	local _checkcurse     = false
	local _ActionDB = ROB_Rotations[ROB_SelectedRotationName].ActionList[_actionname]

	if (_ActionDB.b_debug ~= nil and _ActionDB.b_debug) then
		_debugon = _ActionDB.b_debug
		--print("debug on for ".._actionname)
	end
	_spellname = _ActionDB.v_spellname
	if (_spellname == nil or _spellname == "" or _spellname == "<spellname>") then
		_spellname = "<spellname>"
	end


	-- CHECK: Toggles first otherwise we might exit before updating textures------------------------------------------------------------------
	if (_ActionDB.b_toggle) then
		-- Verify the toggle is turned on otherwise fail the ready
		if (_ActionDB.v_togglename == "Toggle 1") then
			ROB_SetButtonTexture(ROB_RotationToggle1Button, GetTexturePath(_ActionDB.v_toggleicon))

			if (ROB_TOGGLE_1 == 0) then
				_ready = false;
				ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." T:".._ActionDB.v_togglename.." is off",_ready,_debugon)
			end
		elseif (_ActionDB.v_togglename == "Toggle 2") then
			ROB_SetButtonTexture(ROB_RotationToggle2Button, GetTexturePath(_ActionDB.v_toggleicon))
			if (ROB_TOGGLE_2 == 0) then
				_ready = false;
				ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." T:".._ActionDB.v_togglename.." is off",_ready,_debugon)
			end
		elseif (_ActionDB.v_togglename == "Toggle 3") then
			ROB_SetButtonTexture(ROB_RotationToggle3Button, GetTexturePath(_ActionDB.v_toggleicon))
			if (ROB_TOGGLE_3 == 0) then
				_ready = false;
				ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." T:".._ActionDB.v_togglename.." is off",_ready,_debugon)
			end
		elseif (_ActionDB.v_togglename == "Toggle 4") then
			ROB_SetButtonTexture(ROB_RotationToggle4Button, GetTexturePath(_ActionDB.v_toggleicon))
			if (ROB_TOGGLE_4 == 0) then
				_ready = false;
				ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." T:".._ActionDB.v_togglename.." is off",_ready,_debugon)
			end
		end
	end

	if (not _ready) then
		return false
	end
	-- CHECK: if the action is enabled---------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_disabled) then
		ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." because the action is disabled",_getnextspell,_debugon)
		return false
	end

	-- CHECK: Check spell stuff-----------------------------------------------------------------------------------------------------------------------------
	if (not _ActionDB.b_notaspell and _ActionDB.v_spellname) then
		if(nil ~= tonumber(_ActionDB.v_spellname)) then
			-- We are using the spellID to identify our spell. But GetSpellInfo will return the spell name even though we don't know it. So, we must call it twice to get the name of the spell, then verifying the knowledge of it.
			_name, _rank, _icon, _cost, _isFunnel, _powerType, _castTime, _minRange, _maxRange = GetSpellInfo(GetSpellInfo(tonumber(_ActionDB.v_spellname)))
		else
			-- If the spellname isn't an Integer, then it is the true spellname and not it's spellID.
			_name, _rank, _icon, _cost, _isFunnel, _powerType, _castTime, _minRange, _maxRange = GetSpellInfo(_ActionDB.v_spellname)
		end
		if (_name == nil) then
			-- If the name isn't foud, then we don't know the spell.
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._ActionDB.v_spellname.." because this spellname is not available or does not exist due to talents or something. Check spelling or try using the spellid from wowhead instead.",_getnextspell,_debugon)
			return false
		end
		_usable, _nomana = IsUsableSpell(_ActionDB.v_spellname)
		--The default is to show spells even if you dont have mana/rage/ whatever power to cast it, if player wants a power check they can use the power check in player tab
		if (not _usable and not _nomana) then
			--Even when we are getting the next spell we dont want to say its ready when its not usable because not usable means we dont have the spell
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._ActionDB.v_spellname.." because this spellname is not available or does not exist due to talents or something. Check spelling or try using the spellid from wowhead instead.",_getnextspell,_debugon)
			--ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." is not usable or you dont have enough power. Check the spellname in the General Tab.",_getnextspell,_debugon)
			return false
		end
	end

	-- CHECK: Cooldown-----------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.v_gcdspell ~= -1 and _ActionDB.v_spellname) then
		if (_ActionDB.v_gcdspell ~= nil and _ActionDB.v_gcdspell ~= "") then
			_startGCD, _inGCD = GetSpellCooldown(_ActionDB.v_gcdspell)
			if (_startGCD ~= nil) then
				_GCDleft = (_startGCD + _inGCD - GetTime())
				if _GCDleft < 0 then _GCDleft = 0 end
			else
				_GCDleft = 1.5
			end
		else
			_GCDleft = 1.5
		end
	end
	--Even if v_gcdspell is set to -1 make sure to set the cooldown for current action and next action determination
	_start, _duration = GetSpellCooldown(_ActionDB.v_spellname)
	if (_start == nil) then
		local _enabled = nil
		_start, _duration, _enabled = GetInventoryItemCooldown("player", tonumber(_InvSlots[_ActionDB.v_spellname]))
		--print("_start="..tostring(_start).." _enabled="..tostring(_enabled))
	end
	if (_start == nil) then
		--we failed to get the cooldown on the spell for whatever reason, instead of defaulting to ready change it to not ready
		_start = GetTime()
		_duration = 86300
	end

	_cooldownLeft = (_start + _duration - GetTime())
	if _cooldownLeft < 0 then _cooldownLeft = 0 end

	--print("_cooldownLeft="..tostring(_cooldownLeft))

	ROB_ACTION_CD = _cooldownLeft
	--We set the cooldown left on the spell to the action timeleft so the next spell logic can sort spells correctly
	--The check buffs and debuff functions will reassign ROB_ACTION_TIMELEFT later to provide buff timelefts and what not
	ROB_ACTION_TIMELEFT = _cooldownLeft
	ROB_ACTION_GCD = false

	if _cooldownLeft <= _GCDleft then ROB_ACTION_GCD = true; end

	--If we uncomment the next line rotation icon gaps go away but then you can't tell when you have a gap
	--if ((_GCDleft > 0) and (_cooldownLeft > _GCDleft)) then
	if (tonumber(_ActionDB.v_gcdspell) ~= nil and tonumber(_ActionDB.v_gcdspell) < 0) then
		if (tonumber(_cooldownLeft) <= math.abs(_ActionDB.v_gcdspell)) then
			_spellincdbuffer = true
		end
	end

	--if ((_ActionDB.v_gcdspell ~= 0) and (_cooldownLeft > _GCDleft) and (not _ActionDB.b_notaspell) and (not _spellincdbuffer)) then
	if ((_ActionDB.v_gcdspell ~= 0) and (_cooldownLeft > _GCDleft) and (not _spellincdbuffer)) then
		--print("_cooldownLeft1="..tostring(_cooldownLeft))

		if (_getnextspell) then

		--Need to fix this, whats happening is the next spell bypasses cooldown check but the timeleft on a debuff is short but the cooldown is long more than 5 seconds so we do actually need this check
		--Should never need to check this because getNextSpell sorts be what spell is coming up next with the shortest cooldown or shortest time left on the dot
		--we are trying to determine if we should show the next spell coming up but we dont want to show spells with cooldowns more than 5 seconds, who cares about those
		--if (_cooldownLeft > 5) then
		--	ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." has a cooldown longer than 5 seconds",_getnextspell,_debugon)
		--	return false
		--end
		else
			--print("_cooldownLeft2="..tostring(_cooldownLeft))
			--ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." is on cooldown cooldownleft:".._cooldownLeft..":".._GCDleft,_getnextspell,_debugon)
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." is in cooldown",_getnextspell,_debugon)
			return false
		end
	end

	-- CHECK: Other Cooldown-----------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_checkothercd and _ActionDB.v_checkothercdname and _ActionDB.v_checkothercdname ~= "" and _ActionDB.v_checkothercdvalue and _ActionDB.v_checkothercdvalue ~= "") then
		if (not ROB_SpellPassesOtherCooldownCheck(_ActionDB.v_checkothercdname,_ActionDB.v_checkothercdvalue)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._ActionDB.v_spellname.." other cooldown check ".._ActionDB.v_checkothercdname.._ActionDB.v_checkothercdvalue.." failed",_getnextspell,_debugon)
			return false
		end
	end

	-- CHECK: Check interrupt casting-----------------------------------------------------------------------------------------------------------------------------
	_channeling, _, _, _, _, _ = UnitCastingInfo("player")
	if (not _channeling) then
		_channeling, _, _, _, _, _, _, _, _ = UnitChannelInfo("player")
	end
	if (_channeling and (not _getnextspell)) then
		if (_ActionDB.b_breakchanneling and ROB_UnitIsCasting("player", _ActionDB.v_breakchanneling)) then
		--dont return false because player is casting a spell allowed in the breachanneling list
		else
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._ActionDB.v_spellname.." player is casting: "..tostring(_channeling).." which is not found the spell list: "..tostring(_ActionDB.v_breakchanneling),_getnextspell,_debugon)
			return false
		end
	end


	-- CHECK: Check Moving-----------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_moving and GetUnitSpeed("player") == 0) then
		ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._ActionDB.v_spellname.." because player is not moving",_ready,_debugon)
		return false
	end
	if (not _ActionDB.b_moving and _castTime and _castTime > 0 and GetUnitSpeed("player") > 0) then

		ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._ActionDB.v_spellname.." because player can not cast "..tostring(_name).." while moving",_ready,_debugon)
		return false
	end
	-- CHECK: Not Moving-----------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_notmoving and GetUnitSpeed("player") > 0) then
		ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._ActionDB.v_spellname.." because player is moving",_ready,_debugon)
		return false
	end


	-- CHECK: Range-------------------------------------------------------------------------------------------
	if (_ActionDB.b_rangecheck and (not ROB_ActionInRange(_actionname,"target")) and (not _getnextspell)) then
		ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." has range checking turned on and is out of range of your target (make sure to uncheck range for self buffs)",_getnextspell,_debugon)
		return false
	end

	-- CHECK: Out of Range-------------------------------------------------------------------------------------------
	if (_ActionDB.b_oorspell and _ActionDB.v_oorspell ~=nil and _ActionDB.v_oorspell ~= "") then
		if (ROB_ActionInRange(_actionname, "target") and (not _getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." because target is in range of ".._ActionDB.v_oorspell,_getnextspell,_debugon)
			return false
		end
	end

	-- CHECK: Maximum sequential casts---------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_maxcasts and _ActionDB.v_maxcasts ~= nil and _ActionDB.v_maxcasts ~= "" and tonumber(_ActionDB.v_maxcasts) >= 0) then
		if (ROB_LAST_CASTED == _name and ROB_LAST_CASTED_COUNT >= tonumber(_ActionDB.v_maxcasts)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." has reached max cast count of ".._ActionDB.v_maxcasts,_getnextspell,_debugon)
			return false
		end
	end

	-- CHECK: Duration -----------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_duration and _ActionDB.v_durationstartedtime ~=nil and _ActionDB.v_duration ~= nil and _ActionDB.v_duration ~= "") then
		if (GetTime() - tonumber(_ActionDB.v_durationstartedtime) < tonumber(_ActionDB.v_duration)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." player already casted this spell before duration ".._ActionDB.v_duration.." has expired",_getnextspell,_debugon)
			return false
		end
	end

	-- CHECK: Need Buff-----------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_p_needbuff and _ActionDB.v_p_needbuff ~= nil and _ActionDB.v_p_needbuff ~= "") then
		if (ROB_UnitHasBuff(_ActionDB.v_p_needbuff, "player",_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." player had these buffs ".._ActionDB.v_p_needbuff,_getnextspell,_debugon)
			-- Dont allow _getnextspell bypassing because it causes next action to display actions that depend on buffs missing
			return false
		end
	end

	if (_ActionDB.b_t_needsbuff and _ActionDB.v_t_needsbuff ~= nil and _ActionDB.v_t_needsbuff ~= "") then
		if (ROB_UnitHasBuff(_ActionDB.v_t_needsbuff, "target",_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." target had these buffs ".._ActionDB.v_t_needsbuff,_getnextspell,_debugon)
			-- Dont allow _getnextspell bypassing because it causes next action to display actions that depend on buffs missing
			return false
		end
	end

	if (_ActionDB.b_pet_needsbuff and _ActionDB.v_pet_needsbuff ~= nil and _ActionDB.v_pet_needsbuff ~= "") then
		if (ROB_UnitHasBuff(_ActionDB.v_pet_needsbuff, "pet",_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." pet had these buffs ".._ActionDB.v_pet_needsbuff,_getnextspell,_debugon)
			-- Dont allow _getnextspell bypassing because it causes next action to display actions that depend on buffs missing
			return false
		end
	end

	if (_ActionDB.b_f_needsbuff and _ActionDB.v_f_needsbuff ~= nil and _ActionDB.v_f_needsbuff ~= "") then
		if (ROB_UnitHasBuff(_ActionDB.v_f_needsbuff, "focus",_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." focus had these buffs ".._ActionDB.v_f_needsbuff,_getnextspell,_debugon)
			-- Dont allow _getnextspell bypassing because it causes next action to display actions that depend on buffs missing
			return false
		end
	end

	-- CHECK: Have Buff-----------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_p_havebuff and _ActionDB.v_p_havebuff ~= nil and _ActionDB.v_p_havebuff ~= "") then
		if (not ROB_UnitHasBuff(_ActionDB.v_p_havebuff, "player",_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." player did not have these buffs ".._ActionDB.v_p_havebuff,_getnextspell,_debugon)
			-- dont allow _allowreturn bypassing because it causes next action to display actions that are depend on buffs procing
			return false
		end
	end
	if (_ActionDB.b_t_hasbuff and _ActionDB.v_t_hasbuff ~= nil and _ActionDB.v_t_hasbuff ~= "") then
		if (not ROB_UnitHasBuff(_ActionDB.v_t_hasbuff, "target",_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." target did not have these buffs ".._ActionDB.v_t_hasbuff,_getnextspell,_debugon)
			-- dont allow _allowreturn bypassing because it causes next action to display actions that are depend on buffs procing
			return false
		end
	end
	if (_ActionDB.b_pet_hasbuff and _ActionDB.v_pet_hasbuff ~= nil and _ActionDB.v_pet_hasbuff ~= "") then
		if (not ROB_UnitHasBuff(_ActionDB.v_pet_hasbuff, "pet",_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." pet did not have these buffs ".._ActionDB.v_pet_hasbuff,_getnextspell,_debugon)
			-- dont allow _allowreturn bypassing because it causes next action to display actions that are depend on buffs procing
			return false
		end
	end
	if (_ActionDB.b_f_hasbuff and _ActionDB.v_f_hasbuff ~= nil and _ActionDB.v_f_hasbuff ~= "") then
		if (not ROB_UnitHasBuff(_ActionDB.v_f_hasbuff, "focus",_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." focus did not have these buffs ".._ActionDB.v_f_hasbuff,_getnextspell,_debugon)
			-- dont allow _allowreturn bypassing because it causes next action to display actions that are depend on buffs procing
			return false
		end
	end
	-- CHECK: Needs Debuff-----------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_p_needdebuff and _ActionDB.v_p_needdebuff ~= nil and _ActionDB.v_p_needdebuff ~= "") then
		if (ROB_UnitHasDebuff(_ActionDB.v_p_needdebuff, "player",_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." player has one of these debuffs ".._ActionDB.v_p_needdebuff,_getnextspell,_debugon)
			-- dont allow _getnextspell bypassing because it causes next action to display actions that depend on needing a debuff
			return false
		end
	end
	if (_ActionDB.b_t_needsdebuff and _ActionDB.v_t_needsdebuff ~= nil and _ActionDB.v_t_needsdebuff ~= "") then
		if (ROB_UnitHasDebuff(_ActionDB.v_t_needsdebuff, "target",_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." target has one of these debuffs ".._ActionDB.v_t_needsdebuff,_getnextspell,_debugon)
			return false
		end
	end
	if (_ActionDB.b_pet_needsdebuff and _ActionDB.v_pet_needsdebuff ~= nil and _ActionDB.v_pet_needsdebuff ~= "") then
		if (ROB_UnitHasDebuff(_ActionDB.v_pet_needsdebuff, "pet",_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." pet has one of these debuffs ".._ActionDB.v_pet_needsdebuff,_getnextspell,_debugon)
			return false
		end
	end
	if (_ActionDB.b_f_needsdebuff and _ActionDB.v_f_needsdebuff ~= nil and _ActionDB.v_f_needsdebuff ~= "") then
		if (ROB_UnitHasDebuff(_ActionDB.v_f_needsdebuff, "focus",_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." focus has one of these debuffs ".._ActionDB.v_f_needsdebuff,_getnextspell,_debugon)
			return false
		end
	end
	-- CHECK: Have Debuff-----------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_p_havedebuff and _ActionDB.v_p_havedebuff ~= nil and _ActionDB.v_p_havedebuff ~= "") then
		if (not ROB_UnitHasDebuff(_ActionDB.v_p_havedebuff, "player",_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." player does not have one of these debuffs ".._ActionDB.v_p_havedebuff,_getnextspell,_debugon)
			-- dont allow _getnextspell bypassing because it causes next action to display actions that depend on having a debuff
			return false
		end
	end
	if (_ActionDB.b_t_hasdebuff and _ActionDB.v_t_hasdebuff ~= nil and _ActionDB.v_t_hasdebuff ~= "") then
		if (not ROB_UnitHasDebuff(_ActionDB.v_t_hasdebuff, "target",_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." target does not have one of these debuffs ".._ActionDB.v_t_hasdebuff,_getnextspell,_debugon)
			return false
		end
	end
	if (_ActionDB.b_pet_hasdebuff and _ActionDB.v_pet_hasdebuff ~= nil and _ActionDB.v_pet_hasdebuff ~= "") then
		if (not ROB_UnitHasDebuff(_ActionDB.v_pet_hasdebuff, "pet",_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." pet does not have one of these debuffs ".._ActionDB.v_pet_hasdebuff,_getnextspell,_debugon)
			return false
		end
	end
	if (_ActionDB.b_f_hasdebuff and _ActionDB.v_f_hasdebuff ~= nil and _ActionDB.v_f_hasdebuff ~= "") then
		if (not ROB_UnitHasDebuff(_ActionDB.v_f_hasdebuff, "focus",_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." focus does not have one of these debuffs ".._ActionDB.v_f_hasdebuff,_getnextspell,_debugon)
			return false
		end
	end
	-- CHECK: Life -----------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_p_hp and _ActionDB.v_p_hp ~= nil and _ActionDB.v_p_hp ~= "") then
		if (not ROB_UnitPassesLifeCheck(_ActionDB.v_p_hp,"player")) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." player did not pass life check ".._ActionDB.v_p_hp,_getnextspell,_debugon)
			return false
		end
	end
	if (_ActionDB.b_t_hp and _ActionDB.v_t_hp ~= nil and _ActionDB.v_t_hp ~= "") then
		if (not ROB_UnitPassesLifeCheck(_ActionDB.v_t_hp,"target")) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." target did not pass HP check ".._ActionDB.v_t_hp,_getnextspell,_debugon)
			return false
		end
	end

	if (_ActionDB.b_t_maxhp and _ActionDB.v_t_maxhp ~= nil and _ActionDB.v_t_maxhp ~= "") then
		if (not ROB_UnitPassesLifeCheck(_ActionDB.v_t_maxhp,"target",true)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." target did not pass maximum HP check ".._ActionDB.v_t_maxhp,_getnextspell,_debugon)
			return false
		end
	end

	if (_ActionDB.b_f_maxhp and _ActionDB.v_f_maxhp ~= nil and _ActionDB.v_f_maxhp ~= "") then
		if (not ROB_UnitPassesLifeCheck(_ActionDB.v_f_maxhp,"focus",true)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." focus did not pass maximum HP check ".._ActionDB.v_f_maxhp,_getnextspell,_debugon)
			return false
		end
	end

	if (_ActionDB.b_pet_hp and _ActionDB.v_pet_hp ~= nil and _ActionDB.v_pet_hp ~= "") then
		if (not ROB_UnitPassesLifeCheck(_ActionDB.v_pet_hp,"pet")) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." pet did not pass HP check ".._ActionDB.v_pet_hp,_getnextspell,_debugon)
			return false
		end
	end

	if (_ActionDB.b_f_hp and _ActionDB.v_f_hp ~= nil and _ActionDB.v_f_hp ~= "") then
		if (not ROB_UnitPassesLifeCheck(_ActionDB.v_f_hp,"focus")) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." focus did not pass HP check ".._ActionDB.v_f_hp,_getnextspell,_debugon)
			return false
		end
	end

	-- CHECK: Unitpower      -----------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_p_unitpower and _ActionDB.v_p_unitpowertype ~= nil and _ActionDB.v_p_unitpowertype ~= "") then
		if (not ROB_UnitPassesPowerCheck(_ActionDB.v_p_unitpower,"player",_ActionDB.v_p_unitpowertype,_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." player does not meet power requirement ".._ActionDB.v_p_unitpower.." of type ".._ActionDB.v_p_unitpowertype,_getnextspell,_debugon)
			return false
		end
	end

	-- CHECK: MOB Count   -----------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_mobcount and _ActionDB.v_mobcount ~= nil and _ActionDB.v_mobcount ~= "") then
		if (not ROB_MOBsInArea(_ActionDB.v_mobcount)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." MOB Count check failed. There are "..ROB_NUM_MOBS.." mobs in area, not ".._ActionDB.v_mobcount,_getnextspell,_debugon)
			return false
		end
	end

	-- CHECK: Last Casted    -----------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_lastcasted and _ActionDB.v_lastcasted ~= nil and _ActionDB.v_lastcasted ~= "") then
		if ((not _getnextspell) and ROB_LAST_CASTED ~= _ActionDB.v_lastcasted and ROB_LAST_CASTED and GetSpellInfo(ROB_LAST_CASTED) and GetSpellInfo(ROB_LAST_CASTED) ~= _ActionDB.v_lastcasted) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." lastcasted spell is not ".._ActionDB.v_lastcasted,_getnextspell,_debugon)
			return false
		end
		if (_getnextspell and ROB_CURRENT_ACTION and ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_spellname ~= _ActionDB.v_lastcasted) then
			--We failed to match the spell name to last casted try to match the getspellinfo spell id to last casted and if that fails then we dont match last casted
			if (_getnextspell and ROB_CURRENT_ACTION and GetSpellInfo(ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_spellname) and GetSpellInfo(ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_spellname) ~= _ActionDB.v_lastcasted) then
				return false
			end
		end
	end

	-- CHECK: Runes ----------------------------------------------------------------------------------------------------------------------------------------------------
	--Blood
	if (_ActionDB.b_p_bloodrunes and _ActionDB.v_p_bloodrunes ~= nil and _ActionDB.v_p_bloodrunes ~= "") then
		if (not ROB_UnitPassesRuneCheck(_ActionDB.v_p_bloodrunes,nil,nil,nil,_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." player did not meet blood rune requirement of ".._ActionDB.v_p_bloodrunes,_getnextspell,_debugon)
			return false
		end
	end
	--Frost
	if (_ActionDB.b_p_frostrunes and _ActionDB.v_p_frostrunes ~= nil and _ActionDB.v_p_frostrunes ~= "") then
		if (not ROB_UnitPassesRuneCheck(nil,_ActionDB.v_p_frostrunes,nil,nil,_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." player did not meet frost rune requirement of ".._ActionDB.v_p_frostrunes,_getnextspell,_debugon)
			return false
		end
	end
	--Unholy
	if (_ActionDB.b_p_unholyrunes and _ActionDB.v_p_unholyrunes ~= nil and _ActionDB.v_p_unholyrunes ~= "") then
		if (not ROB_UnitPassesRuneCheck(nil,nil,_ActionDB.v_p_unholyrunes,nil,_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." player did not meet unholy rune requirement of ".._ActionDB.v_p_unholyrunes,_getnextspell,_debugon)
			return false
		end
	end
	--Death
	if (_ActionDB.b_p_deathrunes and _ActionDB.v_p_deathrunes ~= nil and _ActionDB.v_p_deathrunes ~= "") then
		if (not ROB_UnitPassesRuneCheck(nil,nil,nil,_ActionDB.v_p_deathrunes,_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." player did not meet death rune requirement of ".._ActionDB.v_p_deathrunes,_getnextspell,_debugon)
			return false
		end
	end

	-- CHECK: Debuff types ----------------------------------------------------------------------------------------------------------------------------------------------------
	_checkmagic = _ActionDB.b_p_magic
	_checkpoison = _ActionDB.b_p_poison
	_checkdisease = _ActionDB.b_p_disease
	_checkcurse = _ActionDB.b_p_curse

	if (_checkmagic == true or _checkpoison == true or _checkdisease == true or _checkcurse == true) then
		if (not ROB_CheckForDebuffType("player",_checkmagic, _checkpoison, _checkdisease, _checkcurse)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." did not find any debuff types on player",_getnextspell,_debugon)
			return false
		end
	end

	-- CHECK: Target Interrupt ----------------------------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_t_interrupt and (ROB_UnitIsCasting("target", _ActionDB.v_t_interrupt)) == false) then
		ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." target is not casting a spell in the ".._ActionDB.v_t_interrupt.." list",_getnextspell,_debugon)
		return false
	end

	-- CHECK: Focus Casting ----------------------------------------------------------------------------------------------------------------------------------------------------
	--[[_focusCasting, _, _, _, _startTime, _endTime, _, _, _ = UnitCastingInfo("focus")
	if (not _focusCasting) then
	--target is not casting so see if target is channeling
	_focusCasting, _, _, _, _, _startTime, _endTime, _, _ = UnitChannelInfo("focus")
	end
	if (_focusCasting and _ActionDB.b_f_casting) then
	_timeLeft =  (_endTime/1000) - GetTime()
	if (not string.find(_ActionDB.v_f_castingname, _focusCasting)) then
	ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." focus is not casting the spell ".._ActionDB.v_f_castingname,_getnextspell,_debugon)
	return false
	end
	if (_timeLeft > _ActionDB.v_f_castingvalue) then
	ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." focus casting is not less than ".._ActionDB.v_f_castingvalue,_getnextspell,_debugon)
	return false
	end
	elseif (_focusCasting == nil and _ActionDB.b_f_casting) then
	--ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." focus is not casting anything",_getnextspell,_debugon)
	return false
	end--]]

	-- CHECK: Focus Interrupt ----------------------------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_f_interrupt and (ROB_UnitIsCasting("focus", _ActionDB.v_f_interrupt)) == false) then
		ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." focus is not casting a spell in the ".._ActionDB.v_f_interrupt.." list",_getnextspell,_debugon)
		return false
	end

	-- CHECK: Class ----------------------------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_t_class and _ActionDB.v_t_class ~= nil and _ActionDB.v_t_class ~= "" and UnitExists("target")) then
		if (not string.find(string.upper(_ActionDB.v_t_class), select(2, UnitClass("target")))) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." target class:"..select(2, UnitClass("target")).." is not one of these ".._ActionDB.v_t_class,_getnextspell,_debugon)
			return false
		end
	end

	if (_ActionDB.b_f_class and _ActionDB.v_f_class ~= nil and _ActionDB.v_f_class ~= "" and UnitExists("focus")) then
		if (not string.find(string.upper(_ActionDB.v_f_class), select(2, UnitClass("focus")))) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." focus class:"..select(2, UnitClass("focus")).." is not one of these ".._ActionDB.v_f_class,_getnextspell,_debugon)
			return false
		end
	end

	-- CHECK: Combo Points----------------------------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_p_combopoints and _ActionDB.v_p_combopoints ~= nil and _ActionDB.v_p_combopoints ~= "") then
		if (not ROB_PlayerHasComboPoints(_ActionDB.v_p_combopoints,_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." player does not have ".._ActionDB.v_p_combopoints.." combo points",_getnextspell,_debugon)
			return false
		end
	end

	-- CHECK: Eclipse Direction----------------------------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_p_eclipse and _ActionDB.v_p_eclipse ~= nil and _ActionDB.v_p_eclipse ~= "") then
		if (not ROB_EclipseDirection(_ActionDB.v_p_eclipse,_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." player eclipse is not heading towards ".._ActionDB.v_p_eclipse,_getnextspell,_debugon)
			return false
		end
	end

	-- CHECK: Check TotemActive ----------------------------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_p_firetotemactive and _ActionDB.v_p_firetotemactive ~= nil and _ActionDB.v_p_firetotemactive ~= "") then
		if (not ROB_TotemActive(_ActionDB.v_p_firetotemactive, 1,_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." Fire totem ".._ActionDB.v_p_firetotemactive.." is not active",_getnextspell,_debugon)
			return false
		end
	end
	if (_ActionDB.b_p_earthtotemactive and _ActionDB.v_p_earthtotemactive ~= nil and _ActionDB.v_p_earthtotemactive ~= "") then
		if (not ROB_TotemActive(_ActionDB.v_p_earthtotemactive, 2,_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." Earth totem ".._ActionDB.v_p_earthtotemactive.." is not active",_getnextspell,_debugon)
			return false
		end
	end
	if (_ActionDB.b_p_watertotemactive and _ActionDB.v_p_watertotemactive ~= nil and _ActionDB.v_p_watertotemactive ~= "") then
		if (not ROB_TotemActive(_ActionDB.v_p_watertotemactive, 3,_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." Water totem ".._ActionDB.v_p_watertotemactive.." is not active",_getnextspell,_debugon)
			return false
		end
	end
	if (_ActionDB.b_p_airtotemactive and _ActionDB.v_p_airtotemactive ~= nil and _ActionDB.v_p_airtotemactive ~= "") then
		if (not ROB_TotemActive(_ActionDB.v_p_airtotemactive, 4,_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." Air totem ".._ActionDB.v_p_airtotemactive.." is not active",_getnextspell,_debugon)
			return false
		end
	end

	-- CHECK: Check TotemInactive ----------------------------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_p_firetoteminactive and _ActionDB.v_p_firetoteminactive ~= nil and _ActionDB.v_p_firetoteminactive ~= "") then
		if (ROB_TotemActive(_ActionDB.v_p_firetoteminactive, 1,_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." Fire totem ".._ActionDB.v_p_firetoteminactive.." is active",_getnextspell,_debugon)
			return false
		end
	end
	if (_ActionDB.b_p_earthtoteminactive and _ActionDB.v_p_earthtoteminactive ~= nil and _ActionDB.v_p_earthtoteminactive ~= "") then
		if (ROB_TotemActive(_ActionDB.v_p_earthtoteminactive, 2,_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." Earth totem ".._ActionDB.v_p_earthtoteminactive.." is active",_getnextspell,_debugon)
			return false
		end
	end
	if (_ActionDB.b_p_watertoteminactive and _ActionDB.v_p_watertoteminactive ~= nil and _ActionDB.v_p_watertoteminactive ~= "") then
		if (ROB_TotemActive(_ActionDB.v_p_watertoteminactive, 3,_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." Water totem ".._ActionDB.v_p_watertoteminactive.." is active",_getnextspell,_debugon)
			return false
		end
	end
	if (_ActionDB.b_p_airtoteminactive and _ActionDB.v_p_airtoteminactive ~= nil and _ActionDB.v_p_airtoteminactive ~= "") then
		if (ROB_TotemActive(_ActionDB.v_p_airtoteminactive, 4,_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." Air totem ".._ActionDB.v_p_airtoteminactive.." is active",_getnextspell,_debugon)
			return false
		end
	end

	-- CHECK: Check TotemTimeleft ----------------------------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_p_firetotemtimeleft and _ActionDB.v_p_firetotemtimeleft ~= nil and _ActionDB.v_p_firetotemtimeleft ~= "") then
		if (not ROB_TotemTimeleft(_ActionDB.v_p_firetotemtimeleft, 1,_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." Fire totem timeleft is not ".._ActionDB.v_p_firetotemtimeleft,_getnextspell,_debugon)
			return false
		end
	end
	if (_ActionDB.b_p_earthtotemtimeleft and _ActionDB.v_p_earthtotemtimeleft ~= nil and _ActionDB.v_p_earthtotemtimeleft ~= "") then
		if (not ROB_TotemTimeleft(_ActionDB.v_p_earthtotemtimeleft, 2,_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." Earth totem timeleft is not ".._ActionDB.v_p_earthtotemtimeleft,_getnextspell,_debugon)
			return false
		end
	end
	if (_ActionDB.b_p_watertotemtimeleft and _ActionDB.v_p_watertotemtimeleft ~= nil and _ActionDB.v_p_watertotemtimeleft ~= "") then
		if (not ROB_TotemTimeleft(_ActionDB.v_p_watertotemtimeleft, 3,_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." Water totem timeleft is not ".._ActionDB.v_p_watertotemtimeleft,_getnextspell,_debugon)
			return false
		end
	end
	if (_ActionDB.b_p_airtotemtimeleft and _ActionDB.v_p_airtotemtimeleft ~= nil and _ActionDB.v_p_airtotemtimeleft ~= "") then
		if (not ROB_TotemTimeleft(_ActionDB.v_p_airtotemtimeleft, 4,_getnextspell)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." Air totem timeleft is not ".._ActionDB.v_p_airtotemtimeleft,_getnextspell,_debugon)
			return false
		end
	end

	-- CHECK: Check Player Controlled ----------------------------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_t_pc ) then
		if (not UnitPlayerControlled("target")) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." because target is not player controlled",_getnextspell,_debugon)
			return false
		end
	end

	if (_ActionDB.b_f_pc ) then
		if (not UnitPlayerControlled("focus")) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." because focus is not player controlled",_getnextspell,_debugon)
			return false
		end
	end

	-- CHECK: Check Duel Range ----------------------------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_t_dr ) then
		if (CheckInteractDistance("target", 3) == nil) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." because target is not in duel range",_getnextspell,_debugon)
			return false
		end
	end
	if (_ActionDB.b_pet_dr ) then
		if (CheckInteractDistance("pet", 3) == nil) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." because pet is not in duel range",_getnextspell,_debugon)
			return false
		end
	end
	if (_ActionDB.b_f_dr ) then
		if (CheckInteractDistance("focus", 3) == nil) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." because focus is not in duel range",_getnextspell,_debugon)
			return false
		end
	end
	if (_ActionDB.b_c_dr and _ActionDB.v_c_unitname and _ActionDB.v_c_unitname ~=nil and _ActionDB.v_c_unitname ~= "") then
		if (CheckInteractDistance(_ActionDB.v_c_unitname, 3) == nil) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." because "..tostring(_ActionDB.v_c_unitname).." is not in duel range",_getnextspell,_debugon)
			return false
		end
	end


	-- CHECK: Weapon Enchants ----------------------------------------------------------------------------------------------------------------------------------------------------
	--local hasMainHandEnchant, mainHandExpiration, mainHandCharges, hasOffHandEnchant, offHandExpiration, offHandCharges = GetWeaponEnchantInfo();
	if (_ActionDB.b_p_nmh and _ActionDB.v_p_nmh ~= nil and _ActionDB.v_p_nmh ~= "") then
		if (ROB_CheckForWeaponEnchant(16, _ActionDB.v_p_nmh)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." because player has ".._ActionDB.v_p_nmh.." on mainhand already",_getnextspell,_debugon)
			return false
		end
	end
	if (_ActionDB.b_p_noh and _ActionDB.v_p_noh ~= nil and _ActionDB.v_p_noh ~= "") then
		if (ROB_CheckForWeaponEnchant(17, _ActionDB.v_p_noh)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." because player has ".._ActionDB.v_p_noh.." on offhad already",_getnextspell,_debugon)
			return false
		end
	end

	-- CHECK: Stance ----------------------------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_p_stance and _ActionDB.v_p_stance ~= nil and _ActionDB.v_p_stance ~= "") then
		local _, _, _active, _ = GetShapeshiftFormInfo(GetShapeshiftForm());
		if (_active == 0 or (tonumber(GetShapeshiftForm()) ~= tonumber(_ActionDB.v_p_stance))) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." because player is not in the ".._ActionDB.v_p_stance.." stance",_getnextspell,_debugon)
			return false
		end
	end

	-- CHECK: Combat ----------------------------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_p_ooc and UnitAffectingCombat("player")) then
		ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." because player is in combat and you have out of combat checked",_getnextspell,_debugon)
		return false
	end
	if (_ActionDB.b_p_ic and not UnitAffectingCombat("player")) then
		ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." because player is out of combat and you have in combat checked",_getnextspell,_debugon)
		return false
	end


	-- CHECK: Check Pet Autocasting ----------------------------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.b_pet_isac and _ActionDB.v_pet_isac ~= nil and _ActionDB.v_pet_isac ~= "") then
		if (not ROB_PetIsAutocasting(_ActionDB.v_pet_isac)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." because pet is not autocasting ".._ActionDB.v_pet_isac,_getnextspell,_debugon)
			return false
		end
	end

	if (_ActionDB.b_pet_nac and _ActionDB.v_pet_nac ~= nil and _ActionDB.v_pet_nac ~= "") then
		if (ROB_PetIsAutocasting(_ActionDB.v_pet_nac)) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." because pet is autocasting ".._ActionDB.v_pet_nac,_getnextspell,_debugon)
			return false
		end
	end

	-- CHECK: Custom Unit ------------------------------------------------------------------------------------------------------------------------------------------------------------
	if (_ActionDB.v_c_unitname and _ActionDB.v_c_unitname ~=nil and _ActionDB.v_c_unitname ~= "") then
		if (UnitExists(_ActionDB.v_c_unitname)) then

		else
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." because custom unit "..tostring(_ActionDB.v_c_unitname).." does not exist",_getnextspell,_debugon)
			return false
		end
		if (_ActionDB.b_c_hp and _ActionDB.v_c_hp ~= nil and _ActionDB.v_c_hp ~= "") then
			if (not ROB_UnitPassesLifeCheck(_ActionDB.v_c_hp,_ActionDB.v_c_unitname)) then
				ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." ".._ActionDB.v_c_unitname.." did not pass HP check ".._ActionDB.v_c_hp,_getnextspell,_debugon)
				return false
			end
		end
		if (_ActionDB.b_c_maxhp and _ActionDB.v_c_maxhp ~= nil and _ActionDB.v_c_maxhp ~= "") then
			if (not ROB_UnitPassesLifeCheck(_ActionDB.v_c_maxhp,_ActionDB.v_c_unitname,true)) then
				ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." ".._ActionDB.v_c_unitname.." did not pass maximum HP check ".._ActionDB.v_c_maxhp,_getnextspell,_debugon)
				return false
			end
		end
		if (_ActionDB.b_c_needsbuff and _ActionDB.v_c_needsbuff ~= nil and _ActionDB.v_c_needsbuff ~= "") then
			if (ROB_UnitHasBuff(_ActionDB.v_c_needsbuff, _ActionDB.v_c_unitname,_getnextspell)) then
				ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." ".._ActionDB.v_c_unitname.." had these buffs ".._ActionDB.v_c_needsbuff,_getnextspell,_debugon)
				-- Dont allow _getnextspell bypassing because it causes next action to display actions that depend on buffs missing
				return false
			end
		end
		if (_ActionDB.b_c_hasbuff and _ActionDB.v_c_hasbuff ~= nil and _ActionDB.v_c_hasbuff ~= "") then
			if (not ROB_UnitHasBuff(_ActionDB.v_c_hasbuff, _ActionDB.v_c_unitname,_getnextspell)) then
				ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." ".._ActionDB.v_c_unitname.." did not have these buffs ".._ActionDB.v_c_hasbuff,_getnextspell,_debugon)
				-- dont allow _allowreturn bypassing because it causes next action to display actions that are depend on buffs procing
				return false
			end
		end
		if (_ActionDB.b_c_needsdebuff and _ActionDB.v_c_needsdebuff ~= nil and _ActionDB.v_c_needsdebuff ~= "") then
			if (ROB_UnitHasDebuff(_ActionDB.v_c_needsdebuff, _ActionDB.v_c_unitname,_getnextspell)) then
				ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." ".._ActionDB.v_c_unitname.." has one of these debuffs ".._ActionDB.v_c_needsdebuff,_getnextspell,_debugon)
				return false
			end
		end
		if (_ActionDB.b_c_hasdebuff and _ActionDB.v_c_hasdebuff ~= nil and _ActionDB.v_c_hasdebuff ~= "") then
			if (not ROB_UnitHasDebuff(_ActionDB.v_c_hasdebuff, _ActionDB.v_c_unitname,_getnextspell)) then
				ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." ".._ActionDB.v_c_unitname.." does not have one of these debuffs ".._ActionDB.v_c_hasdebuff,_getnextspell,_debugon)
				return false
			end
		end
		if (_ActionDB.b_c_class and _ActionDB.v_c_class ~= nil and _ActionDB.v_c_class ~= "") then
			if (not string.find(string.upper(_ActionDB.v_c_class), select(2, UnitClass(_ActionDB.v_c_unitname)))) then
				ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." ".._ActionDB.v_c_unitname.." class:"..select(2, UnitClass(_ActionDB.v_c_unitname)).." is not one of these ".._ActionDB.v_c_class,_getnextspell,_debugon)
				return false
			end
		end
		if (_ActionDB.b_c_interrupt and (ROB_UnitIsCasting(_ActionDB.v_c_unitname, _ActionDB.v_c_interrupt)) == false) then
			ROB_Debug1(ROB_UI_DEBUG_E1.._actionname.." S:".._spellname.." ".._ActionDB.v_c_unitname.." is not casting a spell in the ".._ActionDB.v_c_interrupt.." list",_getnextspell,_debugon)
			return false
		end
	end


	return _ready
end

-- TODO PEL : Analyse this code section to ensure that it is the starting point of the action to display as the current one to push.
function ROB_GetCurrentAction()
	local _foundReadyAction = false
	local _foundReadyActionName = nil
	local _foundReadyActionCD = nil
	local _foundReadyActionTimeleft = 86400

	--ROB_Debug1("ROB_GetCurrentAction",false,true)
	--if (ROB_SelectedRotationName and ROB_Rotations[ROB_SelectedRotationName] ~= nil and ROB_Rotations[ROB_SelectedRotationName].SortedActions ~= nil) then
	--First get the next ready action name
	for _, _CurrentActionName in pairs(ROB_Rotations[ROB_SelectedRotationName].SortedActions) do
		--ROB_Debug1("Checking if ".._CurrentActionName.." is ready",false,ROB_Rotations[ROB_SelectedRotationName].ActionList[_CurrentActionName].b_debug)
		if (ROB_SpellReady(_CurrentActionName,false) and (not _foundReadyAction)) then
			ROB_Debug1("Action:".._CurrentActionName.." is ready",false,ROB_Rotations[ROB_SelectedRotationName].ActionList[_CurrentActionName].b_debug)
			_foundReadyAction = true
			_foundReadyActionName = _CurrentActionName
			_foundReadyActionCD = ROB_ACTION_CD
		elseif (_foundReadyAction) then
			ROB_Debug1("Action:".._CurrentActionName.." is not showing because it is waiting for ready Action:".._foundReadyActionName.." to be cast",false,ROB_Rotations[ROB_SelectedRotationName].ActionList[_CurrentActionName].b_debug)
		end
	end

	ROB_SetCurrentActionTexture(_foundReadyActionName)
	ROB_SetCurrentActionTint(_foundReadyActionName)
	ROB_SetCurrentActionLabel(_foundReadyActionName)


	if (_foundReadyAction) then
		if (_foundReadyActionName ~= ROB_CURRENT_ACTION) then
			ROB_CURRENT_ACTION = _foundReadyActionName
			--		ROB_SetActionCooldown("ROB_CurrentActionButtonCooldown", _foundReadyActionCD)
			--else
			--If we have to cast the same spell twice in a row then we need to update the GCD on the spell
			--ROB_SetActionCooldown("ROB_CurrentActionButtonCooldown", _foundReadyActionCD)
		end
		ROB_SetActionCooldown("ROB_CurrentActionButtonCooldown", _foundReadyActionCD)
	else
		ROB_CURRENT_ACTION = nil
		ROB_SetActionCooldown("ROB_CurrentActionButtonCooldown", nil)
	end
end

-- TODO PEL : Analyse this code section to ensure that it is the method which calculate the next action to do.
function ROB_GetNextAction()
	local _foundReadyAction = false
	local _foundReadyActionName = nil
	local _foundReadyActionCD = nil
	local _foundReadyActionTimeleft = 86400

	--ROB_Debug1("ROB_GetNextAction",false,true)
	--if (ROB_SelectedRotationName and ROB_Rotations[ROB_SelectedRotationName] ~= nil and ROB_Rotations[ROB_SelectedRotationName].SortedActions ~= nil) then
	--First get the next ready action name
	for _, _NextActionName in pairs(ROB_Rotations[ROB_SelectedRotationName].SortedActions) do
		--ROB_Debug1("Checking if ".._NextActionName.." is the next ready action",false,true)
		-- Logic to verify the next action spell name does not match the current action spell name
		local _SpellName1 = nil
		local _SpellName2 = nil
		local _SpellsAreDifferent = true
		if (ROB_CURRENT_ACTION and ROB_SelectedRotationName) then _SpellName1 = ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_spellname end
		if (_NextActionName and ROB_SelectedRotationName) then _SpellName2 = ROB_Rotations[ROB_SelectedRotationName].ActionList[_NextActionName].v_spellname end
		if (_SpellName1 ~= nil and _SpellName2 ~= nil and ROB_SpellsMatch(_SpellName1, _SpellName2)) then _SpellsAreDifferent = false end

		--Dont pick next actions that have the same aciton name or spell name as the current action
		if (ROB_SpellReady(_NextActionName, true) and (_NextActionName ~= ROB_CURRENT_ACTION) and _SpellsAreDifferent) then
			--ROB_Debug1("Action:".._NextActionName.." was ready but checking <.5",false,true)
			--Check to make sure this cooldown is less than .5 seconds more than previous next action before setting it to prevent the multiple spell spinning in next action
			--if (ROB_Rotations[ROB_SelectedRotationName].ActionList[_NextActionName].v_spellname and ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_spellname and ROB_ACTION_TIMELEFT < _foundReadyActionTimeleft and ((_foundReadyActionTimeleft - ROB_ACTION_CD) > .5) and (ROB_Rotations[ROB_SelectedRotationName].ActionList[ROB_CURRENT_ACTION].v_spellname ~= ROB_Rotations[ROB_SelectedRotationName].ActionList[_NextActionName].v_spellname)) then
			if (ROB_Rotations[ROB_SelectedRotationName].ActionList[_NextActionName].v_spellname and ROB_ACTION_TIMELEFT < _foundReadyActionTimeleft and ((_foundReadyActionTimeleft - ROB_ACTION_CD) > .5)) then
				--ROB_Debug1("Action:".._NextActionName.." is < .5 and is ready",false,true)
				_foundReadyAction = true
				_foundReadyActionName = _NextActionName
				_foundReadyActionTimeleft = ROB_ACTION_TIMELEFT
				_foundReadyActionCD = ROB_ACTION_CD
				--print("_NextActionName=".._NextActionName)
				--print("ROB_ACTION_TIMELEFT="..ROB_ACTION_TIMELEFT)
				--print("_foundReadyActionCD=".._foundReadyActionCD)
			end
		else
			--ROB_Debug1(_NextActionName.." was not next ready action",false,ROB_Rotations[ROB_SelectedRotationName].ActionList[_NextActionName].b_debug)
			if (_foundReadyAction) then
			--ROB_Debug1("Action:".._NextActionName.." is not showing as next ready action because Action:".._foundReadyActionName.." is higher priority",false,ROB_Rotations[ROB_SelectedRotationName].ActionList[_NextActionName].b_debug)
			end
		end
	end
	--end

	ROB_SetNextActionTexture(_foundReadyActionName)
	ROB_SetNextActionTint(_foundReadyActionName)
	ROB_SetNextActionLabel(_foundReadyActionName)
	--ROB_SetActionCooldown("ROB_NextActionButtonCooldown", _foundReadyActionCD)

	--if (_foundReadyAction and _foundReadyActionName ~= ROB_NEXT_ACTION) then
	--print("setting next action cooldown to ".._foundReadyActionCD)
	--need to find a way to clear next action cooldown because this is only set when we find a next action the first time

	--ROB_SetActionCooldown("ROB_NextActionButtonCooldown", _foundReadyActionCD)
	--ROB_NEXT_ACTION = _foundReadyActionName
	if (_foundReadyAction) then
		if (_foundReadyActionName ~= ROB_NEXT_ACTION) then
			ROB_NEXT_ACTION = _foundReadyActionName
		end
		ROB_SetActionCooldown("ROB_NextActionButtonCooldown", _foundReadyActionCD)
	else
		ROB_SetActionCooldown("ROB_NextActionButtonCooldown", nil)
	end
end

function ROB_OnUpdate(self, elapsed)
	self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
	while (self.TimeSinceLastUpdate > ROB_UPDATE_INTERVAL) do
		if (ROB_SelectedRotationName and ROB_Rotations[ROB_SelectedRotationName] ~= nil and ROB_Rotations[ROB_SelectedRotationName].SortedActions ~= nil) then
			--=============================================================================================================================
			--=============================================================================================================================
			--Get the first spell that is ready and set the texture
			--=============================================================================================================================
			--=============================================================================================================================
			ROB_GetCurrentAction()
			--=============================================================================================================================
			--=============================================================================================================================
			--Now get the next ready action
			--=============================================================================================================================
			--=============================================================================================================================
			ROB_GetNextAction()
			
			--[[TODO Tylor : Should remove button when no actions so that the warrior heroic leap doesn't appear anymore
			if ROB_CURRENT_ACTION == nil then
				ROB_CurrentActionButton:Hide()
			end
			if ROB_NEXT_ACTION == nil then
				ROB_NextActionButton:Hide()
			end
			Tylor END--]]
		else
			--No rotation selected so hide both icon frames
			ROB_CurrentActionButton:Hide()
			ROB_NextActionButton:Hide()
		end

		if (ROB_TOGGLE_1 == 1 ) then
			ROB_RotationToggle1Button:Show()
		else
			ROB_RotationToggle1Button:Hide()
		end
		if (ROB_TOGGLE_2 == 1 ) then
			ROB_RotationToggle2Button:Show()
		else
			ROB_RotationToggle2Button:Hide()
		end
		if (ROB_TOGGLE_3 == 1 ) then
			ROB_RotationToggle3Button:Show()
		else
			ROB_RotationToggle3Button:Hide()
		end
		if (ROB_TOGGLE_4 == 1 ) then
			ROB_RotationToggle4Button:Show()
		else
			ROB_RotationToggle4Button:Hide()
		end

		--Update the AoE unit count
		ROB_CheckLocalUnits()

		ROB_DebugOnUpdate()
		self.TimeSinceLastUpdate = self.TimeSinceLastUpdate - ROB_UPDATE_INTERVAL
	end
end

function ROB_Debug1(msg,validate,spellhasdebug)
	if (validate ~= nil and validate == true) then
		return
	end
	if (spellhasdebug == nil or spellhasdebug == false) then
		return
	end
	if (ROB_ROTATION_STATE == 0) then
		return
	end
	if (tostring(msg) ~= tostring(ROB_LAST_DEBUG_MSG)) then
		--print(ROB_UI_DEBUG_PREFIX..GetTime()..":"..msg)
		print(ROB_UI_DEBUG_PREFIX..":"..msg)
		ROB_LAST_DEBUG = GetTime()
		ROB_LAST_DEBUG_MSG = msg
	end
end
