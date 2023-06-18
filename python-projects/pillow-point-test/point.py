#!/usr/bin/env python
from PIL import Image, ImageDraw

width = 500
height = 500

image = Image.new("RGB", (width, height), "white")

# Tworzenie obiektu ImageDraw
draw = ImageDraw.Draw(image)

# Określenie punktu i koloru piksela
x = width/2
y = height/2
color = (255, 0, 0) # czerwony

draw.rectangle((x, y, x+1, y+1), fill=color)

image.save("punkt.jpg")


