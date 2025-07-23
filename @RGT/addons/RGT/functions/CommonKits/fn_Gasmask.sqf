removeGoggles player;
_goggles = [
	"MK503",
	"MK50",
	"MK502",
	"G_CBRN_A",
	"G_CBRN_B",
	"G_CBRN_M04",
	"G_CBRN_M50"] call BIS_fnc_selectRandom;
_oldInventory = uniformItems player;
if (isNil "_oldInventory") then {
    _oldInventory = [];
};

player forceAddUniform "CBRN_Expansion_Olive";
{ 
    player addItem _x;
} forEach _oldInventory;
player addGoggles _goggles;

if(backpack player in ["TRYK_B_Medbag_BK","USP_DELTA_BAG_BLK","USP_DELTA_BAG_MCB"]) then {
    comment "Add CLS CBRN Gear";
    for "_i" from 1 to 10 do {player addItemToBackpack "ACE_ATNAA_AntidoteInjector";};
    for "_i" from 1 to 5 do {player addItemToBackpack "CBRN_gasmaskFilter";};
    for "_i" from 1 to 5 do {player addItemToBackpack "CBRN_DuctTape";};
    player addItemToBackpack "CBRN_sealant";
} else {
    comment "Add CBRN Gear";
    player addItem "ACE_ATNAA_AntidoteInjector";
    player addItem "CBRN_gasmaskFilter";
    player addItem "CBRN_DuctTape";
    player addItem "CBRN_sealant";
};

