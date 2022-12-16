module Multiplexer41 #(parameter N = 32)
                     (input logic [N-1:0] d00,
                      input logic [N-1:0] d01,
                      input logic [N-1:0] d10,
                      input logic [N-1:0] d11,
                      input logic [1:0] s,
                      output logic [N-1:0] y);

    always_comb begin
        case(s)
            2'b00: y = d00;
            2'b01: y = d01;
            2'b10: y = d10;
            2'b11: y = d11;
            default: y = d00;
        endcase
    end

endmodule
