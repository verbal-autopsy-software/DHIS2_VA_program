#!/usr/bin/env python

"""Script to create a ICD-10 Option Set JSON metadata file based on a CSV file."""

try:
    import import unicodecsv as csv
except ImportError:
    print("Please install 'unicodecsv' library, see `docs/Dev-Setup.md`")
import json
import codecs

OPTIONSET = 'LAWwdYur1ds'
CSV_INPUT = 'icd10_codes_options.csv'
METADATA_OUTPUT = 'va_icd10_optionset.json'

# reading CSV file into dictionary
with open(CSV_INPUT, 'r') as csv_file:
	reader = csv.DictReader(csv_file, delimiter=',')
	data = [row for row in reader]
print("Reading {}...".format(CSV_INPUT))

# adding optionSet UID to each option
option_list = []
for o in data:
	o["optionSet"] = {"id": OPTIONSET}
	option_list.append(o)

# adding option UIDs to optionSet
option_uids = [{'id': uid} for uid in [option['id'] for option in data]]
option_set = {
	  "name": "ICD-10",
      "id": OPTIONSET,
      "publicAccess": "rw------",
      "version": 0,
      "valueType": "TEXT",
      "options": option_uids
}

# packaging to DHIS2 metadata
metadata = {}
metadata['optionSets'] = [option_set]
metadata['options'] = option_list

with open(METADATA_OUTPUT, 'w') as json_file:
	json.dump(metadata, codecs.getwriter('utf-8')(json_file), ensure_ascii=False, indent=4, sort_keys=True)

print("Exported DHIS2 option set to {}".format(METADATA_OUTPUT))
