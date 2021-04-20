class Pyramid:
  def __init__(self,height, length, width,):
   self.length = length
   self.width = width
   self.height = height
  
  def displayVolume(self):
   v = (self.length*self.width*self.height)/3
   return v

  def displaySA(self):
   sa = self.length*self.width+self.length*pow(pow(self.width/2,2)+pow(self.height,2),0.5)+self.width*pow(pow(self.length/2,2)+pow(self.height,2),0.5)
   return sa