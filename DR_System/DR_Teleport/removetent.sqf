	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// Create a respawn point
	// -----------------------------------------------

	player playMove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 8;

	if!(alive player) exitwith {};

	deletevehicle (_this select 0);
	tent = nil;

