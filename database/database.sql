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

    
/*delete wowSpells TABLE IF it EXISTS*/    
DROP TABLE IF EXISTS wowSpells;
/*CREATE wowSpells TABLE*/
CREATE TABLE wowSpells(
    spellID int,
    classID int,
    specID int,
    spellName varchar(50),
    spellDesc varcchar(512),
    lvl int,
    PRIMARY KEY(spellID, classID, specID),
    FOREIGN KEY (classID) REFERENCES wowClass(classID),
    FOREIGN KEEP (specID) REFERENCES wowSpecializations(specID));

    
/*delete wowTalents TABLE IF it EXISTS*/        
DROP TABLE IF EXISTS wowTalents;
/*CREATE wowSpells TABLE*/
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
        "Warrior"
        "For as long as war has raged, heroes from every race have aimed to master the art of battle. Warriors combine strength, leadership, and a vast knowledge of arms and armor to wreak havoc in glorious combat. Some protect from the front lines with shields, locking down enemies while allies support the warrior from behind with spell and bow. Others forgo the shield and unleash their rage at the closest threat with a variety of deadly weapons."
    );

INSERT INTO wowClass
    VALUES(
        2,
        "Paladin"
        "This is the call of the paladin: to protect the weak, to bring justice to the unjust, and to vanquish evil from the darkest corners of the world. These holy warriors are equipped with plate armor so they can confront the toughest of foes, and the blessing of the Light allows them to heal wounds and, in some cases, even restore life to the dead."
    );

INSERT INTO wowClass
    VALUES(
        3,
        "Hunter"
        "From an early age the call of the wild draws some adventurers from the comfort of their homes into the unforgiving primal world outside. Those who endure become hunters. Masters of their environment, they are able to slip like ghosts through the trees and lay traps in the paths of their enemies."
    );

INSERT INTO wowClass
    VALUES(
        4,
        "Rouge"
        "For rogues, the only code is the contract, and their honor is purchased in gold. Free from the constraints of a conscience, these mercenaries rely on brutal and efficient tactics. Lethal assassins and masters of stealth, they will approach their marks from behind, piercing a vital organ and vanishing into the shadows before the victim hits the ground."
    );

INSERT INTO wowClass
    VALUES(
        5,
        "Priest"
        "Priests are devoted to the spiritual, and express their unwavering faith by serving the people. For millennia they have left behind the confines of their temples and the comfort of their shrines so they can support their allies in war-torn lands. In the midst of terrible conflict, no hero questions the value of the priestly orders."
    );

INSERT INTO wowClass
    VALUES(
        6,
        "Death Knight"
        "When the Lich King’s control of his death knights was broken, his former champions sought revenge for the horrors committed under his command. After their vengeance was won, the death knights found themselves without a cause and without a home. One by one they trickled into the land of the living in search of a new purpose."
    );

INSERT INTO wowClass
    VALUES(
        7,
        "Shaman"
        "Shaman are spiritual guides and practitioners, not of the divine, but of the very elements. Unlike some other mystics, shaman commune with forces that are not strictly benevolent. The elements are chaotic, and left to their own devices, they rage against one another in unending primal fury. It is the call of the shaman to bring balance to this chaos. Acting as moderators among earth, fire, water, and air, shaman summon totems that focus the elements to support the shaman’s allies or punish those who threaten them."
    );    

INSERT INTO wowClass
    VALUES(
        8,
        "Mage"
        "Students gifted with a keen intellect and unwavering discipline may walk the path of the mage. The arcane magic available to magi is both great and dangerous, and thus is revealed only to the most devoted practitioners. To avoid interference with their spellcasting, magi wear only cloth armor, but arcane shields and enchantments give them additional protection. To keep enemies at bay, magi can summon bursts of fire to incinerate distant targets and cause entire areas to erupt, setting groups of foes ablaze."
    );    
    
INSERT INTO wowClass
    VALUES(
        9,
        "Warlock"
        "In the face of demonic power, most heroes see death. Warlocks see only opportunity. Dominance is their aim, and they have found a path to it in the dark arts. These voracious spellcasters summon demonic minions to fight beside them. At first, they command only the service of imps, but as a warlock’s knowledge grows, seductive succubi, loyal voidwalkers, and horrific felhunters join the dark sorcerer’s ranks to wreak havoc on anyone who stands in their master’s way."
    );    

INSERT INTO wowClass
    VALUES(
        10,
        "Monk"
        "When the pandaren were subjugated by the mogu centuries ago, it was the monks that brought hope to a seemingly dim future. Restricted from using weapons by their slave masters, these pandaren instead focused on harnessing their chi and learning weaponless combat. When the opportunity for revolution struck, they were well-trained to throw off the yoke of oppression."
    );    

INSERT INTO wowClass
    VALUES(
        11,
        "Druid"
        "Druids harness the vast powers of nature to preserve balance and protect life. With experience, druids can unleash nature’s raw energy against their enemies, raining celestial fury on them from a great distance, binding them with enchanted vines, or ensnaring them in unrelenting cyclones."
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
        2
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
        "Arms"
    );
    
INSERT INTO wowSpecializations
    VALUES(
        1,
        1,
        "Fury"
    );

INSERT INTO wowSpecializations
    VALUES(
        2,
        1,
        "Protection"
    );    

INSERT INTO wowSpecializations
    VALUES(
        3,
        2,
        "Holy"
    );
    
INSERT INTO wowSpecializations
    VALUES(
        4,
        2,
        "Protection"
    );

INSERT INTO wowSpecializations
    VALUES(
        5,
        2,
        "Retribution"
    );    
    
INSERT INTO wowSpecializations
    VALUES(
        6,
        3,
        "Beast Mastery"
    );
    
INSERT INTO wowSpecializations
    VALUES(
        7,
        3,
        "Marksmanship"
    );

INSERT INTO wowSpecializations
    VALUES(
        8,
        3,
        "Survival"
    );    

INSERT INTO wowSpecializations
    VALUES(
        9,
        4,
        "Assassination"
    );
    
INSERT INTO wowSpecializations
    VALUES(
        10,
        4,
        "Combat"
    );

INSERT INTO wowSpecializations
    VALUES(
        11,
        4,
        "Subtlety"
    );    
    
INSERT INTO wowSpecializations
    VALUES(
        12,
        5,
        "Discipline"
    );
    
INSERT INTO wowSpecializations
    VALUES(
        13,
        5,
        "Holy"
    );

INSERT INTO wowSpecializations
    VALUES(
        14,
        5,
        "Shadow"
    );    


INSERT INTO wowSpecializations
    VALUES(
        15,
        6,
        "Blood"
    );
    
INSERT INTO wowSpecializations
    VALUES(
        16,
        6,
        "Frost"
    );

INSERT INTO wowSpecializations
    VALUES(
        17,
        6,
        "Unholy"
    );    

INSERT INTO wowSpecializations
    VALUES(
        18,
        7,
        "Elemental"
    );
    
INSERT INTO wowSpecializations
    VALUES(
        19,
        7,
        "Enhancement"
    );

INSERT INTO wowSpecializations
    VALUES(
        20,
        7,
        "Restoration"
    );    

INSERT INTO wowSpecializations
    VALUES(
        21,
        8,
        "Arcane"
    );
    
INSERT INTO wowSpecializations
    VALUES(
        22,
        8,
        "Fire"
    );

INSERT INTO wowSpecializations
    VALUES(
        23,
        8,
        "Frost"
    );    
    
INSERT INTO wowSpecializations
    VALUES(
        24,
        9,
        "Affliction"
    );
    
INSERT INTO wowSpecializations
    VALUES(
        25,
        9,
        "Demonology"
    );

INSERT INTO wowSpecializations
    VALUES(
        26,
        9,
        "Destruction"
    );    
    
INSERT INTO wowSpecializations
    VALUES(
        27,
        10,
        "Brewmaster"
    );
    
INSERT INTO wowSpecializations
    VALUES(
        28,
        10,
        "Mistweaver"
    );

INSERT INTO wowSpecializations
    VALUES(
        29,
        10,
        "Windwalker"
    );    
    
INSERT INTO wowSpecializations
    VALUES(
        30,
        11,
        "Balance"
    );
    
INSERT INTO wowSpecializations
    VALUES(
        31,
        11,
        "Feral"
    );

INSERT INTO wowSpecializations
    VALUES(
        32,
        11,
        "Guardian"
    );    

INSERT INTO wowSpecializations
    VALUES(
        33,
        11,
        "Restoration"
    );    
    
    
/*wowSpells*/
/*
************
* Warrior 1*
************
*/
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

                        
/*
************
* Paladin 2*
************
*/
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

        
/*
************
*  Hunter 3*
************
*/
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

        
/*
************
*  Rogue  4*
************
*/
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

        
/*
************
*  Priest 5*
************
*/
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

        
/*
*****************
* Death Knight 6*
*****************
*/
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

        
/*
************
*  Shaman 7*
************
*/
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

        
/*
************
*   Mage  8*
************
*/
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

        

/*
************
* Warlock 9*
************
*/
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

        
/*
*************
*   Monk  10*
*************
*/
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

        
/*
*************
*  Druid  11*
*************
*/
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowSpells
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

        


/*wowTalents*/

/*wowTalents*/
/*
************
* Warrior 1*
************
*/
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    
    
/*
************
* Paladin 2*
************
*/
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

/*
************
*  Hunter 3*
************
*/
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

/*
************
*  Rogue  4*
************
*/
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

/*
************
*  Priest 5*
************
*/
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

/*
*****************
* Death Knight 6*
*****************
*/
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

/*
************
*  Shaman 7*
************
*/
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

/*
************
*   Mage  8*
************
*/
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    


/*
************
* Warlock 9*
************
*/
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

/*
*************
*   Monk  10*
*************
*/
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

/*
*************
*  Druid  11*
*************
*/
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

    INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );
    
INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );

INSERT INTO wowTalents
    VALUES(
        0,
        1,
        0,
        "",
        "",
        0
    );    


    