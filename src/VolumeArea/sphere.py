import math
class Sphere:
   def __init__(self, radius):
     self.radius = radius

   def displayVolume(self):
     v = pow(self.radius,3)*math.pi*(4/3)
     return v
    
   def displaySA(self):
     sa = 4*math.pi*(self.radius*self.radius)
     return sa