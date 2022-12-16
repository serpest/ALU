module Testbench();

    logic [1:0] control;
    logic [31:0] input_a;
    logic [31:0] input_b;
    logic [31:0] result;
    logic overflow;
    logic carry;
    logic negative;
    logic zero;

    ALU alu(control, input_a, input_b, result, overflow, carry, negative, zero);

    logic [31:0] expected_result;

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, Testbench);
        control = 'b00; input_a = 10; input_b = 7; expected_result = 17; #10; // SUM
        control = 'b00; input_a = 'b11111111111111111111111111111111; input_b = 'b1; expected_result = 'b0; #10; // SUM
        control = 'b00; input_a = 'b11111111111111111111111111111110; input_b = 'b1; expected_result = 'b11111111111111111111111111111111; #10; // SUM
        control = 'b01; input_a = 10; input_b = 7; expected_result = 3; #10; // SUB
        control = 'b01; input_a = 1; input_b = 1; expected_result = 0; #10; // SUB
        control = 'b01; input_a = 'b00000000000000000000000000000001; input_b = 'b10; expected_result = 'b11111111111111111111111111111111; #10; // SUB
        control = 'b10; input_a = 'b0011; input_b = 'b0101; expected_result = 'b0001; #10; // AND
        control = 'b11; input_a = 'b0011; input_b = 'b0101; expected_result = 'b0111; #10; // OR
        $finish;
    end

endmodule
