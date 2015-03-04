/*CREATE the database IF it doesn't exist*/
CREATE database IF NOT EXISTS csc435;
/*change to database*/
USE csc435;


/*
**************************************
*Delete the TABLEs IF they EXISTS and*
*CREATE new ones                     *
**************************************
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
    FOREIGN KEY (classID) REFERENCES wowClass(classID)
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
**************************************
*Populate the TABLEs with data       *
*CREATE new ones                     *
**************************************
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
************
* Warrior 1*
************
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
************
* Paladin 2*
************
*/
        
/*
************
*  Hunter 3*
************
*/
        
/*
************
*  Rogue  4*
************
*/

        
/*
************
*  Priest 5*
************
*/
        
/*
*****************
* Death Knight 6*
*****************
*/
        
/*
************
*  Shaman 7*
************
*/

        
/*
************
*   Mage  8*
************
*/
        

/*
************
* Warlock 9*
************
*/
        
/*
*************
*   Monk  10*
*************
*/
        
/*
*************
*  Druid  11*
*************
*/


/*wowTalents*/
/*
************
* Warrior 1*
************
*/
    
/*
************
* Paladin 2*
************
*/

/*
************
*  Hunter 3*
************
*/

/*
************
*  Rogue  4*
************
*/

/*
************
*  Priest 5*
************
*/

/*
*****************
* Death Knight 6*
*****************
*/

/*
************
*  Shaman 7*
************
*/

/*
************
*   Mage  8*
************
*/


/*
************
* Warlock 9*
************
*/

/*
*************
*   Monk  10*
*************
*/

/*
*************
*  Druid  11*
*************
*/
    
