# DHIS2_VA_program

**DHIS2 metadata repository** of the Verbal Autopsy program including a guide to install DHIS2 metadata in production environments (or on a demo server), a Development Manual and and a Technical Implementation Manual for interfacing with the program in the `docs` folder.

In the context of this repository, a _program_ is a term used to describe a set of Metadata objects (like programs, data elements, ...), scripts to maintain/install the program and all its documentation.

## Getting started

The folder `docs` contains the following guides:

- `Installation.md` provides a step-by-step guide to install the program on an existing DHIS2 instance
- `Technical-Implementation.md` specifies interfacing with third party systems via DHIS2's Web API
- `Dev-Setup.md` describes how to set up a development environment for a) interfacing with the program via third party systems and b) for further development of this program
- `Demo-Setup.md` describes how to populate a prepared server with dummy VA events

Currently supported DHIS2 versions:

- 2.25 as a Single Event program (respective metadata might also work in 2.26-2.27, this has not been tested but it will probably work)
- 2.30 as a Single Event program
- 2.30 as a Tracker program

The relevant files for each of these versions are made available in version-specific sub-folders of this repository (e.g. `/metadata/2.30-SingleEvent/`).

## Licence
GNU General Public License v3.0
