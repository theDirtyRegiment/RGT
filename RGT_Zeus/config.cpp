#include "dialogs\QMselectionUI.hpp"  // 👈 Registers your custom UI dialog

class CfgPatches {
    class RGT_Zeus {
        units[] = {
            "RGT_ModuleRemoveGPS",
            "RGT_ModuleAddLoadoutActions"
        };
        requiredVersion = 1.0;
        requiredAddons[] = {
            "A3_Modules_F",
            "A3_Modules_F_Curator",
            "RGT_Loadouts"
        };
    };
};

class CfgEditorCategories {
    class RGT_Category {
        displayName = "RGT";
    };
};

class CfgFunctions {
    class RGT {
        class Zeus {
            file = "RGT_Zeus\functions";

            class zeusOpenLoadoutUI {};         // Entrypoint from Zeus module
            class zeusShowQMSelectionUI {};     // Shows the dialog and populates it
            class zeusHandleLoadoutActions {};  // Handles selection after confirm
        };
    };
};

class CfgFactionClasses {
    class NO_CATEGORY;
    class RGT_Modules: NO_CATEGORY {
        displayName = "RGT Modules";
    };
};

class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class AttributesBase {
            class Default;
        };
        class ModuleDescription {
            class AnyBrain;
        };
    };

    // Remove GPS module
    class RGT_ModuleRemoveGPS: Module_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "Remove GPS";
        category = "RGT_Modules";
        function = "RGT_fnc_zeusRemoveGPS";
        isGlobal = 1;
        isTriggerActivated = 0;
        isDisposable = 1;
        curatorCanAttach = 1;
        editorCategory = "RGT_Category";

        class ModuleDescription: ModuleDescription {
            description = "Removes GPS and MicroDAGR from synced units";
            sync[] = {"AnyBrain"};
        };
    };

    // Add Loadout Actions (QM)
    class RGT_ModuleAddLoadoutActions: Module_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "Add Loadout Actions (QM)";
        category = "RGT_Modules";
        function = "RGT_fnc_zeusOpenLoadoutUI";  // 👈 This is the entry function
        isGlobal = 1;
        isTriggerActivated = 0;
        isDisposable = 1;
        curatorCanAttach = 1;
        editorCategory = "RGT_Category";

        class Attributes: AttributesBase {
            class LoadoutType {
                displayName = "Loadout Menu Type";
                tooltip = "Choose which QM script to apply (leave empty for UI).";
                typeName = "STRING";

                class Values {
                    class arcticQM { name = "Arctic"; value = "arcticQM"; };
                    class cbrnQM { name = "CBRN"; value = "cbrnQM"; };
                    class chQM { name = "CH"; value = "chQM"; };
                    class civQM { name = "Civilian"; value = "civQM"; };
                    class cwQM { name = "Cold War"; value = "cwQM"; };
                    class cwM16QM { name = "Cold War (M16)"; value = "cwM16QM"; };
                    class divingQM { name = "Diving"; value = "divingQM"; };
                    class guerQM { name = "Guerrilla"; value = "guerQM"; };
                    class indigQM { name = "Indigenous"; value = "indigQM"; };
                    class infQM { name = "Infantry"; value = "infQM"; };
                    class pmcQM { name = "PMC"; value = "pmcQM"; };
                    class reconQM { name = "Recon"; value = "reconQM"; };
                    class rusQM { name = "Russian"; value = "rusQM"; };
                    class sniperQM { name = "Sniper"; value = "sniperQM"; };
                    class sofQM { name = "Special Forces"; value = "sofQM"; };
                    class spetsnazQM { name = "Spetsnaz"; value = "spetsnazQM"; };
                    class ucQM { name = "Undercover"; value = "ucQM"; };
                    class wdQM { name = "Woodland"; value = "wdQM"; };
                };
            };
        };

        class ModuleDescription: ModuleDescription {
            description = "Attaches loadout selection actions to a synced object (e.g., crate)";
            sync[] = {"Anything"};
        };
    };
};