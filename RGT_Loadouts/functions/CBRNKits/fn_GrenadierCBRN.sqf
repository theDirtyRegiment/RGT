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
	"arifle_Mk20_GL_plain_F", 0.50, 
	"arifle_Mk20_GL_F", 0.50, 	
	"arifle_TRG21_GL_F", 0.25] call BIS_fnc_selectRandomWeighted;
_rail = [
	"rhsusf_acc_M952V", 
	"acc_flashlight", 
	"rhsusf_acc_wmx", 
	"rhsusf_acc_wmx_bk"] call BIS_fnc_selectRandom;
_optic = [
	"rhsusf_acc_eotech_552", 0.70, 
	"rhsusf_acc_compm4", 0.25, 
	"rhsusf_acc_su230", 0.05] call BIS_fnc_selectRandomWeighted;
_vest = [
	"milgp_v_jpc_Grenadier_belt_rgr", 0.70, 
	"milgp_v_marciras_grenadier_belt_rgr", 0.20, 
	"milgp_v_mmac_grenadier_belt_rgr", 0.05] call BIS_fnc_selectRandomWeighted;
_bag = [
	"USP_REEBOW_3DAP_MCT", 
	"USP_REEBOW_3DAP_ACC5_MCT", 
	"USP_REEBOW_3DAP_RGR", 
	"USP_REEBOW_3DAP_ACC5_RGR"] call BIS_fnc_selectRandom;
_ammo = [
	"rhs_mag_30Rnd_556x45_M855A1_EPM_Pull", 
	"rhs_mag_30Rnd_556x45_M855A1_EPM_Ranger", 
	"rhs_mag_30Rnd_556x45_M855A1_EPM", 
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull", 
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Ranger", 
	"rhs_mag_30Rnd_556x45_M855A1_Stanag"] call BIS_fnc_selectRandom;
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
player addPrimaryWeaponItem _rail;
player addPrimaryWeaponItem _optic;

comment "Fill Uniform and Gear";
player addItem "ACE_morphine";
for "_i" from 1 to 5 do {player addItem "ACE_fieldDressing";};
for "_i" from 1 to 3 do {player addItem "ACE_tourniquet";};
player addItem "ACE_EarPlugs";
player addItem "ACE_Flashlight_MX991";
player addItem "ACE_MapTools";
player addItem "ACE_microDAGR";
player addItem "B_IR_Grenade";
player addItem "Chemlight_green";
player addItem "ACE_Chemlight_IR";
player addItem "Chemlight_red";
player addItem "ACE_EntrenchingTool";
for "_i" from 1 to 2 do {player addItem "SmokeShell";};
for "_i" from 1 to 2 do {player addItem "HandGrenade";};
for "_i" from 1 to 8 do {player addItem "rhs_mag_M441_HE";};
player addItem "rhs_mag_m713_Red";
for "_i" from 1 to 2 do {player addItem "rhs_mag_m714_White";};
player addItem "rhs_mag_m715_Green";
player addItem "UGL_FlareWhite_F";
for "_i" from 1 to 2 do {player addItem "ACE_HuntIR_M203";};
for "_i" from 1 to 8 do {player addItem _ammo;};
player addItem "ACE_HuntIR_monitor";
player addItem "ACE_CableTie";

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

hint "You're now equipped as a CBRN Grenadier. \nWith your 40mm UGL you can provide immediate light indirect fire support while staying protected from the dangers of a contaminated battlefield.";