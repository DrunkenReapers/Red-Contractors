// File Configurazione DR_System
// Settaggi Generali

player addeventhandler ["Respawn",{execVM "DR_System\OnPlayerRespawn.sqf";}];

//********************************************** SEZIONE TELEPORT *****************************************************


DR_Tent = true;                                // Abilita / disabilita sistema tende
                                                 //
DR_Tent_Units = [];                             // Elenco unit? con possibilit? di piazzare la tenda di teleport
                                                 // DR_Tent_Units= [];= tutte; DR_Tent_Units= [A1,A1,B3,C5];= Solo Unit? indicate
DR_Medic_Units = [A1,A2,A3,A4];                            // Elenco unita con possibilita di piazzare la tenda Medica
                                                 // DR_Medic_Units= [];= Nessuno; DR_Medic_Units= [A2,B3,C5];= Solo Unit? indicate
DR_Resp_Move = true;                           // La tenda Medica piazzata puo diventare il nuovo respawn
                                                 // false = no; true = tenda medica della 1?unit? DR_Medic_Units diventa Respawn
DR_Teleport_Points = [respawn_tent];                  // Elenco oggetti con menu di teleport

DR_admin_slot = [p15];                       //Slot amministratore beta test Fr3eMan

if (DR_Tent) then {
  [] execVM "DR_System\DR_Teleport\AddMenu.sqf";
  if (count DR_Teleport_Points > 0) then {
    {
      _x addAction ["<t color='#dddd00'>Teleport to tent</t>", "DR_System\DR_Teleport\createteleporttoPos.sqf",[],-1,false];
    } forEach DR_Teleport_Points;
  };
};
//************************************************************************************************************************

private ["_isAdmin","_admin"];

_isAdmin = false;
sleep 1;

{
  if (str(player) == _x) exitWith {
    _isAdmin = true;
  };
} forEach DR_admin_slot;

if (!_isAdmin) exitWith {};

if (serverCommandAvailable "#shutdown") exitWith {
  hint format ["Welcome %1!\nYou logged in as admin", name player];
  titleText [format["Welcome %1! You logged in as admin", name player],"PLAIN"];
};

for "_i" from 1 to 6 do {
  hint "Attention!\nThis is a reserved admin slot.\nIf you are an admin on this server log in in the next 30 seconds otherwise you'll get kicked automatically!";
  titleText ["Attention! This is a reserved admin slot.\n\nIf you are an admin on this server log in in the next 30 seconds otherwise you'll get kicked automatically!","BLACK FADED"];
  sleep 5;
};

if (serverCommandAvailable "#shutdown") exitWith {
  hint format ["Welcome %1!\nYou logged in as admin, no kick", name player];
  titleText [format["Welcome %1! You logged in as admin, no kick", name player],"PLAIN"];
};

hint "Attention!\nYou have 5 seconds to log in or you get kicked automatically!";
titleText ["Attention! You have 5 seconds to log in or you get kicked automatically!","BLACK FADED"];
sleep 5;

if (serverCommandAvailable "#shutdown") exitWith {
  hint format ["Welcome %1!\nYou logged in as admin, no kick", name player];
  titleText [format["Welcome %1! You logged in as admin, no kick", name player],"PLAIN"];
};

hint "You will be kicked now... !!!";
titleText ["You will be kicked now... !!!","BLACK FADED"];

sleep 1;
endMission "LOSER";