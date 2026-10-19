// Code your design here

module full_adder_4bit (
    input  logic [3:0] a,
    input  logic [3:0] b,
    input  logic cin,
    output logic [3:0] sum,
    output logic cout
);

    logic [4:0] temp;

    assign temp = {1'b0, a} + {1'b0, b} + cin;
    assign sum  = temp[3:0];
    assign cout = temp[4];

endmodule
