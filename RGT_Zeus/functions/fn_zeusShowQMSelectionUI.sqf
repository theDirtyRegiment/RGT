// fn_showQMSelectionUI.sqf

private _qmTypes = [
    "arcticQM", "cbrnQM", "chQM", "civQM", "cwQM", "cwM16QM", "divingQM",
    "guerQM", "indigQM", "infQM", "pmcQM", "reconQM", "rusQM", "sniperQM",
    "sofQM", "spetsnazQM", "ucQM", "wdQM"
];

createDialog "RscQMSelectionDialog";

// Wait for dialog to be ready, then populate
waitUntil { !isNull findDisplay 1000 };

{
    lbAdd [1500, _x];
} forEach _qmTypes;