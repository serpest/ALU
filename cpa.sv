// Ripple-Carry Adder
module CPA #(parameter N = 32)
           (input logic [N-1:0] a,
            input logic [N-1:0] b,
            input logic cin,
            output logic [N-1:0] s,
            output logic cout);

    logic [N-1:0] carries;

    FullAdder adders[N-1:0] (a, b, {carries[N-2:0], cin}, s, carries);

    assign cout = carries[N-1];

endmodule
