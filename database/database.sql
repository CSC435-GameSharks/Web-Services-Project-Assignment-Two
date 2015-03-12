/*CREATE the database IF it doesn't exist*/
CREATE database IF NOT EXISTS csc435;
/*change to database*/
USE csc435;


/*
****************************************************************************
*Delete the TABLEs IF they EXISTS and***************************************
*CREATE new ones                     ***************************************
****************************************************************************
*/

/*delete wowClass TABLE IF it EXISTS*/
DROP TABLE IF EXISTS wowClass;
SHOW WARNINGS;
/*CREATE wow class TABLE*/
CREATE TABLE wowClass(
       classID int,
       className varchar(50),
       classBio varchar(1024),
       PRIMARY KEY (classID));

       
/*delete wowRoles TABLE IF it EXISTS*/
DROP TABLE IF EXISTS wowRoles;
/*CREATE wow role TABLE*/
CREATE TABLE wowRoles(
    roleID int,
    roleName varchar(50),
    PRIMARY KEY (roleId));

/*delete wowClassRoles TABLE IF it EXISTS*/
DROP TABLE IF EXISTS wowClassRoles;
/*CREATE wowClassRoles TABLE*/
CREATE TABLE wowClassRoles(
    classID int,
    roleID int,
    PRIMARY KEY (classID,roleID),
    FOREIGN KEY (classID) REFERENCES wowClass(classID));
    
    
    
/*delete wowSpecializations TABLE IF it EXISTS*/    
DROP TABLE IF EXISTS wowSpecializations;
/*CREATE wowSpecializations TABLE*/
CREATE TABLE wowSpecializations(
    specID int,
    classID int,
    specName varchar(50),
    PRIMARY KEY (specID, classID),
    FOREIGN KEY (classID) REFERENCES wowClass(classID));

    
/*delete wowClassSpells TABLE IF it EXISTS*/    
DROP TABLE IF EXISTS wowClassSpells;
/*CREATE wowClassSpells TABLE*/
CREATE TABLE wowClassSpells(
    spellID int,
    classID int,
    spellName varchar(50),
    spellDesc varchar(512),
    lvl int,
    PRIMARY KEY(spellID, classID),
    FOREIGN KEY (classID) REFERENCES wowClass(classID));

/*delete wowSpecSpells TABLE IF it EXISTS*/
DROP TABLE IF EXISTS wowSpecSpells;
/*CREATE wowSpecSpells TABLE*/
CREATE TABLE wowSpecSpells(
    spellID int,
    specID int,
    spellName varchar(50),
    spellDesc varchar(512),
    lvl int,
    PRIMARY KEY(spellID, specID),
    FOREIGN KEY (specID) REFERENCES wowSpecializations(specID));

/*delete wowTalents TABLE IF it EXISTS*/        
DROP TABLE IF EXISTS wowTalents;
/*CREATE wowTalents TABLE*/
CREATE TABLE wowTalents(
    talentID int,
    classID int,
    specID int,
    talentName varchar(50),
    talentDesc varchar(512),
    lvl int,
    PRIMARY KEY (talentID, classID, specID),
    FOREIGN KEY (classID) REFERENCES wowClass(classID),
    FOREIGN KEY (specID) REFERENCES wowSpecializations(specID));

/*delete wowSpecTalents TABLE IF it EXISTS*/    
DROP TABLE IF EXISTS wowSpecTalents;
/*CREATE wowSpecTalents TABLE*/
CREATE TABLE wowSpecTalents(
    talentID int,
    specID int,
    talentName varchar(50),
    talentDesc varchar(512),
    lvl int,
    PRIMARY KEY(talentID, specID),
    FOREIGN KEY(specID) REFERENCES wowSpecializations(specID));

/*
****************************************************************************
*Populate the TABLEs with data       ***************************************
*CREATE new ones                     ***************************************
****************************************************************************
*/    
    
/*wowClasses*/
    
INSERT INTO wowClass
    VALUES(
        1,
        'Warrior',
        'For as long as war has raged, heroes from every race have aimed to master the art of battle. Warriors combine strength, leadership, and a vast knowledge of arms and armor to wreak havoc in glorious combat. Some protect from the front lines with shields, locking down enemies while allies support the warrior from behind with spell and bow. Others forgo the shield and unleash their rage at the closest threat with a variety of deadly weapons.'
    );

INSERT INTO wowClass
    VALUES(
        2,
        'Paladin',
        'This is the call of the paladin: to protect the weak, to bring justice to the unjust, and to vanquish evil from the darkest corners of the world. These holy warriors are equipped with plate armor so they can confront the toughest of foes, and the blessing of the Light allows them to heal wounds and, in some cases, even restore life to the dead.'
    );

INSERT INTO wowClass
    VALUES(
        3,
        'Hunter',
        'From an early age the call of the wild draws some adventurers from the comfort of their homes into the unforgiving primal world outside. Those who endure become hunters. Masters of their environment, they are able to slip like ghosts through the trees and lay traps in the paths of their enemies.'
    );

INSERT INTO wowClass
    VALUES(
        4,
        'Rouge',
        'For rogues, the only code is the contract, and their honor is purchased in gold. Free from the constraints of a conscience, these mercenaries rely on brutal and efficient tactics. Lethal assassins and masters of stealth, they will approach their marks from behind, piercing a vital organ and vanishing into the shadows before the victim hits the ground.'
    );

INSERT INTO wowClass
    VALUES(
        5,
        'Priest',
        'Priests are devoted to the spiritual, and express their unwavering faith by serving the people. For millennia they have left behind the confines of their temples and the comfort of their shrines so they can support their allies in war-torn lands. In the midst of terrible conflict, no hero questions the value of the priestly orders.'
    );

INSERT INTO wowClass
    VALUES(
        6,
        'Death Knight',
        'When the Lich King’s control of his death knights was broken, his former champions sought revenge for the horrors committed under his command. After their vengeance was won, the death knights found themselves without a cause and without a home. One by one they trickled into the land of the living in search of a new purpose.'
    );

INSERT INTO wowClass
    VALUES(
        7,
        'Shaman',
        'Shaman are spiritual guides and practitioners, not of the divine, but of the very elements. Unlike some other mystics, shaman commune with forces that are not strictly benevolent. The elements are chaotic, and left to their own devices, they rage against one another in unending primal fury. It is the call of the shaman to bring balance to this chaos. Acting as moderators among earth, fire, water, and air, shaman summon totems that focus the elements to support the shaman’s allies or punish those who threaten them.'
    );    

INSERT INTO wowClass
    VALUES(
        8,
        'Mage',
        'Students gifted with a keen intellect and unwavering discipline may walk the path of the mage. The arcane magic available to magi is both great and dangerous, and thus is revealed only to the most devoted practitioners. To avoid interference with their spellcasting, magi wear only cloth armor, but arcane shields and enchantments give them additional protection. To keep enemies at bay, magi can summon bursts of fire to incinerate distant targets and cause entire areas to erupt, setting groups of foes ablaze.'
    );    
    
INSERT INTO wowClass
    VALUES(
        9,
        'Warlock',
        'In the face of demonic power, most heroes see death. Warlocks see only opportunity. Dominance is their aim, and they have found a path to it in the dark arts. These voracious spellcasters summon demonic minions to fight beside them. At first, they command only the service of imps, but as a warlock’s knowledge grows, seductive succubi, loyal voidwalkers, and horrific felhunters join the dark sorcerer’s ranks to wreak havoc on anyone who stands in their master’s way.'
    );    

INSERT INTO wowClass
    VALUES(
        10,
        'Monk',
        'When the pandaren were subjugated by the mogu centuries ago, it was the monks that brought hope to a seemingly dim future. Restricted from using weapons by their slave masters, these pandaren instead focused on harnessing their chi and learning weaponless combat. When the opportunity for revolution struck, they were well-trained to throw off the yoke of oppression.'
    );    

INSERT INTO wowClass
    VALUES(
        11,
        'Druid',
        'Druids harness the vast powers of nature to preserve balance and protect life. With experience, druids can unleash nature’s raw energy against their enemies, raining celestial fury on them from a great distance, binding them with enchanted vines, or ensnaring them in unrelenting cyclones.'
    );    
  

  
/*wowRoles*/

INSERT INTO wowRoles
    VALUES(
        0,
        "Tank"
    );

INSERT INTO wowRoles
    VALUES(
        1,
        "Melee Damage Dealer"
    );

INSERT INTO wowRoles
    VALUES(
        2,
        "Healer"
    );

INSERT INTO wowRoles
    VALUES(
        3,
        "Ranged Physical Damage Dealer"
    );

INSERT INTO wowRoles
    VALUES(
        4,
        "Ranged Magic Damage Dealer"
    );


/*wowClassRoles*/

INSERT INTO wowClassRoles
    VALUES(
        1,
        0
    );

INSERT INTO wowClassRoles
    VALUES(
        1,
        1
    );    

INSERT INTO wowClassRoles
    VALUES(
        2,
        0
    );    

INSERT INTO wowClassRoles
    VALUES(
        2,
        1
    );   
    
INSERT INTO wowClassRoles
    VALUES(
        2,
        2
    );       
    
 INSERT INTO wowClassRoles
    VALUES(
        3,
        3
    );   
    
 INSERT INTO wowClassRoles
    VALUES(
        4,
        1
    );     


 INSERT INTO wowClassRoles
    VALUES(
        5,
        2
    );   

 INSERT INTO wowClassRoles
    VALUES(
        5,
        4
    );       
    
 INSERT INTO wowClassRoles
    VALUES(
        6,
        0
    );   

 INSERT INTO wowClassRoles
    VALUES(
        6,
        1
    );       

 INSERT INTO wowClassRoles
    VALUES(
        7,
        2
    );   

 INSERT INTO wowClassRoles
    VALUES(
        7,
        4
    );   

 INSERT INTO wowClassRoles
    VALUES(
        7,
        1
    );    

 INSERT INTO wowClassRoles
    VALUES(
        8,
        4
    );       
    
  INSERT INTO wowClassRoles
    VALUES(
        9,
        4
    );  

 INSERT INTO wowClassRoles
    VALUES(
        10,
        0
    );   

 INSERT INTO wowClassRoles
    VALUES(
        10,
        2
    );   

 INSERT INTO wowClassRoles
    VALUES(
        10,
        1
    );   

 INSERT INTO wowClassRoles
    VALUES(
        11,
        0
    );       
    
 INSERT INTO wowClassRoles
    VALUES(
        11,
        2
    );     

     INSERT INTO wowClassRoles
    VALUES(
        11,
        4
    );     
    
 INSERT INTO wowClassRoles
    VALUES(
        11,
        1
    );   

    
/*wowSpecializations*/

INSERT INTO wowSpecializations
    VALUES(
        0,
        1,
        'Arms'
    );
    
INSERT INTO wowSpecializations
    VALUES(
        1,
        1,
        'Fury'
    );

INSERT INTO wowSpecializations
    VALUES(
        2,
        1,
        'Protection'
    );    

INSERT INTO wowSpecializations
    VALUES(
        3,
        2,
        'Holy'
    );
    
INSERT INTO wowSpecializations
    VALUES(
        4,
        2,
        'Protection'
    );

INSERT INTO wowSpecializations
    VALUES(
        5,
        2,
        'Retribution'
    );    
    
INSERT INTO wowSpecializations
    VALUES(
        6,
        3,
        'Beast Mastery'
    );
    
INSERT INTO wowSpecializations
    VALUES(
        7,
        3,
        'Marksmanship'
    );

INSERT INTO wowSpecializations
    VALUES(
        8,
        3,
        'Survival'
    );    

INSERT INTO wowSpecializations
    VALUES(
        9,
        4,
        'Assassination'
    );
    
INSERT INTO wowSpecializations
    VALUES(
        10,
        4,
        'Combat'
    );

INSERT INTO wowSpecializations
    VALUES(
        11,
        4,
        'Subtlety'
    );    
    
INSERT INTO wowSpecializations
    VALUES(
        12,
        5,
        'Discipline'
    );
    
INSERT INTO wowSpecializations
    VALUES(
        13,
        5,
        'Holy'
    );

INSERT INTO wowSpecializations
    VALUES(
        14,
        5,
        'Shadow'
    );    


INSERT INTO wowSpecializations
    VALUES(
        15,
        6,
        'Blood'
    );
    
INSERT INTO wowSpecializations
    VALUES(
        16,
        6,
        'Frost'
    );

INSERT INTO wowSpecializations
    VALUES(
        17,
        6,
        'Unholy'
    );    

INSERT INTO wowSpecializations
    VALUES(
        18,
        7,
        'Elemental'
    );
    
INSERT INTO wowSpecializations
    VALUES(
        19,
        7,
        'Enhancement'
    );

INSERT INTO wowSpecializations
    VALUES(
        20,
        7,
        'Restoration'
    );    

INSERT INTO wowSpecializations
    VALUES(
        21,
        8,
        'Arcane'
    );
    
INSERT INTO wowSpecializations
    VALUES(
        22,
        8,
        'Fire'
    );

INSERT INTO wowSpecializations
    VALUES(
        23,
        8,
        'Frost'
    );    
    
INSERT INTO wowSpecializations
    VALUES(
        24,
        9,
        'Affliction'
    );
    
INSERT INTO wowSpecializations
    VALUES(
        25,
        9,
        'Demonology'
    );

INSERT INTO wowSpecializations
    VALUES(
        26,
        9,
        'Destruction'
    );    
    
INSERT INTO wowSpecializations
    VALUES(
        27,
        10,
        'Brewmaster'
    );
    
INSERT INTO wowSpecializations
    VALUES(
        28,
        10,
        'Mistweaver'
    );

INSERT INTO wowSpecializations
    VALUES(
        29,
        10,
        'Windwalker'
    );    
    
INSERT INTO wowSpecializations
    VALUES(
        30,
        11,
        'Balance'
    );
    
INSERT INTO wowSpecializations
    VALUES(
        31,
        11,
        'Feral'
    );

INSERT INTO wowSpecializations
    VALUES(
        32,
        11,
        'Guardian'
    );    

INSERT INTO wowSpecializations
    VALUES(
        33,
        11,
        'Restoration'
    );    
    
    
/*wowSpells*/
/*
****************************************************************************************
* Warrior 1*****************************************************************************
****************************************************************************************
*/
INSERT INTO wowClassSpells
    VALUES(
        0,
	1,
   	'Battle Stance',
    	'An aggressive combat stance that generates Rage from auto attacks',
    	1
    );  

INSERT INTO wowClassSpells
    VALUES(
        1,
	1,
	'Heroic Strike',
	'Instantly deals 3,269 Physical damage. This ability is not on the global cooldown.',
	1
    );


INSERT INTO wowClassSpells
    VALUES(
        2,
	1,
	'Ravager',
	'Throw a whirling axe at the target location that inflicts 1,826 damage to enemies within 6 yards every 1 sec. Lasts 10 sec.',
	1
    );

INSERT INTO wowClassSpells
    VALUES(
        3,
	1,
	'Charge',
	'Charge to an enemy, rooting it for 1.50 sec. Generates 20 Rage.',
	3
    );

INSERT INTO wowClassSpells
    VALUES(
        4,
	1,
	'Victory Rush',
	'Instatnyl attack the target, causing 5,935 damage and healing you for 15% of your maximum health.  Can only be used within 20 sec after you kill an enemy that yields experience or honor.',
	5
    );

INSERT INTO wowClassSpells
    VALUES(
        5,
	1,
	'Execute Off-Hand',
	'Atempt to finish off a wounded foe, causing 9,657 Physical damage.  Only usable on enemies that have less than 20% health.',
	7
    );

INSERT INTO wowClassSpells
    VALUES(
        6,
	1,
	'Defensive Stance',
	'A tanking combat stance that decreases damage taken by 20%, increases threat generation, and generates 1 Rage every 3 sec while in combat.',
	9
    );

INSERT INTO wowClassSpells
    VALUES(
        7,
	1,
	'Taunt',
	'Taunts the target to attack you, and increases threat that you generate against the target for 3 sec.  Using this abikity while in Battle Stance activates Defensive Stance.',
	12
    );

INSERT INTO wowClassSpells
    VALUES(
        8,
	1,
	'Shield Charge',
	'Raise your shield and charge a short distance to your target, increasting the damage of Shield Slam, Revenge, and Heroic Strike by 25% for 7 sec.  Maximum 2 charges.',
	18
    );

INSERT INTO wowClassSpells
    VALUES(
        9,
	1,
	'Heroic Throw',
	'Throw your weapon at the enemy, causing 1,556 Physical damage. Generates high threat.',
	22
    );

INSERT INTO wowClassSpells
    VALUES(
        10,
	1,
	'Pummel',
	'Pummel the target, interrupting spellcasting and preventing any spell in that school from being cast for 4 sec.',
	24
    );

INSERT INTO wowClassSpells
    VALUES(
	11,
	1,
	'Hamstring',
	'Maims the enemy for 155 Physical damage, reducing movement speed by 50% for 15 sec.',
	36
    );

INSERT INTO wowClassSpells
    VALUES(
        12,
	1,
	'Battle Shout',
	'Increase the attack power of all raid and party members within 100 yards by 10% for 1 hour.  Targets may only have one Shout active on them per Warrior.',
	42
    );

INSERT INTO wowClassSpells
    VALUES(
        13,
	1,
	'Intimidating Shout',
	'Causes the targeted enemy to cower in fear, and up to 5 additional enemies within 8 yards to flee.  Targets are disoriented for 8 sec.',
	52
    );

INSERT INTO wowClassSpells
    VALUES(
        14,
	1,
	'Berserker Rage',
	'You go berserk, removing and granting immunity to Fear, Sap and Incapacitate effects for 6 sec.',
	54
    );

INSERT INTO wowClassSpells
    VALUES(
        15,
	1,
	'Spell Reflection',
	'Raise your shield, reflecting the next spell cast on you.  Lasts 5 sec.',
	66
    );

INSERT INTO wowClassSpells
    VALUES(
        16,
	1,
	'Commanding Shout',
	'Increase the Stamina of all party and raid members within 100 yeards by 10% for 1 hour.  Targets may only have one Shout active on them per Warrior.',
	68
    );

INSERT INTO wowClassSpells
    VALUES(
        17,
	1,
	'Intervene',
	'Run at high speed toward an ally within 25 yeards, intercepting the next melee or ranged attack within 10 sec while the target remains within 10 yards.',
	72
    );

INSERT INTO wowClassSpells
    VALUES(
        18,
	1,
	'Shattering Throw',
	'Throws your weapon at the enemy causing 2,338 damage or removing any invulnerabilities',
	74
    );

INSERT INTO wowClassSpells
    VALUES(
        19,
	1,
	'Shield Barrier',
	'Raise your shield, absorbing 4,154 damage for the next 6 sec.  Consumes up to 40 additional Rage to increase the amount absorbed.',
	81
    );

INSERT INTO wowClassSpells
    VALUES(
        20,
	1,
	'Heroic Leap',
	'Leap through the air towards a targeted location, slamming down with destructive force to deal 1,544 Physical damage to all enemies within 8 yards.',
	85
    );  

/*spec spells*/
INSERT INTO wowSpecSpells
    VALUES(
        0,
     	0,
      	'Execute',
      	'',
      	7
    );

INSERT INTO wowSpecSpells
    VALUES(
        1,
     	0,
      	'Rend',
      	'',
      	7
    );

INSERT INTO wowSpecSpells
    VALUES(
        2,
     	0,
      	'Mortal Strike',
      	'',
      	10
    );

INSERT INTO wowSpecSpells
    VALUES(
        3,
     	0,
      	'Seasoned Soldier (Passive)',
      	'',
      	10
    );

INSERT INTO wowSpecSpells
    VALUES(
        4,
     	0,
      	'Thunder Clap',
      	'',
      	14
    );

INSERT INTO wowSpecSpells
    VALUES(
        5,
     	0,
      	'Whirlwind',
      	'',
      	26
    );

INSERT INTO wowSpecSpells
    VALUES(
        6,
     	0,
      	'Die by the Sword',
      	'',
      	56
    );

INSERT INTO wowSpecSpells
    VALUES(
        7,
     	0,
      	'Sweeping Strikes',
      	'',
      	60
    );

INSERT INTO wowSpecSpells
    VALUES(
        8,
     	0,
      	'Inspiring Presence (Passive)',
      	'',
      	80
    );

INSERT INTO wowSpecSpells
    VALUES(
        9,
     	0,
      	'Colossus Smash',
      	'',
      	81
    );

INSERT INTO wowSpecSpells
    VALUES(
        10,
     	0,
      	'Shield Barrier',
      	'',
      	81
    );

INSERT INTO wowSpecSpells
    VALUES(
        11,
     	0,
      	'Rallying Cry',
      	'',
      	83
    );

INSERT INTO wowSpecSpells
    VALUES(
        12,
     	0,
      	'Recklessness',
      	'',
      	87
    );

INSERT INTO wowSpecSpells
    VALUES(
        13,
     	0,
      	'Weapon Mastery (Passive)',
      	'',
      	90
    );

INSERT INTO wowSpecSpells
    VALUES(
        14,
	1,
	'Execute',
	'',
	7
    );

INSERT INTO wowSpecSpells
    VALUES(
        15,
	1,
	'Bloodthirst',
	'',
	10
    );

INSERT INTO wowSpecSpells
    VALUES(
        16,
	1,
	'Crazed Berserker (Passive)',
	'',
	10
    );

INSERT INTO wowSpecSpells
    VALUES(
        17,
	1,
	'Enrage (Passive)',
	'',
	14
    );

INSERT INTO wowSpecSpells
    VALUES(
        18,
	1,
	'Wild Strike',
	'',
	18
    );

INSERT INTO wowSpecSpells
    VALUES(
        19,
	1,
	'Piercing Howl',
	'',
	19
    );

INSERT INTO wowSpecSpells
    VALUES(
        20,
	1,
	'Whirlwind',
	'',
	26
    );

INSERT INTO wowSpecSpells
    VALUES(
        21,
	1,
	'Raging Blow',
	'',
	30
    );

INSERT INTO wowSpecSpells
    VALUES(
        22,
	1,
	'Die by the Sword',
	'',
	56
    );

INSERT INTO wowSpecSpells
    VALUES(
        23,
	1,
	'Inspiring Presence (Passive)',
	'',
	80
    );

INSERT INTO wowSpecSpells
    VALUES(
        24,
	1,
	'Shield Barrier',
	'',
	81
    );

INSERT INTO wowSpecSpells
    VALUES(
        25,
	1,
	'Rallying Cry',
	'',
	83
    );

INSERT INTO wowSpecSpells
    VALUES(
        26,
	1,
	'Recklessness',
	'',
	87
    );

INSERT INTO wowSpecSpells
    VALUES(
        27,
	1,
	'Cruelty (Passive)',
	'',
	90
    );

INSERT INTO wowSpecSpells
    VALUES(
        28,
	2,
	'Execute',
	'',
	7
    );


INSERT INTO wowSpecSpells
    VALUES(
        29,
	2,
	'Shield Slam',
	'',
	10
    );


INSERT INTO wowSpecSpells
    VALUES(
        30,
	2,
	'Resolve (Passive)',
	'',
	10
    );


INSERT INTO wowSpecSpells
    VALUES(
        31,
	2,
	'Tunder Clap',
	'',
	14
    );


INSERT INTO wowSpecSpells
    VALUES(
        32,
	2,
	'Enrage (Passive)',
	'',
	14
    );


INSERT INTO wowSpecSpells
    VALUES(
        33,
	2,
	'Shield Block',
	'',
	18
    );


INSERT INTO wowSpecSpells
    VALUES(
        34,
	2,
	'Devastate',
	'',
	26
    );


INSERT INTO wowSpecSpells
    VALUES(
        35,
	2,
	'Revenge',
	'',
	30
    );


INSERT INTO wowSpecSpells
    VALUES(
        36,
	2,
	'Deep Wounds (Passive)',
	'',
	32
    );


INSERT INTO wowSpecSpells
    VALUES(
        37,
	2,
	'Last Stand',
	'',
	38
    );


INSERT INTO wowSpecSpells
    VALUES(
        38,
	2,
	'Shield Wall',
	'',
	48
    );


INSERT INTO wowSpecSpells
    VALUES(
        39,
	2,
	'Demoralizing Shout',
	'',
	56
    );


INSERT INTO wowSpecSpells
    VALUES(
        40,
	2,
	'Mocking Banner',
	'',
	87
    );


INSERT INTO wowSpecSpells
    VALUES(
        41,
	2,
	'Blood Craze (Passive)',
	'',
	90
    );


INSERT INTO wowSpecSpells
    VALUES(
        42,
	2,
	'Shield Mastery (Passive)',
	'',
	90
    );



/*
****************************************************************************************
* Paladin 2*****************************************************************************
****************************************************************************************
*/
INSERT INTO wowClassSpells
    VALUES(
        21,
	2,
	'Crusader Strike',
	'',
	1
    );        

INSERT INTO wowClassSpells
    VALUES(
        22,
	2,
	'Arcing Light',
	'',
	1
    );    

INSERT INTO wowClassSpells
    VALUES(
        23,
	2,
	'Seal of Command',
	'',
	3
    );    

INSERT INTO wowClassSpells
    VALUES(
        24,
	2,
	'Judgment',
	'',
	5
    );    

INSERT INTO wowClassSpells
    VALUES(
        25,
	2,
	'Hammer of Justice',
	'',
	7
    );    

INSERT INTO wowClassSpells
    VALUES(
        26,
	2,
	'Word of Glory',
	'',
	9
    );    

INSERT INTO wowClassSpells
    VALUES(
        27,
	2,
	'Righteous Fury',
	'',
	12
    );    

INSERT INTO wowClassSpells
    VALUES(
        28,
	2,
	'Redemption',
	'',
	13
    );    

INSERT INTO wowClassSpells
    VALUES(
        29,
	2,
	'Reckoning',
	'',
	15
    );    

INSERT INTO wowClassSpells
    VALUES(
        30,
	2,
	'Lay on Hands',
	'',
	16
    );    

INSERT INTO wowClassSpells
    VALUES(
        31,
	2,
	'Divine Shield',
	'',
	18
    );    

INSERT INTO wowClassSpells
    VALUES(
        32,
	2,
	'Summon Exarchs Elekk',
	'',
	20
    );    

INSERT INTO wowClassSpells
    VALUES(
        33,
	2,
	'Summon Warhorse',
	'',
	20
    );    

INSERT INTO wowClassSpells
    VALUES(
        34,
	2,
	'Summon Thalassian Warhorse',
	'',
	20
    );    

INSERT INTO wowClassSpells
    VALUES(
        35,
	2,
	'Cleanse',
	'',
	20
    );    

INSERT INTO wowClassSpells
    VALUES(
        36,
	2,
	'Summon Sunwalker Kodo',
	'',
	20
    );    

INSERT INTO wowClassSpells
    VALUES(
        37,
	2,
	'Hammer of the Righteous',
	'',
	20
    );    

INSERT INTO wowClassSpells
    VALUES(
        38,
	2,
	'Divine Protection',
	'',
	26
    );    

INSERT INTO wowClassSpells
    VALUES(
        39,
	2,
	'Blessing of Kings',
	'',
	30
    );    

INSERT INTO wowClassSpells
    VALUES(
        40,
	2,
	'Seal of Insight',
	'',
	32
    );    

INSERT INTO wowClassSpells
    VALUES(
        41,
	2,
	'Rebuke',
	'',
	36
    );    

INSERT INTO wowClassSpells
    VALUES(
        42,
	2,
	'Hammer of Wrath',
	'',
	38
    );    

INSERT INTO wowClassSpells
    VALUES(
        43,
	2,
	'Summon Thalassian Charger',
	'',
	40
    );    

INSERT INTO wowClassSpells
    VALUES(
        44,
	2,
	'Summon Great Exarchs Elekk',
	'',
	40
    );    

INSERT INTO wowClassSpells
    VALUES(
        45,
	2,
	'Summon Great Sunwalker Kodo',
	'',
	40
    );    

INSERT INTO wowClassSpells
    VALUES(
        46,
	2,
	'Summon Charger',
	'',
	40
    );    

INSERT INTO wowClassSpells
    VALUES(
        47,
	2,
	'Heart of the Crusiader (Passive)',
	'',
	44
    );    

INSERT INTO wowClassSpells
    VALUES(
        48,
	2,
	'Turn Evil',
	'',
	46
    );    

INSERT INTO wowClassSpells
    VALUES(
        49,
	2,
	'Hand of Protection',
	'',
	48
    );    

INSERT INTO wowClassSpells
    VALUES(
        50,
	2,
	'Hand of Freedom',
	'',
	52
    );    

INSERT INTO wowClassSpells
    VALUES(
        51,
	2,
	'Hand of Sacrifice',
	'',
	80
    );    

INSERT INTO wowClassSpells
    VALUES(
        52,
	2,
	'Blessing of Might',
	'',
	81
    );    

INSERT INTO wowSpecSpells
    VALUES(
        43,
	3,
	'Holy Shock',
	'',
	10
    );

INSERT INTO wowSpecSpells
    VALUES(
        44,
	3,
	'Flash of Light',
	'',
	14
    );

INSERT INTO wowSpecSpells
    VALUES(
        45,
	3,
	'Denounce',
	'',
	20
    );

INSERT INTO wowSpecSpells
    VALUES(
        46,
	3,
	'Holy Radiance',
	'',
	28
    );

INSERT INTO wowSpecSpells
    VALUES(
        47,
	3,
	'Supplication (Passive)',
	'',
	34
    );

INSERT INTO wowSpecSpells
    VALUES(
        48,
	3,
	'Beacon of Light',
	'',
	39
    );

INSERT INTO wowSpecSpells
    VALUES(
        49,
	3,
	'Infusion of Light (Passive)',
	'',
	50
    );

INSERT INTO wowSpecSpells
    VALUES(
        50,
	3,
	'Holy Light',
	'',
	54
    );

INSERT INTO wowSpecSpells
    VALUES(
        51,
	3,
	'Daybreak (Passive)',
	'',
	56
    );

INSERT INTO wowSpecSpells
    VALUES(
        52,
	3,
	'Devotion Aura',
	'',
	60
    );

INSERT INTO wowSpecSpells
    VALUES(
        53,
	3,
	'Light of Dawn',
	'',
	70
    );

INSERT INTO wowSpecSpells
    VALUES(
        54,
	3,
	'Avenging Wrath',
	'',
	72
    );

INSERT INTO wowSpecSpells
    VALUES(
        55,
	3,
	'Sanctified Light (Passive)',
	'',
	90
    );

INSERT INTO wowSpecSpells
    VALUES(
        56,
	4,
	'Avengers Shield',
	'',
	10
    );

INSERT INTO wowSpecSpells
    VALUES(
        57,
	4,
	'Resolve (Passive)',
	'',
	10
    );

INSERT INTO wowSpecSpells
    VALUES(
        58,
	4,
	'Flash of Light',
	'',
	14
    );

INSERT INTO wowSpecSpells
    VALUES(
        59,
	4,
	'Holy Wrath',
	'',
	20
    );

INSERT INTO wowSpecSpells
    VALUES(
        60,
	4,
	'Consecration',
	'',
	34
    );

INSERT INTO wowSpecSpells
    VALUES(
        61,
	4,
	'Shield of the Righteous',
	'',
	40
    );

INSERT INTO wowSpecSpells
    VALUES(
        62,
	4,
	'Seal of Righteousness',
	'',
	42
    );

INSERT INTO wowSpecSpells
    VALUES(
        63,
	4,
	'Grand Crusader (Passive)',
	'',
	50
    );

INSERT INTO wowSpecSpells
    VALUES(
        64,
	4,
	'Shining Protector (Passive)',
	'',
	50
    );

INSERT INTO wowSpecSpells
    VALUES(
        65,
	4,
	'Hand of Salvation',
	'',
	66
    );

INSERT INTO wowSpecSpells
    VALUES(
        66,
	4,
	'Ardent Defender',
	'',
	70
    );

INSERT INTO wowSpecSpells
    VALUES(
        67,
	4,
	'Guardian of Ancient Kings',
	'',
	75
    );

INSERT INTO wowSpecSpells
    VALUES(
        68,
	4,
	'Sacred Duty (Passive)',
	'',
	90
    );


INSERT INTO wowSpecSpells
    VALUES(
        69,
	5,
	'Templars Verdict',
	'',
	10
    );

INSERT INTO wowSpecSpells
    VALUES(
        70,
	5,
	'Sword of Light (Passive)',
	'',
	10
    );


INSERT INTO wowSpecSpells
    VALUES(
        71,
	5,
	'Flash of Light',
	'',
	14
    );


INSERT INTO wowSpecSpells
    VALUES(
        72,
	5,
	'Seal of Truth',
	'',
	24
    );


INSERT INTO wowSpecSpells
    VALUES(
        73,
	5,
	'Divine Storm',
	'',
	34
    );


INSERT INTO wowSpecSpells
    VALUES(
        74,
	5,
	'Supplication (Passive)',
	'',
	34
    );


INSERT INTO wowSpecSpells
    VALUES(
        75,
	5,
	'Seal of Righteousness',
	'',
	42
    );


INSERT INTO wowSpecSpells
    VALUES(
        76,
	5,
	'Exorcism',
	'',
	46
    );


INSERT INTO wowSpecSpells
    VALUES(
        77,
	5,
	'Emancipate',
	'',
	54
    );


INSERT INTO wowSpecSpells
    VALUES(
        78,
	5,
	'Seal of Justice',
	'',
	70
    );


INSERT INTO wowSpecSpells
    VALUES(
        79,
	5,
	'Avenging Wrath',
	'',
	72
    );


INSERT INTO wowSpecSpells
    VALUES(
        80,
	5,
	'Sanctity Aura (Passive)',
	'',
	80
    );


INSERT INTO wowSpecSpells
    VALUES(
        81,
	5,
	'Righteous Vengeance (Passive)',
	'',
	90
    );




/*
****************************************************************************************
*  Hunter 3*****************************************************************************
****************************************************************************************
*/
INSERT INTO wowClassSpells
    VALUES(
        53,
	3,
	'Call Pet 1',
	'',
	1
    );   

INSERT INTO wowClassSpells
    VALUES(
        54,
	3,
	'Revive Pet',
	'',
	1
    );   

INSERT INTO wowClassSpells
    VALUES(
        55,
	3,
	'Arcane Shot',
	'',
	1
    );   

INSERT INTO wowClassSpells
    VALUES(
        56,
	3,
	'Steady Shot',
	'',
	3
    );   

INSERT INTO wowClassSpells
    VALUES(
        57,
	3,
	'Concussive Shot',
	'',
	8
    );   

INSERT INTO wowClassSpells
    VALUES(
        58,
	3,
	'Call Pet 2',
	'',
	10
    );   

INSERT INTO wowClassSpells
    VALUES(
        59,
	3,
	'Dismiss Pet',
	'',
	10
    );   

INSERT INTO wowClassSpells
    VALUES(
        60,
	3,
	'Beast Lore',
	'',
	10
    );   

INSERT INTO wowClassSpells
    VALUES(
        61,
	3,
	'Tame Beast',
	'',
	10
    );   

INSERT INTO wowClassSpells
    VALUES(
        62,
	3,
	'Feed Pet',
	'',
	11
    );   

INSERT INTO wowClassSpells
    VALUES(
        63,
	3,
	'Disengage',
	'',
	14
    );   

INSERT INTO wowClassSpells
    VALUES(
        64,
	3,
	'Eagle Eye',
	'',
	16
    );   

INSERT INTO wowClassSpells
    VALUES(
        65,
	3,
	'Mend Pet',
	'',
	16
    );   

INSERT INTO wowClassSpells
    VALUES(
        66,
	3,
	'Counter Shot',
	'',
	22
    );   

INSERT INTO wowClassSpells
    VALUES(
        67,
	3,
	'Aspect of the Cheetah',
	'',
	24
    );   

INSERT INTO wowClassSpells
    VALUES(
        68,
	3,
	'Multi-Shot',
	'',
	24
    );   

INSERT INTO wowClassSpells
    VALUES(
        69,
	3,
	'Freezing Trap',
	'',
	28
    );   

INSERT INTO wowClassSpells
    VALUES(
        70,
	3,
	'Feign Death',
	'',
	32
    );   

INSERT INTO wowClassSpells
    VALUES(
        71,
	3,
	'Tranquilizing Shot',
	'',
	35
    );   

INSERT INTO wowClassSpells
    VALUES(
        72,
	3,
	'Flare',
	'',
	38
    );   

INSERT INTO wowClassSpells
    VALUES(
        73,
	3,
	'Explosive Trap',
	'',
	38
    );   

INSERT INTO wowClassSpells
    VALUES(
        74,
	3,
	'Trueshot Aura (Passive)',
	'',
	39
    );   


INSERT INTO wowClassSpells
    VALUES(
        75,
	3,
	'Call Pet 3',
	'',
	42
    );   

INSERT INTO wowClassSpells
    VALUES(
        76,
	3,
	'Misdirection',
	'',
	42
    );   

INSERT INTO wowClassSpells
    VALUES(
        77,
	3,
	'Ice Trap',
	'',
	46
    );   

INSERT INTO wowClassSpells
    VALUES(
        78,
	3,
	'Trap Launcher',
	'',
	48
    );   

INSERT INTO wowClassSpells
    VALUES(
        79,
	3,
	'Distracting Shot',
	'',
	52
    );   

INSERT INTO wowClassSpells
    VALUES(
        80,
	3,
	'Aspect of the Pack',
	'',
	56
    );   

INSERT INTO wowClassSpells
    VALUES(
        81,
	3,
	'Call Pet 4',
	'',
	62
    );   

INSERT INTO wowClassSpells
    VALUES(
        82,
	3,
	'Masters Call',
	'',
	74
    );   

INSERT INTO wowClassSpells
    VALUES(
        83,
	3,
	'Deterrence',
	'',
	78
    );   

INSERT INTO wowClassSpells
    VALUES(
        84,
	3,
	'Call Pet 5',
	'',
	82
    );   

INSERT INTO wowClassSpells
    VALUES(
        85,
	3,
	'Apsect of the Fox',
	'',
	84
    );   

INSERT INTO wowClassSpells
    VALUES(
        86,
	3,
	'Camouflage',
	'',
	85
    );   


INSERT INTO wowSpecSpells
    VALUES(
        82,
	6,
	'Kill Command',
	'',
	10
    );


INSERT INTO wowSpecSpells
    VALUES(
        83,
	6,
	'Beast Cleave (Passive)',
	'',
	24
    );

INSERT INTO wowSpecSpells
    VALUES(
        84,
	6,
	'Focus Fire',
	'',
	32
    );

INSERT INTO wowSpecSpells
    VALUES(
        85,
	6,
	'Kill Shot',
	'',
	35
    );

INSERT INTO wowSpecSpells
    VALUES(
        86,
	6,
	'Bestial Wrath',
	'',
	40
    );

INSERT INTO wowSpecSpells
    VALUES(
        87,
	6,
	'Cobra Strike (Passive)',
	'',
	43
    );

INSERT INTO wowSpecSpells
    VALUES(
        88,
	6,
	'Invigoration (Passive)',
	'',
	63
    );

INSERT INTO wowSpecSpells
    VALUES(
        89,
	6,
	'Cobra Shot',
	'',
	81
    );

INSERT INTO wowSpecSpells
    VALUES(
        90,
	6,
	'Animal Handler (Passive)',
	'',
	90
    );

INSERT INTO wowSpecSpells
    VALUES(
        91,
	7,
	'Aimed Shot',
	'',
	10
    );

INSERT INTO wowSpecSpells
    VALUES(
        92,
	7,
	'Careful Aim (Passive)',
	'',
	20
    );

INSERT INTO wowSpecSpells
    VALUES(
        93,
	7,
	'Kill Shot',
	'',
	35
    );

INSERT INTO wowSpecSpells
    VALUES(
        94,
	7,
	'Bombardment (Passive)',
	'',
	45
    );

INSERT INTO wowSpecSpells
    VALUES(
        95,
	7,
	'Rapid Fire',
	'',
	54
    );

INSERT INTO wowSpecSpells
    VALUES(
        96,
	7,
	'Chimaera Shot',
	'',
	60
    );

INSERT INTO wowSpecSpells
    VALUES(
        97,
	7,
	'Lethal Shots (Passive)',
	'',
	90
    );

INSERT INTO wowSpecSpells
    VALUES(
        98,
	8,
	'Explosive Shot',
	'',
	10
    );

INSERT INTO wowSpecSpells
    VALUES(
        99,
	8,
	'Survivalist (Passive)',
	'',
	10
    );

INSERT INTO wowSpecSpells
    VALUES(
        100,
	8,
	'Black Arrow',
	'',
	50
    );

INSERT INTO wowSpecSpells
    VALUES(
        101,
	8,
	'Entrapment (Passive)',
	'',
	55
    );

INSERT INTO wowSpecSpells
    VALUES(
        102,
	8,
	'Serpent String (Passive)',
	'',
	68
    );

INSERT INTO wowSpecSpells
    VALUES(
        103,
	8,
	'Cobra Shot',
	'',
	81
    );

INSERT INTO wowSpecSpells
    VALUES(
        104,
	8,
	'Lighting Reflexes (Passive)',
	'',
	90
    );
         
/*
****************************************************************************************
*  Rogue  4*****************************************************************************
****************************************************************************************
*/
INSERT INTO wowClassSpells
    VALUES(
        87,
	4,
	'Sinister Strike',
	'',
	1
    );   

INSERT INTO wowClassSpells
    VALUES(
        88,
	4,
	'Throw',
	'',
	1
    );   

INSERT INTO wowClassSpells
    VALUES(
        89,
	4,
	'Eviscerate',
	'',
	3
    );   

INSERT INTO wowClassSpells
    VALUES(
        90,
	4,
	'Stealth',
	'',
	5
    );   

INSERT INTO wowClassSpells
    VALUES(
        91,
	4,
	'Ambush',
	'',
	6
    );   

INSERT INTO wowClassSpells
    VALUES(
        92,
	4,
	'Evasion',
	'',
	8
    );   

INSERT INTO wowClassSpells
    VALUES(
        93,
	4,
	'Deadly Posion',
	'',
	10
    );   

INSERT INTO wowClassSpells
    VALUES(
        94,
	4,
	'Slap',
	'',
	12
    );   

INSERT INTO wowClassSpells
    VALUES(
        95,
	4,
	'Slice and Dice',
	'',
	14
    );   

INSERT INTO wowClassSpells
    VALUES(
        96,
	4,
	'Pick Pocket',
	'',
	15
    );   

INSERT INTO wowClassSpells
    VALUES(
        97,
	4,
	'Recuperate',
	'',
	16
    );   

INSERT INTO wowClassSpells
    VALUES(
        98,
	4,
	'Kick',
	'',
	18
    );   

INSERT INTO wowClassSpells
    VALUES(
        99,
	4,
	'Crippling Posion',
	'',
	20
    );   

INSERT INTO wowClassSpells
    VALUES(
        100,
	4,
	'Gouge',
	'',
	22
    );   

INSERT INTO wowClassSpells
    VALUES(
        101,
	4,
	'Pick Lock',
	'',
	24
    );   

INSERT INTO wowClassSpells
    VALUES(
        102,
	4,
	'Sprint',
	'',
	26
    );   

INSERT INTO wowClassSpells
    VALUES(
        103,
	4,
	'Distract',
	'',
	28
    );   

INSERT INTO wowClassSpells
    VALUES(
        104,
	4,
	'Swiftblades Cunning (Passive)',
	'',
	30
    );   

INSERT INTO wowClassSpells
    VALUES(
        105,
	4,
	'Wound Poison',
	'',
	30
    );   

INSERT INTO wowClassSpells
    VALUES(
        106,
	4,
	'Cheap Shot',
	'',
	30
    );   

INSERT INTO wowClassSpells
    VALUES(
        107,
	4,
	'Vanish',
	'',
	34
    );   

INSERT INTO wowClassSpells
    VALUES(
        108,
	4,
	'Blind',
	'',
	38
    );   

INSERT INTO wowClassSpells
    VALUES(
        109,
	4,
	'Kidney Shot',
	'',
	40
    );   

INSERT INTO wowClassSpells
    VALUES(
        110,
	4,
	'Feint',
	'',
	44
    );   

INSERT INTO wowClassSpells
    VALUES(
        111,
	4,
	'Garrote',
	'',
	48
    );   

INSERT INTO wowClassSpells
    VALUES(
        112,
	4,
	'Cloak of Shadows',
	'',
	58
    );   

INSERT INTO wowClassSpells
    VALUES(
        113,
	4,
	'Fleet Footed (Passive)',
	'',
	62
    );   

INSERT INTO wowClassSpells
    VALUES(
        114,
	4,
	'Preparation',
	'',
	68
    );   

INSERT INTO wowClassSpells
    VALUES(
        115,
	4,
	'Shiv',
	'',
	74
    );   

INSERT INTO wowClassSpells
    VALUES(
        116,
	4,
	'Shroud of Concealment',
	'',
	76
    );   

INSERT INTO wowClassSpells
    VALUES(
        117,
	4,
	'Tricks of the Trade',
	'',
	78
    );   

INSERT INTO wowClassSpells
    VALUES(
        118,
	4,
	'Crimson Tempest',
	'',
	83
    );   

INSERT INTO wowClassSpells
    VALUES(
        119,
	4,
	'Smoke Bomb',
	'',
	85
    );   


INSERT INTO wowSpecSpells
    VALUES(
        105,
	9,
	'Mutilate',
	'',
	10
    );


INSERT INTO wowSpecSpells
    VALUES(
        106,
	9,
	'Envenom',
	'',
	20
    );

INSERT INTO wowSpecSpells
    VALUES(
        107,
	9,
	'Seal Fate (Passive)',
	'',
	30
    );

INSERT INTO wowSpecSpells
    VALUES(
        108,
	9,
	'Dispatch',
	'',
	40
    );

INSERT INTO wowSpecSpells
    VALUES(
        109,
	9,
	'Rupture',
	'',
	46
    );

INSERT INTO wowSpecSpells
    VALUES(
        110,
	9,
	'Relentless Strikes (Passive)',
	'',
	54
    );

INSERT INTO wowSpecSpells
    VALUES(
        111,
	9,
	'Fan of Knives',
	'',
	66
    );

INSERT INTO wowSpecSpells
    VALUES(
        112,
	9,
	'Vendetta',
	'',
	80
    );

INSERT INTO wowSpecSpells
    VALUES(
        113,
	9,
	'Master Poisoner (Passive)',
	'',
	90
    );        

INSERT INTO wowSpecSpells
    VALUES(
        114,
	10,
	'Blade Furry',
	'',
	10
    );    

INSERT INTO wowSpecSpells
    VALUES(
        115,
	10,
	'Revealing Strike',
	'',
	20
    );    

INSERT INTO wowSpecSpells
    VALUES(
        116,
	10,
	'Combat Potency (Passive)',
	'',
	30
    );    

INSERT INTO wowSpecSpells
    VALUES(
        117,
	10,
	'Ruthlessness (Passive)',
	'',
	32
    );    

INSERT INTO wowSpecSpells
    VALUES(
        118,
	10,
	'Adrenaline Rush',
	'',
	40
    );    

INSERT INTO wowSpecSpells
    VALUES(
        119,
	10,
	'Bandits Guide (Passive)',
	'',
	60
    );    

INSERT INTO wowSpecSpells
    VALUES(
        120,
	10,
	'Killing Spree',
	'',
	80
    );    

INSERT INTO wowSpecSpells
    VALUES(
        121,
	11,
	'Hemorrhage',
	'',
	10
    );    

INSERT INTO wowSpecSpells
    VALUES(
        122,
	11,
	'Sinister Calling (Passive)',
	'',
	10
    );    

INSERT INTO wowSpecSpells
    VALUES(
        123,
	11,
	'Permediation',
	'',
	30
    );    

INSERT INTO wowSpecSpells
    VALUES(
        124,
	11,
	'Backstab',
	'',
	40
    );    

INSERT INTO wowSpecSpells
    VALUES(
        125,
	11,
	'Rupture',
	'',
	46
    );    

INSERT INTO wowSpecSpells
    VALUES(
        126,
	11,
	'Honor Amoung Thieves (Passive)',
	'',
	50
    );    

INSERT INTO wowSpecSpells
    VALUES(
        127,
	11,
	'Relentless Strikes (Passive)',
	'',
	54
    );    

INSERT INTO wowSpecSpells
    VALUES(
        128,
	11,
	'Sanguinary Vein (Passive)',
	'',
	60
    );    

INSERT INTO wowSpecSpells
    VALUES(
        129,
	11,
	'Fan of Knives',
	'',
	66
    );    

INSERT INTO wowSpecSpells
    VALUES(
        130,
	11,
	'Shadow Dance',
	'',
	80
    );    



/*
****************************************************************************************
*  Priest 5*****************************************************************************
****************************************************************************************
*/


INSERT INTO wowClassSpells
    VALUES(
        120,
	5,
	'Smite',
	'',
	1
    );   

INSERT INTO wowClassSpells
    VALUES(
        121,
	5,
	'Shadow Word: Pain',
	'',
	3
    );   

INSERT INTO wowClassSpells
    VALUES(
        122,
	5,
	'Power Word: Shield',
	'',
	5
    );   

INSERT INTO wowClassSpells
    VALUES(
        123,
	5,
	'Flash Heal',
	'',
	7
    );   

INSERT INTO wowClassSpells
    VALUES(
        124,
	5,
	'Resurrection',
	'',
	18
    );   

INSERT INTO wowClassSpells
    VALUES(
        125,
	5,
	'Power Word: Fortitude',
	'',
	22
    );   

INSERT INTO wowClassSpells
    VALUES(
        126,
	5,
	'Fade',
	'',
	24
    );   

INSERT INTO wowClassSpells
    VALUES(
        127,
	5,
	'Dispel Magic',
	'',
	26
    );   

INSERT INTO wowClassSpells
    VALUES(
        128,
	5,
	'Mind Sear',
	'',
	28
    );   

INSERT INTO wowClassSpells
    VALUES(
        129,
	5,
	'Shackle Undead',
	'',
	32
    );   

INSERT INTO wowClassSpells
    VALUES(
        130,
	5,
	'Levitate',
	'',
	34
    );   

INSERT INTO wowClassSpells
    VALUES(
        131,
	5,
	'Mind Vision',
	'',
	42
    );   

INSERT INTO wowClassSpells
    VALUES(
        132,
	5,
	'Shadowfiend',
	'',
	42
    );   

INSERT INTO wowClassSpells
    VALUES(
        133,
	5,
	'Fear Ward',
	'',
	54
    );   

INSERT INTO wowClassSpells
    VALUES(
        134,
	5,
	'Prayer of Mending',
	'',
	68
    );   

INSERT INTO wowClassSpells
    VALUES(
        135,
	5,
	'Mass Dispel',
	'',
	72
    );   

INSERT INTO wowClassSpells
    VALUES(
        136,
	5,
	'Keap of Faith',
	'',
	84
    );   

INSERT INTO wowSpecSpells
    VALUES(
        131,
	12,
	'Penance',
	'',
	10
    );            

INSERT INTO wowSpecSpells
    VALUES(
        132,
	12,
	'Holy Fire',
	'',
	18
    );     

INSERT INTO wowSpecSpells
    VALUES(
        133,
	12,
	'Holy Nova',
	'',
	20
    );     

INSERT INTO wowSpecSpells
    VALUES(
        134,
	12,
	'Purify',
	'',
	22
    );     

INSERT INTO wowSpecSpells
    VALUES(
        135,
	12,
	'Divine Aegis (Passive)',
	'',
	24
    );     

INSERT INTO wowSpecSpells
    VALUES(
        136,
	12,
	'Focused Will (Passive)',
	'',
	30
    );     

INSERT INTO wowSpecSpells
    VALUES(
        137,
	12,
	'Heal',
	'',
	34
    );     

INSERT INTO wowSpecSpells
    VALUES(
        138,
	12,
	'Atonement (Passive)',
	'',
	38
    );     

INSERT INTO wowSpecSpells
    VALUES(
        139,
	12,
	'Evangelism (Passive)',
	'',
	44
    );     

INSERT INTO wowSpecSpells
    VALUES(
        140,
	12,
	'Prayer of Healing',
	'',
	46
    );     

INSERT INTO wowSpecSpells
    VALUES(
        141,
	12,
	'Archangel',
	'',
	50
    );     

INSERT INTO wowSpecSpells
    VALUES(
        142,
	12,
	'Silence',
	'',
	52
    );     

INSERT INTO wowSpecSpells
    VALUES(
        143,
	12,
	'Pain Suppression',
	'',
	58
    );     

INSERT INTO wowSpecSpells
    VALUES(
        144,
	12,
	'Power Word: Barrier',
	'',
	70
    );     

INSERT INTO wowSpecSpells
    VALUES(
        145,
	12,
	'Enlightenment (Passive)',
	'',
	90
    );     

INSERT INTO wowSpecSpells
    VALUES(
        146,
	13,
	'Holy Word: Chastise',
	'',
	10
    );     

INSERT INTO wowSpecSpells
    VALUES(
        147,
	13,
	'Holy Fire',
	'',
	18
    );    

INSERT INTO wowSpecSpells
    VALUES(
        148,
	13,
	'Purify',
	'',
	22
    );    

INSERT INTO wowSpecSpells
    VALUES(
        149,
	13,
	'Renew',
	'',
	26
    );    

INSERT INTO wowSpecSpells
    VALUES(
        150,
	13,
	'Spirit of Redemption (Passive)',
	'',
	30
    );    

INSERT INTO wowSpecSpells
    VALUES(
        151,
	13,
	'Focused Will (Passive)',
	'',
	30
    );    

INSERT INTO wowSpecSpells
    VALUES(
        152,
	13,
	'Heal',
	'',
	34
    );    

INSERT INTO wowSpecSpells
    VALUES(
        153,
	13,
	'Serendipity (Passive)',
	'',
	34
    );    

INSERT INTO wowSpecSpells
    VALUES(
        154,
	13,
	'Lightwell',
	'',
	36
    );    

INSERT INTO wowSpecSpells
    VALUES(
        155,
	13,
	'Prayer of Healing',
	'',
	46
    );    

INSERT INTO wowSpecSpells
    VALUES(
        156,
	13,
	'Binding Heal',
	'',
	48
    );    

INSERT INTO wowSpecSpells
    VALUES(
        157,
	13,
	'Circle of Healing',
	'',
	50
    );    

INSERT INTO wowSpecSpells
    VALUES(
        158,
	13,
	'Chakra: Chastise',
	'',
	56
    );    

INSERT INTO wowSpecSpells
    VALUES(
        159,
	13,
	'Chakra: Sanctuary',
	'',
	56
    );    

INSERT INTO wowSpecSpells
    VALUES(
        160,
	13,
	'Chakra: Serenity',
	'',
	56
    );    

INSERT INTO wowSpecSpells
    VALUES(
        161,
	13,
	'Guardian Spirit',
	'',
	70
    );    

INSERT INTO wowSpecSpells
    VALUES(
        162,
	13,
	'Divine Hymn',
	'',
	78
    );    

INSERT INTO wowSpecSpells
    VALUES(
        163,
	13,
	'Divine Providence (Passive)',
	'',
	90
    );    


INSERT INTO wowSpecSpells
    VALUES(
        164,
	14,
	'Mind Flay',
	'',
	10
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        165,
	14,
	'Mind Blast',
	'',
	21
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        166,
	14,
	'Devouring Plague',
	'',
	21
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        167,
	14,
	'Shadowform',
	'',
	24
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        168,
	14,
	'Mind Quickening (Passive)',
	'',
	26
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        169,
	14,
	'Vampiric Touch',
	'',
	28
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        170,
	14,
	'Shadowy Apparitions (Passive)',
	'',
	42
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        171,
	14,
	'Mind Spike',
	'',
	44
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        172,
	14,
	'Shadow Word: Death',
	'',
	46
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        173,
	14,
	'Slience',
	'',
	52
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        174,
	14,
	'Dispersion',
	'',
	60
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        175,
	14,
	'Psychic Horror',
	'',
	74
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        176,
	14,
	'Vampiric Embrace',
	'',
	78
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        177,
	14,
	'Mastermind (Passive)',
	'',
	90
    ); 


/*
*********************************************************************************************
* Death Knight 6*****************************************************************************
*********************************************************************************************
*/
        
/*
****************************************************************************************
*  Shaman 7*****************************************************************************
****************************************************************************************
*/

        
/*
****************************************************************************************
*   Mage  8*****************************************************************************
****************************************************************************************
*/
        

/*
****************************************************************************************
* Warlock 9*****************************************************************************
****************************************************************************************
*/
        
/*
*****************************************************************************************
*   Monk  10*****************************************************************************
*****************************************************************************************
*/
        
/*
*****************************************************************************************
*  Druid  11*****************************************************************************
*****************************************************************************************
*/


/*wowTalents*/
/*
****************************************************************************************
* Warrior 1*****************************************************************************
****************************************************************************************
*/
INSERT INTO wowTalents
    VALUES (
        0,
	1,
    	0,
    	'Juggernaut',
    	'',
    	15
    );

INSERT INTO wowTalents
    VALUES (
        1,
    	1,
    	0,
      	'Double Time',
    	'',
    	15
    );

INSERT INTO wowTalents
    VALUES (
        2,
    	1,
    	0,
    	'Warbringer',
    	'',
    	15
    );

INSERT INTO wowTalents
    VALUES (
        3,
    	1,
    	0,
    	'Enraged Regeneration',
    	'',
    	30
    );

INSERT INTO wowTalents
    VALUES (
        4,
    	1,
    	0,
    	'Second Wind',
    	'',
    	30
    );

INSERT INTO wowTalents
    VALUES (
        5,
        1,
        0,
        'Impending Victory',
        '',
        30
    );

INSERT INTO wowTalents
    VALUES (
        6,
        1,
        0,
        'Taste for Blood',
        '',
        45
    );

INSERT INTO wowTalents
    VALUES (
        7,
        1,
        0,
        'Sudden Death',
        '',
        45
    );

INSERT INTO wowTalents
    VALUES (
        8,
    	1,
    	0,
    	'Slam',
    	'',
    	45
    );

INSERT INTO wowTalents
    VALUES (
        9,
    	1,
    	0,
    	'Storm Bolt',
    	'',
    	60
    );

INSERT INTO wowTalents 
    VALUES (
        10,
        1,
        0,
        'Shockwave',
        '',
        60
    );

INSERT INTO wowTalents
    VALUES (
        11,
    	1,
    	0,
    	'Dragon Roar',
    	'',
    	60
    );

INSERT INTO wowTalents
    VALUES (
        12,
    	1,
    	0,
    	'Mass Spell Reflection',
    	'',
    	75
    );

INSERT INTO wowTalents
    VALUES (
        13,
        1,
    	0,
    	'Safeguard',
    	'',
     	75
    );

INSERT INTO wowTalents
    VALUES (
        14,
        1,
    	0,
    	'Vigilance',
    	'',
    	75
    );

INSERT INTO wowTalents
    VALUES (
        15,
    	1,
    	0,
    	'Avatar',
    	'',
    	90
    );

INSERT INTO wowTalents
    VALUES (
        16,
    	1,
    	0,
    	'Bloodbath',
    	'',
    	90
    );

INSERT INTO wowTalents
    VALUES (
        17,
        1,
    	0,
    	'Bladestrom',
    	'',
    	90
    );

INSERT INTO wowTalents
    VALUES (
        18,
        1,
        0,
        'Anger Management',
        '',
    100);

INSERT INTO wowTalents VALUES(
    19,
    1,
    0,
    'Ravager',
    '',
    100);

INSERT INTO wowTalents VALUES(
    20,
    1,
    0,
    'Siegebreaker',
    '',
    100);

INSERT INTO wowTalents VALUES (
    21,
    1,
    1,
    'Juggernaut',
    '',
    15);

INSERT INTO wowTalents VALUES (
    22,
    1,
    1,
    'Double Time',
    '',
    15);

INSERT INTO wowTalents VALUES (
    23,
    1,
    1,
    'Warbringer',
    '',
    15);

INSERT INTO wowTalents VALUES (
    24,
    1,
    1,
    'Enraged Regeneration',
    '',
    30);

INSERT INTO wowTalents VALUES (
    25,
    1,
    1,
    'Second Wind',
    '',
    30);

INSERT INTO wowTalents VALUES (
    26,
    1,
    1,
    'Impending Victory',
    '',
    30);

INSERT INTO wowTalents VALUES (
    27,
    1,
    1,
    'Furious Strikes',
    '',
    45);

INSERT INTO wowTalents VALUES (
    28,
    1,
    1,
    'Sudden Death',
    '',
    45);

INSERT INTO wowTalents VALUES (
    29,
    1,
    1,
    'Unquenchable Thirst',
    '',
    45);

INSERT INTO wowTalents VALUES (
    30,
    1,
    1,
    'Storm Bolt',
    '',
    60);

INSERT INTO wowTalents VALUES (
    31,
    1,
    1,
    'Shockwave',
    '',
    60);

INSERT INTO wowTalents VALUES (
    32,
    1,
    1,
    'Dragon Roar',
    '',
    60);

INSERT INTO wowTalents VALUES (
    33,
    1,
    1,
    'Mass Spell Reflection',
    '',
    75);

INSERT INTO wowTalents VALUES (
    34,
    1,
    1,
    'Safeguard',
    '',
    75);

INSERT INTO wowTalents VALUES (
    35,
    1,
    1,
    'Vigilance',
    '',
    75);

INSERT INTO wowTalents VALUES (
    36,
    1,
    1,
    'Avatar',
    '',
    90);

INSERT INTO wowTalents VALUES (
    37,
    1,
    1,
    'Bloodbath',
    '',
    90);

INSERT INTO wowTalents VALUES (
    38,
    1,
    1,
    'Bladestorm',
    '',
    90);

INSERT INTO wowTalents VALUES (
    39,
    1,
    1,
    'Anger Management',
    '',
    100);

INSERT INTO wowTalents VALUES (
    40,
    1,
    1,
    'Ravager',
    '',
    100);

INSERT INTO wowTalents VALUES (
    41,
    1,
    1,
    'Seigebreaker',
    '',
    100);

INSERT INTO wowTalents VALUES (
    42,
    1,
    2,
    'Juggernaut',
    '',
    15);

INSERT INTO wowTalents VALUES (
    43,
    1,
    2,
    'Double Time',
    '',
    15);

INSERT INTO wowTalents VALUES(
    44,
    1,
    2,
    'Warbringer',
    '',
    15);

INSERT INTO wowTalents VALUES(
    45,
    1,
    2,
    'Enraged Regeneration',
    '',
    30);

INSERT INTO wowTalents VALUES(
    46,
    1,
    2,
    'Second Wind',
    '',
    30);

INSERT INTO wowTalents VALUES(
    47,
    1,
    2,
    'Impending Victory',
    '',
    30);

INSERT INTO wowTalents VALUES(
    48,
    1,
    2,
    'Heavy Repercussions',
    '',
    45);

INSERT INTO wowTalents VALUES(
    49,
    1,
    2,
    'Sudden Death',
    '',
    45);

INSERT INTO wowTalents VALUES(
    50,
    1,
    2,
    'Unyielding Strikes',
    '',
    45);

INSERT INTO wowTalents VALUES(
    51,
    1,
    2,
    'Storm Bolt',
    '',
    60);

INSERT INTO wowTalents VALUES(
    52,
    1,
    2,
    'Shockwave',
    '',
    60);

INSERT INTO wowTalents VALUES(
    53,
    1,
    2,
    'Dragon Roar',
    '',
    60);

INSERT INTO wowTalents VALUES(
    54,
    1,
    2,
    'Mass Spell Reflection',
    '',
    75);

INSERT INTO wowTalents VALUES (
    55,
    1,
    2,
    'Safeguard',
    '',
    75);

INSERT INTO wowTalents VALUES(
    56,
    1,
    2,
    'Vigilance',
    '',
    75);

INSERT INTO wowTalents VALUES(
    57,
    1,
    2,
    'Avatar',
    '',
    90);

INSERT INTO wowTalents VALUES (
    58,
    1,
    2,
    'Bloodbath',
    '',
    90);

INSERT INTO wowTalents VALUES(
    59,
    1,
    2,
    'Bladestorm',
    '',
    90);

INSERT INTO wowTalents VALUES(
    60,
    1,
    2,
    'Anger Management',
    '',
    100);

INSERT INTO wowTalents VALUES(
    61,
    1,
    2,
    'Ravger',
    '',
    100);

INSERT INTO wowTalents VALUES(
    62,
    1,
    2,
    'Gladiators Resolve',
    '',
    100);

    
/*
****************************************************************************************
* Paladin 2*****************************************************************************
****************************************************************************************
*/

INSERT INTO wowTalents VALUES(
    63,
    2,
    3,
    'Speed of Light',
    '',
    15);

INSERT INTO wowTalents VALUES(
    64,
    2,
    3,
    'Long Arm of the Law',
    '',
    15);

INSERT INTO wowTalents VALUES(
    65,
    2,
    3,
    'Pursuit of Justice',
    '',
    15);

INSERT INTO wowTalents VALUES(
    66,
    2,
    3,
    'Fist of Justice',
    '',
    30);

INSERT INTO wowTalents VALUES(
    67,
    2,
    3,
    'Repentance',
    '',
    30);

INSERT INTO wowTalents VALUES(
    68,
    2,
    3,
    'Blinding Light',
    '',
    30);

INSERT INTO wowTalents VALUES(
    69,
    2,
    3,
    'Selfless Healer',
    '',
    45);

INSERT INTO wowTalents VALUES(
    70,
    2,
    3,
    'Eternal Flame',
    '',
    45);

INSERT INTO wowTalents VALUES(
    71,
    2,
    3,
    'Sacred Shield',
    '',
    45);

INSERT INTO wowTalents VALUES(
    72,
    2,
    3,
    'Hand of Purity',
    '',
    60);

INSERT INTO wowTalents VALUES(
    73,
    2,
    3,
    'Unbreakable Spirit',
    '',
    60);

INSERT INTO wowTalents VALUES(
    74,
    2,
    3,
    'Clemency',
    '',
    60);

INSERT INTO wowTalents VALUES(
    75,
    2,
    3,
    'Holy Avenger',
    '',
    75);

INSERT INTO wowTalents VALUES(
    76,
    2,
    3,
    'Sanctified Wrath',
    '',
    75);

INSERT INTO wowTalents VALUES(
    77,
    2,
    3,
    'Divine Purpose',
    '',
    75);

INSERT INTO wowTalents VALUES(
    78,
    2,
    3,
    'Holy Prism',
    '',
    90);

INSERT INTO wowTalents VALUES(
    79,
    2,
    3,
    'Lights Hammer',
    '',
    90);

INSERT INTO wowTalents VALUES(
    80,
    2,
    3,
    'Execution Sentence',
    '',
    90);

INSERT INTO wowTalents VALUES(
    81,
    2,
    3,
    'Beacon of Faith',
    '',
    100);

INSERT INTO wowTalents VALUES(
    82,
    2,
    3,
    'Beacon of insight',
    '',
    100);

INSERT INTO wowTalents VALUES(
    83,
    2,
    3,
    'Saved by the Light',
    '',
    100);


INSERT INTO wowTalents VALUES(
    84,
    2,
    4,
    'Speed of Light',
    '',
    15);

INSERT INTO wowTalents VALUES(
    85,
    2,
    4,
    'Long Arm of the Law',
    '',
    15);

INSERT INTO wowTalents VALUES(
    86,
    2,
    4,
    'Pursuit of Justice',
    '',
    15);

INSERT INTO wowTalents VALUES(
    87,
    2,
    4,
    'Fist of Justice',
    '',
    30);

INSERT INTO wowTalents VALUES(
    88,
    2,
    4,
    'Repentance',
    '',
    30);

INSERT INTO wowTalents VALUES(
    89,
    2,
    4,
    'Binding Light',
    '',
    30);

INSERT INTO wowTalents VALUES(
    90,
    2,
    4,
    'Selfless Healer',
    '',
    45);

INSERT INTO wowTalents VALUES(
    91,
    2,
    4,
    'Eternal Flame',
    '',
    45);

INSERT INTO wowTalents VALUES(
    92,
    2,
    4,
    'Sacred Shield',
    '',
    45);

INSERT INTO wowTalents VALUES(
    93,
    2,
    4,
    'Hand of Purity',
    '',
    60);

INSERT INTO wowTalents VALUES(
    94,
    2,
    4,
    'Unbreakable Spirit',
    '',
    60);

INSERT INTO wowTalents VALUES(
    95,
    2,
    4,
    'Clemency',
    '',
    60);

INSERT INTO wowTalents VALUES(
    96,
    2,
    4,
    'Holy Avenger',
    '',
    75);

INSERT INTO wowTalents VALUES(
    97,
    2,
    4,
    'Sanctified Wrath',
    '',
    75);

INSERT INTO wowTalents VALUES(
    98,
    2,
    4,
    'Divine Purpose',
    '',
    75);

INSERT INTO wowTalents VALUES(
    99,
    2,
    4,
    'Holy Prism',
    '',
    90);

INSERT INTO wowTalents VALUES(
    100,
    2,
    4,
    'Lights Hammer',
    '',
    90);

INSERT INTO wowTalents VALUES(
    101,
    2,
    4,
    'Execution Sentence',
    '',
    90);

INSERT INTO wowTalents VALUES(
    102,
    2,
    4,
    'Emposered Seals',
    '',
    100);

INSERT INTO wowTalents VALUES(
    103,
    2,
    4,
    'Seraphim',
    '',
    100);

INSERT INTO wowTalents VALUES(
    104,
    2,
    4,
    'Holy Shield',
    '',
    100);




INSERT INTO wowTalents VALUES(
    105,
    2,
    5,
    'Speed of Light',
    '',
    15);

INSERT INTO wowTalents VALUES(
    106,
    2,
    5,
    'Long Arm of the Law',
    '',
    15);

INSERT INTO wowTalents VALUES(
    107,
    2,
    5,
    'Pursuit of Justice',
    '',
    15);

INSERT INTO wowTalents VALUES(
    108,
    2,
    5,
    'Fist of Justice',
    '',
    30);

INSERT INTO wowTalents VALUES(
    109,
    2,
    5,
    'Repentance',
    '',
    30);

INSERT INTO wowTalents VALUES(
    110,
    2,
    5,
    'Blinding Light',
    '',
    30);

INSERT INTO wowTalents VALUES(
    111,
    2,
    5,
    'Selfless Healer',
    '',
    45);

INSERT INTO wowTalents VALUES(
    112,
    2,
    5,
    'Eternal Flame',
    '',
    45);

INSERT INTO wowTalents VALUES(
    113,
    2,
    5,
    'Sacred Shield',
    '',
    45);

INSERT INTO wowTalents VALUES(
    114,
    2,
    5,
    'Hand of Purity',
    '',
    60);

INSERT INTO wowTalents VALUES(
    115,
    2,
    5,
    'Unbreakable Spirit',
    '',
    60);

INSERT INTO wowTalents VALUES(
    116,
    2,
    5,
    'Clemency',
    '',
    60);

INSERT INTO wowTalents VALUES(
    117,
    2,
    5,
    'Holy Avenger',
    '',
    75);

INSERT INTO wowTalents VALUES(
    118,
    2,
    5,
    'Sanctified Wrath',
    '',
    75);

INSERT INTO wowTalents VALUES(
    119,
    2,
    5,
    'Divine Purpose',
    '',
    75);

INSERT INTO wowTalents VALUES(
    120,
    2,
    5,
    'Holy Prism',
    '',
    90);

INSERT INTO wowTalents VALUES(
    121,
    2,
    5,
    'Lights Hammer',
    '',
    90);

INSERT INTO wowTalents VALUES(
    122,
    2,
    5,
    'Execution Sentence',
    '',
    90);

INSERT INTO wowTalents VALUES(
    123,
    2,
    5,
    'Empowered Seals',
    '',
    100);

INSERT INTO wowTalents VALUES(
    124,
    2,
    5,
    'Seraphim',
    '',
    100);

INSERT INTO wowTalents VALUES(
    125,
    2,
    5,
    'Final Verdict',
    '',
    100);


/*
****************************************************************************************
*  Hunter 3*****************************************************************************
****************************************************************************************
*/
INSERT INTO wowTalents VALUES(
    126,
    3,
    6,
    'Posthaste',
    '',
    15);

INSERT INTO wowTalents VALUES(
    127,
    3,
    6,
    'Narrow Escape',
    '',
    15);

INSERT INTO wowTalents VALUES(
    128,
    3,
    6,
    'Crouching Tiger, Hidden Chimaera',
    '',
    15);

INSERT INTO wowTalents VALUES(
    129,
    3,
    6,
    'Binding Shot',
    '',
    30);

INSERT INTO wowTalents VALUES(
    130,
    3,
    6,
    'Wyvern Sting',
    '',
    30);

INSERT INTO wowTalents VALUES(
    131,
    3,
    6,
    'Intimidation',
    '',
    30);

INSERT INTO wowTalents VALUES(
    132,
    3,
    6,
    'Exhilaration',
    '',
    45);

INSERT INTO wowTalents VALUES(
    133,
    3,
    6,
    'Iron Hawk',
    '',
    45);

INSERT INTO wowTalents VALUES(
    134,
    3,
    6,
    'Spirit Bond',
    '',
    45);

INSERT INTO wowTalents VALUES(
    135,
    3,
    6,
    'Steady Focus',
    '',
    60);

INSERT INTO wowTalents VALUES(
    136,
    3,
    6,
    'Dire Beast',
    '',
    60);

INSERT INTO wowTalents VALUES(
    137,
    3,
    6,
    'Thrill of the Hunt',
    '',
    60);

INSERT INTO wowTalents VALUES(
    138,
    3,
    6,
    'A Murder of Crows',
    '',
    75);

INSERT INTO wowTalents VALUES(
    139,
    3,
    6,
    'Blink Strikes',
    '',
    75);

INSERT INTO wowTalents VALUES(
    140,
    3,
    6,
    'Stampede',
    '',
    75);

INSERT INTO wowTalents VALUES(
    141,
    3,
    6,
    'Glaive Toss',
    '',
    90);

INSERT INTO wowTalents VALUES(
    142,
    3,
    6,
    'Powershot',
    '',
    90);

INSERT INTO wowTalents VALUES(
    143,
    3,
    6,
    'Barrage',
    '',
    90);

INSERT INTO wowTalents VALUES(
    144,
    3,
    6,
    'Exotic Munitions',
    '',
    100);

INSERT INTO wowTalents VALUES(
    145,
    3,
    6,
    'Focusing Shot',
    '',
    100);

INSERT INTO wowTalents VALUES(
    146,
    3,
    6,
    'Adaptation',
    '',
    100);


INSERT INTO wowTalents VALUES(
    147,
    3,
    7,
    'Posthaste',
    '',
    15);

INSERT INTO wowTalents VALUES(
    148,
    3,
    7,
    'Narrow Escape',
    '',
    15);

INSERT INTO wowTalents VALUES(
    149,
    3,
    7,
    'Crouching Tiger, Hidden Chimaera',
    '',
    15);

INSERT INTO wowTalents VALUES(
    150,
    3,
    7,
    'Binding Shot',
    '',
    30);

INSERT INTO wowTalents VALUES(
    151,
    3,
    7,
    'Wyvern Sting',
    '',
    30);

INSERT INTO wowTalents VALUES(
    152,
    3,
    7,
    'Intimidation',
    '',
    30);

INSERT INTO wowTalents VALUES(
    153,
    3,
    7,
    'Exhilaration',
    '',
    45);

INSERT INTO wowTalents VALUES(
    154,
    3,
    7,
    'Iron Hawk',
    '',
    45);

INSERT INTO wowTalents VALUES(
    155,
    3,
    7,
    'Spirit Bond',
    '',
    45);

INSERT INTO wowTalents VALUES(
    156,
    3,
    7,
    'Steady Focus',
    '',
    60);

INSERT INTO wowTalents VALUES(
    157,
    3,
    7,
    'Dire Beast',
    '',
    60);

INSERT INTO wowTalents VALUES(
    158,
    3,
    7,
    'Thrill of the Hunt',
    '',
    60);

INSERT INTO wowTalents VALUES(
    159,
    3,
    7,
    'A Murder of Crows',
    '',
    75);

INSERT INTO wowTalents VALUES(
    160,
    3,
    7,
    'Blink Strikes',
    '',
    75);

INSERT INTO wowTalents VALUES(
    161,
    3,
    7,
    'Stampede',
    '',
    75);

INSERT INTO wowTalents VALUES(
    162,
    3,
    7,
    'Glaive Toss',
    '',
    90);

INSERT INTO wowTalents VALUES(
    163,
    3,
    7,
    'Powershot',
    '',
    90);

INSERT INTO wowTalents VALUES(
    164,
    3,
    7,
    'Barrage',
    '',
    90);

INSERT INTO wowTalents VALUES(
    165,
    3,
    7,
    'Exotic Munitions',
    '',
    100);

INSERT INTO wowTalents VALUES(
    166,
    3,
    7,
    'Focusing Shot',
    '',
    100);

INSERT INTO wowTalents VALUES(
    167,
    3,
    7,
    'Lone Wolf',
    '',
    100);




INSERT INTO wowTalents VALUES(
    168,
    3,
    8,
    'Posthaste',
    '',
    15);

INSERT INTO wowTalents VALUES(
    169,
    3,
    8,
    'Narrow Escape',
    '',
    15);

INSERT INTO wowTalents VALUES(
    170,
    3,
    8,
    'Crouching Tiger, Hidden Chimaera',
    '',
    15);

INSERT INTO wowTalents VALUES(
    171,
    3,
    8,
    'Binding Shot',
    '',
    30);

INSERT INTO wowTalents VALUES(
    172,
    3,
    8,
    'Wyvern Sting',
    '',
    30);

INSERT INTO wowTalents VALUES(
    173,
    3,
    8,
    'Intimidation',
    '',
    30);

INSERT INTO wowTalents VALUES(
    174,
    3,
    8,
    'Exhilaration',
    '',
    45);

INSERT INTO wowTalents VALUES(
    175,
    3,
    8,
    'Iron Hawk',
    '',
    45);

INSERT INTO wowTalents VALUES(
    176,
    3,
    8,
    'Spirit Bond',
    '',
    45);

INSERT INTO wowTalents VALUES(
    177,
    3,
    8,
    'Steady Focus',
    '',
    60);

INSERT INTO wowTalents VALUES(
    178,
    3,
    8,
    'Dire Beast',
    '',
    60);

INSERT INTO wowTalents VALUES(
    179,
    3,
    8,
    'Thrill of the Hunt',
    '',
    60);

INSERT INTO wowTalents VALUES(
    180,
    3,
    8,
    'A Murder of Crows',
    '',
    75);

INSERT INTO wowTalents VALUES(
    181,
    3,
    8,
    'Blink Strikes',
    '',
    75);

INSERT INTO wowTalents VALUES(
    182,
    3,
    8,
    'Stampede',
    '',
    75);

INSERT INTO wowTalents VALUES(
    183,
    3,
    8,
    'Glaive Toss',
    '',
    90);

INSERT INTO wowTalents VALUES(
    184,
    3,
    8,
    'Powershot',
    '',
    90);

INSERT INTO wowTalents VALUES(
    185,
    3,
    8,
    'Barrage',
    '',
    90);

INSERT INTO wowTalents VALUES(
    186,
    3,
    8,
    'Exotic Munitions',
    '',
    100);

INSERT INTO wowTalents VALUES(
    187,
    3,
    8,
    'Focusing Shot',
    '',
    100);

INSERT INTO wowTalents VALUES(
    188,
    3,
    8,
    'Lone Wolf',
    '',
    100);

/*
****************************************************************************************
*  Rogue  4*****************************************************************************
****************************************************************************************
*/
INSERT INTO wowTalents 
    VALUES(
        189,
        4,
        9,
        'Nightstalker',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        190,
        4,
        9,
        'Subterfuge',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        191,
        4,
        9,
        'Shadow Focus',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        192,
        4,
        9,
        'Deadly Throw',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        193,
        4,
        9,
        'Nerve Strike',
        '',
        30
    );


INSERT INTO wowTalents 
    VALUES(
        194,
        4,
        9,
        'Combate Readiness',
        '',
        30
    );


INSERT INTO wowTalents 
    VALUES(
        195,
        4,
        9,
        'Cheat Death',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        196,
        4,
        9,
        'Leeching Posion',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        197,
        4,
        9,
        'Elusiveness',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        198,
        4,
        9,
        'Cloak and Dagger',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        199,
        4,
        9,
        'Shadowstep',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        200,
        4,
        9,
        'Burst of Speed',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        201,
        4,
        9,
        'Prey on the Weak',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        202,
        4,
        9,
        'Internal Bleeding',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        203,
        4,
        9,
        'Dirty Tricks',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        204,
        4,
        9,
        'Shuriken Toss',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        205,
        4,
        9,
        'Marked for Death',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        206,
        4,
        9,
        'Anticipation',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        207,
        4,
        9,
        'Venom Rush',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        208,
        4,
        9,
        'Shadow Reflection',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        209,
        4,
        9,
        'Death from Above',
        '',
        100
    );


INSERT INTO wowTalents 
    VALUES(
        210,
        4,
        10,
        'Nightstalker',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        211,
        4,
        10,
        'Subterfuge',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        212,
        4,
        10,
        'Shadow Focus',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        213,
        4,
        10,
        'Deadly Throw',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        214,
        4,
        10,
        'Nerve Strike',
        '',
        30
    );


INSERT INTO wowTalents 
    VALUES(
        215,
        4,
        10,
        'Combate Readiness',
        '',
        30
    );


INSERT INTO wowTalents 
    VALUES(
        216,
        4,
        10,
        'Cheat Death',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        217,
        4,
        10,
        'Leeching Posion',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        218,
        4,
        10,
        'Elusiveness',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        219,
        4,
        10,
        'Cloak and Dagger',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        220,
        4,
        10,
        'Shadowstep',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        221,
        4,
        10,
        'Burst of Speed',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        222,
        4,
        10,
        'Prey on the Weak',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        223,
        4,
        10,
        'Internal Bleeding',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        224,
        4,
        10,
        'Dirty Tricks',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        225,
        4,
        10,
        'Shuriken Toss',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        226,
        4,
        10,
        'Marked for Death',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        227,
        4,
        10,
        'Anticipation',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        228,
        4,
        10,
        'Venom Rush',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        229,
        4,
        10,
        'Shadow Reflection',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        230,
        4,
        10,
        'Death from Above',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        231,
        4,
        11,
        'Nightstalker',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        232,
        4,
        11,
        'Subterfuge',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        233,
        4,
        11,
        'Shadow Focus',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        234,
        4,
        11,
        'Deadly Throw',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        235,
        4,
        11,
        'Nerve Strike',
        '',
        30
    );


INSERT INTO wowTalents 
    VALUES(
        236,
        4,
        11,
        'Combate Readiness',
        '',
        30
    );


INSERT INTO wowTalents 
    VALUES(
        237,
        4,
        11,
        'Cheat Death',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        238,
        4,
        11,
        'Leeching Posion',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        239,
        4,
        11,
        'Elusiveness',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        240,
        4,
        11,
        'Cloak and Dagger',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        241,
        4,
        11,
        'Shadowstep',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        242,
        4,
        11,
        'Burst of Speed',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        243,
        4,
        11,
        'Prey on the Weak',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        244,
        4,
        11,
        'Internal Bleeding',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        245,
        4,
        11,
        'Dirty Tricks',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        246,
        4,
        11,
        'Shuriken Toss',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        247,
        4,
        11,
        'Marked for Death',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        248,
        4,
        11,
        'Anticipation',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        249,
        4,
        11,
        'Venom Rush',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        250,
        4,
        11,
        'Shadow Reflection',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        251,
        4,
        11,
        'Death from Above',
        '',
        100
    );
/*
****************************************************************************************
*  Priest 5*****************************************************************************
****************************************************************************************
*/
INSERT INTO wowTalents 
    VALUES(
        252,
        5,
        12,
        'Desprate Prayer',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        253,
        5,
        12,
        'Spectral Guise',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        254,
        5,
        12,
        'Angelic Bulwark',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        255,
        5,
        12,
        'Body and Soul',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        256,
        5,
        12,
        'Angelic Feather',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        257,
        5,
        12,
        'Phantasm',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        258,
        5,
        12,
        'Surge of Light',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        259,
        5,
        12,
        'Mindbender',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        260,
        5,
        12,
        'Power Word: Solace',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        261,
        5,
        12,
        'Void Tendrils',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        262,
        5,
        12,
        'Psychic Scream',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        263,
        5,
        12,
        'Dominate Mind',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        264,
        5,
        12,
        'Twist of Fate',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        265,
        5,
        12,
        'Power Infusion',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        266,
        5,
        12,
        'Spirit Shell',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        267,
        5,
        12,
        'Cascade',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        268,
        5,
        12,
        'Divine Star',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        269,
        5,
        12,
        'Halo',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        270,
        5,
        12,
        'Clarity of Will',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        271,
        5,
        12,
        'Words of Mending',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        272,
        5,
        12,
        'Saving Grace',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        273,
        5,
        13,
        'Desprate Prayer',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        274,
        5,
        13,
        'Spectral Guise',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        275,
        5,
        13,
        'Angelic Bulwark',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        276,
        5,
        13,
        'Body and Soul',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        277,
        5,
        13,
        'Angelic Feather',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        278,
        5,
        13,
        'Phantasm',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        279,
        5,
        13,
        'Surge of Light',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        280,
        5,
        13,
        'Mindbender',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        281,
        5,
        13,
        'Power Word: Solace',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        282,
        5,
        13,
        'Void Tendrils',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        283,
        5,
        13,
        'Psychic Scream',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        284,
        5,
        13,
        'Dominate Mind',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        285,
        5,
        13,
        'Twist of Fate',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        286,
        5,
        13,
        'Power Infusion',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        287,
        5,
        13,
        'Devine Insight',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        288,
        5,
        13,
        'Cascade',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        289,
        5,
        13,
        'Divine Star',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        290,
        5,
        13,
        'Halo',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        291,
        5,
        13,
        'Clarity of Purpose',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        292,
        5,
        13,
        'Words of Mending',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        293,
        5,
        13,
        'Saving Grace',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        294,
        5,
        14,
        'Desperate Prayer',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        295,
        5,
        14,
        'Spectral Guise',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        296,
        5,
        14,
        'Angelic Bulwark',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        297,
        5,
        14,
        'Body and Soul',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        298,
        5,
        14,
        'Angelic Feather',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        299,
        5,
        14,
        'Phantasm',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        300,
        5,
        14,
        'Surge of Darkness',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        301,
        5,
        14,
        'mindbender',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        302,
        5,
        14,
        'Insanity',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        303,
        5,
        14,
        'Void Tendrils',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        304,
        5,
        14,
        'Psychic Scream',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        305,
        5,
        14,
        'Dominate Mind',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        306,
        5,
        14,
        'Twist of Fate',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        307,
        5,
        14,
        'Power Infusion',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        308,
        5,
        14,
        'Shadowy Insight',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        309,
        5,
        14,
        'Cascade',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        310,
        5,
        14,
        'Divine Star',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        311,
        5,
        14,
        'Halo',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        312,
        5,
        14,
        'Clarity of Power',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        313,
        5,
        14,
        'Void Entropy',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        314,
        5,
        14,
        'Auspicious Spirits',
        '',
        100
    );


/*
*********************************************************************************************
* Death Knight 6*****************************************************************************
*********************************************************************************************
*/
INSERT INTO wowTalents 
    VALUES(
        315,
        6,
        15,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        316,
        6,
        15,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        317,
        6,
        15,
        '',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        318,
        6,
        15,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        319,
        6,
        15,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        320,
        6,
        15,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        321,
        6,
        15,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        322,
        6,
        15,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        323,
        6,
        15,
        '',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        324,
        6,
        15,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        325,
        6,
        15,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        326,
        6,
        15,
        '',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        327,
        6,
        15,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        328,
        6,
        15,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        329,
        6,
        15,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        330,
        6,
        15,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        331,
        6,
        15,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        332,
        6,
        15,
        '',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        333,
        6,
        15,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        334,
        6,
        15,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        335,
        6,
        15,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        336,
        6,
        16,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        337,
        6,
        16,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        338,
        6,
        16,
        '',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        339,
        6,
        16,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        340,
        6,
        16,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        341,
        6,
        16,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        342,
        6,
        16,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        343,
        6,
        16,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        344,
        6,
        16,
        '',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        345,
        6,
        16,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        346,
        6,
        16,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        347,
        6,
        16,
        '',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        348,
        6,
        16,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        349,
        6,
        16,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        350,
        6,
        16,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        351,
        6,
        16,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        352,
        6,
        16,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        353,
        6,
        16,
        '',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        354,
        6,
        16,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        355,
        6,
        16,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        356,
        6,
        16,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        357,
        6,
        17,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        358,
        6,
        17,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        359,
        6,
        17,
        '',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        360,
        6,
        17,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        361,
        6,
        17,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        362,
        6,
        17,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        363,
        6,
        17,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        364,
        6,
        17,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        365,
        6,
        17,
        '',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        366,
        6,
        17,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        367,
        6,
        17,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        368,
        6,
        17,
        '',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        369,
        6,
        17,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        370,
        6,
        17,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        371,
        6,
        17,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        372,
        6,
        17,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        373,
        6,
        17,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        374,
        6,
        17,
        '',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        375,
        6,
        17,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        376,
        6,
        17,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        377,
        6,
        17,
        '',
        '',
        100
    );


/*
****************************************************************************************
*  Shaman 7*****************************************************************************
****************************************************************************************
*/
INSERT INTO wowTalents 
    VALUES(
        378,
        7,
        18,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        379,
        7,
        18,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        380,
        7,
        18,
        '',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        381,
        7,
        18,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        382,
        7,
        18,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        383,
        7,
        18,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        384,
        7,
        18,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        385,
        7,
        18,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        386,
        7,
        18,
        '',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        387,
        7,
        18,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        388,
        7,
        18,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        389,
        7,
        18,
        '',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        390,
        7,
        18,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        391,
        7,
        18,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        392,
        7,
        18,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        393,
        7,
        18,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        394,
        7,
        18,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        395,
        7,
        18,
        '',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        396,
        7,
        18,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        397,
        7,
        18,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        398,
        7,
        18,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        399,
        7,
        19,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        400,
        7,
        19,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        401,
        7,
        19,
        '',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        402,
        7,
        19,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        403,
        7,
        19,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        404,
        7,
        19,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        405,
        7,
        19,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        406,
        7,
        19,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        407,
        7,
        19,
        '',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        408,
        7,
        19,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        409,
        7,
        19,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        410,
        7,
        19,
        '',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        411,
        7,
        19,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        412,
        7,
        19,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        413,
        7,
        19,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        414,
        7,
        19,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        415,
        7,
        19,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        416,
        7,
        19,
        '',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        417,
        7,
        19,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        418,
        7,
        19,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        419,
        7,
        19,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        420,
        7,
        20,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        421,
        7,
        20,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        422,
        7,
        20,
        '',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        423,
        7,
        20,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        424,
        7,
        20,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        425,
        7,
        20,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        426,
        7,
        20,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        427,
        7,
        20,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        428,
        7,
        20,
        '',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        429,
        7,
        20,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        430,
        7,
        20,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        431,
        7,
        20,
        '',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        432,
        7,
        20,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        433,
        7,
        20,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        434,
        7,
        20,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        435,
        7,
        20,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        436,
        7,
        20,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        437,
        7,
        20,
        '',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        438,
        7,
        20,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        439,
        7,
        20,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        440,
        7,
        20,
        '',
        '',
        100
    );


/*
****************************************************************************************
*   Mage  8*****************************************************************************
****************************************************************************************
*/
INSERT INTO wowTalents 
    VALUES(
        441,
        8,
        21,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        442,
        8,
        21,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        443,
        8,
        21,
        '',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        444,
        8,
        21,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        445,
        8,
        21,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        446,
        8,
        21,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        447,
        8,
        21,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        448,
        8,
        21,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        449,
        8,
        21,
        '',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        450,
        8,
        21,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        451,
        8,
        21,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        452,
        8,
        21,
        '',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        453,
        8,
        21,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        454,
        8,
        21,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        455,
        8,
        21,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        456,
        8,
        21,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        457,
        8,
        21,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        458,
        8,
        21,
        '',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        459,
        8,
        21,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        460,
        8,
        21,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        461,
        8,
        21,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        462,
        8,
        22,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        463,
        8,
        22,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        464,
        8,
        22,
        '',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        465,
        8,
        22,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        466,
        8,
        22,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        467,
        8,
        22,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        468,
        8,
        22,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        469,
        8,
        22,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        470,
        8,
        22,
        '',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        471,
        8,
        22,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        472,
        8,
        22,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        473,
        8,
        22,
        '',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        474,
        8,
        22,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        475,
        8,
        22,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        476,
        8,
        22,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        477,
        8,
        22,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        478,
        8,
        22,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        479,
        8,
        22,
        '',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        480,
        8,
        22,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        481,
        8,
        22,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        482,
        8,
        22,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        483,
        8,
        23,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        484,
        8,
        23,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        485,
        8,
        23,
        '',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        486,
        8,
        23,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        487,
        8,
        23,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        488,
        8,
        23,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        489,
        8,
        23,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        490,
        8,
        23,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        491,
        8,
        23,
        '',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        492,
        8,
        23,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        493,
        8,
        23,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        494,
        8,
        23,
        '',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        495,
        8,
        23,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        496,
        8,
        23,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        497,
        8,
        23,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        498,
        8,
        23,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        499,
        8,
        23,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        500,
        8,
        23,
        '',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        501,
        8,
        23,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        502,
        8,
        23,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        503,
        8,
        23,
        '',
        '',
        100
    );

/*
****************************************************************************************
* Warlock 9*****************************************************************************
****************************************************************************************
*/
INSERT INTO wowTalents 
    VALUES(
        504,
        9,
        24,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        505,
        9,
        24,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        506,
        9,
        24,
        '',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        507,
        9,
        24,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        508,
        9,
        24,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        509,
        9,
        24,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        510,
        9,
        24,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        511,
        9,
        24,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        512,
        9,
        24,
        '',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        513,
        9,
        24,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        514,
        9,
        24,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        515,
        9,
        24,
        '',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        516,
        9,
        24,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        517,
        9,
        24,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        518,
        9,
        24,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        519,
        9,
        24,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        520,
        9,
        24,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        521,
        9,
        24,
        '',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        522,
        9,
        24,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        523,
        9,
        24,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        524,
        9,
        24,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        525,
        9,
        25,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        526,
        9,
        25,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        527,
        9,
        25,
        '',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        528,
        9,
        25,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        529,
        9,
        25,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        530,
        9,
        25,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        531,
        9,
        25,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        532,
        9,
        25,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        533,
        9,
        25,
        '',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        534,
        9,
        25,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        535,
        9,
        25,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        536,
        9,
        25,
        '',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        537,
        9,
        25,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        538,
        9,
        25,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        539,
        9,
        25,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        540,
        9,
        25,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        541,
        9,
        25,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        542,
        9,
        25,
        '',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        543,
        9,
        25,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        544,
        9,
        25,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        545,
        9,
        25,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        546,
        9,
        26,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        547,
        9,
        26,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        548,
        9,
        26,
        '',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        549,
        9,
        26,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        550,
        9,
        26,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        551,
        9,
        26,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        552,
        9,
        26,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        553,
        9,
        26,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        554,
        9,
        26,
        '',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        555,
        9,
        26,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        556,
        9,
        26,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        557,
        9,
        26,
        '',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        558,
        9,
        26,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        559,
        9,
        26,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        560,
        9,
        26,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        561,
        9,
        26,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        562,
        9,
        26,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        563,
        9,
        26,
        '',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        564,
        9,
        26,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        565,
        9,
        26,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        566,
        9,
        26,
        '',
        '',
        100
    );

/*
*****************************************************************************************
*   Monk  10*****************************************************************************
*****************************************************************************************
*/
INSERT INTO wowTalents 
    VALUES(
        567,
        10,
        27,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        568,
        10,
        27,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        569,
        10,
        27,
        '',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        570,
        10,
        27,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        571,
        10,
        27,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        572,
        10,
        27,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        573,
        10,
        27,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        574,
        10,
        27,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        575,
        10,
        27,
        '',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        576,
        10,
        27,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        577,
        10,
        27,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        578,
        10,
        27,
        '',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        579,
        10,
        27,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        580,
        10,
        27,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        581,
        10,
        27,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        582,
        10,
        27,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        583,
        10,
        27,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        584,
        10,
        27,
        '',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        585,
        10,
        27,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        586,
        10,
        27,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        587,
        10,
        27,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        588,
        10,
        28,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        589,
        10,
        28,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        590,
        10,
        28,
        '',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        591,
        10,
        28,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        592,
        10,
        28,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        593,
        10,
        28,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        594,
        10,
        28,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        595,
        10,
        28,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        596,
        10,
        28,
        '',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        597,
        10,
        28,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        598,
        10,
        28,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        599,
        10,
        28,
        '',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        600,
        10,
        28,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        601,
        10,
        28,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        602,
        10,
        28,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        603,
        10,
        28,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        604,
        10,
        28,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        605,
        10,
        28,
        '',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        606,
        10,
        28,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        607,
        10,
        28,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        608,
        10,
        28,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        609,
        10,
        29,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        610,
        10,
        29,
        '',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        611,
        10,
        29,
        '',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        612,
        10,
        29,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        613,
        10,
        29,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        614,
        10,
        29,
        '',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        615,
        10,
        29,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        616,
        10,
        29,
        '',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        617,
        10,
        29,
        '',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        618,
        10,
        29,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        619,
        10,
        29,
        '',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        620,
        10,
        29,
        '',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        621,
        10,
        29,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        622,
        10,
        29,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        623,
        10,
        29,
        '',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        624,
        10,
        29,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        625,
        10,
        29,
        '',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        626,
        10,
        29,
        '',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        627,
        10,
        29,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        628,
        10,
        29,
        '',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        629,
        10,
        29,
        '',
        '',
        100
    );


/*
*****************************************************************************************
*  Druid  11*****************************************************************************
*****************************************************************************************
*/
    
