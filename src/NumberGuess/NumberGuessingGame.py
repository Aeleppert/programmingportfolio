play = True
while (play) :
  print ("Welcome to the Number Guessing Game! ")
  import random
  n = random.randint(1, 100)
  guess = 0
  test = int(input("Please guess a number between 1 and 100: "))
  while(test != n):
    if n < test:
      print('You guessed:',test,'. Sorry that is too high!')
      guess+= 1
      test = int(input("Please try again: "))
    elif test < n: 
      print('You guessed:',test,'. Sorry that is too low!') 
      guess+= 1
      test = int(input("Please try again: "))
  guess+= 1
  print ('You guessed:',test,'That is correct!')
  print ('This attempt took you', guess,'amount of times.')
  if input('Play again?:') == 'no':
    play = False

