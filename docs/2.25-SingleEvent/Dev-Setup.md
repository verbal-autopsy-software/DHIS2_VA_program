# Development setup

## Local DHIS2

To install DHIS2, follow the official Installation manual: https://docs.dhis2.org/2.25/en/implementer/html/dhis2_implementation_guide_full.html#installation

Or download a complete DHIS2 VirtualBox Image here (File > Import appliance...): https://drive.switch.ch/index.php/s/T1zwEXlyB1WlayM

- Ubuntu user: `dhis` / Password: `dhis`
- Start Tomcat: `/home/dhis/tomcat-dhis/bin/startup.sh`
- Shut down Tomcat: `/home/dhis/tomcat-dhis/bin/shutdown.sh`

### Restore a complete database (locally) that includes the VA program

- Download the `update-db.sh` script from Github in the `db` folder (it's already present in the VirtualBox Image)
- `bash /home/dhis/update-db.sh` to fetch a fully configured DHIS2 database where VA is installed. *Warning*: This overwrites the existing database!
- Log in with `admin` / `District1` or `va-demo` as indicated in Login screen.
- Inspect logs with `dhis_logs` or `tail -f /home/dhis/tomcat-dhis/logs/catalina.out`

## Modifying DHIS2 Metadata

- Install Python 2
- Install `pip` [docs](https://pip.pypa.io/en/stable/installing/)
- In the working directory, install dev libraries: `pip install -r python_requirements.txt`
- In the `resources` folder, run `python create_metadata.py` to process CSV files in `resources` and put them into `metadata` folder

## Deleting Verbal Autopsy data

To delete all events (not its related metadata configuration), run the SQL script in `db/delete-program-data.sql`. This removes e.g. data that was pushed during "Demo Setup" (see `docs/Demo-Setup.md`).

## Dump a database to a SQL file

```
pg_dump --no-owner --no-privileges --exclude-table=analytics* --exclude-table=_* --exclude-table=aggregated*  --exclude-table=completeness* --schema=public dhis2 > db-dump.sql
```
replace `dhis2` with the database name. This removes Analytic tables (Dashboard content), if you want to keep them do not `--exclude...` anything.
