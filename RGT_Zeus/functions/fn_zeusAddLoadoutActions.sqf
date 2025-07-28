// fn_openLoadoutDialog.sqf

private _logic = _this select 0;
private _targets = _this select 1;
private _activated = _this select 2;

if (!_activated) exitWith {};

// Define list of QM types
private _qmTypes = [
    "arcticQM", "cbrnQM", "chQM", "civQM", "cwQM", "cwM16QM", "divingQM",
    "guerQM", "indigQM", "infQM", "pmcQM", "reconQM", "rusQM", "sniperQM",
    "sofQM", "spetsnazQM", "ucQM", "wdQM"
];

// Create a variable to hold selected index
private _selectedIndex = 0;

// Show dialog code (simplified, use your own UI or hint for prototype)
_hint = format ["Select QM type by index (0-%1):", count _qmTypes - 1];
systemChat _hint;

// Wait for selection from Zeus user (this is just a placeholder, in reality you’ll need a UI)
private _selection = call BIS_fnc_guiMessage; // Not real, just a placeholder for dialog

// For now, just pick the first QM type for testing:
_selectedIndex = 0;

private _loadoutType = _qmTypes select _selectedIndex;

{
    _x addAction [
        format["Open %1 Loadout Menu", _loadoutType],
        {
            params ["_target", "_caller"];
            switch (_loadoutType) do {
         		case "arcticQM":     { [_x] call RGT_fnc_arcticQM };
        		case "cbrnQM":       { [_x] call RGT_fnc_cbrnQM };
        		case "chQM":         { [_x] call RGT_fnc_chQM };
        		case "civQM":        { [_x] call RGT_fnc_civQM };
        		case "cwQM":         { [_x] call RGT_fnc_cwQM };
        		case "cwM16QM":      { [_x] call RGT_fnc_cwM16QM };
        		case "divingQM":     { [_x] call RGT_fnc_divingQM };
        		case "guerQM":       { [_x] call RGT_fnc_guerQM };
        		case "indigQM":      { [_x] call RGT_fnc_indigQM };
        		case "infQM":        { [_x] call RGT_fnc_infQM };
        		case "pmcQM":        { [_x] call RGT_fnc_pmcQM };
        		case "reconQM":      { [_x] call RGT_fnc_reconQM };
        		case "rusQM":        { [_x] call RGT_fnc_rusQM };
        		case "sniperQM":     { [_x] call RGT_fnc_sniperQM };
        		case "sofQM":        { [_x] call RGT_fnc_sofQM };
        		case "spetsnazQM":   { [_x] call RGT_fnc_spetsnazQM };
        		case "ucQM":         { [_x] call RGT_fnc_ucQM };
        		case "wdQM":         { [_x] call RGT_fnc_wdQM };
                // ... etc
                default {
                    diag_log format ["[RGT_Zeus] Unknown QM script: %1", _loadoutType];
                };
            };
        }
    ];
} forEach _targets;
{
    switch (_loadoutType) do {

        default {
            diag_log format ["[RGT_Zeus] Unknown QM script: %1", _loadoutType];
        };
    };
} forEach _targets;