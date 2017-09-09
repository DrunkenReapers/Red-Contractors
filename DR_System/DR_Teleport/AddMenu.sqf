
waitUntil {alive player};
sleep 1;
if ((count DR_Tent_Units == 0) or (player in DR_Tent_Units )) then {
    player addAction ["<t color='#dddd00'>"+"Deploy Tent"+"</t>", "DR_System\DR_Teleport\createtent.sqf",[],-1,false,true,"((vehicle player == player) &&  (isnil 'tent'))"];
 };
if ((count DR_Medic_Units > 0) && (player in DR_Medic_Units )) then {
    player addAction ["<t color='#dddd00'>"+"Deploy Medic Tent"+"</t>", "DR_System\DR_Teleport\createMedtent.sqf",[],-1,false,true, "", "(vehicle player == player)"];
};