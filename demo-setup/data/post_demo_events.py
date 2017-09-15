#!/usr/bin/python

"""Script to create VA data to load into DHIS2 (for demo purposes)."""

try:
    import requests
except ImportError:
    print("Please install 'requests' library, see http://docs.python-requests.org/en/master/user/install")

import argparse
import datetime
import json
import os
import random
import sqlite3
import sys
import time
import uuid
from dateutil.relativedelta import relativedelta

root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WARNING = '\033[91m'
ENDC = '\033[0m'


class Dhis(object):
    """ Access DHIS2 API """

    def __init__(self, server, username, password):
        if '/api' in server:
            print('Please do not specify /api/ in the server argument: e.g. --server=play.dhis2.org/demo')
            sys.exit()
        if server.startswith('localhost') or server.startswith('127.0.0.1'):
            server = 'http://{}'.format(server)
        elif server.startswith('http://'):
            server = server
        elif not server.startswith('https://'):
            server = 'https://{}'.format(server)
        self.auth = (username, password)
        self.url = '{}/api'.format(server)

    def get(self, endpoint, params=None):
        """
        GET method for DHIS2 API.
        :rtype: dict
        """
        url = '{}/{}.json'.format(self.url, endpoint)
        if not params:
            params = {}
        params['paging'] = False
        try:
            r = requests.get(url=url, params=params, auth=self.auth)
            if r.status_code != 200:
                print("HTTP Code: {}".format(r.status_code))
                print(r.text)
            else:
                return r.json()
        except requests.RequestException as e:
            print(e)

    def post(self, endpoint, data):
        """
        POST  method for DHIS2 API.
        :rtype: dict
        """
        url = '{}/{}.json'.format(self.url, endpoint)
        try:
            r = requests.post(url=url, json=data, auth=self.auth)
            if r.status_code not in range(200, 206):
                print("HTTP Code: {}".format(r.status_code))
                print(r.text)
            else:
                return r.json()
        except requests.RequestException as e:
            print(e)

    def post_blob(self, f):
        """ Post file to DHIS2 and return created UID for that file
        :rtype: str
        """
        url = '{}/fileResources'.format(self.url)
        files = {'file': (f, open(f, 'rb'), 'application/x-sqlite3', {'Expires': '0'})}
        try:
            r = requests.post(url, files=files, auth=self.auth)
            if r.status_code not in (200, 202):
                print("HTTP Code: {}".format(r.status_code))
                print(r.text)
            else:
                response = r.json()
                file_id = response['response']['fileResource']['id']
                print("\tPosted BLOB for VA ID {} - returned fileResource ID: {}".format(va_id, file_id))
                return file_id

        except requests.RequestException as e:
            print(e)


class VerbalAutopsyEvent(object):
    """ DHIS2 event + a BLOB file resource"""
    def __init__(self, va_id, program, orgunit, icd10, file_id):
        self.va_id = va_id
        self.program = program
        self.orgunit = orgunit

        today = datetime.datetime.today()
        start = datetime.datetime(today.year - 1, 1, 1)

        self.event_date = self.random_date(start, today)

        self.datavalues = [
            {"dataElement": "htm6PixLJNy", "value": self.va_id},
            {"dataElement": "hi7qRC4SMMk", "value": self.random_sex()},
            {"dataElement": "F4XGdOBvWww", "value": self.choose_icd10(icd10)},
            {"dataElement": "XLHIBoLtjGt", "value": file_id}
        ]

        birth_date = self.random_date(start=datetime.datetime(1915, 1, 1), end=self.event_date)
        birth_date_formatted = datetime.datetime.strftime(birth_date, '%Y-%m-%d')
        age = relativedelta(self.event_date, birth_date).years

        age_choice = random.choice(['birth_date', 'age', 'both'])
        if age_choice == 'birth_date':
            self.datavalues.append({"dataElement": "mwSaVq64k7j", "value": birth_date_formatted})
        elif age_choice == 'age':
            self.datavalues.append({"dataElement": "oPAg4MA0880", "value": age})
        elif age_choice == 'both':
            self.datavalues.append({"dataElement": "mwSaVq64k7j", "value": birth_date_formatted})
            self.datavalues.append({"dataElement": "oPAg4MA0880", "value": age})

    @staticmethod
    def random_date(start, end):
        """Returns a random datetime between start and end date
        :rtype: datetime
        """
        return start + datetime.timedelta(seconds=random.randint(0, int((end - start).total_seconds())))

    @staticmethod
    def random_sex():
        """ Returns a weighted choice for sex
        :rtype: str
        """

        # should add up to 100 for better comparison
        choices = {"male": 45, "female": 45, "intermediate": 1, "unknown": 5, "missing": 4}
        return random.choice([k for k in choices for x in range(choices[k])])

    @staticmethod
    def choose_icd10(icd10):
        """ Returns a weighted chose of ICD-10 for better demo purposes
        :rtype: str
        """
        weighted = {
            "A00": 10, "A01": 10, "A02": 10, "A03": 10, "A04": 10, "A05": 10, "A06": 10,
            "A07": 10, "A08": 10, "A09": 10, "A15": 10, "A16": 8, "A17": 5, "A18": 5,
            "A19": 4, "A20": 5, "A21": 5, "A22": 5, "A23": 5, "A24": 5, "A25": 5,
            "A26": 5, "A27": 5, "A28": 5, "A30": 5, "A31": 5, "A32": 5, "A33": 5,
            "A34": 5, "A35": 5, "A36": 5, "A37": 4, "A38": 5, "A39": 5, "A40": 5,
            "A41": 5, "A42": 5, "A43": 5, "A44": 5, "A46": 5, "A48": 5, "A49": 5,
            "A50": 5, "A51": 5, "A52": 3, "A53": 5, "A54": 5, "A55": 4, "A56": 9,
            "A57": 5, "A58": 5, "A59": 5, "A60": 5, "A63": 5, "A64": 5, "A65": 5,
            "A66": 5, "A67": 5, "A68": 5, "A69": 2, "A70": 5, "A71": 3, "A74": 5,
            "A75": 5, "A77": 5, "A78": 5, "A79": 5, "A80": 5, "A81": 5, "A82": 5,
            "A83": 5, "A84": 5, "A85": 9, "A86": 5, "A87": 6, "A88": 5, "A89": 5,
            "A92": 5, "A93": 5, "A94": 5, "A95": 5, "A96": 5, "A97": 5, "A98": 5,
            "A99": 5, "B00": 5, "B01": 5, "B02": 5, "B03": 5, "B04": 5, "B05": 5,
            "B06": 5, "B07": 8, "B08": 5, "B09": 5, "B15": 5, "B16": 5, "B17": 5,
            "B18": 5, "B19": 5, "B20": 5, "B21": 5, "B22": 5, "B23": 5, "B24": 8,
            "B25": 3, "B26": 5, "B27": 5, "B30": 5, "B33": 5, "B34": 5, "B35": 5,
            "B36": 2, "B37": 5, "B38": 6, "B39": 5, "B40": 5, "B41": 5, "B42": 5,
            "B43": 5, "B44": 5, "B45": 5, "B46": 5, "B47": 5, "B48": 5, "B49": 5,
            "B50": 5, "B51": 5, "B52": 5, "B53": 2, "B54": 5, "B55": 5, "B56": 5,
            "B57": 2, "B58": 5, "B59": 5, "B60": 5, "B64": 5, "B65": 5, "B66": 5,
            "B67": 5, "B68": 5, "B69": 5, "B70": 5, "B71": 5, "B72": 4, "B73": 5,
            "B74": 5, "B75": 5, "B76": 5, "B77": 5, "B78": 5, "B79": 5, "B80": 5,
            "B81": 5, "B82": 5, "B83": 5, "B85": 3, "B86": 5, "B87": 5, "B88": 5,
            "B89": 5, "B90": 5
            }
        unweighted = {k: 1 for k in icd10}
        # merge dict and override unweigted
        choices = dict(unweighted.items() + weighted.items())
        return random.choice([k for k in choices for x in range(choices[k])])



    def format_to_dhis2(self, username):
        """
        Format object to DHIS2 compatible event for DHIS2 API
        :rtype: dict
        """
        event = {
            "program": self.program,
            "orgUnit": self.orgunit,
            "eventDate": datetime.datetime.strftime(self.event_date, '%Y-%m-%d'),
            "status": "COMPLETED",
            "storedBy": username,
            "dataValues": self.datavalues
        }
        return event

    def __str__(self):
        return json.dumps(self, default=lambda o: o.__dict__)


def parse_args():
    parser = argparse.ArgumentParser(description="Create demo data to load into the Verbal Autopsy program")
    parser.add_argument('--server', dest='server', action='store', required=True,
                        help="DHIS2 server URL, e.g. 'play.dhis2.org/demo'")
    parser.add_argument('--username', dest='username', action='store', required=True,
                        help='DHIS2 username, e.g. --username=admin')
    parser.add_argument('--password', dest='password', action='store', required=True,
                        help='DHIS2 password, e.g. --password=district')
    parser.add_argument('--events', dest='events', nargs='?', type=int, default=1000,
                        help="Amount of events to generate (default: 1000)")
    parser.add_argument('--orgunit', dest='orgunit', required=True, help='OrgUnit UID to register events for')
    return parser.parse_args()


def create_db(f):
    """
    Create a dummy SQLite database
    :rtype: None
    """
    conn = sqlite3.connect(f)
    with conn:
        cur = conn.cursor()
        cur.execute("CREATE TABLE Cars(Id INT, Name TEXT, Price INT)")
        cur.execute("INSERT INTO Cars VALUES(1,'Audi',52642)")
        cur.execute("INSERT INTO Cars VALUES(2,'Mercedes',57127)")
        cur.execute("INSERT INTO Cars VALUES(3,'Skoda',9000)")
        cur.execute("INSERT INTO Cars VALUES(4,'Volvo',29000)")
        cur.execute("INSERT INTO Cars VALUES(5,'Bentley',350000)")
        cur.execute("INSERT INTO Cars VALUES(6,'Citroen',21000)")
        cur.execute("INSERT INTO Cars VALUES(7,'Hummer',41400)")
        cur.execute("INSERT INTO Cars VALUES(8,'Volkswagen',21600)")


if __name__ == '__main__':

    args = parse_args()
    api = Dhis(server=args.server, username=args.username, password=args.password)

    print("{}+++ Warning: This script does load {} random Verbal Autopsy events to {} "
          "and posts SQlite files to /api/fileResources. OK? Abort with CTRL+C {}".format(WARNING, args.events, args.server, ENDC))
    try:
        time.sleep(3)
    except KeyboardInterrupt:
        print("Creating events and blobs aborted. Nothing was created or imported.")

    va_programs = api.get('programs', params={'filter': 'name:like:Verbal Autopsy'}).get('programs')
    orgunit_valid = len(
        api.get('organisationUnits', params={'filter': 'id:eq:{}'.format(args.orgunit)})['organisationUnits']) == 1
    if not orgunit_valid:
        print('Organisation Unit UID could not be found. Exiting...')
        sys.exit()
    if not va_programs:
        print("'Verbal Autopsy' program not found. Exiting...")
        sys.exit()
    elif len(va_programs) > 1:
        print("More than one 'Verbal Autopsy' found. Exiting...")
        sys.exit()

    va_program_uid = va_programs[0]['id']
    icd10_options = [o['code'] for o in
                     api.get('options', params={'filter': 'optionSet.id:eq:LAWwdYur1ds', 'fields': 'code'}).get(
                         'options')]

    db_path = os.path.join(root, 'blobs')
    if not os.path.isdir(db_path):
        os.makedirs(db_path)

    events = []
    export = {}
    for i in range(args.events):
        va_id = str(uuid.uuid4())
        blob_file = "{}.db".format(os.path.join(root, 'blobs', va_id))
        create_db(blob_file)
        file_id = api.post_blob(blob_file)
        e = VerbalAutopsyEvent(va_id, va_program_uid, args.orgunit, icd10_options, file_id)
        events.append(e.format_to_dhis2(args.username))
        print("{} out of {} events processed".format(i+1, args.events))

    export['events'] = events

    with open('events.json', 'w') as json_file:
        json.dump(export, json_file, indent=4)

    print("Import file stored at events.json - {} Proceeding to POST that import file NOW...{} Abort with CTRL+C.".format(WARNING, ENDC))
    try:
        time.sleep(5)
    except KeyboardInterrupt:
        print("POSTing events aborted. Nothing was imported to {}".format(args.server))

    log = api.post('events', data=export)
    print("\n\n")
    errors = [x.get('description') for x in log['response']['importSummaries'] if
              x.get('status', None) in {'ERROR', 'WARNING'}]
    with open('log.json',  'w') as json_file:
        json.dump(log, json_file, indent=4)
    print("Import summary: {} errors".format(len(errors)))
    print("Log file of import stored at log.json")
    print("\n".join(errors))
