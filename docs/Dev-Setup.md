# Development setup

## 1. Install DHIS2

To install DHIS2, follow the official Installation manual: https://docs.dhis2.org/2.25/en/implementer/html/dhis2_implementation_guide_full.html#installation

Or download a complete DHIS2 VirtualBox Image here (File > Import appliance...): https://drive.switch.ch/index.php/s/T1zwEXlyB1WlayM

- Ubuntu user: `dhis` / Password: `dhis`
- Start Tomcat: `/home/dhis/tomcat-dhis/bin/startup.sh`
- Shut down Tomcat: `/home/dhis/tomcat-dhis/bin/shutdown.sh`

## 2. Restore a Database with everything already set up:

- Download the `update-db.sh` script from Github in the `db` folder (it's already present in the VirtualBox Image)
- `bash /home/dhis/update-db.sh` to fetch a fully configured DHIS2 database where VA is installed. *Warning*: This deletes the existing database!
- Log in with `admin` / `district` or `va-demo` as indicated in Login screen.
- Inspect logs with `dhis_logs` or `tail -f /home/dhis/tomcat-dhis/logs/catalina.out`

## Modifying DHIS2 Metadata

- Install Python 2
- Install `pip` [docs](https://pip.pypa.io/en/stable/installing/)
- In the working directory, install dev libraries by calling `pip install -r python_requirements.txt`
