# Development setup

## 1. Install DHIS2

To install DHIS2, follow the official Installation manual: https://docs.dhis2.org/2.25/en/implementer/html/dhis2_implementation_guide_full.html#installation
Or download a VirtualBox Image here: https://drive.switch.ch/index.php/s/YBh3sBc3XQR34tK

- Ubuntu user: `dhis` / Password: `dhis`
- Start Tomcat: `/home/dhis/tomcat-dhis/bin/startup.sh`
- Shut down Tomcat: `/home/dhis/tomcat-dhis/bin/shutdown.sh`

## 2. Restore a Database with everything already set up:

- Shut down Tomcat first (see above)
- Download the database from Github: `wget https://raw.githubusercontent.com/SwissTPH/dhis2_va_draft/master/db/va-dhis2-full-db.sql`
- `sudo su postgres`
- `dropdb dhis2`
- `createdb -O dhis dhis2`
- `psql dhis2 < va-dhis2-full-db.sql`
- `exit` back to `dhis` user
- Start Tomcat (see above) and inspect DHIS2 logs with `dhis_logs`