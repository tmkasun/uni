#! /usr/bin/python

"""
Simple HTML parser to grab the information appears on selected students page in industry traning web application
"""
import urllib2
import re
import psycopg2

# Open database connection
connection = psycopg2.connect(database="uni_db", user="uni", password="uni@123", host="127.0.0.1")
cursor = connection.cursor()

def configServer():
    """
    Import configuration file and set parameters
    """
    try:
      config = open(r"./intern.conf", "r+")
    except IOError, e:
      print e
      return 0
    configLines = []
    try:
      while True:
        configLines.append(config.next())
    except StopIteration:
      pass
    finally:
      config.close()
    configInfo = {}
    for line in configLines:
      if line[0] == "#" or line[0] == "\n":
        continue
      configLineArgumentList = line[:-1].split("->")
      key = configLineArgumentList[0]
      value = configLineArgumentList[1]
      configInfo.update({key:value})
    return configInfo

def getProfileID(registration_number):
    registration_number = registration_number.upper()
    cursor.execute("""select id from profiles where registration_number = '{}' """.format(registration_number))
    result = cursor.fetchall()
    return result[0][0]

def insertToDB(record):
    status = False
    profileID = getProfileID(record[0])
    companyName = record[1]
    #print companyName,profileID
    query = """insert into internships(profile_id,company_name) values({},'{}')""".format(profileID,companyName)
    try:
        status = cursor.execute(query)
        connection.commit()
        status = True
    except :
        print "Duplicate record for {}".format(record)
        connection.rollback()

    return status

configDict = configServer()
print configDict
opener = urllib2.build_opener()
opener.addheaders.append(('Cookie', configDict['cook1']))
opener.addheaders.append(('Cookie', configDict['cook2']))
opener.addheaders.append(('Cookie', configDict['cook3']))

selectedStudentList = opener.open(configDict['url'])
rawContent = selectedStudentList.read()
rawHTMLLines = rawContent.split("\n")

insideRow = False
compiledPattern = re.compile('>[\w^&^;^ ]+<')
records = []
validRecord = False
for line in rawHTMLLines:
    #print line.strip(), len(line.strip())
    if line.strip() == "<tr>":
        #print "****************"
        insideRow = True
        record = []
        continue

    if line.strip() == "</tr>":
        #print "################"
        insideRow = False
        validRecord = False
        #print record
        records.append(record)
        continue

    if insideRow:
        stripedLine =  line.strip()
        match = compiledPattern.search(stripedLine)
        if match:
            #print match.group()[1:-1]
            if not validRecord:
                try:
                    count = int(match.group()[1:-1])
                    validRecord = True
                    continue
                except:
                    continue

            record.append(match.group()[1:-7])
            #print match.group()[1:-7]

successCount = 0
failCount = 0
recordsCount = 0

for record in records:
    if len(record) == 0:
        continue
    recordsCount += 1
    if insertToDB(record):
        successCount += 1
        continue
    failCount += 1


print "Total records = {}, successCount = {} ,failCount = {}".format(recordsCount,successCount,failCount)
