#!/usr/bin/env python

"""Script to create a JSON metadata file based on a CSV file."""

try:
    import unicodecsv as csv
except ImportError:
    print("Please install 'unicodecsv' library, see `docs/Dev-Setup.md`")
import json
import codecs
import argparse
import os

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUTPUTFOLDER = os.path.join(ROOT, 'metadata')
INPUTFOLDER = os.path.join(ROOT, 'resources')


def process_dataelements():
    """Read CSV file and create DHIS2 metadata JSON file for Data Elements"""

    dataelements = []
    final = {}
    input_file = os.path.join(INPUTFOLDER, 'dataelements', 'dataelements.csv')
    with open(input_file, 'rb') as csv_file:
        reader = csv.DictReader(csv_file, delimiter=',')
        for row in reader:
            if row.get('zeroIsSignificant', None):
                row['zeroIsSignificant'] = True
            else:
                del row['zeroIsSignificant']
            if row.get('optionSet', None):
                row['optionSet'] = {'id': row['optionSet']}
            else:
                del row['optionSet']
            if row.get('categoryCombo', None):
                row['categoryCombo'] = {'id': row['categoryCombo']}
            else:
                del row['categoryCombo']
            dataelements.append(row)

    final['dataElements'] = dataelements
    with open(os.path.join(OUTPUTFOLDER, 'va_dataelements.json'), 'w') as json_file:
        json.dump(final, codecs.getwriter('utf-8')
                  (json_file), ensure_ascii=False, indent=4)


def process_optionset(optionset):

    if optionset == 'icd10':
        csv_input = os.path.join(INPUTFOLDER, 'icd10',
                                 'icd10_codes_options.csv')
        json_output = os.path.join(OUTPUTFOLDER, 'va_icd10_optionset.json')
        optionset_name = 'ICD-10'
        optionset_uid = 'LAWwdYur1ds'
    elif optionset == 'algorithm_metadata':
        csv_input = os.path.join(INPUTFOLDER, 'algorithm_metadata', 'algorithm_metadata_options.csv')
        json_output = os.path.join(OUTPUTFOLDER, 'va_algorithm_metadata_optionset.json')
        optionset_name = 'Algorithm Metadata on how CoD was obtained'
        optionset_uid = 'Joti2JHU4i6'
    else:
        raise ValueError(
            'Unrecognized type: {}, must be icd10 or algorithm_metadata'.format(optionset))

    with open(csv_input, 'rb') as csv_file:
    	reader=csv.DictReader(csv_file, delimiter=',')
    	data=[row for row in reader]

    # adding optionSet UID to each option
    option_list=[]
    for o in data:
    	o["optionSet"]={"id": optionset_uid}
    	option_list.append(o)

    # adding option UIDs to optionSet
    option_uids=[{'id': uid} for uid in [option['id'] for option in data]]
    option_set={
    	  "name": optionset_name,
          "id": optionset_uid,
          "publicAccess": "rw------",
          "version": 0,
          "valueType": "TEXT",
          "options": option_uids
    }

    # packaging to DHIS2 metadata
    metadata={}
    metadata['optionSets']=[option_set]
    metadata['options']=option_list

    with open(json_output, 'wb') as json_file:
    	json.dump(metadata, codecs.getwriter('utf-8')(json_file),
    	          ensure_ascii=False, indent=4, sort_keys=True)

if __name__ == '__main__':
    print(u"+++ CREATING METADATA IMPORT FILES IN JSON FROM CSV...")
    print(u"Reading source files: data elements from {}".format(INPUTFOLDER))
    process_dataelements()
    print(u"Reading source files: option sets from {}".format(INPUTFOLDER))
    process_optionset('icd10')
    process_optionset('algorithm_metadata')
    print(u"\nExported DHIS2 metadata files to {}".format(OUTPUTFOLDER))
