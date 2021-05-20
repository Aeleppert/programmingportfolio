class Freespace:
    def __init__(self,number,x,y,textcolor):
        self.number=number
        self.x=x
        self.y=y
        self.dist = 22
        self.color = "#AF9057"
        self.textcolor = textcolor
        hover = False
        return;

    def display(self):
        strokeWeight(1)
        fill(self.color)
        rect(self.x,self.y,self.dist,self.dist)
        strokeWeight(2.5)
        line(75,200,75,398)
        line(140,200,140,398)
        line(206,200,206,398)
        line(272,200,272,398)
        
        line(75,200,272,200)
        line(75,266,272,266)
        line(75,398,272,398)
        line(75,332,272,332)
        strokeWeight(1)
        textSize(18)
        fill(self.textcolor)
        textAlign(CENTER)
        text(self.number,self.x+10,self.y+18)
        return;
    def changecolor(self):
        if (mouseX>self.x and mouseY>self.y and mouseX<self.x+22 and mouseY<self.y+22):
            self.color = "#BFA679"
        else:
            self.color = "#AF9057"
        hover = True
        return;
    def hover():
        hover = (mouseX>self.x and mouseY>self.y and mouseX<self.x+22 and mouseY<self.y+22)
        self.color = "#BFA679"
        return;
    # def newnumber():
