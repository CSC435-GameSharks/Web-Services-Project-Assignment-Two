/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Diablo;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.LinkedHashMap;
import javax.json.*;
/**
 *
 * @author csaroff
 */
public class Hero {
    private int id;
    private String name;
    private String className;
    private int gender;
    private int level;
    private boolean hardcore;
    private List<ActiveSkill> activeSkills;
    private List<PassiveSkill> passiveSkills;
    private Map<String, Item> items;
    private Map<String, Double> stats;
    private int lastUpdated;
    public Hero(JsonObject objIn){
        name = objIn.getString("name");
        id = objIn.getInt("id");
        className = objIn.getString("class");
        level = objIn.getInt("level");
        hardcore = objIn.getBoolean("hardcore");
        gender = objIn.getInt("gender");
        lastUpdated = objIn.getInt("last-updated");
        JsonArray jsonActiveSkills = objIn.getJsonObject("skills").getJsonArray("active");
        activeSkills = new ArrayList<ActiveSkill>();
        for(JsonValue jsonActiveSkill : jsonActiveSkills){
            if(((JsonObject)jsonActiveSkill).size() != 0){
                JsonObject jsonObj = ((JsonObject)(jsonActiveSkill)).getJsonObject("skill");
                activeSkills.add(new ActiveSkill(jsonObj));
            }
        }

        JsonArray jsonPassiveSkills = objIn.getJsonObject("skills").getJsonArray("passive");
        passiveSkills = new ArrayList<PassiveSkill>();
        for(JsonValue jsonPassiveSkill : jsonPassiveSkills){
            if(((JsonObject)jsonPassiveSkill).size() != 0){
                JsonObject jsonObj = ((JsonObject)(jsonPassiveSkill)).getJsonObject("skill");
                passiveSkills.add(new PassiveSkill(jsonObj));
            }
        }

        JsonObject jsonItems = objIn.getJsonObject("items");
        items = new HashMap<String, Item>();
        for(String itemKey : jsonItems.keySet()){
            items.put(itemKey, new Item((JsonObject)jsonItems.get(itemKey)));
        }

        JsonObject jsonStats = objIn.getJsonObject("stats");
        stats = new LinkedHashMap<String, Double>();
        for(String statKey : jsonStats.keySet()){
            stats.put(statKey, jsonStats.getJsonNumber(statKey).doubleValue());
        }
        //dead = objIn.getBoolean("dead");
    }
    public String toHtmlString(){
        StringBuilder sbReturn = new StringBuilder();
        sbReturn.append("           </br>\n");
        sbReturn.append("Name:    " + this.getName()+ "</br>\n");
        sbReturn.append("Level:    " + this.getLevel()+ "</br>\n");
        //sbReturn.append("Dead:    " + (this.dead?"Yes":"No") + "</br>\n");
        
        sbReturn.append("</br>\n Base Stats </br>");
        for(String statKey : stats.keySet()){
            sbReturn.append(statKey+":    " + stats.get(statKey) +  "</br>\n");
            sbReturn.append("</br>\n");
        }
        
        for(ActiveSkill skill : activeSkills){
            sbReturn.append(skill.toHtmlString() + "</br>\n");
        }
        for(PassiveSkill skill : passiveSkills){
            sbReturn.append(skill.toHtmlString() + "</br>\n");
        }
        for(String key : items.keySet()){
            sbReturn.append(key + ":    </br>\n");
            sbReturn.append(items.get(key).toHtmlString());
        }
        return sbReturn.toString();
    }

    public String getName() {
        return name;
    }

    public int getId() {
        return id;
    }

    public int getLevel() {
        return level;
    }

    public boolean isHardcore() {
        return hardcore;
    }

    public int getGender() {
        return gender;
    }

    public int getLastUpdated() {
        return lastUpdated;
    }
}
