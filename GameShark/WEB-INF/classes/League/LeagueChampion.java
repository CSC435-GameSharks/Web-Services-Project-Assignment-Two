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
    LeagueChampionAllyTips allyTips;
    LeagueChampionEnemyTips enemyTips;
    LeagueChampionTags tags;
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
    
    public int getID(){
     return id;   
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
    
    public double getArmorPerLevel(){
        return stats.getArmorPerLevel();
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
    
    public double getCrit(){
        return stats.getCrit();
    }
    
    
}
