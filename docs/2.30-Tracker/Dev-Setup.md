# Development setup

## Local DHIS2

To install DHIS2, follow the official Installation manual: https://docs.dhis2.org/2.30/en/implementer/html/dhis2_implementation_guide_full.html#installation

### Restore a complete database (locally) that includes the VA program

- Download the `db/2.30-Tracker/update-db.sh` script from Github
- `bash update-db.sh` to fetch a fully configured DHIS2 database where VA is installed. *Warning*: This overwrites the existing database!
- Log in with `admin` / `District99!` or `va-demo` as indicated in Login screen.
- Inspect logs with `dhis_logs` or `tail -f /home/dhis/tomcat-dhis/logs/catalina.out`

## Deleting Verbal Autopsy data

To delete all events (not its related metadata configuration), run the SQL script stored in `db/2.30-Tracker/delete-program-data.sql`. 

## Dump a database to a SQL file

```
pg_dump --no-owner --no-privileges --exclude-table=analytics* --exclude-table=_* --exclude-table=aggregated*  --exclude-table=completeness* --schema=public dhis2 > db-dump.sql
```
replace `dhis2` with the database name. This removes Analytic tables (Dashboard content), if you want to keep them do not `--exclude...` anything.
