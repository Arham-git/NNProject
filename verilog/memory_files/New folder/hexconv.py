import csv
import struct
import binascii


def float32_to_hex(f):
    return hex(struct.unpack('<I', struct.pack('<f', f))[0])


# def float32_to_hex(f):
#     s = binascii.hexlify(struct.pack('<f', f))
#     return s[2:]

# float_to_hex(17.5) # 0x418c0000

with open('biases_layer1.csv', 'r') as input_file, open('BiasesLayer1new.txt', 'w') as output_file:
    reader = csv.reader(input_file)
    for row in reader:
        for value in row:
            hex_value = float32_to_hex(float(value))
            hex_value = hex_value[2:] 
            output_file.write(hex_value + ' ')
        output_file.write('\n')


with open('biases_layer2.csv', 'r') as input_file, open('BiasesLayer2new.txt', 'w') as output_file:
    reader = csv.reader(input_file)
    for row in reader:
        for value in row:
            hex_value = float32_to_hex(float(value))
            hex_value = hex_value[2:] 
            output_file.write(hex_value + ' ')
        output_file.write('\n')



with open('weights_layer1.csv', 'r') as input_file, open('WeightsLayer1new.txt', 'w') as output_file:
    reader = csv.reader(input_file)
    for row in reader:
        for value in row:
          #   if float(value) < 0.00000001:
          #       value = 0
            hex_value = float32_to_hex(float(value))
            hex_value = hex_value[2:] 
            output_file.write(hex_value + '\n')
        output_file.write('\n')


with open('weights_layer2.csv', 'r') as input_file, open('WeightsLayer2new.txt', 'w') as output_file:
    reader = csv.reader(input_file)
    for row in reader:
        for value in row:
          #   if float(value) < 0.0000001:
          #       value = 0
            hex_value = float32_to_hex(float(value))
            hex_value = hex_value[2:] 
            output_file.write(hex_value + '\n')
        output_file.write('\n')
        