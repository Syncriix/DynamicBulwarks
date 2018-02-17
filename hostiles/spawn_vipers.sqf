_cfgVehicles = configFile >> "CfgVehicles";
_totalentries = count _cfgVehicles;  // GO INTO CFGVEHICLES AND CHECK NUMBER OF ENTRIES
_realentries = _totalentries - 1;
_found = true;
_vecToSpawn = "Empty";
_attGroupBand = createGroup [east, true];


hint "Finding and spawning soldier";
//sleep 1;
while {true} do {
	_banditSpaned = objNull;
	_checked_veh = _cfgVehicles select round (random _realentries);  // RANDOMLY SELECT AN ENTRY
	_classname = configName _checked_veh;
	_checkBandit = [_classname, 0, 16] call BIS_fnc_trimString;
	if (_checkBandit == "O_V_Soldier_Viper") exitWith {
		_infBandit = _classname;
		//hint ("spawning: " + str _infBandit);
		//sleep 1;
		_infBandit createUnit [[bulwarkCity, 150, 300,1,0] call BIS_fnc_findSafePos, _attGroupBand, "_banditSpaned = this", hosSkill];
		if (isNull _banditSpaned) then {hint "falied to spawn";};
		_banditSpaned doMove (getPos (selectRandom playableUnits));
		_banditSpaned addEventHandler ["Hit", killPoints_fnc_hit];
		_banditSpaned addEventHandler ["Killed", killPoints_fnc_killed];
	};
};
//hint "Soldier found and spawned";
//sleep 5;