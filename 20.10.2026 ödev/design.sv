
module alu (
    input  logic [3:0] A,
    input  logic [3:0] B,
    input  logic [1:0] select,
    output logic [4:0] output_result
);

always_comb begin
    case (select)
        2'b00: output_result = A + B;
        2'b01: output_result = {1'b0, A} - {1'b0, B};
        2'b10: output_result = {1'b0, (A & B)};
        2'b11: output_result = {1'b0, (A ^ B)};
        default: output_result = 5'b00000;
    endcase
end

endmodule
