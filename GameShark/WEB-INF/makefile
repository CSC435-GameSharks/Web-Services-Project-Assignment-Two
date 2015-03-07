CLASSPATH = -cp .:/Applications/Tomcat/lib/servlet-api.jar:lib/javax.json.jar:src/servlet/
DEST = -d classes
SRC = \
    src/League/LeagueServer.java \
    src/League/LeagueServerService.java \
    src/League/LeagueServerIncident.java \
    src/League/LeagueServerIncMessage.java \
	src/League/LeagueSummoner.java \
	src/WoW/WoWCharacter.java \
	src/WoW/WoWClass.java \
	src/WoW/WoWClassDetail.java \
	src/WoW/WoWRace.java \
	src/WoW/WoWServer.java \
	src/WoW/WoWSpell.java \
	src/WoW/WoWTalent.java \
	src/WoW/WoWSpec.java \
	src/servlet/LeagueServerStatus.java \
	src/servlet/LeagueNames.java \
	src/servlet/WoWCharServ.java \
	src/servlet/WoWServServ.java \
	src/servlet/WoWClassServ.java
compile:
	javac $(CLASSPATH) $(DEST) $(SRC)

clean:
	$(RM) *.class
