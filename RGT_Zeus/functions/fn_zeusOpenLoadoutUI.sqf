// fn_openLoadoutDialog.sqf
params ["_logic", "_targets", "_activated"];
if (!_activated) exitWith {};

RGT_QM_Targets = _targets; // Make targets globally accessible

[] execVM "functions\fn_zeusShowQMSelectionUI.sqf";