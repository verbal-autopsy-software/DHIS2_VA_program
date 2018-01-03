# DHIS2 Demo Setup

It is possible to create a demo version with fake data on an empty DHIS2 instance including BLOBs which holds fake data about cars (for the data element "VA-06-Verbal Autopsy metadata file").

To do this, follow the installation steps described in the [Installation Guide](Installation.md), but before linking the Program to Organisation Units, these can be created by importing an example hierarchy: `demo_setup/metadata/example_organisationUnits_hierarchy.json` .

Create **Verbal Autopsy dummy data**:

The actual dummy data can be generated and pushed into DHIS2 by using the script `demo_setup/data/post_demo_events.py` as follows:

```
usage: python post_demo_events.py --server --username --password --orgunit [--events]

Create demo data to load into the Verbal Autopsy program

optional arguments:
  -h, --help           show this help message and exit
  --server SERVER      DHIS2 server URL
  --username USERNAME  DHIS2 username
  --password PASSWORD  DHIS2 password
  --events [EVENTS]    Amount of events to generate (default: 1000)
  --orgunit ORGUNIT    OrgUnit UID to register events
```

Example to create 500 events:

```
python post_demo_events.py --server=play.dhis2.org/demo --username=admin --password=district --orgunit=SCVeBskgiK6 --events=500
```

To remove data again, run the SQL query `db/delete-program-data.sql`.
