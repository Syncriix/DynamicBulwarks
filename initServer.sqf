["Preparing mission", "BLACK", 2] remoteExec ["titleText", -2];
_hLocation = [] execVM "locationLists.sqf";
_hLoot     = [] execVM "loot\lists.sqf";
_hHostiles = [] execVM "hostiles\lists.sqf";
_hConfig   = [] execVM "editMe.sqf";
waitUntil {
    scriptDone _hLocation &&
    scriptDone _hLoot &&
    scriptDone _hHostiles &&
    scriptDone _hConfig
};

_basepoint = [] execVM "bulwark\createBase.sqf";
waitUntil { scriptDone _basepoint };

publicVariable "bullwarkBox";
publicVariable "PARATROOP_CLASS";
publicVariable "BULWARK_SUPPORTITEMS";
publicVariable "BULWARK_BUILDITEMS";

_dayTimeHours = DAYTIMETO - DAYTIMEFROM;
_randTime = floor random _dayTimeHours;
_timeToSet = DAYTIMEFROM + _randTime;
setDate [2018, 7, 1, _timeToSet, 0];

["", "BLACK IN", 2] remoteExec ["titleText", -2];
[bulwarkRoomPos] execVM "missionLoop.sqf";