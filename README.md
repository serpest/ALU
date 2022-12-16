# Arithmetic logic unit (ALU)
Arithmetic logic unit implementation in SystemVerilog based on the model described by S. L. Harris and D. M. Harris in the book "Digital Design and Computer Architecture: ARM Edition".

## Building and testing

``` shell
iverilog -g2012 -o test.out alu.sv cpa.sv flag_alu.sv full_adder.sv multiplexer21.sv multiplexer41.sv testbench.sv
vvp -i test.out
gtkwave test.vcd
```
