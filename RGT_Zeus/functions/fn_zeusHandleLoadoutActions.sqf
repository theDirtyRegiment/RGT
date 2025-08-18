// fn_handleQMSelection.sqf

params ["_loadoutType"];

{
    private _target = _x;
    
    switch (_loadoutType) do {
        case "arcticQM":     { [_target] call RGT_fnc_arcticQM };
        case "cbrnQM":       { [_target] call RGT_fnc_cbrnQM };
        case "chQM":         { [_target] call RGT_fnc_chQM };
        case "civQM":        { [_target] call RGT_fnc_civQM };
        case "cwQM":         { [_target] call RGT_fnc_cwQM };
        case "cwM16QM":      { [_target] call RGT_fnc_cwM16QM };
        case "divingQM":     { [_target] call RGT_fnc_divingQM };
        case "guerQM":       { [_target] call RGT_fnc_guerQM };
        case "indigQM":      { [_target] call RGT_fnc_indigQM };
        case "infQM":        { [_target] call RGT_fnc_infQM };
        case "pmcQM":        { [_target] call RGT_fnc_pmcQM };
        case "reconQM":      { [_target] call RGT_fnc_reconQM };
        case "rusQM":        { [_target] call RGT_fnc_rusQM };
        case "sniperQM":     { [_target] call RGT_fnc_sniperQM };
        case "sofQM":        { [_target] call RGT_fnc_sofQM };
        case "spetsnazQM":   { [_target] call RGT_fnc_spetsnazQM };
        case "ucQM":         { [_target] call RGT_fnc_ucQM };
        case "wdQM":         { [_target] call RGT_fnc_wdQM };
        default {
            diag_log format ["[RGT_Zeus] Unknown QM script: %1", _loadoutType];
        };
    };
} forEach RGT_QM_Targets;