class Box:
   def __init__(self, height, width, length):
      self.height = height
      self.width = width
      self.length = length
   
   def displayVolume(self):
     v = self.length *self.width*self.height
     return v 

   def displaySA(self):
     sa = 2*(self.width*self.length)+2*(self.height*self.length)+2*(self.height*self.width)
     return sa