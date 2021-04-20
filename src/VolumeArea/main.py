from box import Box
from pyramid import Pyramid
from sphere import Sphere
print("Welcome! This program will give you the Volume \nand the Surface Area for a box, a pyramid, and a \nsphere. To begin, press 'box' for a box, press 'pyramid' for a pyramid, and \npress 'sphere' for a sphere.")
play = True
shape = input('Which Shape?')
if shape == 'box':
  l = float(input('Length:'))
  w = float(input('Width:'))
  h = float(input('Height:'))
  box = Box(h,w,l)
  print('Volume:',Box.displayVolume(box))
  print('Surface Area:',Box.displaySA(box))

if shape == 'pyramid':
  l = float(input('Length of Base:'))
  w = float(input('Width of Base:'))
  h = float(input('Height:'))
  pyramid = Pyramid(h,l,w)
  print('Volume:',Pyramid.displayVolume(pyramid))
  print('Surface Area:',Pyramid.displaySA(pyramid))

if shape == 'sphere':
  r = float(input('Radius:'))
  sphere = Sphere(r)
  print('Volume:',Sphere.displayVolume(sphere))
  print('Surface Area:',Sphere.displaySA(sphere))
