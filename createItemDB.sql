CREATE TABLE items (
	itemID VARCHAR(200) NOT NULL,
	Gold_Find DOUBLE,
	Strength_Item DOUBLE,
	Armor_Item DOUBLE,
	Loot_2_0_Drop DOUBLE,
	Season DOUBLE,
	Hitpoints_Regen_Per_Second DOUBLE,
	Durability_Max DOUBLE,
	IsCrafted DOUBLE,
	Durability_Cur DOUBLE,
	Sockets DOUBLE,
	Vitality_Item DOUBLE,
	Experience_Bonus DOUBLE,
	Gold_PickUp_Radius DOUBLE,
	Attacks_Per_Second_Percent DOUBLE,
	Thorns_Fixed DOUBLE,
	Splash_Damage_Effect_Percent DOUBLE,
	Resource_Cost_Reduction_Percent_All DOUBLE,
	Hitpoints_On_Hit DOUBLE,
	Damage_Weapon_Delta DOUBLE,
	Spending_Resource_Heals_Percent DOUBLE,
	Attacks_Per_Second_Item DOUBLE,
	Damage_Weapon_Bonus_Min_X1 DOUBLE,
	Damage_Weapon_Bonus_Delta_X1 DOUBLE,
	Damage_Weapon_Min DOUBLE,
	Resource_Max_Bonus DOUBLE,
	Block_Chance_Item DOUBLE,
	Block_Amount_Item_Delta DOUBLE,
	Block_Amount_Item_Min DOUBLE,
	PRIMARY KEY (itemID)
	);