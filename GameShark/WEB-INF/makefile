CLASSPATH = -classpath ~/Documents/tomcat/apache8/lib/servlet-api.jar:lib/javax.json.jar:src/servlet/
DEST = -d classes
SRC = \
	src/WoW/WoWCharacter.java \
	src/WoW/WoWClass.java \
	src/WoW/WoWRace.java \
	src/WoW/WoWServer.java \
	src/servlet/WoWCharServ.java \
	src/servlet/WoWServServ.java
compile:
	javac $(CLASSPATH) $(DEST) $(SRC)

clean:
	$(RM) *.class
