#!/bin/bash

# shut down tomcat
~/tomcat-dhis/bin/shutdown.sh

# delete db, recreate empty db
sudo -u postgres dropdb dhis2
sudo -u postgres createdb -O dhis dhis2

# download full database from github
wget -O db.sql https://raw.githubusercontent.com/SwissTPH/dhis2_VA_program/master/db/2.30-Tracker/va-dhis2-full-db.sql

# restore db from file, fix permissions
sudo -u postgres psql dhis2 -f db.sql
sudo -u postgres psql dhis2 -c "ALTER SCHEMA public OWNER TO dhis;"
sudo -u postgres psql dhis2 -c "REVOKE ALL ON SCHEMA public FROM public;"
sudo -u postgres psql dhis2 -c "GRANT ALL ON ALL TABLES IN SCHEMA public TO dhis;"
sudo -u postgres psql dhis2 -c "GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO dhis;"
sudo -u postgres psql dhis2 -c "GRANT ALL ON ALL FUNCTIONS IN SCHEMA public TO dhis;"

# set admin / district dhis2 login
sudo -u postgres psql dhis2 -c "UPDATE users SET password = '\$2a\$10\$iRcOoPD4yIDAr3WYZQCqlu09O4V915H3EeHNryXioFQ5HpKl7APyW' WHERE username = 'admin'";

# start tomcat and display logging
~/tomcat-dhis/bin/startup.sh
tail -f ~/tomcat-dhis/logs/catalina.out