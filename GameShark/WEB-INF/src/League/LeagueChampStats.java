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
    private double critChance;
    private double critDamage;
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
    private double spellBlock;//magic resist
    private double spellBlockPerLevel;
    private double spellVamp;
    private double dodge;
    private double tenacity;
    private double abilityPower;
    private double armorPen;
    private double magicPen;
    private double lifeSteal;
    private int currentLevel = 18;

    public LeagueChampStats(JsonObject json) {

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
        critDamage = Double.parseDouble(tmp);

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

        critChance = 0;
        spellVamp = 0;
        dodge = 0;
        tenacity = 0;
        abilityPower = 0;
        armorPen = 0;
        magicPen = 0;
        lifeSteal = 0;

    }
    public double getSpellVamp(){
        return spellVamp;
    }
    public double getLifeSteal(){
        return lifeSteal;
    }
    public double getDodge(){
        return dodge;
    }
    public double getTenacity(){
        return tenacity;
    }
    public double getAP(){
        return abilityPower;
    }
    public double getArmorPen(){
        return armorPen;
    }
    public double getMagicPen(){
        return magicPen;
    }

    public double getArmor() {
        double b = armor;
        double x = armorPerLevel;
        double n = currentLevel;
        double p = (double)Math.pow(n, 2);
        double part1 = (double)7/400 * p;
        double part2 = ((double)267/400)*n;
        double part3 = (double)137/200;
        double part4 = (double)part1 + (double)part2 - (double)part3;

        double tmp = b + (x*part4);
        tmp =Math.round(tmp*100);
        tmp = tmp/100;
        return tmp;
    }


    public double getAttackDamage() {
        double b = attackDamage;
        double x = attackDamagePerLevel;
        double n = currentLevel;
        double p = (double)Math.pow(n, 2);
        double part1 = (double)7/400 * p;
        double part2 = ((double)267/400)*n;
        double part3 = (double)137/200;
        double part4 = (double)part1 + (double)part2 - (double)part3;

        double tmp = b + (x*part4);
        tmp =Math.round(tmp*100);
        tmp = tmp/100;
        return tmp;
    }

    public double getAttackSpeed() {
       double base = 0.625/(1 + attackSpeedOffset);
        double added = attackSpeedPerLevel * currentLevel;
        return Math.round(base);
    }

    public double getHealth() {
        double b = hp;
        double x = hpPerLevel;
        double n = currentLevel;
        double p = (double)Math.pow(n, 2);
        double part1 = (double)7/400 * p;
        double part2 = ((double)267/400)*n;
        double part3 = (double)137/200;
        double part4 = (double)part1 + (double)part2 - (double)part3;

        double tmp = b + (x*part4);
        tmp =Math.round(tmp*100);
        tmp = tmp/100;
        return tmp;
    }

    public double getHealthRegen() {
        double b = hpRegen;
        double x = hpRegenPerLevel;
        double n = currentLevel;
        double p = (double)Math.pow(n, 2);
        double part1 = (double)7/400 * p;
        double part2 = ((double)267/400)*n;
        double part3 = (double)137/200;
        double part4 = (double)part1 + (double)part2 - (double)part3;

        double tmp = b + (x*part4);
        tmp =Math.round(tmp*100);
        tmp = tmp/100;
        return tmp;
    }

    public double getMana() {
        double b = mp;
        double x = mpPerLevel;
        double n = currentLevel;
        double p = (double)Math.pow(n, 2);
        double part1 = (double)7/400 * p;
        double part2 = ((double)267/400)*n;
        double part3 = (double)137/200;
        double part4 = (double)part1 + (double)part2 - (double)part3;

        double tmp = b + (x*part4);
        tmp =Math.round(tmp*100);
        tmp = tmp/100;
        return tmp;
    }

    public double getManaRegen() {
        double b = mpRegen;
        double x = mpRegenPerLevel;
        double n = currentLevel;
        double p = (double)Math.pow(n, 2);
        double part1 = (double)7/400 * p;
        double part2 = ((double)267/400)*n;
        double part3 = (double)137/200;
        double part4 = (double)part1 + (double)part2 - (double)part3;

        double tmp = b + (x*part4);
        tmp =Math.round(tmp*100);
        tmp = tmp/100;
        return tmp;
    }

    public double getMagicResist() {
        double b = spellBlock;
        double x = spellBlockPerLevel;
        double n = currentLevel;
        double p = (double)Math.pow(n, 2);
        double part1 = (double)7/400 * p;
        double part2 = ((double)267/400)*n;
        double part3 = (double)137/200;
        double part4 = (double)part1 + (double)part2 - (double)part3;

        double tmp = b + (x*part4);
        tmp =Math.round(tmp*100);
        tmp = tmp/100;
        return tmp;
    }

    public double getMovementSpeed() {
        return moveSpeed;
    }

    public double getCritDamage() {
        return critDamage;
    }
    public double getCritChance() {
        return critChance;
    }

    public void updateArmor(boolean newItem, double f, double p) {
        if (newItem) {
            double tmp = armor + f;
            double pp = tmp * p;
            armor = tmp +pp;
        } else {
            double tmp = armor - f;
            armor = tmp;
        }
    }

    public void updateAttackDamage(boolean newItem, double f, double p) {
        if (newItem) {
            double tmp = attackDamage + f;
            double pp = tmp * p;
            attackDamage = tmp + pp;
        } else {
            double tmp = attackDamage - f;
            attackDamage = tmp;
        }
    }

    public void updateAttackSpeed(boolean newItem, double n, double p) {

    }

    public void updateHealth(boolean newItem, double n, double p) {
        if (newItem) {
            double tmp = hp + n;
            double pp = tmp * p;
            hp = tmp + pp;
        } else {
            double tmp = hp - n;
            hp = tmp;

        }
    }

    public void updateHealthRegen(boolean newItem, double n, double p) {
        if (newItem) {
            double tmp = hpRegen + n;
            double pp = tmp * p;
            hpRegen = tmp + pp;
        } else {
            double tmp = hpRegen - n;
            hpRegen = tmp;

        }
    }

    public void updateMana(boolean newItem, double n, double p) {
        if (newItem) {
            double tmp = mp + n;
            double pp = tmp * p;
            mp = tmp + pp;
        } else {
            double tmp = mp - n;
            mp = tmp;

        }
    }

    public void updateManaRegen(boolean newItem, double n, double p) {
        if (newItem) {
            double tmp = mpRegen + n;
            double pp = tmp * p;
            mpRegen = tmp + pp;
        } else {
            double tmp = mpRegen - n;
            mpRegen = tmp;

        }
    }

    public void updateMagicResist(boolean newItem, double n, double p) {
        if (newItem) {
            double tmp = spellBlock + n;
            double pp = tmp * p;
            spellBlock = tmp + pp;
        } else {
            double tmp = spellBlock - n;
            spellBlock = tmp;

        }
    }

    public void updatetMovementSpeed(boolean newItem, double n, double p) {
        if (newItem) {
            double tmp = moveSpeed + n;
            double pp = tmp * p;
            moveSpeed = tmp + pp;
        } else {
            double tmp = moveSpeed - n;
            moveSpeed = tmp;

        }
    }

    public void updateCrit(boolean newItem, double n, double p) {
        if (newItem) {
            double tmp = critDamage + n;
            double pp = tmp * p;
            critDamage = tmp + pp;
        } else {
double tmp = critDamage - n;
            critDamage = tmp;
        }
    }

    public void updateSpellVamp(boolean newItem, double n, double p){
                if (newItem) {
            double tmp = spellVamp + n;
            double pp = tmp * p;
            spellVamp = tmp + pp;
        } else {
double tmp = spellVamp - n;
            spellVamp = tmp;
        }
    }
    public void updateDodge(boolean newItem, double n, double p){
        if (newItem) {
            double tmp = dodge + n;
            double pp = tmp * p;
            dodge = tmp + pp;
        } else {
            double tmp = dodge - n;
            dodge = tmp;

        }
    }
    public void updateTenacity(boolean newItem, double n, double p){
        if (newItem) {
            double tmp = tenacity + n;
            double pp = tmp * p;
            tenacity = tmp + pp;
        } else {
            double tmp = tenacity - n;
            tenacity = tmp;

        }
    }
    public void updateAP(boolean newItem, double n, double p){
        if (newItem) {
            double tmp = abilityPower + n;
            double pp = tmp * p;
            abilityPower = tmp + pp;
        } else {
double tmp = abilityPower - n;
            abilityPower = tmp;
        }
    }
    public void updateArmorPen(boolean newItem, double n, double p){
        if (newItem) {
            double tmp = armorPen + n;
            double pp = tmp * p;
            armorPen = tmp + pp;
        } else {

        }
    }
    public void updateMagicPen(boolean newItem, double n, double p){
        if (newItem) {
            double tmp = magicPen + n;
            double pp = tmp * p;
            magicPen = tmp + pp;
        } else {
            double tmp = magicPen - n;
            magicPen = tmp;

        }
    }
    
        public void updateCritChance(boolean newItem, double n, double p){
        if (newItem) {
            double tmp = critChance + n;
            double pp = tmp * p;
            critChance = tmp + pp;
        } else {
            double tmp = critChance - n;
            critChance = tmp;

        }
    }
        public void updateLifeSteal(boolean newItem, double n, double p){
        if (newItem) {
            double tmp = lifeSteal + n;
            double pp = tmp * p;
            lifeSteal = tmp + pp;
        } else {
            double tmp = lifeSteal - n;
            lifeSteal = tmp;

        }
    }
    public int getLevel(){
        return currentLevel;
    }

    public void updateLevel(int level) {
        if(level >0 && level < 19){
            currentLevel = level;
        }
    }

}
