print("Welcome to BirthDate! Please begin by entering your Birthdate. Please enter only numbers. If you don't know a catagory, please enter a '0'.")
import time
millen = 0
cent = 0
dec = 0
year = int(input('Year:'))
month = int(input('Month:'))
day = int(input('Day:'))
hour = int(input('Hour of day (24hr clock):'))
minute = int(input('Minute of hour (24hr clock):'))
yr = abs(time.localtime()[0] - year)
while yr>1000:
  yr = yr - 1000
  millen = millen+1
while yr>100:
  yr = yr-100
  cent = cent+1
while yr>10:
  yr = yr-10
  dec = dec+1
mon = time.localtime()[1] - month
if mon<0:
  mon = 12+mon
  yr=yr-1
if mon>12:
  mon = mon - 12
  yr = yr+1
d = time.localtime()[2] - day
if mon == 2:
  while d<0:
    d = 28+day
    mon = mon-1
  while d >28:
    d = d-28
    mon = mon+1
elif mon == 1 and 3 and 5 and 7 and 8 and 10 and 12:
  while d<0:
    d = 31+day
    mon = mon-1
  while d>31:
    d = d-31
    mon = mon+1
else:
  while d<0:
    d = 30+day
    mon = mon-1
  while d>30:
    d = d-30
    mon = mon+1
hr = time.localtime()[3] - hour
while hr<0:
  hr = 24+hr
  d=d-1
while hr>24:
  hr = hr-24
  d = d+1
mint = time.localtime()[4] - minute
while mint<0:
  mint = 60+mint
  hr=hr-1
while mint>60:
  mint = mint-60
  hr = hr+1
sec = time.localtime()[5]
print('Milleniums:',millen,'Centuries:',cent,'Decades:',dec,'Years:',yr,'Months:',mon,'Days:',d,'Hours:',hr,'Minutes:',mint,'Seconds:',sec)