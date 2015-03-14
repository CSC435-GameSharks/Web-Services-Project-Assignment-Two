/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package League;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.json.JsonObject;

/**
 *
 * @author kellymaestri
 */
public class Item {
    
    String id;
    String description;
    String name;
    String image;
    double armor, attackSpeed, block, critDamage, critChance, hp;
    double hpRegen, mp, mpRegen, magicDamage,movementSpeed,physicalDamage;
    double spellBlock, parmor,pattackSpeed,pblock, pdodge, pcritChance;
    double pcritDamage,php,phpRegen,pmp,pmpRegen,plifeSteal,pmagicDamage;
    double pmovementSpeed, pphysicalDamage, pspellBlock, pspellVamp;
    
    
    
    public Item(JsonObject json){
        name = json.getString("name");
        id = json.getString("id");
        description = json.getString("sanitizedDescription");
        JsonObject stats = json.getJsonObject("stats");
        if(stats.get("FlatArmorMod") !=null){
            armor= Integer.parseInt(stats.get("FlatArmorMod").toString());
        }else{
            armor = 0;
        }
        if(stats.get("FlatAttackSpeedMod") !=null){
            attackSpeed= Integer.parseInt(stats.get("FlatAttackSPeedMod").toString());
        }else{
            attackSpeed = 0;
        }
        if(stats.get("FlatBlockMod") !=null){
            block= Integer.parseInt(stats.get("FlatBlockMod").toString());
        }else{
            block = 0;
        }

        if(stats.get("FlatCritDamagekMod") !=null){
            critDamage= Integer.parseInt(stats.get("FlatCritDamageMod").toString());
        }else{
            critDamage = 0;
        }
        if(stats.get("FlatHPPoolMod") !=null){
            hp= Integer.parseInt(stats.get("FlatHPPoolMod").toString());
        }else{
            hp = 0;
        }
        if(stats.get("FlatHPRegenMod") !=null){
            hpRegen= Integer.parseInt(stats.get("FlatHPRegenMod").toString());
        }else{
            hpRegen = 0;
        }
        if(stats.get("FlatMPPoolMod") !=null){
            mp= Integer.parseInt(stats.get("FlatMPPoolMod").toString());
        }else{
            mp = 0;
        }
        if(stats.get("FlatMPRegenMod") !=null){
            mpRegen= Integer.parseInt(stats.get("FlatMPRegenMod").toString());
        }else{
            mpRegen = 0;
        }

        if(stats.get("FlatMovementSpeedMod") !=null){
            movementSpeed= Integer.parseInt(stats.get("FlatMovementSpeedMod").toString());
        }else{
            movementSpeed = 0;
        }
        if(stats.get("FlatPhysicalDamageMod") !=null){
            physicalDamage= Integer.parseInt(stats.get("FlatPhysicalDamageMod").toString());
        }else{
            physicalDamage = 0;
        }
        if(stats.get("FlatSpellBlockMod") !=null){
            spellBlock= Integer.parseInt(stats.get("FlatSpellBlockMod").toString());
        }else{
            spellBlock = 0;
        }
        if(stats.get("PercentArmorMod") !=null){
            parmor= Integer.parseInt(stats.get("PercentArmorMod").toString());
        }else{
            parmor = 0;
        }
        if(stats.get("PercentAttackSpeedMod") !=null){
            pattackSpeed= Integer.parseInt(stats.get("PercentAttackSpeedMod").toString());
        }else{
            pattackSpeed = 0;
        }
        if(stats.get("PercentBlockMod") !=null){
            pblock= Integer.parseInt(stats.get("PercentBlockMod").toString());
        }else{
            pblock = 0;
        }

        if(stats.get("PercentCritDamageMod") !=null){
            pcritDamage= Integer.parseInt(stats.get("PercentCritDamageMod").toString());
        }else{
            pcritDamage = 0;
        }
        if(stats.get("PercentHPPoolMod") !=null){
            php= Integer.parseInt(stats.get("PercentHPPoolMod").toString());
        }else{
            php = 0;
        }
        if(stats.get("PercentHPRegenMod") !=null){
            phpRegen= Integer.parseInt(stats.get("PercentHPRegenMod").toString());
        }else{
            phpRegen = 0;
        }
        if(stats.get("PercentLifeStealMod") !=null){
            plifeSteal= Integer.parseInt(stats.get("PercentLifeStealMod").toString());
        }else{
            plifeSteal = 0;
        }
        if(stats.get("PercentMPPoolMod") !=null){
            pmp= Integer.parseInt(stats.get("PercentMPPoolMod").toString());
        }else{
            pmp = 0;
        }
        if(stats.get("PercentMPRegenMod") !=null){
            pmpRegen= Integer.parseInt(stats.get("PercentMPRegenMod").toString());
        }else{
            pmpRegen = 0;
        }
        if(stats.get("PercentMagicDamageMod") !=null){
            pmagicDamage= Integer.parseInt(stats.get("PercentMagicDamageMod").toString());
        }else{
            pmagicDamage = 0;
        }
        if(stats.get("PercentMovementSpeedMod") !=null){
            pmovementSpeed= Integer.parseInt(stats.get("PercentMovementSpeedMod").toString());
        }else{
            pmovementSpeed = 0;
        }
        if(stats.get("PercentPhysicalDamageMod") !=null){
            pphysicalDamage= Integer.parseInt(stats.get("PercentPhysicalDamageMod").toString());
        }else{
            pphysicalDamage = 0;
        }
        if(stats.get("PercentSpellBlockMod") !=null){
            pspellBlock= Integer.parseInt(stats.get("PercentSpellBlockMod").toString());
        }else{
            pspellBlock = 0;
        }if(stats.get("PercentSpellVampMod") !=null){
            pspellVamp= Integer.parseInt(stats.get("PercentSpellVampMod").toString());
        }else{
            pspellVamp = 0;
        }
        
        
        
    }
    
    
    public Item(String nam, String iD, String im, String desc){
        name = nam;
        id = iD;
        image = im;
        description = desc;
    }
    
    public void updateStats(ResultSet rs) throws SQLException{
        armor = rs.getDouble("armor");
        attackSpeed = rs.getDouble("attackSpeed");
        block = rs.getDouble("block");
        critDamage = rs.getDouble("critDamage");
        critChance = rs.getDouble("critChance");
        hp = rs.getDouble("hp");
        hpRegen = rs.getDouble("hpRegen");
        mp = rs.getDouble("mp");
        mpRegen = rs.getDouble("mpRegen");
        magicDamage = rs.getDouble("magicDamage");
        movementSpeed = rs.getDouble("movementSpeed");
        physicalDamage = rs.getDouble("physicalDamage");
        spellBlock = rs.getDouble("spellBlock");
        parmor = rs.getDouble("pArmor");
        pattackSpeed = rs.getDouble("pAttackSpeed");
        pblock = rs.getDouble("pBlock");
        pcritDamage = rs.getDouble("pCritDamage");
        pcritChance = rs.getDouble("pCritChance");
        php = rs.getDouble("pHP");
        phpRegen = rs.getDouble("pHPRegen");
        pmp = rs.getDouble("pMP");
        pmpRegen = rs.getDouble("pMPRegen");
        plifeSteal = rs.getDouble("pLifeSteal");
        pmagicDamage = rs.getDouble("pMagicDamage");
        pmovementSpeed = rs.getDouble("pMovementSpeed");
        pphysicalDamage = rs.getDouble("pPhysicalDamage");
        pspellBlock = rs.getDouble("pSpellBlock");
        pspellVamp = rs.getDouble("pSpellVamp");
        pdodge = rs.getDouble("pDodge");
        
        
    }
    
    public String getImage(){
        return image;
    }
    
    public String getID(){
        return id;
    }
    
    public String getName(){
        return name;
    }
    
    
    
}
