/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package League;


import javax.json.JsonObject;

/**
 *
 * @author kellymaestri
 */
public class LeagueChampStats {
    private double armor;
    private double armorPerLevel;
    private double attackDamage;
    private double attackDamagePerLevel;
    private double attackRange;
    private double attackSpeedOffset;
    private double attackSpeedPerLevel;
    private double crit;
    private double critPerLevel;
    private double hp;
    private double hpPerLevel;
    private double hpRegen;
    private double hpRegenPerLevel;
    private double moveSpeed;
    private double mp;
    private double mpPerLevel;
    private double mpRegen;
    private double mpRegenPerLevel;
    private double spellBlock;
    private double spellBlockPerLevel;
    
    public LeagueChampStats(JsonObject json){
        
        String tmp = json.get("armor").toString();
        armor = Double.parseDouble(tmp);
        
        tmp = json.get("armorperlevel").toString();
        armorPerLevel = Double.parseDouble(tmp);
        
        tmp = json.get("attackdamage").toString();
        attackDamage = Double.parseDouble(tmp);
        
        tmp = json.get("attackdamageperlevel").toString();
        attackDamagePerLevel = Double.parseDouble(tmp);
        
        tmp = json.get("attackrange").toString();
        attackRange = Double.parseDouble(tmp);
        
        tmp = json.get("attackspeedoffset").toString();
        attackSpeedOffset = Double.parseDouble(tmp);
        
        tmp = json.get("attackspeedperlevel").toString();
        attackSpeedPerLevel = Double.parseDouble(tmp);
        
        tmp = json.get("crit").toString();
        crit = Double.parseDouble(tmp);
        
        tmp = json.get("critperlevel").toString();
        critPerLevel = Double.parseDouble(tmp);
        
        tmp = json.get("hp").toString();
        hp = Double.parseDouble(tmp);
        
        tmp = json.get("hpperlevel").toString();
        hpPerLevel = Double.parseDouble(tmp);
        
        tmp = json.get("hpregen").toString();
        hpRegen = Double.parseDouble(tmp);
        
        tmp = json.get("hpregenperlevel").toString();
        hpRegenPerLevel = Double.parseDouble(tmp);
        
        tmp = json.get("movespeed").toString();
        moveSpeed = Double.parseDouble(tmp);
        
        tmp = json.get("mp").toString();
        mp = Double.parseDouble(tmp);
        
        tmp = json.get("mpregen").toString();
        mpRegen = Double.parseDouble(tmp);
        
        tmp = json.get("mpperlevel").toString();
        mpPerLevel = Double.parseDouble(tmp);
        
        tmp = json.get("mpregenperlevel").toString();
        mpRegenPerLevel = Double.parseDouble(tmp);
        
        tmp = json.get("spellblock").toString();
        spellBlock = Double.parseDouble(tmp);
        
        tmp = json.get("spellblockperlevel").toString();
        spellBlockPerLevel = Double.parseDouble(tmp); 
        
    }
    
    public double getArmor(){
        return armor;
    }
    
    public double getArmorPerLevel(){
        return armorPerLevel;
    }
    
    public double getAttackDamage(){
     return attackDamage;   
    }
    
    public double getHealth(){
     return hp;    
    }
    
    public double getHealthRegen(){
        return hpRegen;
    }
    
    public double getMana(){
        return mp;
    }
    
    public double getManaRegen(){
        return mpRegen;
    }
    
    public double getMagicResist(){
        return spellBlock;
    }
    
    public double getMovementSpeed(){
        return moveSpeed;
    }
    
    public double getAttackSpeed(){
        return attackSpeedPerLevel;
    }
    
    public double getCrit(){
        return crit;
    }
    
}
