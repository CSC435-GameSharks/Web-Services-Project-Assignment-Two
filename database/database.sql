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
     
INSERT INTO wowClassSpells
    VALUES(
        137,
	6,
	'Death Coil',
	'',
	55
    );
   
INSERT INTO wowClassSpells
    VALUES(
        138,
	6,
	'Death Grip',
	'',
	55
    );
INSERT INTO wowClassSpells
    VALUES(
        139,
	6,
	'Frost Presence',
	'',
	55
    );

INSERT INTO wowClassSpells
    VALUES(
        140,
	6,
	'Icy Touch',
	'',
	55
    );

INSERT INTO wowClassSpells
    VALUES(
        141,
	6,
	'Blood Boil',
	'',
	55
    );

INSERT INTO wowClassSpells
    VALUES(
        142,
	6,
	'Plague Strike',
	'',
	55
    );

INSERT INTO wowClassSpells
    VALUES(
        143,
	6,
	'Death Strike',
	'',
	56
    );

INSERT INTO wowClassSpells
    VALUES(
        144,
	6,
	'Blood Presence',
	'',
	57
    );

INSERT INTO wowClassSpells
    VALUES(
        145,
	6,
	'Mind Freeze',
	'',
	57
    );

INSERT INTO wowClassSpells
    VALUES(
        146,
	6,
	'Chains of Ice',
	'',
	58
    );

INSERT INTO wowClassSpells
    VALUES(
        147,
	6,
	'Strangulate',
	'',
	58
    );

INSERT INTO wowClassSpells
    VALUES(
        148,
	6,
	'Death of Decay',
	'',
	60
    );

INSERT INTO wowClassSpells
    VALUES(
        149,
	6,
	'Dark Succor (Passive)',
	'',
	60
    );

INSERT INTO wowClassSpells
    VALUES(
        150,
	6,
	'On a Pale Horse (Passive)',
	'',
	61
    );

INSERT INTO wowClassSpells
    VALUES(
        151,
	6,
	'Icebound Fortitude',
	'',
	62
    );

INSERT INTO wowClassSpells
    VALUES(
        152,
	6,
	'Unholy Presence',
	'',
	64
    );

INSERT INTO wowClassSpells
    VALUES(
        153,
	6,
	'Horn of Winter',
	'',
	65
    );

INSERT INTO wowClassSpells
    VALUES(
        154,
	6,
	'Path of Frost',
	'',
	66
    );

INSERT INTO wowClassSpells
    VALUES(
        155,
	6,
	'Anti-Magic Shell',
	'',
	68
    );

INSERT INTO wowClassSpells
    VALUES(
        156,
	6,
	'Control Undead',
	'',
	69
    );

INSERT INTO wowClassSpells
    VALUES(
        157,
	6,
	'Raise Ally',
	'',
	72
    );

INSERT INTO wowClassSpells
    VALUES(
        158,
	6,
	'Empower Rune Weapon',
	'',
	76
    );

INSERT INTO wowClassSpells
    VALUES(
        159,
	6,
	'Army of the Dead',
	'',
	80
    );

INSERT INTO wowClassSpells
    VALUES(
        160,
	6,
	'Outbreak',
	'',
	81
    );

INSERT INTO wowClassSpells
    VALUES(
        161,
	6,
	'Dark Simulacrum',
	'',
	85
    );

INSERT INTO wowClassSpells
    VALUES(
        162,
	6,
	'Soul Reaper',
	'',
	87
    );


INSERT INTO wowSpecSpells
    VALUES(
        178,
	15,
	'Crimson Scourge (Passive) ',
	'',
	10
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        179,
	15,
	'Resolve (Passive)',
	'',
	10
    ); 


INSERT INTO wowSpecSpells
    VALUES(
        180,
	15,
	'Veteran of the Third War (Passive)',
	'',
	55
    ); 


INSERT INTO wowSpecSpells
    VALUES(
        181,
	15,
	'Dark Command',
	'',
	58
    ); 


INSERT INTO wowSpecSpells
    VALUES(
        182,
	15,
	'Rune Tap',
	'',
	64
    ); 


INSERT INTO wowSpecSpells
    VALUES(
        183,
	15,
	'Will of the Necropolis (Passive)',
	'',
	70
    ); 


INSERT INTO wowSpecSpells
    VALUES(
        184,
	15,
	'Dancing Rune Weapon',
	'',
	74
    ); 


INSERT INTO wowSpecSpells
    VALUES(
        185,
	15,
	'Vampiric Blood',
	'',
	76
    ); 


INSERT INTO wowSpecSpells
    VALUES(
        186,
	15,
	'Bone Shield',
	'',
	78
    ); 


INSERT INTO wowSpecSpells
    VALUES(
        187,
	15,
	'Power of the Grave (passive)',
	'',
	80
    ); 


INSERT INTO wowSpecSpells
    VALUES(
        188,
	15,
	'Runic Strikes (Passive)',
	'',
	90
    ); 


INSERT INTO wowSpecSpells
    VALUES(
        189,
	16,
	'Frost Strike',
	'',
	55
    ); 


INSERT INTO wowSpecSpells
    VALUES(
        190,
	16,
	'Howling Blast',
	'',
	55
    ); 


INSERT INTO wowSpecSpells
    VALUES(
        191,
	16,
	'Icy Talons (Passive)',
	'',
	55
    ); 



INSERT INTO wowSpecSpells
    VALUES(
        192,
	16,
	'Obliterate',
	'',
	58
    ); 



INSERT INTO wowSpecSpells
    VALUES(
        193,
	16,
	'Unholy Aura (Passive)',
	'',
	60
    ); 



INSERT INTO wowSpecSpells
    VALUES(
        194,
	16,
	'Killing Machine (Passive)',
	'',
	63
    ); 



INSERT INTO wowSpecSpells
    VALUES(
        195,
	16,
	'Pillar of Frost',
	'',
	68
    ); 



INSERT INTO wowSpecSpells
    VALUES(
        196,
	16,
	'Might of the Frozen Wastes (Passive)',
	'',
	74
    ); 


INSERT INTO wowSpecSpells
    VALUES(
        197,
	17,
	'Raise Dead',
	'',
	56
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        198,
	17,
	'Scourge Strike',
	'',
	58
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        199,
	17,
	'Shadow Infusion (Passive)',
	'',
	60
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        200,
	17,
	'Unholy Aura (Passive)',
	'',
	60
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        201,
	17,
	'Festering Strike',
	'',
	62
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        202,
	17,
	'Sudden Doom (Passive)',
	'',
	64
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        203,
	17,
	'Dark Transformation',
	'',
	70
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        204,
	17,
	'Summon Gargoyle',
	'',
	74
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        205,
	17,
	'Necrosis (Passive)',
	'',
	90
    ); 


/*
****************************************************************************************
*  Shaman 7*****************************************************************************
****************************************************************************************
*/
INSERT INTO wowClassSpells
    VALUES(
        163,
	7,
	'Lighting Bolt',
	'',
	1
    );

INSERT INTO wowClassSpells
    VALUES(
        164,
	7,
	'Primal Strike',
	'',
	3
    );

INSERT INTO wowClassSpells
    VALUES(
        165,
	7,
	'Healing Surge',
	'',
	7
    );

INSERT INTO wowClassSpells
    VALUES(
        166,
	7,
	'Lighting Shield',
	'',
	8
    );

INSERT INTO wowClassSpells
    VALUES(
        167,
	7,
	'Purge',
	'',
	12
    );

INSERT INTO wowClassSpells
    VALUES(
        168,
	7,
	'Flame Shock',
	'',
	12
    );

INSERT INTO wowClassSpells
    VALUES(
        169,
	7,
	'Ancestral Spirit',
	'',
	14
    );

INSERT INTO wowClassSpells
    VALUES(
        170,
	7,
	'Ghost Wolf',
	'',
	15
    );

INSERT INTO wowClassSpells
    VALUES(
        180,
	7,
	'Searing Totem',
	'',
	16
    );

INSERT INTO wowClassSpells
    VALUES(
        181,
	7,
	'Wind Shear',
	'',
	16
    );

INSERT INTO wowClassSpells
    VALUES(
        182,
	7,
	'Cleanse Spirit',
	'',
	18
    );

INSERT INTO wowClassSpells
    VALUES(
        183,
	7,
	'Frost Shock',
	'',
	22
    );

INSERT INTO wowClassSpells
    VALUES(
        184,
	7,
	'Water Walking',
	'',
	24
    );

INSERT INTO wowClassSpells
    VALUES(
        185,
	7,
	'Earthbind Totem',
	'',
	26
    );

INSERT INTO wowClassSpells
    VALUES(
        186,
	7,
	'Chain Lightning',
	'',
	28
    );

INSERT INTO wowClassSpells
    VALUES(
        187,
	7,
	'Healing Stream Totem',
	'',
	30
    );

INSERT INTO wowClassSpells
    VALUES(
        188,
	7,
	'Totemic Recall',
	'',
	30
    );

INSERT INTO wowClassSpells
    VALUES(
        189,
	7,
	'Reincarnation (Passive)',
	'',
	32
    );

INSERT INTO wowClassSpells
    VALUES(
        190,
	7,
	'Astral Recall',
	'',
	34
    );

INSERT INTO wowClassSpells
    VALUES(
        191,
	7,
	'Far Sight',
	'',
	26
    );


INSERT INTO wowClassSpells
    VALUES(
        192,
	7,
	'Grounding Totem',
	'',
	38
    );


INSERT INTO wowClassSpells
    VALUES(
        193,
	7,
	'Tremor Totem',
	'',
	54
    );


INSERT INTO wowClassSpells
    VALUES(
        194,
	7,
	'Earth Elemental Totem',
	'',
	58
    );


INSERT INTO wowClassSpells
    VALUES(
        195,
	7,
	'Healing Rain',
	'',
	60
    );


INSERT INTO wowClassSpells
    VALUES(
        196,
	7,
	'Capacitor Totem',
	'',
	63
    );


INSERT INTO wowClassSpells
    VALUES(
        197,
	7,
	'Fire Elemental Totem',
	'',
	66
    );


INSERT INTO wowClassSpells
    VALUES(
        198,
	7,
	'Heroism',
	'',
	70
    );


INSERT INTO wowClassSpells
    VALUES(
        199,
	7,
	'Bloodlust',
	'',
	70
    );


INSERT INTO wowClassSpells
    VALUES(
        200,
	7,
	'Hex',
	'',
	75
    );


INSERT INTO wowClassSpells
    VALUES(
        201,
	7,
	'Grace of Air (Passive)',
	'',
	80
    );


INSERT INTO wowClassSpells
    VALUES(
        202,
	7,
	'Unleash Life',
	'',
	81
    );


INSERT INTO wowSpecSpells
    VALUES(
        206,
	18,
	'Earth Shock',
	'',
	6
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        207,
	18,
	'Thunderstorm',
	'',
	10
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        208,
	18,
	'Fulmination (Passive)',
	'',
	20
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        209,
	18,
	'Lava Burst',
	'',
	34
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        210,
	18,
	'Lava Surge (Passive)',
	'',
	50
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        211,
	18,
	'Earthquake',
	'',
	60
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        212,
	18,
	'Shamanistic Rage',
	'',
	65
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        213,
	18,
	'Unleash Flame',
	'',
	81
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        214,
	18,
	'Spiritwalkers Grace',
	'',
	87
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        215,
	18,
	'Ascendance',
	'',
	87
    ); 

INSERT INTO wowSpecSpells
    VALUES(
        216,
	18,
	'Elemental Overload (Passive)',
	'',
	90
    );    

INSERT INTO wowSpecSpells
    VALUES(
        217,
	19,
	'Lava Lash',
	'',
	10
    );    

INSERT INTO wowSpecSpells
    VALUES(
        218,
	19,
	'Flurry (Passive)',
	'',
	20
    );    

INSERT INTO wowSpecSpells
    VALUES(
        219,
	19,
	'Stormstrike',
	'',
	26
    );    

INSERT INTO wowSpecSpells
    VALUES(
        220,
	19,
	'Enhanced Weapons (Passive)',
	'',
	30
    );    

INSERT INTO wowSpecSpells
    VALUES(
        221,
	19,
	'Magma Totem',
	'',
	36
    );    

INSERT INTO wowSpecSpells
    VALUES(
        222,
	19,
	'Fire Nova',
	'',
	44
    );    

INSERT INTO wowSpecSpells
    VALUES(
        223,
	19,
	'Maelstorm Weapon (Passive)',
	'',
	50
    );    

INSERT INTO wowSpecSpells
    VALUES(
        224,
	19,
	'Feral Spirit',
	'',
	60
    );    

INSERT INTO wowSpecSpells
    VALUES(
        225,
	19,
	'Spirit Walk',
	'',
	60
    );    

INSERT INTO wowSpecSpells
    VALUES(
        226,
	19,
	'Shamanistic Rage',
	'',
	65
    );    

INSERT INTO wowSpecSpells
    VALUES(
        227,
	19,
	'Unleash Elements',
	'',
	81
    );    

INSERT INTO wowSpecSpells
    VALUES(
        228,
	19,
	'Ascendance',
	'',
	87
    );    

INSERT INTO wowSpecSpells
    VALUES(
        229,
	19,
	'Lightning Strikes (Passive)',
	'',
	90
    );    

INSERT INTO wowSpecSpells
    VALUES(
        230,
	20,
	'Riptide',
	'',
	10
    );    

INSERT INTO wowSpecSpells
    VALUES(
        231,
	20,
	'Telluric Currents (Passive)',
	'',
	10
    );   

INSERT INTO wowSpecSpells
    VALUES(
        232,
	20,
	'Purify Spirit',
	'',
	18
    );   

INSERT INTO wowSpecSpells
    VALUES(
        233,
	20,
	'Water Shield',
	'',
	20
    );   

INSERT INTO wowSpecSpells
    VALUES(
        234,
	20,
	'Earth Shield',
	'',
	26
    );   

INSERT INTO wowSpecSpells
    VALUES(
        235,
	20,
	'Lava Burst',
	'',
	34
    );   

INSERT INTO wowSpecSpells
    VALUES(
        236,
	20,
	'Resurgence (Passive)',
	'',
	40
    );   

INSERT INTO wowSpecSpells
    VALUES(
        237,
	20,
	'Chain Heal',
	'',
	44
    );   

INSERT INTO wowSpecSpells
    VALUES(
        238,
	20,
	'Tidal Waves (Passive)',
	'',
	50
    );   

INSERT INTO wowSpecSpells
    VALUES(
        239,
	20,
	'Healing Wave',
	'',
	60
    );   

INSERT INTO wowSpecSpells
    VALUES(
        240,
	20,
	'Healing Tide Totem',
	'',
	65
    );   

INSERT INTO wowSpecSpells
    VALUES(
        241,
	20,
	'Spirit Link Totem',
	'',
	70
    );   

INSERT INTO wowSpecSpells
    VALUES(
        242,
	20,
	'Spiritwalkers Grace',
	'',
	85
    );   

INSERT INTO wowSpecSpells
    VALUES(
        243,
	20,
	'Ascendance',
	'',
	87
    );   

INSERT INTO wowSpecSpells
    VALUES(
        244,
	20,
	'Purification (Passive)',
	'',
	90
    );   


/*
****************************************************************************************
*   Mage  8*****************************************************************************
****************************************************************************************
*/
INSERT INTO wowClassSpells
    VALUES(
        203,
	8,
	'Frostfire Bolt',
	'',
	1
    );        

INSERT INTO wowClassSpells
    VALUES(
        204,
	8,
	'Frost Nova',
	'',
	3
    );        


INSERT INTO wowClassSpells
    VALUES(
        205,
	8,
	'Fire Blast',
	'',
	5
    );        


INSERT INTO wowClassSpells
    VALUES(
        206,
	8,
	'Blink',
	'',
	7
    );        


INSERT INTO wowClassSpells
    VALUES(
        207,
	8,
	'Counterspell',
	'',
	8
    );        


INSERT INTO wowClassSpells
    VALUES(
        208,
	8,
	'Polymorph',
	'',
	14
    );        


INSERT INTO wowClassSpells
    VALUES(
        209,
	8,
	'Ice Block',
	'',
	15
    );        


INSERT INTO wowClassSpells
    VALUES(
        210,
	8,
	'Cone of Cold',
	'',
	28
    );        


INSERT INTO wowClassSpells
    VALUES(
        211,
	8,
	'Remove Curse',
	'',
	29
    );        


INSERT INTO wowClassSpells
    VALUES(
        212,
	8,
	'Slow Fall',
	'',
	32
    );        


INSERT INTO wowClassSpells
    VALUES(
        213,
	8,
	'Conjure Refreshment',
	'',
	38
    );        


INSERT INTO wowClassSpells
    VALUES(
        214,
	8,
	'Invisibility',
	'',
	56
    );        


INSERT INTO wowClassSpells
    VALUES(
        215,
	8,
	'Arcane Brilliance',
	'',
	58
    );        


INSERT INTO wowClassSpells
    VALUES(
        216,
	8,
	'Spellsteal',
	'',
	64
    );        


INSERT INTO wowClassSpells
    VALUES(
        217,
	8,
	'Conjure Refeshment Table',
	'',
	72
    );        


INSERT INTO wowClassSpells
    VALUES(
        218,
	8,
	'Time Warp',
	'',
	84
    );        


INSERT INTO wowClassSpells
    VALUES(
        219,
	8,
	'Amplify Magic',
	'',
	87
    );        






INSERT INTO wowSpecSpells
    VALUES(
        245,
	21,
	'Presence of Mind',
	'',
	1
    );  

INSERT INTO wowSpecSpells
    VALUES(
        246,
	21,
	'Arcane Blast',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        247,
	21,
	'Arcane Charge (Passive)',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        248,
	21,
	'Arcane Barrage',
	'',
	12
    );  

INSERT INTO wowSpecSpells
    VALUES(
        249,
	21,
	'Arcane Explosion',
	'',
	18
    );  

INSERT INTO wowSpecSpells
    VALUES(
        250,
	21,
	'Arcane Missiles',
	'',
	24
    );  

INSERT INTO wowSpecSpells
    VALUES(
        251,
	21,
	'Slow',
	'',
	36
    );  

INSERT INTO wowSpecSpells
    VALUES(
        252,
	21,
	'Evocation',
	'',
	40
    );  

INSERT INTO wowSpecSpells
    VALUES(
        253,
	21,
	'Arcane Power',
	'',
	62
    );  

INSERT INTO wowSpecSpells
    VALUES(
        254,
	21,
	'Mage Armor (Passive)',
	'',
	80
    );  

INSERT INTO wowSpecSpells
    VALUES(
        255,
	21,
	'Arcane Mind (Passive)',
	'',
	90
    );  


INSERT INTO wowSpecSpells
    VALUES(
        256,
	22,
	'Pyroblast',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        257,
	22,
	'Fireball',
	'',
	12
    );  

INSERT INTO wowSpecSpells
    VALUES(
        258,
	22,
	'Scorch',
	'',
	22
    );  

INSERT INTO wowSpecSpells
    VALUES(
        259,
	22,
	'Inferno Blast',
	'',
	24
    );  

INSERT INTO wowSpecSpells
    VALUES(
        260,
	22,
	'Molten Armor (Passive)',
	'',
	34
    );  

INSERT INTO wowSpecSpells
    VALUES(
        261,
	22,
	'Critical Mass (Passive)',
	'',
	36
    );  

INSERT INTO wowSpecSpells
    VALUES(
        262,
	22,
	'Flamestrike',
	'',
	44
    );  

INSERT INTO wowSpecSpells
    VALUES(
        263,
	22,
	'Dragons Breath',
	'',
	62
    );  

INSERT INTO wowSpecSpells
    VALUES(
        264,
	22,
	'Combustion',
	'',
	80
    );  

INSERT INTO wowSpecSpells
    VALUES(
        265,
	22,
	'Incineration (Passive)',
	'',
	90
    );  

INSERT INTO wowSpecSpells
    VALUES(
        266,
	23,
	'Summon Water Elemental',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        267,
	23,
	'Frostbolt',
	'',
	12
    );  

INSERT INTO wowSpecSpells
    VALUES(
        268,
	23,
	'Shatter (Passive)',
	'',
	16
    );  

INSERT INTO wowSpecSpells
    VALUES(
        269,
	23,
	'Ice Lance',
	'',
	22
    );  

INSERT INTO wowSpecSpells
    VALUES(
        270,
	23,
	'Fingers of Frost (Passive)',
	'',
	24
    );  

INSERT INTO wowSpecSpells
    VALUES(
        271,
	23,
	'Icy Veins',
	'',
	36
    );  

INSERT INTO wowSpecSpells
    VALUES(
        272,
	23,
	'Blizzard',
	'',
	52
    );  

INSERT INTO wowSpecSpells
    VALUES(
        273,
	23,
	'Frost Armor (Passive)',
	'',
	54
    );  

INSERT INTO wowSpecSpells
    VALUES(
        274,
	23,
	'Frozen Orb',
	'',
	62
    );  

INSERT INTO wowSpecSpells
    VALUES(
        275,
	23,
	'Deep Freeze',
	'',
	66
    );  

INSERT INTO wowSpecSpells
    VALUES(
        276,
	23,
	'Brain Freeze (Passive)',
	'',
	77
    );  

INSERT INTO wowSpecSpells
    VALUES(
        277,
	23,
	'Ice Shards (Passive)',
	'',
	90
    );  

/*
****************************************************************************************
* Warlock 9*****************************************************************************
****************************************************************************************
*/
INSERT INTO wowClassSpells
    VALUES(
        219,
	9,
	'Summon Imp',
	'',
	1
    );     

INSERT INTO wowClassSpells
    VALUES(
        220,
	9,
	'Shadow Bolt',
	'',
	1
    );     

INSERT INTO wowClassSpells
    VALUES(
        221,
	9,
	'The Codex of Xerrath (Passive)',
	'',
	1
    );     

INSERT INTO wowClassSpells
    VALUES(
        222,
	9,
	'Corruption',
	'',
	3
    );     

INSERT INTO wowClassSpells
    VALUES(
        223,
	9,
	'Summon Voidwalker',
	'',
	8
    );     

INSERT INTO wowClassSpells
    VALUES(
        224,
	9,
	'Create Healthstone',
	'',
	9
    );     

INSERT INTO wowClassSpells
    VALUES(
        225,
	9,
	'Fear',
	'',
	14
    );     

INSERT INTO wowClassSpells
    VALUES(
        226,
	9,
	'Soulstone',
	'',
	18
    );     

INSERT INTO wowClassSpells
    VALUES(
        227,
	9,
	'Summon Succubus',
	'',
	20
    );     

INSERT INTO wowClassSpells
    VALUES(
        228,
	9,
	'Felsteed',
	'',
	20
    );     

INSERT INTO wowClassSpells
    VALUES(
        229,
	9,
	'Eye of Kilrogg',
	'',
	22
    );     

INSERT INTO wowClassSpells
    VALUES(
        230,
	9,
	'Unending Breath',
	'',
	24
    );     

INSERT INTO wowClassSpells
    VALUES(
        231,
	9,
	'Soul Harvest (Passive)',
	'',
	27
    );     

INSERT INTO wowClassSpells
    VALUES(
        232,
	9,
	'Summon Felhunter',
	'',
	29
    );     

INSERT INTO wowClassSpells
    VALUES(
        233,
	9,
	'Enslave Demon',
	'',
	31
    );     

INSERT INTO wowClassSpells
    VALUES(
        234,
	9,
	'Banish',
	'',
	32
    );     

INSERT INTO wowClassSpells
    VALUES(
        235,
	9,
	'Dreadsteed',
	'',
	40
    );     

INSERT INTO wowClassSpells
    VALUES(
        236,
	9,
	'Ritual of Summoning',
	'',
	42
    );     

INSERT INTO wowClassSpells
    VALUES(
        237,
	9,
	'Summon Infernal',
	'',
	49
    );     

INSERT INTO wowClassSpells
    VALUES(
        238,
	9,
	'Command Demon',
	'',
	56
    );     

INSERT INTO wowClassSpells
    VALUES(
        239,
	9,
	'Summon Doomguard',
	'',
	58
    );     

INSERT INTO wowClassSpells
    VALUES(
        240,
	9,
	'Unending Resolve',
	'',
	64
    );     

INSERT INTO wowClassSpells
    VALUES(
        241,
	9,
	'Soulshatter',
	'',
	66
    );     

INSERT INTO wowClassSpells
    VALUES(
        242,
	9,
	'Create Soulwell',
	'',
	68
    );     

INSERT INTO wowClassSpells
    VALUES(
        243,
	9,
	'Demonic Circle: Summon',
	'',
	76
    );     

INSERT INTO wowClassSpells
    VALUES(
        244,
	9,
	'Demonic Circle: Teleport',
	'',
	76
    );     

INSERT INTO wowClassSpells
    VALUES(
        245,
	9,
	'Blood Pact (Passive)',
	'',
	80
    );     

INSERT INTO wowClassSpells
    VALUES(
        246,
	9,
	'Dark Intent',
	'',
	82
    );     

INSERT INTO wowClassSpells
    VALUES(
        247,
	9,
	'Demonic Gateway',
	'',
	87
    );     


INSERT INTO wowSpecSpells
    VALUES(
        278,
	24,
	'Drain Life',
	'',
	7
    );  

INSERT INTO wowSpecSpells
    VALUES(
        279,
	24,
	'Unstable Affliction',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        280,
	24,
	'Health Funneel',
	'',
	11
    );  

INSERT INTO wowSpecSpells
    VALUES(
        281,
	24,
	'Life Tap',
	'',
	16
    );  

INSERT INTO wowSpecSpells
    VALUES(
        282,
	24,
	'Soulburn',
	'',
	19
    );  

INSERT INTO wowSpecSpells
    VALUES(
        283,
	24,
	'Seed of Corruption',
	'',
	21
    );  

INSERT INTO wowSpecSpells
    VALUES(
        284,
	24,
	'Drain Soul',
	'',
	24
    );  

INSERT INTO wowSpecSpells
    VALUES(
        285,
	24,
	'Agony',
	'',
	36
    );  

INSERT INTO wowSpecSpells
    VALUES(
        286,
	24,
	'Haunt',
	'',
	60
    );  

INSERT INTO wowSpecSpells
    VALUES(
        287,
	24,
	'Soul Swap',
	'',
	79
    );  

INSERT INTO wowSpecSpells
    VALUES(
        288,
	24,
	'Dark Soul: Misery',
	'',
	84
    );  

INSERT INTO wowSpecSpells
    VALUES(
        289,
	24,
	'Eradication (Passive)',
	'',
	90
    );  


INSERT INTO wowSpecSpells
    VALUES(
        290,
	25,
	'Drain Life',
	'',
	7
    );  

INSERT INTO wowSpecSpells
    VALUES(
        291,
	25,
	'Metamorphosis',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        292,
	25,
	'Molten Core (Passive)',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        293,
	25,
	'Health Funnel',
	'',
	11
    );  

INSERT INTO wowSpecSpells
    VALUES(
        294,
	25,
	'Demonic Leap',
	'',
	12
    );  

INSERT INTO wowSpecSpells
    VALUES(
        295,
	25,
	'Soul Fire',
	'',
	13
    );  

INSERT INTO wowSpecSpells
    VALUES(
        296,
	25,
	'Life Tap',
	'',
	16
    );  

INSERT INTO wowSpecSpells
    VALUES(
        297,
	25,
	'Hand of Guldan',
	'',
	19
    );  

INSERT INTO wowSpecSpells
    VALUES(
        298,
	25,
	'Helfire',
	'',
	22
    );  

INSERT INTO wowSpecSpells
    VALUES(
        299,
	25,
	'Wild Imps (Passive)',
	'',
	32
    );  

INSERT INTO wowSpecSpells
    VALUES(
        300,
	25,
	'Summon Felguard',
	'',
	42
    );  

INSERT INTO wowSpecSpells
    VALUES(
        301,
	25,
	'Dark Soul: Knowledge',
	'',
	84
    );  

INSERT INTO wowSpecSpells
    VALUES(
        302,
	25,
	'Demonic Tactics (Passive)',
	'',
	90
    );  

INSERT INTO wowSpecSpells
    VALUES(
        303,
	26,
	'Conflagrate',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        304,
	26,
	'Incinerate',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        305,
	26,
	'Chaos Bolt',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        306,
	26,
	'Immolate',
	'',
	12
    );  

INSERT INTO wowSpecSpells
    VALUES(
        307,
	26,
	'Ember Tap',
	'',
	15
    );  

INSERT INTO wowSpecSpells
    VALUES(
        308,
	26,
	'Rain of Fire',
	'',
	21
    );  

INSERT INTO wowSpecSpells
    VALUES(
        309,
	26,
	'Havoc',
	'',
	36
    );  

INSERT INTO wowSpecSpells
    VALUES(
        310,
	26,
	'Shadowburn',
	'',
	47
    );  

INSERT INTO wowSpecSpells
    VALUES(
        311,
	26,
	'Fire and Brimstone',
	'',
	54
    );  

INSERT INTO wowSpecSpells
    VALUES(
        312,
	26,
	'Backdraft (Passive)',
	'',
	69
    );  

INSERT INTO wowSpecSpells
    VALUES(
        313,
	26,
	'Flames of Xoroth',
	'',
	79
    );  

INSERT INTO wowSpecSpells
    VALUES(
        314,
	26,
	'Dark Soul: Instability',
	'',
	84
    );  

INSERT INTO wowSpecSpells
    VALUES(
        315,
	26,
	'Devastation (Passive)',
	'',
	90
    );  
   

/*
*****************************************************************************************
*   Monk  10*****************************************************************************
*****************************************************************************************
*/
INSERT INTO wowClassSpells
    VALUES(
        247,
	10,
	'Jab',
	'',
	1
    );     

INSERT INTO wowClassSpells
    VALUES(
        248,
	10,
	'Way of the Monk (Passive)',
	'',
	1
    );     

INSERT INTO wowClassSpells
    VALUES(
        249,
	10,
	'Stance of the Fierce Tiger',
	'',
	1
    );     

INSERT INTO wowClassSpells
    VALUES(
        250,
	10,
	'Tiger Palm',
	'',
	3
    );     

INSERT INTO wowClassSpells
    VALUES(
        251,
	10,
	'Roll',
	'',
	5
    );     

INSERT INTO wowClassSpells
    VALUES(
        252,
	10,
	'Blackout Kick',
	'',
	7
    );     

INSERT INTO wowClassSpells
    VALUES(
        253,
	10,
	'Tiger Strikes (Passive)',
	'',
	10
    );     

INSERT INTO wowClassSpells
    VALUES(
        254,
	10,
	'Surging Mist',
	'',
	12
    );     

INSERT INTO wowClassSpells
    VALUES(
        255,
	10,
	'Provoke',
	'',
	14
    );     

INSERT INTO wowClassSpells
    VALUES(
        256,
	10,
	'Resuscitate',
	'',
	18
    );     

INSERT INTO wowClassSpells
    VALUES(
        257,
	10,
	'Detox',
	'',
	20
    );     

INSERT INTO wowClassSpells
    VALUES(
        258,
	10,
	'Zen Pilgrimage',
	'',
	20
    );     

INSERT INTO wowClassSpells
    VALUES(
        259,
	10,
	'Touch of Death',
	'',
	22
    );     

INSERT INTO wowClassSpells
    VALUES(
        260,
	10,
	'Fortifying Brew',
	'',
	24
    );     

INSERT INTO wowClassSpells
    VALUES(
        261,
	10,
	'Expel Harm',
	'',
	26
    );     

INSERT INTO wowClassSpells
    VALUES(
        262,
	10,
	'Nimble Brew',
	'',
	30
    );     

INSERT INTO wowClassSpells
    VALUES(
        263,
	10,
	'Spear Hand Strike',
	'',
	32
    );     

INSERT INTO wowClassSpells
    VALUES(
        264,
	10,
	'Paralysis',
	'',
	44
    );     

INSERT INTO wowClassSpells
    VALUES(
        265,
	10,
	'Spinning Crane Kick',
	'',
	46
    );     

INSERT INTO wowClassSpells
    VALUES(
        266,
	10,
	'Crackling Jade Lighting',
	'',
	54
    );     

INSERT INTO wowClassSpells
    VALUES(
        267,
	10,
	'Transcendence',
	'',
	87
    );     

INSERT INTO wowClassSpells
    VALUES(
        268,
	10,
	'Transcendence: Transfer',
	'',
	87
    );     
 
   
INSERT INTO wowSpecSpells
    VALUES(
        316,
	27,
	'Dizzing Haze',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        317,
	27,
	'Stance of the Sturdy Ox',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        318,
	27,
	'Resolve (Passice)',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        319,
	27,
	'Keg Smash',
	'',
	11
    );  

INSERT INTO wowSpecSpells
    VALUES(
        320,
	27,
	'Breath of Fire',
	'',
	18
    );  

INSERT INTO wowSpecSpells
    VALUES(
        321,
	27,
	'Guard',
	'',
	26
    );  

INSERT INTO wowSpecSpells
    VALUES(
        322,
	27,
	'Elusive Brew',
	'',
	36
    );  

INSERT INTO wowSpecSpells
    VALUES(
        323,
	27,
	'Gift of the Ox (Passive)',
	'',
	56
    );  

INSERT INTO wowSpecSpells
    VALUES(
        324,
	27,
	'Summon Black Ox Statue',
	'',
	70
    );  

INSERT INTO wowSpecSpells
    VALUES(
        325,
	27,
	'Purifying Brew',
	'',
	75
    );  

INSERT INTO wowSpecSpells
    VALUES(
        326,
	27,
	'Legacy of the White Tiger',
	'',
	81
    );  

INSERT INTO wowSpecSpells
    VALUES(
        327,
	27,
	'Zen Meditation',
	'',
	82
    );  

INSERT INTO wowSpecSpells
    VALUES(
        328,
	27,
	'Ferment (Passive)',
	'',
	90
    );  

INSERT INTO wowSpecSpells
    VALUES(
        329,
	28,
	'Stance of the Wise Serpent',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        330,
	28,
	'Soothing Mist',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        331,
	28,
	'Stance of the Spirited Crane',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        332,
	28,
	'Enveloping Mist',
	'',
	16
    );  

INSERT INTO wowSpecSpells
    VALUES(
        333,
	28,
	'Legacy of the Emperor',
	'',
	22
    );  

INSERT INTO wowSpecSpells
    VALUES(
        334,
	28,
	'Renewing Mist',
	'',
	24
    );  

INSERT INTO wowSpecSpells
    VALUES(
        335,
	28,
	'Focus and Harmony (Passive)',
	'',
	45
    );  

INSERT INTO wowSpecSpells
    VALUES(
        336,
	28,
	'Life Cocoon',
	'',
	50
    );  

INSERT INTO wowSpecSpells
    VALUES(
        337,
	28,
	'Mana Tea',
	'',
	56
    );  

INSERT INTO wowSpecSpells
    VALUES(
        338,
	28,
	'Rising Sun Kick',
	'',
	56
    );  

INSERT INTO wowSpecSpells
    VALUES(
        339,
	28,
	'Uplift',
	'',
	62
    );  

INSERT INTO wowSpecSpells
    VALUES(
        340,
	28,
	'Detonate Chi',
	'',
	64
    );  

INSERT INTO wowSpecSpells
    VALUES(
        341,
	28,
	'Thunder Focus Tea',
	'',
	66
    );  

INSERT INTO wowSpecSpells
    VALUES(
        342,
	28,
	'Summon Jade Serpent Statue',
	'',
	70
    );  

INSERT INTO wowSpecSpells
    VALUES(
        343,
	28,
	'Revival',
	'',
	78
    );  

INSERT INTO wowSpecSpells
    VALUES(
        344,
	28,
	'Jade Mists (Passive)',
	'',
	90
    );  
 

INSERT INTO wowSpecSpells
    VALUES(
        345,
	29,
	'Fists of Fury',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        346,
	29,
	'Flying Serpent Kick',
	'',
	18
    );  

INSERT INTO wowSpecSpells
    VALUES(
        347,
	29,
	'Touch of Karma',
	'',
	22
    );  

INSERT INTO wowSpecSpells
    VALUES(
        348,
	29,
	'Afterlife (Passive)',
	'',
	26
    );  

INSERT INTO wowSpecSpells
    VALUES(
        349,
	29,
	'Disable',
	'',
	28
    );  

INSERT INTO wowSpecSpells
    VALUES(
        350,
	29,
	'Energizing Brew',
	'',
	36
    );  

INSERT INTO wowSpecSpells
    VALUES(
        351,
	29,
	'Rising Sun Kick',
	'',
	56
    );  

INSERT INTO wowSpecSpells
    VALUES(
        352,
	29,
	'Tigereye Brew',
	'',
	56
    );  

INSERT INTO wowSpecSpells
    VALUES(
        353,
	29,
	'Storm, Earth, and Fire',
	'',
	75
    );  

INSERT INTO wowSpecSpells
    VALUES(
        354,
	29,
	'Windflurry (Passive)',
	'',
	80
    );  

INSERT INTO wowSpecSpells
    VALUES(
        355,
	29,
	'Legacy of the White Tiger',
	'',
	81
    );  

INSERT INTO wowSpecSpells
    VALUES(
        356,
	29,
	'Zen Meditation',
	'',
	82
    );  

INSERT INTO wowSpecSpells
    VALUES(
        357,
	29,
	'Battle Trance (Passive)',
	'',
	90
    );  


/*
*****************************************************************************************
*  Druid  11*****************************************************************************
*****************************************************************************************
*/
INSERT INTO wowClassSpells
    VALUES(
        269,
	11,
	'Wrath',
	'',
	1
    );

INSERT INTO wowClassSpells
    VALUES(
        270,
	11,
	'Moonfire',
	'',
	3
    );

INSERT INTO wowClassSpells
    VALUES(
        271,
	11,
	'Rejuvenation',
	'',
	4
    );

INSERT INTO wowClassSpells
    VALUES(
        272,
	11,
	'Ferocious Bite',
	'',
	6
    );

INSERT INTO wowClassSpells
    VALUES(
        273,
	11,
	'Cat Form',
	'',
	6
    );

INSERT INTO wowClassSpells
    VALUES(
        274,
	11,
	'Prowl',
	'',
	6
    );

INSERT INTO wowClassSpells
    VALUES(
        275,
	11,
	'Shred',
	'',
	6
    );

INSERT INTO wowClassSpells
    VALUES(
        276,
	11,
	'Mangle',
	'',
	8
    );

INSERT INTO wowClassSpells
    VALUES(
        277,
	11,
	'Mangle',
	'',
	8
    );

INSERT INTO wowClassSpells
    VALUES(
        278,
	11,
	'Bear Form',
	'',
	8
    );

INSERT INTO wowClassSpells
    VALUES(
        279,
	11,
	'Growl',
	'',
	8
    );

INSERT INTO wowClassSpells
    VALUES(
        280,
	11,
	'Entangling Roots',
	'',
	10
    );

INSERT INTO wowClassSpells
    VALUES(
        281,
	11,
	'Revive',
	'',
	12
    );

INSERT INTO wowClassSpells
    VALUES(
        282,
	11,
	'Teleport: Moonglade',
	'',
	14
    );

INSERT INTO wowClassSpells
    VALUES(
        283,
	11,
	'Thrash',
	'',
	14
    );

INSERT INTO wowClassSpells
    VALUES(
        284,
	11,
	'Thrash',
	'',
	14
    );

INSERT INTO wowClassSpells
    VALUES(
        285,
	11,
	'Travel Form',
	'',
	16
    );

INSERT INTO wowClassSpells
    VALUES(
        286,
	11,
	'Sunfire',
	'',
	18
    );

INSERT INTO wowClassSpells
    VALUES(
        287,
	11,
	'Dash',
	'',
	24
    );

INSERT INTO wowClassSpells
    VALUES(
        288,
	11,
	'Healing Touch',
	'',
	26
    );

INSERT INTO wowClassSpells
    VALUES(
        289,
	11,
	'Primal Fury (Passive)',
	'',
	30
    );

INSERT INTO wowClassSpells
    VALUES(
        290,
	11,
	'Hurricane',
	'',
	42
    );

INSERT INTO wowClassSpells
    VALUES(
        291,
	11,
	'Rebirth',
	'',
	56
    );

INSERT INTO wowClassSpells
    VALUES(
        292,
	11,
	'Soothe',
	'',
	60
    );

INSERT INTO wowClassSpells
    VALUES(
        293,
	11,
	'Mark of the Wild',
	'',
	62
    );

INSERT INTO wowClassSpells
    VALUES(
        294,
	11,
	'Frenzied Regeneration',
	'',
	68
    );


INSERT INTO wowClassSpells
    VALUES(
        295,
	11,
	'Cyclone',
	'',
	78
    );


INSERT INTO wowClassSpells
    VALUES(
        296,
	11,
	'Stampeding Roar',
	'',
	84
    );


INSERT INTO wowSpecSpells
    VALUES(
        358,
	30,
	'Eclispe (Passive)',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        359,
	30,
	'Starfire',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        360,
	30,
	'Starsurge',
	'',
	12
    );  

INSERT INTO wowSpecSpells
    VALUES(
        361,
	30,
	'Moonkin Form',
	'',
	16
    );  

INSERT INTO wowSpecSpells
    VALUES(
        362,
	30,
	'Astral Communion',
	'',
	20
    );  

INSERT INTO wowSpecSpells
    VALUES(
        363,
	30,
	'Remove Corruption',
	'',
	22
    );  

INSERT INTO wowSpecSpells
    VALUES(
        364,
	30,
	'Shooting Stars (Passive)',
	'',
	26
    );  

INSERT INTO wowSpecSpells
    VALUES(
        365,
	30,
	'Solar Beam',
	'',
	28
    );  

INSERT INTO wowSpecSpells
    VALUES(
        366,
	30,
	'Natures Birthday',
	'',
	38
    );  

INSERT INTO wowSpecSpells
    VALUES(
        367,
	30,
	'Barkskin',
	'',
	44
    );  

INSERT INTO wowSpecSpells
    VALUES(
        368,
	30,
	'Celestial Alignment',
	'',
	68
    );  

INSERT INTO wowSpecSpells
    VALUES(
        369,
	30,
	'Starfall',
	'',
	76
    );  

INSERT INTO wowSpecSpells
    VALUES(
        370,
	30,
	'Astral Showers (Passive)',
	'',
	82
    );  

INSERT INTO wowSpecSpells
    VALUES(
        371,
	30,
	'Wild Mushroom',
	'',
	84
    );  

INSERT INTO wowSpecSpells
    VALUES(
        372,
	30,
	'Lunar Guidance (Passive)',
	'',
	90
    );  

INSERT INTO wowSpecSpells
    VALUES(
        373,
	31,
	'Rake',
	'',
	6
    );  

INSERT INTO wowSpecSpells
    VALUES(
        374,
	31,
	'Tigers Fury',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        375,
	31,
	'Savage Roar',
	'',
	18
    );  


INSERT INTO wowSpecSpells
    VALUES(
        376,
	31,
	'Savage Roar',
	'',
	18
    );  


INSERT INTO wowSpecSpells
    VALUES(
        377,
	31,
	'Rip',
	'',
	20
    );  


INSERT INTO wowSpecSpells
    VALUES(
        378,
	31,
	'Remove Corruption',
	'',
	22
    );  


INSERT INTO wowSpecSpells
    VALUES(
        379,
	31,
	'Swipe',
	'',
	22
    );  


INSERT INTO wowSpecSpells
    VALUES(
        380,
	31,
	'Predatory Swiftness (Passive)',
	'',
	26
    );  


INSERT INTO wowSpecSpells
    VALUES(
        381,
	31,
	'Faerie Fire',
	'',
	28
    );  


INSERT INTO wowSpecSpells
    VALUES(
        382,
	31,
	'Omen of Clarity (Passive)',
	'',
	38
    );  


INSERT INTO wowSpecSpells
    VALUES(
        383,
	31,
	'Leader of the Pack (Passive)',
	'',
	46
    );  


INSERT INTO wowSpecSpells
    VALUES(
        384,
	31,
	'Berserk',
	'',
	48
    );  


INSERT INTO wowSpecSpells
    VALUES(
        385,
	31,
	'Survival instincts',
	'',
	56
    );  


INSERT INTO wowSpecSpells
    VALUES(
        386,
	31,
	'Skull Bash',
	'',
	64
    );  


INSERT INTO wowSpecSpells
    VALUES(
        387,
	31,
	'Maim',
	'',
	82
    );  


INSERT INTO wowSpecSpells
    VALUES(
        388,
	31,
	'Sharpened Claws (Passive)',
	'',
	90
    );  


INSERT INTO wowSpecSpells
    VALUES(
        389,
	32,
	'Savage Defense',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        390,
	32,
	'Resolve (Passive)',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        391,
	32,
	'Maul',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        392,
	32,
	'Remove Corruption',
	'',
	22
    );  

INSERT INTO wowSpecSpells
    VALUES(
        393,
	32,
	'Faerie Fire',
	'',
	28
    );  

INSERT INTO wowSpecSpells
    VALUES(
        394,
	32,
	'Tooth and Claw (Passive)',
	'',
	32
    );  

INSERT INTO wowSpecSpells
    VALUES(
        395,
	32,
	'Lacerate',
	'',
	38
    );  

INSERT INTO wowSpecSpells
    VALUES(
        396,
	32,
	'Barkskin',
	'',
	44
    );  

INSERT INTO wowSpecSpells
    VALUES(
        397,
	32,
	'Berserk',
	'',
	48
    );  

INSERT INTO wowSpecSpells
    VALUES(
        398,
	32,
	'Survival Instincts',
	'',
	399
    );  

INSERT INTO wowSpecSpells
    VALUES(
        399,
	32,
	'Skull Bash',
	'',
	400
    );  

INSERT INTO wowSpecSpells
    VALUES(
        400,
	32,
	'Ursa Major (Passive)',
	'',
	90
    );  

INSERT INTO wowSpecSpells
    VALUES(
        401,
	32,
	'Survival of the Fittest (Passive)',
	'',
	90
    );  


INSERT INTO wowSpecSpells
    VALUES(
        402,
	33,
	'Natures Swiftness',
	'',
	1
    );  

INSERT INTO wowSpecSpells
    VALUES(
        403,
	33,
	'Swiftmend',
	'',
	10
    );  

INSERT INTO wowSpecSpells
    VALUES(
        404,
	33,
	'Regrowth',
	'',
	18
    );  

INSERT INTO wowSpecSpells
    VALUES(
        405,
	33,
	'Natures Cure',
	'',
	22
    );  

INSERT INTO wowSpecSpells
    VALUES(
        406,
	33,
	'Living Seed (Passive)',
	'',
	28
    );  

INSERT INTO wowSpecSpells
    VALUES(
        407,
	33,
	'Lifebloom',
	'',
	36
    );  

INSERT INTO wowSpecSpells
    VALUES(
        408,
	33,
	'Omen of Clarity (Passive)',
	'',
	38
    );  

INSERT INTO wowSpecSpells
    VALUES(
        409,
	33,
	'Barskin',
	'',
	44
    );  

INSERT INTO wowSpecSpells
    VALUES(
        410,
	33,
	'Ironbark',
	'',
	64
    );  

INSERT INTO wowSpecSpells
    VALUES(
        411,
	33,
	'Tranquility',
	'',
	74
    );  

INSERT INTO wowSpecSpells
    VALUES(
        412,
	33,
	'Wild Growth',
	'',
	76
    );  

INSERT INTO wowSpecSpells
    VALUES(
        413,
	33,
	'Wild Mushroom',
	'',
	84
    );  

INSERT INTO wowSpecSpells
    VALUES(
        414,
	33,
	'Genesis',
	'',
	88
    );  

INSERT INTO wowSpecSpells
    VALUES(
        415,
	33,
	'Naturalist (Passive)',
	'',
	90
    );  


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
        'Plague Bearer',
        '',
        56
    );

INSERT INTO wowTalents 
    VALUES(
        316,
        6,
        15,
        'Plague Leech',
        '',
        56
    );

INSERT INTO wowTalents 
    VALUES(
        317,
        6,
        15,
        'Unholy Blight',
        '',
        56
    );


INSERT INTO wowTalents 
    VALUES(
        318,
        6,
        15,
        'Lichborne',
        '',
        57
    );

INSERT INTO wowTalents 
    VALUES(
        319,
        6,
        15,
        'Anti-Magic Zone',
        '',
        57
    );

INSERT INTO wowTalents 
    VALUES(
        320,
        6,
        15,
        'Purgatory',
        '',
        57
    );

INSERT INTO wowTalents 
    VALUES(
        321,
        6,
        15,
        'Deaths Advance',
        '',
        58
    );

INSERT INTO wowTalents 
    VALUES(
        322,
        6,
        15,
        'Chilblanis',
        '',
        58
    );

INSERT INTO wowTalents 
    VALUES(
        323,
        6,
        15,
        'Asphyziate',
        '',
        58
    );


INSERT INTO wowTalents 
    VALUES(
        324,
        6,
        15,
        'Blood Tap',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        325,
        6,
        15,
        'Runic Empowerment',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        326,
        6,
        15,
        'Runic Corruption',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        327,
        6,
        15,
        'Death Pact',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        328,
        6,
        15,
        'Death Siphon',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        329,
        6,
        15,
        'Conversion',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        330,
        6,
        15,
        'Gorefiends Grasp',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        331,
        6,
        15,
        'Remoreseless Winter',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        332,
        6,
        15,
        'Descrated Ground',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        333,
        6,
        15,
        'Necrotic Plague',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        334,
        6,
        15,
        'Defile',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        335,
        6,
        15,
        'Breath of Sindragosa',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        336,
        6,
        16,
        'Plaguebearer',
        '',
        56
    );

INSERT INTO wowTalents 
    VALUES(
        337,
        6,
        16,
        'Plague Leech',
        '',
        56
    );

INSERT INTO wowTalents 
    VALUES(
        338,
        6,
        16,
        'Unholy Blight',
        '',
        56
    );


INSERT INTO wowTalents 
    VALUES(
        339,
        6,
        16,
        'Lichborne',
        '',
        57
    );

INSERT INTO wowTalents 
    VALUES(
        340,
        6,
        16,
        'Anti-Magic Zone',
        '',
        57
    );

INSERT INTO wowTalents 
    VALUES(
        341,
        6,
        16,
        'Purgatory',
        '',
        57
    );

INSERT INTO wowTalents 
    VALUES(
        342,
        6,
        16,
        'Deaths Advance',
        '',
        58
    );

INSERT INTO wowTalents 
    VALUES(
        343,
        6,
        16,
        'Chilblains',
        '',
        58
    );

INSERT INTO wowTalents 
    VALUES(
        344,
        6,
        16,
        'Asphyxiate',
        '',
        58
    );


INSERT INTO wowTalents 
    VALUES(
        345,
        6,
        16,
        'Blood Tap',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        346,
        6,
        16,
        'Runic Empowerment',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        347,
        6,
        16,
        'Runic Corruption',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        348,
        6,
        16,
        'Death Pact',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        349,
        6,
        16,
        'Death Siphon',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        350,
        6,
        16,
        'Conversion',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        351,
        6,
        16,
        'Gorefiends Grasp',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        352,
        6,
        16,
        'Remoreseless Winter',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        353,
        6,
        16,
        'Desecrated Ground',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        354,
        6,
        16,
        'Necrotic Plague',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        355,
        6,
        16,
        'Defile',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        356,
        6,
        16,
        'Breath of Sindragosa',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        357,
        6,
        17,
        'Plaguebearer',
        '',
        56
    );

INSERT INTO wowTalents 
    VALUES(
        358,
        6,
        17,
        'Plague Leech',
        '',
        56
    );

INSERT INTO wowTalents 
    VALUES(
        359,
        6,
        17,
        'Unholy Blight',
        '',
        56
    );


INSERT INTO wowTalents 
    VALUES(
        360,
        6,
        17,
        'Linchborne',
        '',
        57
    );

INSERT INTO wowTalents 
    VALUES(
        361,
        6,
        17,
        'Anti-Magic Zone',
        '',
        57
    );

INSERT INTO wowTalents 
    VALUES(
        362,
        6,
        17,
        'Purgatory',
        '',
        57
    );

INSERT INTO wowTalents 
    VALUES(
        363,
        6,
        17,
        'Deaths Advance',
        '',
        58
    );

INSERT INTO wowTalents 
    VALUES(
        364,
        6,
        17,
        'Chilblains',
        '',
        58
    );

INSERT INTO wowTalents 
    VALUES(
        365,
        6,
        17,
        'Asphyxiate',
        '',
        58
    );


INSERT INTO wowTalents 
    VALUES(
        366,
        6,
        17,
        'Blood Tap',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        367,
        6,
        17,
        'Runic Empowerment',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        368,
        6,
        17,
        'Runic Corruption',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        369,
        6,
        17,
        'Death Pact',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        370,
        6,
        17,
        'Death Siphon',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        371,
        6,
        17,
        'Conversion',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        372,
        6,
        17,
        'Gorefiends Grasp',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        373,
        6,
        17,
        'Remoreseless Winter',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        374,
        6,
        17,
        'Descrated Ground',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        375,
        6,
        17,
        'Necrotic Plague',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        376,
        6,
        17,
        'Defile',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        377,
        6,
        17,
        'Breath of Sindragosa',
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
        'Natures Guardian',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        379,
        7,
        18,
        'Stone Bulwark Totem',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        380,
        7,
        18,
        'Astral Shift',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        381,
        7,
        18,
        'Frozen Power',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        382,
        7,
        18,
        'Earthgrab Totem',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        383,
        7,
        18,
        'Windwalk Totem',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        384,
        7,
        18,
        'Call of the Elements',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        385,
        7,
        18,
        'Totemic Persistence',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        386,
        7,
        18,
        'Totemic Projection',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        387,
        7,
        18,
        'Elemental Mastery',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        388,
        7,
        18,
        'Ancestral Swiftness',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        389,
        7,
        18,
        'Echo of the Elements',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        390,
        7,
        18,
        'Rushing Streams',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        391,
        7,
        18,
        'Ancestral Guidance',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        392,
        7,
        18,
        'Conductivity',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        393,
        7,
        18,
        'Unleashed Fury',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        394,
        7,
        18,
        'Primal Elementalist',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        395,
        7,
        18,
        'Elemental Blast',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        396,
        7,
        18,
        'Elemental Fusion',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        397,
        7,
        18,
        'Storm Elemental Totem',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        398,
        7,
        18,
        'Liquid Magma',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        399,
        7,
        19,
        'Natures Guardian',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        400,
        7,
        19,
        'Stone Bulwark Totem',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        401,
        7,
        19,
        'Astral Shift',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        402,
        7,
        19,
        'Frozen Power',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        403,
        7,
        19,
        'Earthgrap Totem',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        404,
        7,
        19,
        'Windwalk Totem',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        405,
        7,
        19,
        'Call of the Elements',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        406,
        7,
        19,
        'Totemic Persistence',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        407,
        7,
        19,
        'Totemic Projection',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        408,
        7,
        19,
        'Elemental Mastery',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        409,
        7,
        19,
        'Ancestral Swiftness',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        410,
        7,
        19,
        'Echo of the Elements',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        411,
        7,
        19,
        'Rushing Streams',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        412,
        7,
        19,
        'Ancestral Guidance',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        413,
        7,
        19,
        'Conductivity',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        414,
        7,
        19,
        'Unleashed Fury',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        415,
        7,
        19,
        'Primal Elementalist',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        416,
        7,
        19,
        'Elemental Blast',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        417,
        7,
        19,
        'Elemental Fusion',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        418,
        7,
        19,
        'Storm Elemental Totem',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        419,
        7,
        19,
        '',
        'Liquid Magma',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        420,
        7,
        20,
        'Natures Guardian',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        421,
        7,
        20,
        'Stone Bulwark Totem',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        422,
        7,
        20,
        'Astral Shift',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        423,
        7,
        20,
        'Frozen Power',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        424,
        7,
        20,
        'Earthgrab Totem',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        425,
        7,
        20,
        'Windwalk Totem',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        426,
        7,
        20,
        'Call of the Elements',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        427,
        7,
        20,
        'Totemic Persistence',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        428,
        7,
        20,
        'Totemic Projection',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        429,
        7,
        20,
        'Elemental Mastery',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        430,
        7,
        20,
        'Ancestral Swiftness',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        431,
        7,
        20,
        'Echo of the Elements',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        432,
        7,
        20,
        'Rushing Streams',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        433,
        7,
        20,
        'Ancestral Guidance',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        434,
        7,
        20,
        'Conductivity',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        435,
        7,
        20,
        'Unleashed Fury',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        436,
        7,
        20,
        'Primal Elementalist',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        437,
        7,
        20,
        'Elemental Blast',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        438,
        7,
        20,
        'Cloudburst Totem',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        439,
        7,
        20,
        'Storm Elemental Totem',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        440,
        7,
        20,
        'High Tide',
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
        'Evanesce',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        442,
        8,
        21,
        'Blazing Speed',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        443,
        8,
        21,
        'Ice Floes',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        444,
        8,
        21,
        'Alter Time',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        445,
        8,
        21,
        'Flameglow',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        446,
        8,
        21,
        'Ice Barrier',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        447,
        8,
        21,
        'Ring of Frost',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        448,
        8,
        21,
        'Ice Ward',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        449,
        8,
        21,
        'Frostjaw',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        450,
        8,
        21,
        'Greater Invisibility',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        451,
        8,
        21,
        'Cauterize',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        452,
        8,
        21,
        'Clod Snap',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        453,
        8,
        21,
        'Nether Tempest',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        454,
        8,
        21,
        'Unstable Magic',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        455,
        8,
        21,
        'Supernova',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        456,
        8,
        21,
        'Mirror Image',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        457,
        8,
        21,
        'Rune of Power',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        458,
        8,
        21,
        'Incanters Flow',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        459,
        8,
        21,
        'Overpowered',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        460,
        8,
        21,
        'Prismatic Crystal',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        461,
        8,
        21,
        'Arcane Orb',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        462,
        8,
        22,
        'Evanesce',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        463,
        8,
        22,
        'Blazing Speed',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        464,
        8,
        22,
        'Ice Floes',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        465,
        8,
        22,
        'Alter Time',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        466,
        8,
        22,
        'Flameglow',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        467,
        8,
        22,
        'Ice Barrier',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        468,
        8,
        22,
        'Ring of Frost',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        469,
        8,
        22,
        'Ice Ward',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        470,
        8,
        22,
        'Frostjaw',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        471,
        8,
        22,
        'Greater Invisibility',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        472,
        8,
        22,
        'Cauterize',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        473,
        8,
        22,
        'Cold Snap',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        474,
        8,
        22,
        'Living Bomb',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        475,
        8,
        22,
        'Unstable Magic',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        476,
        8,
        22,
        'Blast Wave',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        477,
        8,
        22,
        'Mirror Image',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        478,
        8,
        22,
        'Rune of Power',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        479,
        8,
        22,
        'Incanters Flow',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        480,
        8,
        22,
        'Kindling',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        481,
        8,
        22,
        'Prismatic Crystal',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        482,
        8,
        22,
        'Meteor',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        483,
        8,
        23,
        'Evanesce',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        484,
        8,
        23,
        'Blazing Speed',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        485,
        8,
        23,
        'Ice Floes',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        486,
        8,
        23,
        'Alter Time',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        487,
        8,
        23,
        'Flameglow',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        488,
        8,
        23,
        'Ice Barrier',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        489,
        8,
        23,
        'Ring of Frost',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        490,
        8,
        23,
        'Ice Ward',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        491,
        8,
        23,
        'Frostjaw',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        492,
        8,
        23,
        'Greater Invisibility',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        493,
        8,
        23,
        'Cauterize',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        494,
        8,
        23,
        'Cold Snap',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        495,
        8,
        23,
        'Frost Bomb',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        496,
        8,
        23,
        'Unstable Magic',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        497,
        8,
        23,
        'Ice Nova',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        498,
        8,
        23,
        'Mirror Image',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        499,
        8,
        23,
        'Rune of Power',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        500,
        8,
        23,
        'Incanters Flow',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        501,
        8,
        23,
        'Thermal Void',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        502,
        8,
        23,
        'Prismatic Crystal',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        503,
        8,
        23,
        'Comet Storm',
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
        'Dark Regeneration',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        505,
        9,
        24,
        'Soul Leech',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        506,
        9,
        24,
        'Harvest Life',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        507,
        9,
        24,
        'Howl of Terror',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        508,
        9,
        24,
        'Mortal Coil',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        509,
        9,
        24,
        'Shadowfury',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        510,
        9,
        24,
        'Soul Link',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        511,
        9,
        24,
        'Sacrifical Pact',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        512,
        9,
        24,
        'Drak Bargain',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        513,
        9,
        24,
        'Blood Horror',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        514,
        9,
        24,
        'Burning Rush',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        515,
        9,
        24,
        'Unbound Will',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        516,
        9,
        24,
        'Grimoire of Supremacy',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        517,
        9,
        24,
        'Grimoire of Service',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        518,
        9,
        24,
        'Gro,pore pf Sacrofoce',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        519,
        9,
        24,
        'Archimondes Darkness',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        520,
        9,
        24,
        'Kil jaedens Cunning',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        521,
        9,
        24,
        'Mannoroths Fury',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        522,
        9,
        24,
        'Soulburn: Haunt',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        523,
        9,
        24,
        'Cataclysm',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        524,
        9,
        24,
        'Demonic Servitude',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        525,
        9,
        25,
        'Dark Regeneration',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        526,
        9,
        25,
        'Soul Leech',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        527,
        9,
        25,
        'Harvest Life',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        528,
        9,
        25,
        'Howl of Terror',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        529,
        9,
        25,
        'Mortal Coil',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        530,
        9,
        25,
        'Shadowfury',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        531,
        9,
        25,
        'Soul Link',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        532,
        9,
        25,
        'Sacrificaial Pact',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        533,
        9,
        25,
        'Dark Bargain',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        534,
        9,
        25,
        'Blood Horror',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        535,
        9,
        25,
        'Burning Rush',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        536,
        9,
        25,
        'Unbound Will',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        537,
        9,
        25,
        'Grimoire of Superemacy',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        538,
        9,
        25,
        'Grimoire of Service',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        539,
        9,
        25,
        'Grimoire of Synergy',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        540,
        9,
        25,
        'Archimondes Darkness',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        541,
        9,
        25,
        'Kiljaedens Cunning',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        542,
        9,
        25,
        'Mannoroths Fury',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        543,
        9,
        25,
        'Demonbolt',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        544,
        9,
        25,
        'Cataclysm',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        545,
        9,
        25,
        'Demonic Servitude',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        546,
        9,
        26,
        'Dark Regeneration',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        547,
        9,
        26,
        'Soul Leech',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        548,
        9,
        26,
        'Searing Flames',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        549,
        9,
        26,
        'Howl of Terror',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        550,
        9,
        26,
        'Mortal Coil',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        551,
        9,
        26,
        'Shadowfury',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        552,
        9,
        26,
        'Soul Link',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        553,
        9,
        26,
        'Sacrifical Pact',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        554,
        9,
        26,
        'Dark Bargain',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        555,
        9,
        26,
        'Blood Horror',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        556,
        9,
        26,
        'Burning Rush',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        557,
        9,
        26,
        'Unbound Will',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        558,
        9,
        26,
        'Grimoire of Supermacy',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        559,
        9,
        26,
        'Grimoire of Service',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        560,
        9,
        26,
        'Grimoire of Sacrifice',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        561,
        9,
        26,
        'Archimondes Darkness',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        562,
        9,
        26,
        'Kil jaedens Cunning',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        563,
        9,
        26,
        'Mannoroths Fury',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        564,
        9,
        26,
        'Charred Remains',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        565,
        9,
        26,
        'Cataclysm',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        566,
        9,
        26,
        'Demonic Servitude',
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
        'Celerity',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        568,
        10,
        27,
        'Tigers Lust',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        569,
        10,
        27,
        'Momentum',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        570,
        10,
        27,
        'Chi Wave',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        571,
        10,
        27,
        'Zen Sphere',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        572,
        10,
        27,
        'Chi Burst',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        573,
        10,
        27,
        'Power Strikes',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        574,
        10,
        27,
        'Ascension',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        575,
        10,
        27,
        'Chi Brew',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        576,
        10,
        27,
        'Ring of Peace',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        577,
        10,
        27,
        'Charging Ox Wave',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        578,
        10,
        27,
        'Leg Sweep',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        579,
        10,
        27,
        'Healing Elixirs',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        580,
        10,
        27,
        'Dampen Harm',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        581,
        10,
        27,
        'Diffuse Magic',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        582,
        10,
        27,
        'Rushing Jade Wind',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        583,
        10,
        27,
        'Invoke Xuen, the White Tiger',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        584,
        10,
        27,
        'Chi Torpedo',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        585,
        10,
        27,
        'Soul Dance',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        586,
        10,
        27,
        'Chi Explosion',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        587,
        10,
        27,
        'Serenity',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        588,
        10,
        28,
        'Celerity',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        589,
        10,
        28,
        'Tigers Lust',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        590,
        10,
        28,
        'Momentum',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        591,
        10,
        28,
        'Chi Wave',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        592,
        10,
        28,
        'Zen Sphere',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        593,
        10,
        28,
        'Chi Burst',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        594,
        10,
        28,
        'Power Strikes',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        595,
        10,
        28,
        'Ascension',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        596,
        10,
        28,
        'Chi Brew',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        597,
        10,
        28,
        'Ring of Peace',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        598,
        10,
        28,
        'Charging Ox Wave',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        599,
        10,
        28,
        'Leg Sweep',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        600,
        10,
        28,
        'Healing Elixers',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        601,
        10,
        28,
        'Dampen Harm',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        602,
        10,
        28,
        'Diffuse Magic',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        603,
        10,
        28,
        'Rushing Jade Wind',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        604,
        10,
        28,
        'Invoke Xuen, the White Tiger',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        605,
        10,
        28,
        'Chi Torpedo',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        606,
        10,
        28,
        'Breath of the Serpent',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        607,
        10,
        28,
        'Chi Explosion',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        608,
        10,
        28,
        'Pool of Mists',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        609,
        10,
        29,
        'Celerity',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        610,
        10,
        29,
        'Tigers Lust',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        611,
        10,
        29,
        'Momentum',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        612,
        10,
        29,
        'Chi Wave',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        613,
        10,
        29,
        'Zen Sphere',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        614,
        10,
        29,
        'Chi Burst',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        615,
        10,
        29,
        'Power Strikes',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        616,
        10,
        29,
        'Ascension',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        617,
        10,
        29,
        'Chi Brew',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        618,
        10,
        29,
        'Ring of Peace',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        619,
        10,
        29,
        'Charging Ox Wave',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        620,
        10,
        29,
        'Leg Sweep',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        621,
        10,
        29,
        'Healing Elixers',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        622,
        10,
        29,
        'Dampen Harm',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        623,
        10,
        29,
        'Diffuse Magic',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        624,
        10,
        29,
        'Rushing Jade Wind',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        625,
        10,
        29,
        'Invoke Xuen, the White Tiger',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        626,
        10,
        29,
        'Chi Torpedo',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        627,
        10,
        29,
        'Hurricane Strike',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        628,
        10,
        29,
        'Chi Explosion',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        629,
        10,
        29,
        'Serenity',
        '',
        100
    );


/*
*****************************************************************************************
*  Druid  11*****************************************************************************
*****************************************************************************************
*/

INSERT INTO wowTalents 
    VALUES(
        630,
        11,
        30,
        'Feline Swiftness',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        631,
        11,
        30,
        'Displacer Beast',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        632,
        11,
        30,
        'Wild Charge',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        633,
        11,
        30,
        'Yseras Gift',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        634,
        11,
        30,
        'Renewal',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        635,
        11,
        30,
        'Cenarion Ward',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        636,
        11,
        30,
        'Faerie Swarm',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        637,
        11,
        30,
        'Mass Entanglement',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        638,
        11,
        30,
        'Typhoon',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        639,
        11,
        30,
        'Soul of the Forest',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        640,
        11,
        30,
        'Incarnation: Chosen of Elune',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        641,
        11,
        30,
        'Force of Nature',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        642,
        11,
        30,
        'Incapacitating Roar',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        643,
        11,
        30,
        'Ursols Vortex',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        644,
        11,
        30,
        'Mighty Bash',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        645,
        11,
        30,
        'Heart of the Wild',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        646,
        11,
        30,
        'Dream of Cenarius',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        647,
        11,
        30,
        'Natures Vigil',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        648,
        11,
        30,
        'Euphoria',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        649,
        11,
        30,
        'Stellar Flare',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        650,
        11,
        30,
        'Balance of Power',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        651,
        11,
        31,
        'Feline Swiftness',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        652,
        11,
        31,
        'Displacer Beast',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        653,
        11,
        31,
        'Wild Charge',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        654,
        11,
        31,
        'Yseras Gift',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        655,
        11,
        31,
        'Renewal',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        656,
        11,
        31,
        'Cenarion Ward',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        657,
        11,
        31,
        'Faerie Swarm',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        658,
        11,
        31,
        'Mass Entanglement',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        659,
        11,
        31,
        'Typhoon',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        660,
        11,
        31,
        'Soul of the Forest',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        661,
        11,
        31,
        'Incarnation: King of the Jungle',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        662,
        11,
        31,
        'Force of Nature',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        663,
        11,
        31,
        'Incapacitating Roar',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        664,
        11,
        31,
        'Ursols Vortex',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        665,
        11,
        31,
        'Mighty Bash',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        666,
        11,
        31,
        'Heart of the Wild',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        667,
        11,
        31,
        'Dream of Cenarius',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        668,
        11,
        31,
        'Natures Vigil',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        669,
        11,
        31,
        'Lunar Inspiration',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        670,
        11,
        31,
        'Bloodtalons',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        671,
        11,
        31,
        'Claws of Shirvallah',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        672,
        11,
        32,
        'Feline Swiftness',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        673,
        11,
        32,
        'Displacer Beast',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        674,
        11,
        32,
        'Wild Charge',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        675,
        11,
        32,
        'Ysera Gift',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        676,
        11,
        32,
        'Renewal',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        677,
        11,
        32,
        'Cenarion Ward',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        678,
        11,
        32,
        'Faerie Swarm',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        679,
        11,
        32,
        'Mass Entanglement',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        680,
        11,
        32,
        'Typhoon',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        681,
        11,
        32,
        'Soul of the Forest',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        682,
        11,
        32,
        'Incarnation: Son of Ursoc',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        683,
        11,
        32,
        'Force of Nature',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        684,
        11,
        32,
        'Incapacitating Roar',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        685,
        11,
        32,
        'Ursols Vortex',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        686,
        11,
        32,
        'Mighty Bash',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        687,
        11,
        32,
        'Heart of the Wild',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        688,
        11,
        32,
        'Dream of Cenarius',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        689,
        11,
        32,
        'Natures Vigil',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        690,
        11,
        32,
        'Guardian of Elune',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        691,
        11,
        32,
        'Pulverize',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        692,
        11,
        32,
        'Bristling Fur',
        '',
        100
    );    


INSERT INTO wowTalents 
    VALUES(
        693,
        11,
        33,
        'Feline Swiftness',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        694,
        11,
        33,
        'Displacer Beast',
        '',
        15
    );

INSERT INTO wowTalents 
    VALUES(
        695,
        11,
        33,
        'Wild Charge',
        '',
        15
    );


INSERT INTO wowTalents 
    VALUES(
        696,
        11,
        33,
        'Yseras Gift',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        697,
        11,
        33,
        'Renewal',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        698,
        11,
        33,
        'Cenarion Ward',
        '',
        30
    );

INSERT INTO wowTalents 
    VALUES(
        699,
        11,
        33,
        'Faerie Swarm',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        700,
        11,
        33,
        'Mass Entanglement',
        '',
        45
    );

INSERT INTO wowTalents 
    VALUES(
        701,
        11,
        33,
        'Typhoon',
        '',
        45
    );


INSERT INTO wowTalents 
    VALUES(
        702,
        11,
        33,
        'Soul of the Forest',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        703,
        11,
        33,
        'Incarnation: Tree of Life',
        '',
        60
    );

INSERT INTO wowTalents 
    VALUES(
        704,
        11,
        33,
        'Force of Nature',
        '',
        60
    );


INSERT INTO wowTalents 
    VALUES(
        705,
        11,
        33,
        'Incapacitating Roar',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        706,
        11,
        33,
        'Ursols Vortex',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        707,
        11,
        33,
        'Mighty Bash',
        '',
        75
    );

INSERT INTO wowTalents 
    VALUES(
        708,
        11,
        33,
        'Heart of the Wild',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        709,
        11,
        33,
        'Dream of Cenarius',
        '',
        90
    );

INSERT INTO wowTalents 
    VALUES(
        710,
        11,
        33,
        'Natures Vigil',
        '',
        90
    );


INSERT INTO wowTalents 
    VALUES(
        711,
        11,
        33,
        'Moment of Clarity',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        712,
        11,
        33,
        'Germination',
        '',
        100
    );

INSERT INTO wowTalents 
    VALUES(
        713,
        11,
        33,
        'Rampant Growth',
        '',
        100
    );    

