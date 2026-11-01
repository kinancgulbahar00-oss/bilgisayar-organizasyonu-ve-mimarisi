// Full Adder modülü
module full_adder(
    input logic a, b, cin,
    output logic sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule


// 4 bit toplama ve çıkarma modülü
module adder_subtractor_4bit (
    input logic [3:0] A, B,
    input logic sub,
    output logic [3:0] Sum,
    output logic Cout
);

    logic c1, c2, c3;
    logic [3:0] B_in;

    assign B_in[0] = B[0] ^ sub;
    assign B_in[1] = B[1] ^ sub;
    assign B_in[2] = B[2] ^ sub;
    assign B_in[3] = B[3] ^ sub;

    full_adder fa0 (.a(A[0]), .b(B_in[0]), .cin(sub), .sum(Sum[0]), .cout(c1));
    full_adder fa1 (.a(A[1]), .b(B_in[1]), .cin(c1), .sum(Sum[1]), .cout(c2));
    full_adder fa2 (.a(A[2]), .b(B_in[2]), .cin(c2), .sum(Sum[2]), .cout(c3));
    full_adder fa3 (.a(A[3]), .b(B_in[3]), .cin(c3), .sum(Sum[3]), .cout(Cout));

endmodule


// 4 bit çarpma modülü
module multiplier_4bit(
    input logic [3:0] A, B,
    output logic [7:0] carpim
);

    assign carpim = A * B;

endmodule


// ALU modülü
module alu_4bit(
    input logic [3:0] a, b,
    input logic [1:0] islem,
    output logic [7:0] sonuc
);

    logic [3:0] add_sub_sonuc;
    logic add_sub_cout;
    logic [3:0] and_sonuc;
    logic [7:0] carpim_sonuc;

    // Toplama ve çıkarma modülü
    adder_subtractor_4bit add_sub_inst (
        .A(a),
        .B(b),
        .sub(islem[0]),
        .Sum(add_sub_sonuc),
        .Cout(add_sub_cout)
    );

    // AND işlemi
    assign and_sonuc = a & b;

    // Çarpma modülü
    multiplier_4bit carpma_inst (
        .A(a),
        .B(b),
        .carpim(carpim_sonuc)
    );

    // İşlem seçimi
    always_comb begin
        case(islem)
            2'b00: sonuc = {3'b000, add_sub_cout, add_sub_sonuc};
            2'b01: sonuc = {3'b000, add_sub_cout, add_sub_sonuc};
            2'b10: sonuc = {4'b0000, and_sonuc};
            2'b11: sonuc = carpim_sonuc;

            default: sonuc = 8'b00000000;
        endcase
    end

endmodule