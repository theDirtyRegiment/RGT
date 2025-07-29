comment "Remove gear before applying loadouts";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;

comment "Create the arrays for different equipment";
_rifle = [
	"rhs_weap_m14ebrri", 
	"rhs_weap_mk17_LB", 
	"srifle_DMR_06_camo_F", 
	"rhs_weap_sr25_d", 
	"rhs_weap_sr25", 
	"rhs_weap_m14_rail",  
	"rhs_weap_m14_rail_d", 
	"rhs_weap_m14_rail_fiberglass",
	"rhs_weap_m14_rail_wd"] call BIS_fnc_selectRandom;
_vest = [
	"milgp_v_marciras_marksman_RGR", 
	"milgp_v_marciras_marksman_belt_rgr"] call BIS_fnc_selectRandom;
_bag = [
	"USP_REEBOW_3DAP_MCT", 
	"USP_REEBOW_3DAP_ACC5_MCT", 
	"USP_REEBOW_3DAP_RGR", 
	"USP_REEBOW_3DAP_ACC5_RGR"] call BIS_fnc_selectRandom;
_helmet = [
	"USP_OPSCORE_FASTMTC_M81_MT", 
	"USP_OPSCORE_FASTMTC_M81_MTW", 
	"USP_OPSCORE_FASTMTC_M81_MW", 
	"USP_OPSCORE_FASTMTC_MCT_MSW",
	"USP_OPSCORE_FASTMTC_MCT_S",
	"USP_OPSCORE_FASTMTC_MCT_T"] call BIS_fnc_selectRandom;
_goggles = [
	"MK503",
	"MK50",
	"MK502",
	"G_CBRN_A",
	"G_CBRN_B",
	"G_CBRN_M04",
	"G_CBRN_M50"] call BIS_fnc_selectRandom;
_nods = [
	"USP_PVS14",
	"USP_PVS14_TAR",
	"USP_PVS31_WP_BLK"] call BIS_fnc_selectRandom;

comment "Add Uniforms and Gear";
player forceAddUniform "CBRN_Expansion_Olive";
player addVest _vest;
player addBackpack _bag;
player addHeadgear _helmet;
player addGoggles _goggles;


comment "Add Weapons and attachments";
player addWeapon _rifle;
player addPrimaryWeaponItem "optic_MRCO";
if (_rifle isEqualTo "rhs_weap_mk17_LB") then { 
	player addPrimaryWeaponItem "rhsusf_acc_anpeq15_wmx_sc";
}	else	{
	player addPrimaryWeaponItem "rhsusf_acc_anpeq15side";
};
player addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
player addPrimaryWeaponItem "rhsusf_acc_m14_bipod";
player addWeapon "rhsusf_weap_glock17g4";

comment "Fill Uniform and Gear";
player addItem "ACE_morphine";
for "_i" from 1 to 5 do {player addItem "ACE_fieldDressing";};
for "_i" from 1 to 3 do {player addItem "ACE_tourniquet";};
player addItem "ACE_CableTie";
player addItem "ACE_EarPlugs";
player addItem "ACE_Flashlight_MX991";
player addItem "ACE_MapTools";
player addItem "B_IR_Grenade";
player addItem "Chemlight_green";
player addItem "ACE_Chemlight_IR";
player addItem "Chemlight_red";
for "_i" from 1 to 3 do {player addItem "rhsusf_mag_17Rnd_9x19_FMJ";};
player addItem "ACE_microDAGR";
for "_i" from 1 to 2 do {player addItem "HandGrenade";};
player addItem "ACE_EntrenchingTool";
for "_i" from 1 to 2 do {player addItem "SmokeShell";};
player addItem "SmokeShellBlue";
switch (_rifle) do {
	case "rhs_weap_sr25_d": {
		for "_i" from 1 to 4 do {player addItem "rhsusf_20Rnd_762x51_SR25_m118_special_Mag";};
		for "_i" from 1 to 3 do {player addItem "rhsusf_20Rnd_762x51_SR25_m993_Mag";};
	};
	case "rhs_weap_sr25": {
		for "_i" from 1 to 4 do {player addItem "rhsusf_20Rnd_762x51_SR25_m118_special_Mag";};
		for "_i" from 1 to 3 do {player addItem "rhsusf_20Rnd_762x51_SR25_m993_Mag";};
	};
	case "rhs_weap_mk17_LB": {
		for "_i" from 1 to 4 do {player addItem "rhs_mag_20Rnd_SCAR_762x51_mk316_special";};
		for "_i" from 1 to 3 do {player addItem "rhs_mag_20Rnd_SCAR_762x51_m61_ap";};
	};
	default {
		for "_i" from 1 to 4 do {player addItem "ACE_20Rnd_762x51_M118LR_Mag";};
		for "_i" from 1 to 3 do {player addItem "ACE_20Rnd_762x51_M993_AP_Mag";};
	};
};

comment "Add CBRN Gear";
player addItem "ACE_ATNAA_AntidoteInjector";
player addItem "CBRN_gasmaskFilter";
player addItem "CBRN_DuctTape";
player addItem "CBRN_sealant";

comment "Add final Gear";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "TFAR_microdagr";
player linkItem "TFAR_anprc152";
player linkItem "ItemGPS";
player linkItem _nods;
player setSpeaker "ACE_NoVoice";

comment "Set G Force resistance and Medical + Engineer training";
player setVariable ["ACE_GForceCoef", 1];

[[player],"ace_medical_medicClass", 0, true] call ace_common_fnc_assignObjectsInList;
[[player],"ACE_IsEngineer", 0, true] call ace_common_fnc_assignObjectsInList;

hint "You're now equipped as an CBRN marksman. \nYour equipment is optimized for daylight medium-range precision engagements";
