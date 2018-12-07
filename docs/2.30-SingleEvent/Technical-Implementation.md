# Technical Implementation Manual

## Key information
* DHIS2 version: 2.30
* Verbal Autopsy program implemented as "Single Event Without Registration"

### Creating a VA event in DHIS2

#### 1. Posting VA raw survey data as a file to DHIS2

To send a complete Verbal Autopsy event (that includes a BLOB file) to a Single Event Without Registration program, there are two steps needed: First send the file to a certain API endpoint, receive a unique identifier for that file and use that as the data value for the data element that stores the meta data of the VA survey.

DHIS2 can store arbitrary-sized files as data values via the `/api/fileResources` endpoint - see [**DHIS2 docs on sending file resources**](https://docs.dhis2.org/2.30/en/developer/html/dhis2_developer_manual_full.html#webapi_file_resources) and [**DHIS2 docs on working with file data values**](https://docs.dhis2.org/2.30/en/developer/html/dhis2_developer_manual_full.html#datavalue_file).

Example request:
`curl -X POST -v -F "file=@/path/to/verbalautopsy-raw-someid.db;filename=someid.db" https://va30se.swisstph-mis.ch/api/30/fileResources -u username:password`

Example response:
```
{
  "httpStatus": "Accepted",
  "httpStatusCode": 202,
  "status": "OK",
  "response": {
    "responseType": "FileResource",
    "fileResource": {
      "name": "someid.db",
      "created": "2017-06-16T16:34:20.654+0000",
      "lastUpdated": "2017-06-16T16:34:20.667+0000",
      "externalAccess": false,
      "publicAccess": "--------",
      "user": { ... },
      "displayName": "someid.db",
      "contentType": "application/x-sqlite3",
      "contentLength": 512571,
      "contentMd5": "4e1fc1c3f999e5aa3228d531e4adde58",
      "storageStatus": "PENDING",
      "id": "xm4JwRwke0i"
    }
  }
}
```

The most important bit of that response is the property `response.fileResource.id` (in above case it's `xm4JwRwke0i`) which then can be used as a data value (see below).

NB: If **within two hours** an event was not created (step 2 below), the file will **automatically be deleted again** as described in the [DHIS2 docs link](https://docs.dhis2.org/2.30/en/developer/html/dhis2_developer_manual_full.html#webapi_file_resources) from above.

There are two possibilities in DHIS2 to store files (pros and cons are out of scope for this manual):

- A) On the server's hard drive (default)
- B) On an Amazon AWS S3 bucket (see related chapter in the [DHIS2 implementation guide](https://docs.dhis2.org/2.30/en/implementer/html/dhis2_implementation_guide_full.html#install_file_store_configuration))

The server's endpoint to receive file does not change if a S3 bucket was chosen.

#### 2. Posting events

When the file (SQLite database) was successfully posted, its generated `id` (as described above) should flow into an event as a data value.

Example request (payload below):

`curl -X POST "https://va30se.swisstph-mis.ch/api/30/events" -H "Content-Type: application/json" -u username:password -d @event.json`

With a payload:

```
{
  "program": "sv91bCroFFx",
  "orgUnit": "DiszpKrYNg8",
  "eventDate": "2017-04-01",
  "status": "COMPLETED",
  "storedBy": "admin",
  "dataValues": [
    { "dataElement": "htm6PixLJNy", "value": "someVerbalAutopsyId" },
    { "dataElement": "hi7qRC4SMMk", "value": "male" },
    { "dataElement": "oPAg4MA0880", "value": "22" },
    { "dataElement": "F4XGdOBvWww", "value": "E88.1" },
    { "dataElement": "XLHIBoLtjGt", "value": "xm4JwRwke0i" },
    { "dataElement": "wiJviUqN1io", "value": "InsilicoVA|1.1.4|PHMRCShort|1|2016 WHO Verbal Autopsy Form|v1_4_2"}
  ]
}
```

Let's look at these properties of the event:

|property               |description                                                                                 |compulsory?
|---                    |---                                                                                         |---
|program                |The UID of the VA program                                                                   |yes
|orgUnit                |The UID of the Organisation Unit where the event should be registered                       |yes
|eventDate              |Date of Death in YYYY-MM-DD format                                                          |yes
|status                 |The status of the event - should be always `COMPLETED`                                      |yes
|storedBy               |the name of the user doing the import                                                       |yes
|dataElement "VA-01"    |VA ID as text                                                                               |yes
|dataElement "VA-02"    |Sex - must fit to an option in the "Sex" optionSet                                          |yes
|dataElement "VA-03"    |Date of Birth in YYYY-MM-DD format                                                          |no
|dataElement "VA-04"    |Age in years                                                                                |no
|dataElement "VA-05"    |Coded Cause of Death - must fit to an option in the "CoD codes" optionSet                   |yes
|dataElement "VA-06"    |The ID received from posting the blob file (containing the VA questionnaire raw data)       |no
|dataElement "VA-07"    |How the CoD was obtained - must fit to an option in the "Algorithm Metadata" optionSet      |yes
|dataElement "VA-08"    |The ODK meta:instanceID, which is the unique identification of a completed ODK form         |no


In general, any client posting VA events needs to know...

- the Organisation Unit UID (can be fetched via API as well if an identifier is known)
- CoD codes used in DHIS2 (static) - see `/resources/cod_codes/cod_codes_options.csv` for valid codes to send
- The Verbal Autopsy Program UID (static) - probably it's `sv91bCroFFx`
- Algorithm metadata codes - - see `resources/algorithm_metadata/algorithm_metadata_options.csv` for valid codes to send

It's possible to send multiple events at once, just wrap all events into a list and use the same endpoint:

```
{
  "events": [
    { <event 1>},
    { <event 2>},
    ...
  ]
}
```
