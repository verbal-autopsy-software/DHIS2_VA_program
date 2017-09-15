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
            "A00": 500, "A01": 400, "A02": 350, "A03": 300, "A04": 300, "A05": 300, "A06": 300,
            "A07": 200, "A08": 200, "A09": 200, "A15": 200, "A16": 200, "A17": 200, "A18": 200,
            "A19": 200, "A20": 200, "A21": 200, "A22": 200, "A23": 200, "A24": 200, "A25": 200,
            "A26": 150, "A27": 150, "A28": 150, "A30": 150, "A31": 150, "A32": 150, "A33": 150,
            "A34": 150, "A35": 150, "A36": 150, "A37": 150, "A38": 150, "A39": 150, "A40": 150,
            "A41": 100, "A42": 100, "A43": 100, "A44": 100, "A46": 100, "A48": 100, "A49": 50,
            "A50": 70, "A51": 50, "A52": 30, "A53": 50, "A54": 50, "A55": 40, "A56": 90,
            "A57": 70, "A58": 50, "A59": 50, "A60": 50, "A63": 50, "A64": 50, "A65": 50,
            "A66": 70, "A67": 50, "A68": 50, "A69": 20, "A70": 50, "A71": 30, "A74": 50,
            "A75": 70, "A77": 50, "A78": 50, "A79": 50, "A80": 50, "A81": 50, "A82": 50,
            "A83": 70, "A84": 50, "A85": 90, "A86": 50, "A87": 60, "A88": 50, "A89": 50,
            "A92": 70, "A93": 50, "A94": 50, "A95": 50, "A96": 50, "A97": 50, "A98": 50,
            "A99": 70, "B00": 50, "B01": 50, "B02": 50, "B03": 50, "B04": 50, "B05": 50,
            "B06": 70, "B07": 80, "B08": 50, "B09": 50, "B15": 50, "B16": 50, "B17": 50,
            "B18": 70, "B19": 50, "B20": 50, "B21": 50, "B22": 50, "B23": 50, "B24": 80,
            "B25": 70, "B26": 50, "B27": 50, "B30": 50, "B33": 50, "B34": 50, "B35": 50,
            "B36": 70, "B37": 50, "B38": 60, "B39": 50, "B40": 50, "B41": 50, "B42": 50,
            "B43": 70, "B44": 50, "B45": 50, "B46": 50, "B47": 50, "B48": 50, "B49": 50,
            "B50": 70, "B51": 50, "B52": 50, "B53": 20, "B54": 50, "B55": 50, "B56": 50,
            "B57": 70, "B58": 50, "B59": 50, "B60": 50, "B64": 50, "B65": 50, "B66": 50,
            "B67": 70, "B68": 50, "B69": 50, "B70": 50, "B71": 50, "B72": 40, "B73": 50,
            "B74": 70, "B75": 50, "B76": 50, "B77": 50, "B78": 50, "B79": 50, "B80": 50,
            "B81": 70, "B82": 50, "B83": 50, "B85": 30, "B86": 50, "B87": 50, "B88": 50,
            "B89": 50, "B90": 50
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
