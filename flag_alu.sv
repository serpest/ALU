module FlagALU #(parameter N = 32)
               (input logic [1:0] m,
                input logic [N-1:0] a,
                input logic [N-1:0] b,
                input logic cpa_cout,
                input logic [N-1:0] r,
                output logic v,
                output logic c,
                output logic n,
                output logic z);

    assign v = ~m[1] & (a[N-1] ^ r[N-1]) & ~(a ^ b ^ m[0]);

    assign c = ~m[1] & cpa_cout;

    assign n = r[N-1];

    assign z = &(~r);

endmodule
