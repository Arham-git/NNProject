from PIL import Image


def decimaltobin(decimal_number):
     binary_number1 = bin(decimal_number[0])[2:].zfill(8)
     binary_number2 = bin(decimal_number[1])[2:].zfill(8)
     binary_number3 = bin(decimal_number[2])[2:].zfill(8)
     
     # print(binary_number)
     return binary_number1,binary_number2,binary_number3





img = Image.open('1.png')
pixels = img.load()
print(img.size[0],img.size[1])
with open("1bin.txt" , 'w' ) as file:
     for i in range(img.size[0]):
          for j in range(img.size[1]):
               print(pixels[i,j])
               r,g,b = decimaltobin(pixels[i,j])
               file.write(f"{r}\n{g}\n{b}\n")
               # print((f"({r},\t {g},\t {b}\t )\n"))





# to read txt to image.

# with open('rgb.txt', 'r') as f:
#     data = f.readlines()

# data = [x.strip() for x in data]

# img = Image.new('RGB', (len(data), 1), "black")
# pixels = img.load()

# for i in range(len(data)):
#     r, g, b = data[i].split(',')
#     pixels[i, 0] = (int(r), int(g), int(b))

# img.show()