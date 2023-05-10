import sys

for arg in sys.argv:
    if arg == '--help' or arg == '-h':
        print ("""RandomFiscalCode, version 0.0.1

Usage: random-fiscal-code [arguments]

Arguments:
-h or --help\t\tPrint Help (this message) and exit
-copy\t\t\tCopy the random fiscal code to the clipboard
-e or --extended\tShow more information""")
        exit()

from codicefiscale import codicefiscale
import pandas as pd
import string
import datetime
import random

def random_date(start_date, end_date):
    time_between_dates = end_date - start_date
    days_between_dates = time_between_dates.days
    random_number_of_days = random.randrange(days_between_dates)
    random_date = start_date + datetime.timedelta(days=random_number_of_days)
    
    return random_date.strftime('%d/%m/%Y')

GENDERS = ['M', 'F']
MIN_AGE = 18
MAX_AGE = 100
START_DATE = datetime.date.today() - datetime.timedelta(days=MAX_AGE*365)
END_DATE = datetime.date.today() - datetime.timedelta(days=MIN_AGE*365)

gender = random.choice(GENDERS)
lastname = random.choice(pd.read_csv('data/surnames.csv').surname.values)
firstname = random.choice(pd.read_csv('data/male_names.csv' if gender == 'M' else 'data/female_names.csv').name.values)
birthdate = random_date(START_DATE, END_DATE)
birthplace = random.choice(pd.read_csv('data/municipalities.csv').to_dict('records'))

fiscalCode = codicefiscale.encode(lastname=lastname, firstname=firstname, gender=gender, birthdate=birthdate, birthplace=birthplace['name'])
print(
f'''
####################
#                  #
# RandomFiscalCode #
#                  #
####################
#                  #
# {fiscalCode} #
#                  #
####################''')

for arg in sys.argv:
    if arg == '--extended' or arg == '-e':
        print(
f'''#                  #
# Lastname: {lastname}
# Firstname: {firstname}
# Gender: {gender}
# Birthdate: {birthdate}
# Birthplace: {birthplace['name']} ({birthplace['province']})
#                  #
####################''')
        break
print()

for arg in sys.argv:
    if arg == '-copy':
        import clipboard
            
        clipboard.copy(fiscalCode)
        print('Random fiscal code copied!')
        break
        
