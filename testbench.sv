

module tb_mux4to1;

    logic [7:0] in0, in1, in2, in3;
    logic [1:0] sel;
    logic [7:0] out;

    mux4to1 dut (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .sel(sel),
        .out(out)
    );

    initial begin
      $dumpfile("dump.vcd");
$dumpvars(0, tb_mux4to1);
        in0 = 8'h12;
        in1 = 8'h34;
        in2 = 8'h56;
        in3 = 8'h78;

        sel = 2'b00;
        #10;
        if (out !== in0) $fatal(1, "Test 00 FAILED");
        $display("sel=%b out=%h PASS", sel, out);

        sel = 2'b01;
        #10;
        if (out !== in1) $fatal(1, "Test 01 FAILED");
        $display("sel=%b out=%h PASS", sel, out);

        sel = 2'b10;
        #10;
        if (out !== in2) $fatal(1, "Test 10 FAILED");
        $display("sel=%b out=%h PASS", sel, out);

        sel = 2'b11;
        #10;
        if (out !== in3) $fatal(1, "Test 11 FAILED");
        $display("sel=%b out=%h PASS", sel, out);

        $display("Tum testler basariyla tamamlandi.");
        $finish;
    end
 
endmodule
