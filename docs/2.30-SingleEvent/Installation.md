# Installation Guide

This guide shows how to install Verbal Autopsy metadata on an existing DHIS2 instance - JSON files are in `metadata` folder.

- _CoD codes_ **Option Set** (including all options for Cause of Death)
- _Sex_ **Option set** (including 5 options)
- _Algorithm metadata_ **Option set** (containing a reference on how the Cause of Death was obtained)
- 8 **Data Elements**
- 1 **Program**
- 1 **Program Stage**
- 7 **Program Stage Data Elements**
- 1 **User Role**
- 1 **User Group**
- 2 **Event Reports**: 
	- "Top causes of death this year" (aggregate report) 
	- "Verbal Autopsies conducted in the last 12 months" (individual events overview)
- 1 **Dashboard** displaying the 2 mentioned Event Reports

## Preparation

1. Find out the root (`level 1`) Organisation Unit UID on the target server by using the following API Query: `/api/organisationUnits?level=1` (an organisational hierarchy should exist already in the server, otherwise an example hierarchy can be created beforehand by importing the following one: `demo_setup/metadata/example_organisationUnits_hierarchy.json`)
2. Open `va_dashboard.json` with a text editor.
3. "Find and Replace..." the Organisation Unit UID `wEVB21sQaHu` of the 2 Event Reports with the UID found in step 1 and re-save the file.


## Import

Import the prepared files in the following sequence now with DHIS2's _Import-Export_ app.
On every file, a _Dry run_ should be done to validate the import first.

1. `va_usergroups.json` 
2. `va_userroles.json`
3. `va_cod_codes_optionset.json` 
4. `va_sex_optionset.json` 
5. `va_algorithm_metadata_optionset.json`
6. `va_dataelements.json`
7. `va_program.json`
8. `va_dashboard.json`

## Link Program to Organisation Units

The Organisation Units (e.g. districts) to which verbal autopsies are associated need to be linked to the Program "Verbal Autopsy", by performing the following steps: 
1. access "Maintenance" app
2. under "Program", access the list of programs
3. access the "Verbal Autopsy" program
4. click on tab "4 Access"
5. type the name of the relevant organisation units in the field "Filtering organisation units by name", and tick their respective box in the filtered list
6. click on "SAVE" at the bottom of the page

## User Access control & Sharing

### User Groups

#### User Group 1 - _VA Admin_

This User Group is aimed at users who can edit the VA program metadata, but only view (and not edit) its data.

#### User Group 2 - _VA Interface_

This User Group is aimed at users who can only view the VA program metadata, but edit its data.

### User Roles

#### User Role 1 - _VA Interface_
The User Role **VA Interface** gives the respective users access to viewing and editing data of the VA program (both through the API and the web front end).

### User Creation

When creating a user, the relevant user roles and user groups from above should be assigned, as well as the relevant _Data capture and maintenance organisation units_ and _Data output and analytic organisation units_.

### Sharing

Certain imported metadata has explicitly defined sharing settings (that concern availability of the objects for reading or modification), more concretely:

#### _VA Admin_ User Group
  - Public Access: _None_
  - User Group with Read/Write Access: _None_
  - User Group with Read-Only Access: _None_
    
#### _VA Interface_ User Group
  - Public Access: _None_
  - User Group with Read/Write Access: _None_
  - User Group with Read-Only Access: _None_

#### _VA Interface_ User Role
- Public Access: _None_
- User Group with Read/Write Access: _None_
- User Group with Read-Only Access: _None_
  
#### _Verbal Autopsy CoD codes_ Option Set (for "VA-05-Most probable Cause of Death" data element)
 - Public Access: **View**
 - User Group with Read/Write Access: **VA Admin**
 - User Group with Read-Only Access: _None_

#### _Verbal Autopsy Sex_ Option Set (for "VA-02-Sex" data element)
  - Public Access: **View**
  - User Group with Read/Write Access: **VA Admin**
  - User Group with Read-Only Access: _None_

#### _Verbal Autopsy Algorithm Metadata_ Option Set (for "VA-07-Algorithm metadata on how CoD was obtained" data element)
  - Public Access: **View**
  - User Group with Read/Write Access: **VA Admin**
  - User Group with Read-Only Access: _None_

In case there is a need for more restrictive access, it would be possible to set all "Public Access" to None while giving Read-Only Access to another User Group called e.g. `VA User`.
