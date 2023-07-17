# NNProject

Please check the Color Detection docx file for python code and the model description as well as this link to look at latest code https://colab.research.google.com/drive/1FZUa-REocJ90S4oC3S_DyVnYQ-uePyhD?usp=drive_link

# Verilog files 
We take two 8 bit inputs and convert them two there 32 bit IEEE-754 floating point representation by using a lookup table.
Then they are given two to 3 relu neuron who have their weights and biases assigned for them. 
The output is either a 32 bit float number or 0.
The last layer is of a linear neuron which decides which one of the three neurons the result is given in favor of the highest value and assigned a code word like 00(Green ) 10(Blue ) 01 (Red) .
