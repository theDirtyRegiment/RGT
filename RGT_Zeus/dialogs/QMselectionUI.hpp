class RscQMSelectionDialog {
    idd = 1000;
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground {
        class Background: RscText {
            idc = -1;
            x = 0.35; y = 0.2;
            w = 0.3; h = 0.5;
            colorBackground[] = {0, 0, 0, 0.7};
        };
    };

    class controls {
        class QMListbox: RscListbox {
            idc = 1500;
            x = 0.375; y = 0.25;
            w = 0.25; h = 0.3;
        };

        class ConfirmButton: RscButton {
            idc = 1600;
            text = "Confirm";
            x = 0.375; y = 0.6;
            w = 0.25; h = 0.05;
            action = "_sel = lbText [1500, lbCurSel 1500]; closeDialog 0; [_sel] execVM 'functions\fn_handleQMSelection.sqf';";
        };

        class CancelButton: RscButton {
            idc = 1601;
            text = "Cancel";
            x = 0.375; y = 0.66;
            w = 0.25; h = 0.05;
            action = "closeDialog 0;";
        };
    };
};