print ('Welcome to a Pig Latin Translator. Please type a word or phrase to translate. Please do not use punctuation.')
translate = True
while (translate):
  ineng = input('English:')
  if (' ' in ineng):
    splitspace = ineng.split(' ', len(ineng))
    i = 0
    words = []
    for index in range(len(splitspace)):
      splittwo = splitspace[i].split(splitspace [i][0], len(splitspace))
      firstvtwo = splitspace[i][0]
      suff = 'ay'
      pigword = splittwo[1]+firstvtwo+suff
      words.append(pigword)
      i = i+1
    s = ' '
    a = s.join(words)
    print('Pig Latin:',a)
  else:
    firstv = ineng[0]
    suff = 'ay'
    split = ineng.split(ineng[0], 1)[1]
    print('Pig Latin:', split+firstv+suff)