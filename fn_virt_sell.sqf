#include "..\..\script_macros.hpp"
/*
    File: fn_virt_sell.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_amount","_name"];
if ((lbCurSel 2402) isEqualTo -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_price = -1;
if (isClass(missionConfigFile >> " CfgDynamicMarketPrice" >> _type)) then {
	{ if (_x # 0 == _type) exitWith { _price = _x # 1; }; } forEach BoursePublicPrice;
} else {
	_price = M_CONFIG(getNumber,"VirtualItems",_type,"sellPrice");
};

if (_price isEqualTo -1) exitWith {};

_amount = ctrlText 2405;
if (!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_amount = parseNumber (_amount);
if (_amount > (ITEM_VALUE(_type))) exitWith {hint localize "STR_Shop_Virt_NotEnough"};
if ((time - life_action_delay) < 0.2) exitWith {hint localize "STR_NOTF_ActionDelay";};
life_action_delay = time;

_price = (_price * _amount);
_name = M_CONFIG(getText,"VirtualItems",_type,"displayName");
if ([false,_type,_amount] call life_fnc_handleInv) then {
    hint format[localize "STR_Shop_Virt_SellItem",_amount,(localize _name),[_price] call life_fnc_numberText];
	_grp = group player;
	if(!((_grp getVariable ["gang_id",-1]) isEqualTo -1)) then {
		_permissions = _grp getVariable ["gang_permissions",[]];
		_playerpermission = [];
		{
			if((_x select 0) isEqualTo (life_gangData select 1)) exitWith {
				_playerpermission = _x;
			};
		} forEach _permissions;
		_playerpermission = _playerpermission select 2;
		
		_tax = _grp getVariable ["gang_tax",0];
		if(!(_tax isEquaLTo 0) && {"PAYTAX" in _playerpermission}) then {
			_taxsum = _grp getVariable ["gang_tax_sum",0];
			_val = _price * (_tax/100);
			_grp setVariable ["gang_tax_sum",_taxsum + _val,true];
			if(life_hc_isActive) then {
				[15, _grp] remoteExecCall ["hc_fnc_gang_update",HC_life];
			} else {
				[15, _grp] remoteExecCall ["ton_fnc_gang_update",2];
			};
			_price = _price - _val;
		};
	};
    CASH = CASH + _price;
	
    [] call life_fnc_virt_update;
	
	if (isClass(missionConfigFile >> "CfgDynamicMarketPrice" >> _type)) then {
		_amoutOfType = player getVariable _type;
		if (!isNil "_amoutOfType") then {
			_amoutOfType = _amoutOfType + _amount;
			player setVariable [_type, _amoutOfType];
		} else {
			player setVariable [_type, _amount];
		};
	};
};

if (life_shop_type isEqualTo "drugdealer") then {
    private["_array","_ind","_val"];
    _array = life_shop_npc getVariable ["sellers",[]];
    _ind = [getPlayerUID player,_array] call TON_fnc_index;
    if (!(_ind isEqualTo -1)) then {
        _val = ((_array select _ind) select 2);
        _val = _val + _price;
        _array set[_ind,[getPlayerUID player,profileName,_val]];
        life_shop_npc setVariable ["sellers",_array,true];
    } else {
        _array pushBack [getPlayerUID player,profileName,_price];
        life_shop_npc setVariable ["sellers",_array,true];
    };
};

if (life_shop_type isEqualTo "gold" && (LIFE_SETTINGS(getNumber,"noatm_timer")) > 0) then {
    [] spawn {
        life_use_atm = false;
        sleep ((LIFE_SETTINGS(getNumber,"noatm_timer")) * 60);
        life_use_atm = true;
    };
};
[_price,1] spawn max_gouvernement_fnc_gouvernementTaxe;
[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
