module ALU #(parameter N = 32)
           (input logic [1:0] m, /* Control */
            input logic [N-1:0] a, /* Input A */
            input logic [N-1:0] b, /* Input B */
            output logic [N-1:0] r, /* Result */
            output logic v, /* Overflow */
            output logic c, /* Carry */
            output logic n, /* Negative */
            output logic z /* Zero */);

    logic [N-1:0] b_for_sum;
    logic [N-1:0] sum;
    logic cpa_cout;

    Multiplexer21 sum_multiplexer(b, ~b, m[0], b_for_sum);

    CPA cpa(a, b_for_sum, m[0], sum, cpa_cout);

    Multiplexer41 output_multiplexer(sum, sum, a & b, a | b, m, r);

    FlagALU flag_alu(m, a, b, cpa_cout, r, v, c, n, z);

endmodule
