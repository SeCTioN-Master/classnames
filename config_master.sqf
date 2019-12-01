/*
 *  Author: Thomas CROIZET "Steez"
 *  File: fn_bourseReturnTime.sqf
 *  License: Script sales in The-Programmer, © All Rights Reserved
*/
#define true 1
#define false 0

class CfgDynamicMarketPrice {
	lang = "en"; // en / fr

	sleepSpecialEvent = 10; // in minutes, default value = 10
	sleepCalculating = 5; // in minutes, default value = 5
	saveInDatabase = true;
	hideEventTime = true; //Displays or not the date of the next event
	enableSpecialEvent = false; //If you have no event you can disable the system

	/* EXAMPLE CLASS
		class Example ==> This is the variable of the virtual object
		{
				isHide = ==> Does not display the object in the menu (the object remains influenced)
				synchronizeBuyPrice = ==> Synchronize or not the buy price to the sell price
				minPrice = the minimum price of your item, must be an integer
				maxPrice = the maximum price of your item, must be an integer
				defaultPrice = the default price of your item, must be an integer
				influence = a coefficiant for the item, default value = 0.15
				specialEvents[] = { {"name of an event", min influence, max influence} } to lower the price put the influence betwteen > 1 and < 2.
				To increase the price put the influence between < 1 and > 0. Leave blank if you do not want an event.
				itemInfluenced[] = { {"class name of the item", coefficiant} } the coefficiant must be >= 1, default value 1.25
		};
	*/

	class apple {
		isHide = false;
		synchronizeBuyPrice = true;
		minPrice = 642;
		maxPrice = 1286;
		defaultPrice = 782;
		influence = 0.15;
		specialEvents[] = { {"Eine Gruppe von Wanderen hat sich auf den Verkauf von Äpfeln spezialisiert!", 0.15, 0.8}, {"Ein Bio-Student bestätigt wie Wirksamkeit der Äpfel!", 1.15, 1.8} };
		itemInfluenced[] = { {"peach", 1.25} };
	};
	
	class peach {
		isHide = false;
		synchronizeBuyPrice = true;
		minPrice = 765;
		maxPrice = 1301;
		defaultPrice = 864;
		influence = 0.15;
		specialEvents[] = { {"Eine Gruppe von Wanderen hat sich auf den Verkauf von Äpfeln spezialisiert!", 0.15, 0.8}, {"Ein Bio-Student bestätigt wie Wirksamkeit der Äpfel!", 1.15, 1.8} };
		itemInfluenced[] = { {"peach", 1.25} };
	};
	
	class holz {
		isHide = false;
		synchronizeBuyPrice = true;
		minPrice = 964;
		maxPrice = 1643;
		defaultPrice = 1286;
		influence = 0.15;
		specialEvents[] = { {"Eine Gruppe von Wanderen hat sich auf den Verkauf von Äpfeln spezialisiert!", 0.15, 0.8}, {"Ein Bio-Student bestätigt wie Wirksamkeit der Äpfel!", 1.15, 1.8} };
		itemInfluenced[] = { {"peach", 1.25} };
	};
	
	class copper_refined {
		isHide = false;
		synchronizeBuyPrice = true;
		minPrice = 1213;
		maxPrice = 1976;
		defaultPrice = 1497;
		influence = 0.15;
		specialEvents[] = { {"Eine Gruppe von Wanderen hat sich auf den Verkauf von Äpfeln spezialisiert!", 0.15, 0.8}, {"Ein Bio-Student bestätigt wie Wirksamkeit der Äpfel!", 1.15, 1.8} };
		itemInfluenced[] = { {"peach", 1.25} };
	};
	
	class cement {
		isHide = false;
		synchronizeBuyPrice = true;
		minPrice = 1429;
		maxPrice = 1704;
		defaultPrice = 1532;
		influence = 0.15;
		specialEvents[] = { {"Eine Gruppe von Wanderen hat sich auf den Verkauf von Äpfeln spezialisiert!", 0.15, 0.8}, {"Ein Bio-Student bestätigt wie Wirksamkeit der Äpfel!", 1.15, 1.8} };
		itemInfluenced[] = { {"peach", 1.25} };
	};
	
	class iron_refined {
		isHide = false;
		synchronizeBuyPrice = true;
		minPrice = 1495;
		maxPrice = 2185;
		defaultPrice = 1602;
		influence = 0.15;
		specialEvents[] = { {"Eine Gruppe von Wanderen hat sich auf den Verkauf von Äpfeln spezialisiert!", 0.15, 0.8}, {"Ein Bio-Student bestätigt wie Wirksamkeit der Äpfel!", 1.15, 1.8} };
		itemInfluenced[] = { {"peach", 1.25} };
	};
	
	class oil_processed {
		isHide = false;
		synchronizeBuyPrice = true;
		minPrice = 1692;
		maxPrice = 2329;
		defaultPrice = 1883;
		influence = 0.15;
		specialEvents[] = { {"Eine Gruppe von Wanderen hat sich auf den Verkauf von Äpfeln spezialisiert!", 0.15, 0.8}, {"Ein Bio-Student bestätigt wie Wirksamkeit der Äpfel!", 1.15, 1.8} };
		itemInfluenced[] = { {"peach", 1.25} };
	};
	
	class salt_refined {
		isHide = false;
		synchronizeBuyPrice = true;
		minPrice = 1892;
		maxPrice = 2593;
		defaultPrice = 2042;
		influence = 0.15;
		specialEvents[] = { {"Eine Gruppe von Wanderen hat sich auf den Verkauf von Äpfeln spezialisiert!", 0.15, 0.8}, {"Ein Bio-Student bestätigt wie Wirksamkeit der Äpfel!", 1.15, 1.8} };
		itemInfluenced[] = { {"peach", 1.25} };
	};
	
	class glass {
		isHide = false;
		synchronizeBuyPrice = true;
		minPrice = 2084;
		maxPrice = 2812;
		defaultPrice = 2394;
		influence = 0.15;
		specialEvents[] = { {"Eine Gruppe von Wanderen hat sich auf den Verkauf von Äpfeln spezialisiert!", 0.15, 0.8}, {"Ein Bio-Student bestätigt wie Wirksamkeit der Äpfel!", 1.15, 1.8} };
		itemInfluenced[] = { {"peach", 1.25} };
	};
	
	class diamond_cut {
		isHide = false;
		synchronizeBuyPrice = true;
		minPrice = 2283;
		maxPrice = 3054;
		defaultPrice = 2529;
		influence = 0.15;
		specialEvents[] = { {"Eine Gruppe von Wanderen hat sich auf den Verkauf von Äpfeln spezialisiert!", 0.15, 0.8}, {"Ein Bio-Student bestätigt wie Wirksamkeit der Äpfel!", 1.15, 1.8} };
		itemInfluenced[] = { {"peach", 1.25} };
	};
	
	class turtle_soup {
		isHide = false;
		synchronizeBuyPrice = true;
		minPrice = 2348;
		maxPrice = 3064;
		defaultPrice = 2524;
		influence = 0.15;
		specialEvents[] = { {"Eine Gruppe von Wanderen hat sich auf den Verkauf von Äpfeln spezialisiert!", 0.15, 0.8}, {"Ein Bio-Student bestätigt wie Wirksamkeit der Äpfel!", 1.15, 1.8} };
		itemInfluenced[] = { {"peach", 1.25} };
	};
	
	class marijuana {
		isHide = false;
		synchronizeBuyPrice = true;
		minPrice = 2594;
		maxPrice = 3392;
		defaultPrice = 2846;
		influence = 0.25;
		specialEvents[] = { {"Eine Gruppe von Wanderen hat sich auf den Verkauf von Äpfeln spezialisiert!", 0.15, 0.8}, {"Ein Bio-Student bestätigt wie Wirksamkeit der Äpfel!", 1.15, 1.8} };
		itemInfluenced[] = { {"peach", 1.25} };
	};
	
	class cocaine_processed {
		isHide = false;
		synchronizeBuyPrice = true;
		minPrice = 2947;
		maxPrice = 3692;
		defaultPrice = 3294;
		influence = 0.25;
		specialEvents[] = { {"Eine Gruppe von Wanderen hat sich auf den Verkauf von Äpfeln spezialisiert!", 0.15, 0.8}, {"Ein Bio-Student bestätigt wie Wirksamkeit der Äpfel!", 1.15, 1.8} };
		itemInfluenced[] = { {"peach", 1.25} };
	};
	
	class heroin_processed {
		isHide = false;
		synchronizeBuyPrice = true;
		minPrice = 3782;
		maxPrice = 4321;
		defaultPrice = 4001;
		influence = 0.25;
		specialEvents[] = { {"Eine Gruppe von Wanderen hat sich auf den Verkauf von Äpfeln spezialisiert!", 0.15, 0.8}, {"Ein Bio-Student bestätigt wie Wirksamkeit der Äpfel!", 1.15, 1.8} };
		itemInfluenced[] = { {"peach", 1.25} };
	};

	
	class goldbar {
		isHide = false;
		synchronizeBuyPrice = true;
		minPrice = 16464;
		maxPrice = 28453;
		defaultPrice = 20453;
		influence = 0.75;
		specialEvents[] = { {"Eine Gruppe von Wanderen hat sich auf den Verkauf von Äpfeln spezialisiert!", 0.15, 0.8}, {"Ein Bio-Student bestätigt wie Wirksamkeit der Äpfel!", 1.15, 1.8} };
		itemInfluenced[] = { {"peach", 1.25} };
	};
};
