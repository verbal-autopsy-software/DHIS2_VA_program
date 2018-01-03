# Installation guide

This guide shows how to install Verbal Autopsy metadata on an existing DHIS2 instance - JSON files are in `metadata` folder.

- _ICD-10_ **Option Set** (including all options for Cause of Death)
- _Sex_ **Option set** (including 5 options)
- _Algorithm metadata_ **Option set** (containing a reference on how the Cause of Death was obtained)
- 6 **Data Elements**
- 1 **Program**
- 1 **Program Stage**
- 6 **Program Stage Data Elements**
- 1 **User Role**
- 1 **User Group**

## Preparation

1. Find out the `default` Category Combo UID on the target server by using the following API Query: `/api/categoryCombos?query=default`.
2. Open `va_dataelements.json` with a Text Editor.
3. "Find and Replace..." the Category Combo UID `bjDvmb4bfuf` with the UID found in step 1 and resave the file.
4. Do the same in `va_program.json` and find and replace the program's `categoryCombo` by replacing `bjDvmb4bfuf` with the UID found in step 1 and resave the file.


## Import

Import the prepared files in the following sequence now with DHIS2's _Import-Export_ app.
On every file, a _Dry run_ should be done to validate the import first.

1. `va_icd10_optionset.json`
2. `va_sex_optionset.json`
3. `va_algorithm_metadata_optionset.json`
4. `va_dataelements.json`
5. `va_program.json`
6. `va_userrole.json`
7. `va_usergroups.json` (optional)

## Link Program to Organisation Units

The Organisation Units (e.g. districts) to which verbal autopsies are associated need to be associated to the Program "Verbal Autopsy", by: 
1. accessing "Programs/Attributes" app
2. accessing "Program"
3. clicking on "Verbal Autopsy" program
4. choosing option "Assign program to organisation units"
![Link Program "Verbal Autopsy" to Organisational Unit](/dhis2_va_draft/resources/images/LinkProgToOrgUnit.png)
5. Selecting the relevant organisational units

## User Access control & Sharing

### User Groups

#### User Group 1 - _openVA Admin_

This User Group should only contain one user (see below). It is to enforce Edit rights to only the `openva-pipeline` user as well as DHIS2 Superusers.

### User Roles

#### User Role 1 - _openVA Pipeline_
The User Role **openVA Pipeline** is crucial, because the Interface sending Verbal Autopsy events needs to be able to do so, as well as _Edit and View_ rights for Public Option Sets related to Verbal Autopsy - i.e. it **must** be able to edit ICD-10 codes and the Algorithm metadata on how the Cause of Death was obtained.

### User Creation

Create a User for the openVA Pipeline Interface:

1. Give the user the name `openva-pipeline`
2. Assign the User Role **openVA Pipeline**
3. Assign the **Root Organisation Unit** in _Data capture and maintenance organisation units_ to the user
4. Assign the User Group **openVA Admin**

### Sharing

#### _Verbal Autopsy ICD-10_ Option Set
 - Public Access: **View**
 - User Group with Read/Write Access: **openVA Admin**
 - User Group with Read-Only Access: _None_

#### _Verbal Autopsy Sex_ Option Set
  - Public Access: **View**
  - User Group with Read/Write Access: **openVA Admin**
  - User Group with Read-Only Access: _None_

#### _Verbal Autopsy Metadata_ Option Set
  - Public Access: **View**
  - User Group with Read/Write Access: **openVA Admin**
  - User Group with Read-Only Access: _None_

#### _Verbal Autopsy_ Data Elements
  - Public Access: **View**
  - User Group with Read/Write Access: **openVA Admin**
  - User Group with Read-Only Access: _None_

#### _Verbal Autopsy_ Program
  - Public Access: **View**
  - User Group with Read/Write Access: **openVA Admin**
  - User Group with Read-Only Access: _None_

#### _openVA Pipeline_ User Role
  - Public Access: _None_
  - User Group with Read/Write Access: **openVA Admin**
  - User Group with Read-Only Access: _None_

In case there is a need for more restrictive access, it would be possible to set all "Public Access" to None while giving Read-Only Access to another User Group called e.g. `openVA User`.
