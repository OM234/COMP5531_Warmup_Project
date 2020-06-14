import random
import re

# Random phone number generation
r = random
numRegex1 = re.compile('^\\d\\d\\d$')
numRegex2 = re.compile('^\\d\\d\\d-\\d\\d\\d$')

phoneNumberList = [''] * 100
digitList = [0] * 10
phoneNumber = ''

for z in range(10):
    digitList[z] = r.randrange(10)

for x in range(100):
    for y in range(10):
        if numRegex1.match(phoneNumber) or numRegex2.match(phoneNumber):
            phoneNumber += "-" + str(digitList[r.randrange(10)])
        else:
            phoneNumber += str(digitList[r.randrange(10)])
    phoneNumberList[x] = phoneNumber
    #    print(phoneNumberList[x])
    phoneNumber = ''

# Publisher Number Generation

publisherNumberList = [''] * 100
publisherNumber = ''
four = 4

for x in range(100):
    while four > 0:
        publisherNumber += str(r.randrange(10))
        four -= 1
        if publisherNumber in publisherNumberList:
            four = 4
            publisherNumber = ''
    four = 4
    publisherNumberList[x] = publisherNumber
    print(publisherNumberList[x])
    publisherNumber = ''

# Publisher Names

# Publisher Website

# Publisher Head Office Name

# Publisher Email

# Publisher Address

# Publisher City

# Publisher Postal Code

# Publisher Province

# Bookstore Name

# Bookstore email

# Bookstore Phone Number

# Bookstore Address

# Bookstore City

# Bookstore Postal Code

# Bookstore Province

# CustomerID

# Customer First Name

# Customer Last Name

# Customer Company Name

# Customer Phone Number

# Customer Address

# Customer City

# Customer Postal Code

# Customer Province

# Customer Cumulative Purchase Number

# Book IBNS

# Author SIN, First Name, Last Name

numRegex3 = re.compile('^\\d\\d\\d$')
numRegex4 = re.compile('^\\d\\d\\d-\\d\\d\\d$')

SINNumberList = [''] * 100
digitList = [0] * 10
SINNumber = ''
sinCount = 9

for z in range(10):
    digitList[z] = r.randrange(10)

for x in range(100):
    while sinCount > 0:
        if numRegex3.match(SINNumber) or numRegex4.match(SINNumber):
            SINNumber += "-" + str(digitList[r.randrange(10)])
        else:
            SINNumber += str(digitList[r.randrange(10)])
        sinCount -= 1
        if SINNumber in SINNumberList:
            sinCount = 9
            SINNumber = ''
    sinCount = 9
    SINNumberList[x] = SINNumber
    print(SINNumberList[x])
    SINNumber = ''

authorNameList = []

with open('names.txt', 'r') as nameFile:
    for line in nameFile:
        authorNameList.append(line.strip())

with open('insert_dataPrime.sql', 'w') as sqlFile:
    sqlFile.write('INSER INTO PUBLISHER (PublisherNumber, PublisherName, Website, HeadOfficeName, Email, PhoneNumber, '
                  'Address, City, PostalCode, Province)\n')
    sqlFile.write('VALUES (\'' + publisherNumberList[0] + '\', PublisherNamePlaceholder, WebPLace, HeadOfficePlace, '
                                                          'EmailPlace '
                                                          ', \'' + phoneNumberList[
                      0] + '\', Address, City, PostalCode, '
                           'Province),\n')
    for b in range(len(publisherNumberList) - 1):
        if b != (len(publisherNumberList) - 2):
            sqlFile.write(
                '(\'' + publisherNumberList[b - 1] + '\', PublisherNamePlaceholder, WebPLace, HeadOfficePlace, '
                                                     'EmailPlace, \'' + phoneNumberList[b - 1] + '\', Address, City, '
                                                                                                 'PostalCode, '
                                                                                                 'Province),\n')
        else:
            sqlFile.write(
                '(\'' + publisherNumberList[b - 1] + '\', PublisherNamePlaceholder, WebPLace, HeadOfficePlace, '
                                                     'EmailPlace, \'' + phoneNumberList[b - 1] + '\', Address, City, '
                                                                                                 'PostalCode, '
                                                                                                 'Province);\n')
    sqlFile.write('\n')
    sqlFile.write('INSER INTO Author (SIN, FirstName, LastName)\n')
    sqlFile.write('VALUES (\'' + SINNumberList[0] + '\', \'' + authorNameList[0] + '\', \'' + authorNameList[
        r.randrange(100)] + "\'),\n")
    for a in range(len(SINNumberList) - 1):
        if a != (len(SINNumberList) - 2):
            sqlFile.write('(\'' + SINNumberList[a + 1] + '\', \'' + authorNameList[r.randrange(len(authorNameList))] +
                          '\', \' ' + authorNameList[r.randrange(len(authorNameList))] + "\'),\n")
        else:
            sqlFile.write('(\'' + SINNumberList[a + 1] + '\', \'' + authorNameList[r.randrange(len(authorNameList))] +
                          '\', \'' + authorNameList[r.randrange(len(authorNameList))] + "\');\n")
