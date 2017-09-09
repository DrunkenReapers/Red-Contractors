	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - Description:
	// Attach a marker to an object
	// -----------------------------------------------

	private ["_vehicle", "_position"];

	_position = respawnposition select 0;	
	_vehicle = respawnposition select 1;

	if(format ["%1", _position] == "any") exitWith {hint "No respawn point avalaible";};
	if(format ["%1", _vehicle] == "any") exitWith {hint "No respawn point avalaible";};



	if ((alive _vehicle) and ((position _vehicle) distance _position < 100)) then {
		player setpos _position;

	} else {
		hint "No respawn point avalaible";
	};