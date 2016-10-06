// onPlayerRespawn.sqf
// Executes on a player's machine when they respawn
// _this = [<newUnit>, <oldUnit>, <respawn>, <respawnDelay>]

_unit = _this select 0;
// Handle giving units their proper loadouts upon respawn.
// If the variable "loadout" is given to a unit, that loadout will be used from CfgRespawnInventory
// If the variable is not used, the classname of the unit will be used.
_loadout = _unit getVariable ["loadout", "config"];
if (_loadout == "config") then {
	_loadout = typeOf _unit;
};
[_unit, missionConfigFile >> "CfgRespawnInventory" >> _loadout] call BIS_fnc_loadInventory;

// Sets the insignia of the unit to the TMTM insignia
[_unit, "tmtm"] remoteExec ["BIS_fnc_setUnitInsignia", 0, true];