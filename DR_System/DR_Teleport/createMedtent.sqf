	// -----------------------------------------------
	// Create a respawn point
	// -----------------------------------------------
M_TENT_ADD_ACTION = {
	_object = _this select 0;
	_owner = _this select 1;
	call compile format ["_object addAction [""<t color='#ff4500'>Remove medic tent </t>"", ""DR_System\DR_Teleport\removeMedtent.sqf"",[],-1,false]; _object addAction [""<t color='#dddd00'>Teleport to tent</t>"", ""DR_System\DR_Teleport\createteleporttoPos.sqf"",[],-1,false];"];
};

	private ["_position", "_mydir"];

	if (((position player) distance (getmarkerpos "respawn_west")) < 100) exitwith { hintsilent "Can t deploy tent here. Try to move out of base";};

	_mydir = getdir player;
	_position =  [(getposatl player select 0) + (sin _mydir * 2), (getposatl player select 1) + (cos _mydir * 2), 0];


	if(!alive player) exitwith {};

	if(isnil "M_tent") then {
		player playMove "AinvPknlMstpSlayWrflDnon_medic";
		sleep 4;
		Mtent =  "Land_TentA_F" createvehicle _position;
		Mtent setVariable ["R3F_LOG_disabled", true];
		Mtent setposatl _position;
		Mtent setVariable ["owner_M", name player, true];
		sleep 0.1;
		MtentB = "Box_NATO_Support_F" createvehicle _position;
		MtentB setVariable ["R3F_LOG_disabled", true];
			clearBackpackCargoGlobal MtentB;
			clearMagazineCargoGlobal MtentB;
			clearWeaponCargoGlobal MtentB;
			clearItemCargoGlobal MtentB;
			MtentB additemcargo ["FirstAidKit",12];
			MtentB additemcargo ["SmokeShell",12];
			MtentB additemcargo ["Chemlight_blue",4];
			MtentB additemcargo ["B_IR_Grenade",4];
		sleep 1;

		publicVariable "M_TENT_ADD_ACTION";
		[[Mtent, name player],"M_TENT_ADD_ACTION", true, true] spawn BIS_fnc_MP;
		"Respawn_West" setMarkerPos _position;
	} else {
		if((getdammage Mtent > 0.9) or !(alive Mtent)) then {
			deletevehicle Mtent;
			Mtent = nil;
			Mtent =  "Land_TentA_F" createvehicle _position;
			Mtent setVariable ["R3F_LOG_disabled", true];
			Mtent setposatl _position;
			Mtent setVariable ["owner_M", name player, true];
			sleep 0.1;
			MtentB = "Box_NATO_Support_F" createvehicle _position;
			MtentB setVariable ["R3F_LOG_disabled", true];
				clearBackpackCargoGlobal MtentB;
				clearMagazineCargoGlobal MtentB;
				clearWeaponCargoGlobal MtentB;
				clearItemCargoGlobal MtentB;
				MtentB additemcargo ["FirstAidKit",12];
				MtentB additemcargo ["SmokeShell",12];
				MtentB additemcargo ["Chemlight_blue",4];
				MtentB additemcargo ["B_IR_Grenade",4];

			publicVariable "M_TENT_ADD_ACTION";
			[[Mtent, name player],"M_TENT_ADD_ACTION", true, true] spawn BIS_fnc_MP;
            if ((count DR_Medic_Units > 0) && (player == DR_Medic_Units select 0 )) then {
                "Respawn_West" setMarkerPos _position;
              };
		} else {
			hint  "A Medic tent already exist. You must remove it to build a new one.";
		};
	};