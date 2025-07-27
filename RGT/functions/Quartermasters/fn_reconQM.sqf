_this addAction['Get Scout Loadout',RGT_fnc_ScoutRecon,nil,1.5,true,true,"","((_target distance _this)<5)"]; 
_this addAction['Get Autorifleman Loadout',RGT_fnc_ARRecon,nil,1.5,true,true,"","((_target distance _this)<5)"]; 
_this addAction['Get CLS Loadout',RGT_fnc_CLSRecon,nil,1.5,true,true,"","((_target distance _this)<5)"]; 
_this addAction['Get Leader Loadout',RGT_fnc_LeaderRecon,nil,1.5,true,true,"","((_target distance _this)<5)"]; 
_this addAction["<t color='#2C75FF'>Add Parachute", RGT_fnc_Parachute,nil,1.5,true,true,"","((_target distance _this)<5)"];
_this addAction["<t color='#FF2B2B'>Camouflage", "createDialog 'SpecOpsLoadoutUI'",nil,1.5,true,true,"","((_target distance _this)<5)"];