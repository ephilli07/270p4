`timescale 1ns/1ns

module AddSub_tb;

    // Parameter
    parameter W = 4;

    // Inputs
    reg signed [W-1:0] A;
    reg signed [W-1:0] B;
    reg c0;

    // Outputs
    wire signed [W-1:0] R;
    wire ovf;

    // Instantiate DUT
    AddSub #(.W(W)) dut (
        .A(A),
        .B(B),
        .c0(c0),
        .R(R),
        .ovf(ovf)
    );

    initial begin
        // =====================
        // ADD TESTS
        // =====================
        // 4 + 3 = 7 (no ovf)
        A = 4; B = 3; c0 = 0;
        #20;

        // 7 + 1 = -8 (ovf expected)
        A = 7; B = 1; c0 = 0;
        #20;

        // -7 + -1 = -8 (ovf expected)
        A = -7; B = -1; c0 = 0;
        #20;

        // -8 + 8 = 0 (no ovf)
        A = -8; B = 8; c0 = 0;
        #20;

        // =====================
        // SUB TESTS
        // =====================
        // 5 - 2 = 3 (no ovf)
        A = 5; B = 2; c0 = 1;
        #20;

        // -5 - -2 = -3 (no ovf)
        A = -5; B = -2; c0 = 1;
        #20;

        // 2 - 2 = 0 (no ovf)
        A = 2; B = 2; c0 = 1;
        #20;

        // 7 - (-2) = 9 (ovf expected)
        A = 7; B = -2; c0 = 1;
        #20;

        // -8 - 1 = -9 (ovf expected)
        A = -8; B = 1; c0 = 1;
        #20;

        // Done
        $stop;
    end

endmodule
