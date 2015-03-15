/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package League;

import java.io.PrintWriter;
import javax.json.JsonArray;
import javax.json.JsonObject;

/**
 *
 * @author kellymaestri
 */
public class LeagueSummoner {

    String name;
    String id;
    String profileIcon;
    String level;
    LeagueSummonerStats[] stats;

    public LeagueSummoner(JsonObject summoner) {
        name = summoner.get("name").toString().replace("\"", "");
        id = summoner.get("id").toString();
        level = summoner.get("summonerLevel").toString();
        profileIcon = summoner.get("profileIconId").toString();
    }

    public void updateSummonerStats(JsonArray s, PrintWriter out) {
        stats = new LeagueSummonerStats[s.size()];
       
        //out.println("Size: "+ s.size());
        for (int i = 0; i < s.size(); i++) {
          //  out.println("Got stat " + i);
            stats[i] = new LeagueSummonerStats(s.getJsonObject(i), out);
        }

    }

    public int getStatsSize() {
        return stats.length;
    }

    public String getStatType(int statNum) {

        if (statNum < stats.length) {
            return stats[statNum].getType();
        } else {
            return null;
        }
    }

    public String getStatAssists(int statNum) {

        if (statNum < stats.length) {
            return stats[statNum].getAssists();
        } else {
            return null;
        }
    }

    public String getStatWins(int statNum) {

        if (statNum < stats.length) {
            return stats[statNum].getWins();
        } else {
            return null;
        }
    }

    public String getStatChampKills(int statNum) {

        if (statNum < stats.length) {
            return stats[statNum].getChampKills();
        } else {
            return null;
        }
    }

    public String getStatMinionKills(int statNum) {

        if (statNum < stats.length) {
            return stats[statNum].getMinionKills();
        } else {
            return null;
        }
    }

    public String getStatNMKills(int statNum) {

        if (statNum < stats.length) {
            return stats[statNum].getNMKills();
        } else {
            return null;
        }
    }

    public String getStatTurrentKills(int statNum) {
        if (statNum < stats.length) {
            return stats[statNum].getTurrentKills();
        } else {
            return null;
        }
    }

    public String getName() {
        return name;
    }

    public String getID() {
        return id;
    }

    public String getLevel() {
        return level;
    }

    public String getProfileIcon() {
        return profileIcon;
    }

}
