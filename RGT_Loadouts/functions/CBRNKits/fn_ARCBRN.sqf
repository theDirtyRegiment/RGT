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
	"rhs_weap_m249", 0.90, 
	"rhs_weap_m249_light_S", 0.05] call BIS_fnc_selectRandomWeighted;
_optic = [
	"rhsusf_acc_eotech_552", 0.70, 
	"rhsusf_acc_compm4", 0.25] call BIS_fnc_selectRandomWeighted;
_vest = [
	"milgp_v_jpc_hgunner_belt_rgr", 
	"milgp_v_marciras_hgunner_rgr", 
	"milgp_v_marciras_hgunner_belt_rgr",
	"milgp_v_mmac_hgunner_belt_rgr"] call BIS_fnc_selectRandom;
_bag = [
	"USP_REEBOW_3DAP_MCT", 
	"USP_REEBOW_3DAP_ACC1_MCT", 
	"USP_REEBOW_3DAP_ACC7_MCT"] call BIS_fnc_selectRandom;
_mag = [
	"rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote", 
	"rhsusf_200Rnd_556x45_mixed_soft_pouch", 
	"rhsusf_200Rnd_556x45_mixed_soft_pouch_ucp"] call BIS_fnc_selectRandom;
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
switch(_rifle) do {
	case "rhs_weap_m249_light_S": {
		player addPrimaryWeaponItem "rhsusf_acc_elcan_ard";
		player addPrimaryWeaponItem "rhsusf_acc_m952v";
	};
	default {
		player addPrimaryWeaponItem "rhsusf_acc_saw_bipod";
	};
};
player addWeapon "rhsusf_weap_m9";

comment "Fill Uniform and Gear";
player addItem "ACE_morphine";
for "_i" from 1 to 5 do {player addItem "ACE_fieldDressing";};
for "_i" from 1 to 3 do {player addItem "ACE_tourniquet";};
for "_i" from 1 to 3 do {player addItem "ACE_CableTie";};
for "_i" from 1 to 2 do {player addItem "HandGrenade";};
for "_i" from 1 to 2 do {player addItem "SmokeShell";};
player addItem "ACE_EntrenchingTool";
for "_i" from 1 to 3 do {player addItem "rhsusf_mag_15Rnd_9x19_JHP";};
for "_i" from 1 to 3 do {player addItem _mag;};
player addItem "ACE_EarPlugs";
player addItem "ACE_Flashlight_MX991";
player addItem "ACE_MapTools";
player addItem "B_IR_Grenade";
player addItem "Chemlight_green";
player addItem "ACE_Chemlight_IR";
player addItem "Chemlight_red";
player addItem "ACE_microDAGR";

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

hint "You're now equipped as a CBRN autorifleman. \nYour heavy weaponry, combined with CBRN protection, allows you to deliver suppressive fire while staying shielded from chemical, biological, radiological, and nuclear threats.";