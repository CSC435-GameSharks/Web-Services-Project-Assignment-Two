CLASSPATH = -cp .:/Applications/Tomcat/lib/servlet-api.jar:lib/javax.json.jar:src/servlet/
DEST = -d classes
SRC = \
    src/League/LeagueServer.java \
    src/League/LeagueServerService.java \
    src/League/LeagueServerIncident.java \
    src/League/LeagueServerIncMessage.java \
	src/League/LeagueSummoner.java \
	src/League/LeagueSummonerStats.java \
	src/League/LeagueBasicChampion.java \
	src/League/LeagueChampionPassive.java \
	src/League/LeagueChampSpells.java \
	src/League/LeagueChampStats.java \
	src/League/LeagueChampion.java \
	src/League/Item.java \
	src/servlet/LeagueServerStatus.java \
	src/servlet/LeagueNames.java \
	src/servlet/LeagueBuildABuildServ.java \
	src/servlet/LeagueChampionServ.java \
	src/servlet/LeagueServerApi.java \
	src/servlet/LeagueNamesApi.java \
	src/servlet/LeagueBuildABuildApi.java \
	src/servlet/LeagueChampionApi.java \
	src/servlet/JsonResponseServ.java \

compile:
	javac $(CLASSPATH) $(DEST) $(SRC)

clean:
	$(RM) *.class
