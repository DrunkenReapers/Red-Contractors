	// -----------------------------------------------
	// Create a respawn point
	// -----------------------------------------------
TENT_ADD_ACTION = {
	_object = _this select 0;
	_owner = _this select 1;
	call compile format ["_object addAction [""<t color='#ff4500'>Remove tent of %1</t>"", ""DR_System\DR_Teleport\removetent.sqf"",[],-1,false];", _owner];
};
	private ["_position", "_mydir"];

	if (((position player) distance (getmarkerpos "respawn_tent")) < 100) exitwith { hintsilent "Can t deploy tent here. Try to move out of base";};

	_mydir = getdir player;
	_position =  [(getposatl player select 0) + (sin _mydir * 2), (getposatl player select 1) + (cos _mydir * 2), 0];


	if(!alive player) exitwith {};

	if (isnil "tent") then {
		player playMove "AinvPknlMstpSlayWrflDnon_medic";
		sleep 4;
		tent =  "Land_TentDome_F" createvehicle _position;
		tent setVariable ["R3F_LOG_disabled", true];
		tent setposatl _position;
		tent setVariable ["owner", name player, true];
		sleep 1;

		publicVariable "TENT_ADD_ACTION";
		[[tent, name player],"TENT_ADD_ACTION", true, true] spawn BIS_fnc_MP;
		respawnposition = [getpos player, tent];
	} else {
		if((getdammage tent > 0.9) or !(alive tent)) then {
			deletevehicle tent;
			tent = nil;
			player playMove "AinvPknlMstpSlayWrflDnon_medic";
			sleep 4;
			tent =  "Land_TentDome_F" createvehicle _position;
			tent setVariable ["R3F_LOG_disabled", true];
			tent setposatl _position;
			tent setVariable ["owner", name player, true];

			publicVariable "TENT_ADD_ACTION";
			[[tent, name player],"TENT_ADD_ACTION", true, true] spawn BIS_fnc_MP;
			respawnposition = [position player, tent];
			}
			else {
				hint  "A tent already exist. You must remove it to build a new one.";
			};
	};





