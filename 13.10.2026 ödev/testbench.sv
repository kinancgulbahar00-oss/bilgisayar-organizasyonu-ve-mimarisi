// Code your testbench here
// or browse Examples

module testbench;

    logic [3:0] a, b;
    logic cin;
    logic [3:0] sum;
    logic cout;

    full_adder_4bit dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
    
        a = 4'b0011; b = 4'b0010; cin = 0;
        #10;
        $display("3 + 2 = %b%b", cout, sum);

        a = 4'b0111; b = 4'b0001; cin = 0;
        #10;
        $display("7 + 1 = %b%b", cout, sum);

        a = 4'b1111; b = 4'b0001; cin = 0;
        #10;
        $display("15 + 1 = %b%b", cout, sum);

        a = 4'b1010; b = 4'b0101; cin = 1;
        #10;
        $display("10 + 5 + 1 = %b%b", cout, sum);

        $finish;
    end

endmodule
