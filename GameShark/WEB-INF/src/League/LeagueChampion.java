/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package League;

import javax.json.JsonArray;
import javax.json.JsonObject;

/**
 *
 * @author kellymaestri
 */
public class LeagueChampion {
    String name;
    String image;
    int id;
    String title;
    String lore;
    String partype;
    LeagueChampStats stats;
    LeagueChampSpells[] spells;
    LeagueChampionPassive passive;
    
    public LeagueChampion(JsonObject json, String im){
     
        image = im;
        name = json.getString("name");
        title = json.getString("title");
        id = json.getInt("id");
        lore = json.getString("lore");
        partype = json.getString("partype");
        
        stats = new LeagueChampStats(json.getJsonObject("stats"));
        passive = new LeagueChampionPassive(json.getJsonObject("passive"));
        JsonArray sp = json.getJsonArray("spells");
        spells = new  LeagueChampSpells[sp.size()];
        for(int i = 0; i<sp.size(); i++){
            spells[i] = new LeagueChampSpells(sp.getJsonObject(i));
        }
        
        
    }
    
    public void updateStats(boolean newItem, Item item){
        stats.updateArmor(newItem, item.armor, item.parmor);
        stats.updateAttackDamage(newItem, item.physicalDamage, item.pphysicalDamage);
        stats.updateAttackSpeed(newItem, item.attackSpeed, item.pattackSpeed);
        stats.updateCrit(newItem, item.critDamage, item.pcritDamage);
        stats.updateHealth(newItem, item.hp, item.php);
        stats.updateHealthRegen(newItem, item.hpRegen, item.hpRegen);
        stats.updateMagicResist(newItem, item.spellBlock, item.pspellBlock);
        stats.updateMana(newItem, item.mp, item.pmp);
        stats.updateManaRegen(newItem, item.mpRegen, item.pmpRegen);
        stats.updatetMovementSpeed(newItem, item.movementSpeed, item.pmovementSpeed);
        stats.updateDodge(newItem, 0, item.pdodge);
        stats.updateCritChance(newItem, item.critChance, item.pcritChance);
        stats.updateAP(newItem, item.magicDamage, item.pmagicDamage);
        stats.updateSpellVamp(newItem, 0, item.pspellVamp);
        stats.updateLifeSteal(newItem, 0, item.plifeSteal);
    
    }
    
    public int getID(){
     return id;   
    }
    
    public int getLevel(){
        return stats.getLevel();
    }
    
    public String getImage(){
     return image;   
    }
    
    public String getIDasString(){
    return Integer.toString(id);
    }
    
    
    public String getName(){
        return name;
    }
    
    public String getTitle(){
        return title;
    }

    public String getLore(){
        return lore;
    }
    public LeagueChampSpells[] getSkills(){
        return this.spells;
    }
  
    public String getSkillQImage() {
        if (spells != null && 1 <= spells.length) {
            return spells[0].getImage();
        } else {
            return "Error";
        }
    }
    
    public String getSkillQName() {
        if (spells != null && 1 <= spells.length) {
            return spells[0].getName();
        } else {
            return "Error";
        }
    }
        
    public String getSkillQDesc() {
        if (spells != null && 1 <= spells.length) {
            return spells[0].getDescription();
        } else {
            return "Error";
        }
    }

    public String getSkillWImage() {
        if (spells != null && 2 <= spells.length) {
            return spells[1].getImage();
        } else {
            return "Error";
        }
    }
    
   public String getSkillWName() {
        if (spells != null && 2 <= spells.length) {
            return spells[1].getName();
        } else {
            return "Error";
        }
    }
        
    public String getSkillWDesc() {
        if (spells != null && 2 <= spells.length) {
            return spells[1].getDescription();
        } else {
            return "Error";
        }
    }
        
    public String getSkillEImage(){
        if (spells != null && 3 <= spells.length) {
            return spells[2].getImage();
        } else {
            return "Error";
        }
    }
    
    public String getSkillEName(){
        if (spells != null && 3 <= spells.length) {
            return spells[2].getName();
        } else {
            return "Error";
        }
    }
        
    public String getSkillEDesc(){
        if (spells != null && 3 <= spells.length) {
            return spells[2].getDescription();
        } else {
            return "Error";
        }
    }
            
    public String getSkillRImage(){
        if (spells != null && 4 <= spells.length) {
            return spells[3].getImage();
        } else {
            return "Error";
        }
    }
    
        public String getSkillRName(){
        if (spells != null && 4 <= spells.length) {
            return spells[3].getName();
        } else {
            return "Error";
        }
    }
        
            public String getSkillRDesc(){
        if (spells != null && 4 <= spells.length) {
            return spells[3].getDescription();
        } else {
            return "Error";
        }
    }
    
    public String getPassiveImage(){
     return passive.getImage();   
    }
    
    public String getPassiveName(){
        return passive.getName();
    }
    
    public String getPassiveDesc(){
     return passive.getDesc();   
    }
    
    public double getHealth(){
        return stats.getHealth();
    }
    
    public double getArmor(){
        return stats.getArmor();
    }
    
    public double getAttackDamage(){
     return stats.getAttackDamage();
    }
    
    public double getHealthRegen(){
        return stats.getHealthRegen();
    }
    
    public double getMana(){
        return stats.getMana();
    }
    
    public double getManaRegen(){
        return stats.getManaRegen();
    }
    
    public double getMagicResist(){
        return stats.getMagicResist();
    }
    
    public double getMovementSpeed(){
        return stats.getMovementSpeed();
    }
    
    public double getAttackSpeed(){
        return stats.getAttackSpeed();
    }
    
    public double getCritDamage(){
        return stats.getCritDamage();
    }
    
    public double getCritChance(){
        return stats.getCritChance();
    }
    
    public double getSpellVamp(){
        return stats.getSpellVamp();
    }
    
    public double getDodge(){
        return stats.getDodge();
    }
    public double getTenacity(){
        return stats.getTenacity();
    }
    public double getAP(){
        return stats.getAP();
    }
    
    public double getArmorPen(){
        return stats.getArmorPen();
    }
    public double getMagicPen(){
        return stats.getMagicPen();
    }
    public double getLifeSteal(){
        return stats.getLifeSteal();
    }
    
}
