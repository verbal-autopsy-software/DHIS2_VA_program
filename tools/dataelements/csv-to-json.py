import csv
import json
import codecs

dataelements = []
final = {}
with open('dataelements.csv', 'rb') as f:
	reader = csv.DictReader(f, delimiter=';')
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
with open('dataElements.json', 'w') as f2:
	json.dump(final, codecs.getwriter('utf-8')(f2), ensure_ascii=False, indent=4)