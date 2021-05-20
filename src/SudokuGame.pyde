#Variables
from gamebuttons import*
from numberbuttons import *
from freespace import*
play = False
fixednum = False
select = False
easy = True
easylevel = Gamebuttons("Easy",400,279)
hardlevel = Gamebuttons("Hard",400,319)
#set up grid for sudoku
grid = [ ['', 2,'','','',4,1,9,''],
    ['',3,9,'','','',2,4,''],
    ['','',8,9,'','','',6,7],
    [6,'','','',4,8,'','',''],
    ['','','','','','',8,3,1],
    ['',8,'',2,7,'',4,5,6],
    ['','',2,'','',3,6,'',''],
    ['','',7,'',1,6,5,2,''],
    [3,'','','',2,'',7,8,''], ]
gridhard = [['','',1,'',3,2,4,'',9],
            [6,'','','','','','','',''],
            [9,'',3,7,4,'',6,5,2],
            [5,'',9,'','','','','',''],
            [8,'',6,'','','',1,'',''],
            [2,'','','','','',3,9,''],
            [3,'','',4,'','','','',''],
            [1,'',5,'',9,3,'','',''],
            ['',7,'',1,5,8,'','','']]
grid0 = [['']*9]*9
boxeshard = list()
for j in range(9):
    for i in range(9):
        boxeshard.append(Freespace(gridhard[i][j],75+(22*i),200+(22*j),0))
boxes = list()
for j in range(9):
    for i in range(9):
        boxes.append(Freespace(grid[i][j],75+(22*i),200+(22*j),0)) 
workboxes = list()
for j in range(9):
    for i in range(9):
        workboxes.append(Freespace(grid0[i][j],75+(22*i),200+(22*j),0)) 
numbut = list()
for i in range(9):
    numbut.append(NumberButtons(i+1,25+(42*i),400))
clear = NumberButtons("Clear", 320,319)
clearnum = NumberButtons("Check", 320,279)
hardfixednumber = list()
easyfixednumber = list()
fixednumber = ['']
workarray = [0]

for j in range(9):
    for i in range(9):
        if gridhard[i][j] == '':       
            hardfixednumber.append(gridhard[i][j])
for j in range(9):
    for i in range(9):
        if grid[i][j] == '':
            easyfixednumber.append(grid[i][j])
    
#commad do-things
def mouseClicked():
    if (mouseX>easylevel.x and mouseY>easylevel.y and mouseX<easylevel.x+70 and mouseY<easylevel.y+30):
        for k in range(81):
            workboxes.insert(k,boxes[k])
        for i in range(len(fixednumber)):
            fixednumber.remove('')
        for i in range(len(easyfixednumber)):
            fixednumber.insert(0,easyfixednumber[i])
        for i in range(81):
            if workboxes[i].number == '':
                workarray.insert(i, 0)
            else:
                workarray.insert(i,1)
    if (mouseX>hardlevel.x and mouseY>hardlevel.y and mouseX<hardlevel.x+70 and mouseY<hardlevel.y+30):
        for k in range(81):
            workboxes.insert(k,boxeshard[k])
        for i in range(len(fixednumber)):
            fixednumber.remove('')
        for j in range(len(hardfixednumber)):
            fixednumber.insert(0,hardfixednumber[j])
        for i in range(81):
            if workboxes[i].number == '':
                workarray.insert(i, 0)
            else:
                workarray.insert(i,1)
    if(mouseX>clear.x and mouseY>clear.y and mouseX<clear.x+70 and mouseY<clear.y+30):
        for i in range(81):
            if workarray[i] == 0:
                workboxes[i].number = ''
    if(mouseX>clearnum.x and mouseY>clearnum.y and mouseX<clearnum.x+70 and mouseY<clearnum.y+30):
        check()
                    
    return;
def setup():
    size(520,480)
    background("#FAF8E1")
    
def draw():
    select = False
    startscreen()
  
    for i in range(9):
        if mouseX>numbut[i].x and mouseY>numbut[i].y and mouseX<numbut[i].x+22 and mouseY<numbut[i].y+22:
            select = True
        if select == True:
            numbut[i].color = 0

def keyTyped():
    if key == BACKSPACE:
        print('hi')
    for i in range(81):
        if mouseX>workboxes[i].x and mouseY>workboxes[i].y and mouseX<workboxes[i].x+22 and mouseY<workboxes[i].y+22: 
                for k in range(len(fixednumber)):
                    if fixednumber[k] == workboxes[i].number:
                        workboxes[i].number=key
                    if key == BACKSPACE and fixednumber[k] != workboxes[i].number and workarray[i] == 0:
                        workboxes[i].textcolor = 0
                        workboxes[i].number = ''
                        print('del',workboxes[i].number)
    return;
def startscreen():
    if not play:
        fill(0)
        textAlign(CENTER)
        textSize(40)
        text("SUDOKU", 260,50)
        strokeWeight(0.5)
        textSize(12)
        text("To begin, please select a level difficulty below. \n To enter a number, hover over a box and use your keyboard to select a number. \n To undo an answer, hover over the box and use your DELETE or BACKSPACE button. \n To clear all answers, click the 'Clear' button. \n To check your answers, click the 'Check' button. \n If you have changed your answers, click the 'Check' button to recheck.", 260, 75)
        text("By Alice Leppert", 260, 435)
        text("May 2021", 260,455)
        fill(0)
        easylevel.display()
        easylevel.changecolor()
        hardlevel.display()
        hardlevel.changecolor()
        clear.display()
        clear.changecolor()
        clearnum.display()
        clearnum.changecolor()
        for i in range(81):
            workboxes[i].display()
            workboxes[i].changecolor()
    return;

def check():
    solvedgrideasy = [['7','2','6','8','3','4','1','9','5'],
                      ['5','3','9','1','6','7','2','4','8'],
                      ['1','4','8','9','5','2','3','6','7'],
                      ['6','1','5','3','4','8','9','7','2'],
                      ['2','7','4','6','9','5','8','3','1'],
                      ['9','8','3','2','7','1','4','5','6'],
                      ['4','5','2','7','8','3','6','1','9'],
                      ['8','9','7','4','1','6','5','2','3'],
                      ['3','6','1','5','2','9','7','8','4']]
    solvedgridhard = [['7','5','1','6','3','2','4','8','9'],
                      ['6','2','4','9','8','5','7','1','3'],
                      ['9','8','3','7','4','1','6','5','2'],
                      ['5','1','9','3','7','4','2','6','8'],
                      ['8','3','6','5','2','9','1','7','4'],
                      ['2','4','7','8','1','6','3','9','5'],
                      ['3','9','8','4','6','7','5','2','1'],
                      ['1','6','5','2','9','3','8','4','7'],
                      ['4','7','2','1','5','8','9','3','6']]
    solvedboxeshard = list()
    for j in range(9):
        for i in range(9):
            solvedboxeshard.append(solvedgridhard[i][j])
    solvedboxes = list()
    for j in range(9):
        for i in range(9):
            solvedboxes.append(solvedgrideasy[i][j]) 
    solvedworkboxes = list()
    if (workboxes[1] == boxeshard[1]):
        for k in range(81):
            solvedworkboxes.append(solvedboxeshard[k])
    if (workboxes[1] == boxes[1]):
        for k in range(81):
            solvedworkboxes.append(solvedboxes[k])   
    for i in range(81):
        if workboxes[i].number != solvedworkboxes[i] and workarray[i] == 0:
            workboxes[i].textcolor = "#F50F0F"
            if workboxes[i].number == '':
                workboxes[i].textcolor = 0
            print(i)
            print(workboxes[i].number)
            print(solvedworkboxes[i])
            
        elif workboxes[i].number == '':
            workboxes[i].textcolor = 0
    # print(solvedworkboxes)
    # for i in range(81):
    #     print(workboxes[i].number)
