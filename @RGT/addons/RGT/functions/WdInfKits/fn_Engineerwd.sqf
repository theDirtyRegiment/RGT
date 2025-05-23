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
	"rhs_weap_g36kv", 0.60, 
	"rhs_weap_g36c", 0.30, 
	"rhs_weap_vhsd2", 0.10] call BIS_fnc_selectRandomWeighted;
_rail = [
	"rhsusf_acc_M952V", 
	"acc_flashlight", 
	"rhsusf_acc_wmx", 
	"rhsusf_acc_wmx_bk"] call BIS_fnc_selectRandom;
_optic = [
	"rhsusf_acc_eotech_552", 0.70, 
	"rhsusf_acc_compm4", 0.25, 
	"rhsusf_acc_ACOG_RMR", 0.05] call BIS_fnc_selectRandomWeighted;
_uniform = [
	"rhs_uniform_g3_m81", 
	"rhs_uniform_bdu_erdl", 
	"USP_PCU_G3C_MCT_M81", 
	"USP_G3C_M81", 
	"USP_G3C_CU_TSW", 
	"USP_G3C_CU_KP_M81", 
	"USP_G3C_CU_KP_MX_M81", 
	"USP_G3C_CU_KP_OR_TSW", 
	"USP_G3C_CU_MX_M81", 
	"USP_G3C_CU_OR_M81", 
	"USP_G3C_KP_TSW"] call BIS_fnc_selectRandom;
_bag = [
	"TRYK_B_BAF_BAG_rgr", 
	"USP_PATROL_PACK_RGR"] call BIS_fnc_selectRandom;
_helmet = [
	"rhsusf_ach_helmet_M81", 
	"rhsusf_ach_bare_wood", 
	"rhsusf_ach_bare_wood_ess", 
	"rhsusf_ach_bare_wood_headset", 
	"rhsusf_ach_bare_wood_headset_ess", 
	"rhsusf_ach_bare"] call BIS_fnc_selectRandom;

comment "Add Weapons and attachments";
player addWeapon _rifle;
player addPrimaryWeaponItem _rail;
player addPrimaryWeaponItem _optic;

comment "Add Uniforms and Gear";
player forceAddUniform _uniform;
player addVest "rhsusf_iotv_ocp_Repair";
player addBackpack _bag;
player addHeadgear _helmet;

comment "Fill Uniform and Gear";
player addItem "ACE_EarPlugs";
player addItem "ACE_morphine";
for "_i" from 1 to 5 do {player addItem "ACE_fieldDressing";};
for "_i" from 1 to 3 do {player addItem "ACE_tourniquet";};
player addItem "ACE_MapTools";
player addItem "ACE_Flashlight_MX991";
player addItem "ACE_microDAGR";
player addItem "SmokeShell";
player addItem "HandGrenade";
player addItem "SmokeShellRed";;
player addItem "ACE_EntrenchingTool";
for "_i" from 1 to 7 do {player addItem "rhssaf_30rnd_556x45_EPR_G36";};
player addItem "ACE_Clacker";
player addItem "APERSMineDispenser_Mag";
player addItem "DemoCharge_Remote_Mag";
player addItem "SatchelCharge_Remote_Mag";
for "_i" from 1 to 2 do {player addItem "SLAMDirectionalMine_Wire_Mag";};

comment "Add final Gear";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "TFAR_anprc152";
player linkItem "ItemGPS";
player linkItem "USP_PVS14";
player setSpeaker "ACE_NoVoice";

comment "Set G Force resistance and Medical + Engineer training";
player setVariable ["ACE_GForceCoef", 1];

[[player],"ace_medical_medicClass", 0, true] call ace_common_fnc_assignObjectsInList;
[[player],"ACE_IsEngineer", 1, true] call ace_common_fnc_assignObjectsInList;

hint "You're now equipped as a combat engineer. \nNeed something blown up? Great! \nYou're equipped with a variety of explosives.";