/*
Author: Kerkkoh
First Edit: 6.12.2016
*/

ctrlShow [1600, false];
_distanceFail = false;

_rnd = floor random 5;
for "_i" from 0 to 15 step 1 do {
	ctrlSetText [1000, "Hacking."];
	sleep 1;
	if (((position player) distance (getMarkerPos 'jail')) > 15) exitWith {_distanceFail = true;};
	ctrlSetText [1000, "Hacking.."];
	sleep 1;
	if (((position player) distance (getMarkerPos 'jail')) > 15) exitWith {_distanceFail = true;};
	ctrlSetText [1000, "Hacking..."];
	sleep 1;
	if (((position player) distance (getMarkerPos 'jail')) > 15) exitWith {_distanceFail = true;};
	if (_i == 15) then {
		if (_rnd == 0) then {
			ctrlSetText [1000, "Success!"];
			[] remoteExecCall ["ServerModules_fnc_breakoutJail", 2];
			if (true) exitWith {};
		} else {
			_police = []call Client_fnc_getPolice;
			{[] remoteExecCall ["ClientModules_fnc_jailBreakAlert", _x];}forEach _police;
			ctrlSetText [1000, "Hacking.."];
			sleep 2;
			if (((position player) distance (getMarkerPos 'jail')) > 15) exitWith {_distanceFail = true;};
			ctrlSetText [1000, "Hacking"];
			sleep 3;
			if (((position player) distance (getMarkerPos 'jail')) > 15) exitWith {_distanceFail = true;};
			ctrlSetText [1000, "Error"];
			sleep 5;
			if (true) exitWith {};
		};
	};
};

closeDialog 0;
