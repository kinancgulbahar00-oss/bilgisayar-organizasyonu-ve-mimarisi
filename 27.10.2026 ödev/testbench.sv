module testbench;

    logic [3:0] A, B;
    logic [1:0] islem;
    logic [7:0] sonuc;

    // ALU modülünü çağırıyoruz
    alu_4bit uut (
        .a(A),
        .b(B),
        .islem(islem),
        .sonuc(sonuc)
    );

    initial begin

        // TOPLAMA
        A = 4'd7;
        B = 4'd3;
        islem = 2'b00;
        #10;
        $display("TOPLAMA: %d + %d = %d", A, B, sonuc);

        // ÇIKARMA
        A = 4'd9;
        B = 4'd4;
        islem = 2'b01;
        #10;
        $display("CIKARMA: %d - %d = %d", A, B, sonuc);

        // AND
        A = 4'd7;
        B = 4'd3;
        islem = 2'b10;
        #10;
        $display("AND: %d & %d = %d", A, B, sonuc);

        // ÇARPMA
        A = 4'd5;
        B = 4'd4;
        islem = 2'b11;
        #10;
        $display("CARPMA: %d * %d = %d", A, B, sonuc);

        $finish;
    end

endmodule