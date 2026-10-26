
module testbench;

logic [3:0] A, B;
logic [1:0] select;
logic [4:0] output_result;

alu uut (
    .A(A),
    .B(B),
    .select(select),
    .output_result(output_result)
);

initial begin
    A = 4'd7;
    B = 4'd3;

    select = 2'b00;
    #10;
    $display("TOPLAMA: %d + %d = %d", A, B, output_result);

    select = 2'b01;
    #10;
    $display("CIKARMA: %d - %d = %d", A, B, output_result);

    select = 2'b10;
    #10;
    $display("AND: %b & %b = %b", A, B, output_result);

    select = 2'b11;
    #10;
    $display("XOR: %b ^ %b = %b", A, B, output_result);

    $finish;
end

endmodule
