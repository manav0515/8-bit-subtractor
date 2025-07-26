`timescale 1ns/1ns
`include "8_bit_subtractor_rtl.v"  // Make sure the subtractor module file is in the same directory

module testbench;
    reg [7:0] A, B;
    reg Clock, Borrow_in;
    wire [7:0] DIFF;
    wire Borrow_out;

    // Instantiate the module under test
    subtractor_8bit dut (
        .A(A),
        .B(B),
        .Clock(Clock),
        .Borrow_in(Borrow_in),
        .DIFF(DIFF),
        .Borrow_out(Borrow_out)
    );

    // Clock generation
    always #5 Clock = ~Clock; // Clock period = 10ns

    // Stimulus
    initial begin
        $fsdbDumpvars; // For waveform analysis (tool-specific, e.g., Verdi)

        // Initialize
        Clock = 0;
        A = 8'b00000000;
        B = 8'b00000000;
        Borrow_in = 0;

        // Wait for a few cycles
        #10;

        // Test Case 1: 10 - 5 - 0 = 5
        A = 8'd10;
        B = 8'd5;
        Borrow_in = 0;
        #10 $display("A = %d, B = %d, Borrow_in = %b, DIFF = %d, Borrow_out = %b", A, B, Borrow_in, DIFF, Borrow_out);

        // Test Case 2: 5 - 10 - 0 = -5 → 2’s complement = 251
        A = 8'd5;
        B = 8'd10;
        Borrow_in = 0;
        #10 $display("A = %d, B = %d, Borrow_in = %b, DIFF = %d, Borrow_out = %b", A, B, Borrow_in, DIFF, Borrow_out);

        // Test Case 3: 15 - 7 - 1 = 7
        A = 8'd15;
        B = 8'd7;
        Borrow_in = 1;
        #10 $display("A = %d, B = %d, Borrow_in = %b, DIFF = %d, Borrow_out = %b", A, B, Borrow_in, DIFF, Borrow_out);

        // Test Case 4: 0 - 1 - 1 = -2 → 2’s complement = 254
        A = 8'd0;
        B = 8'd1;
        Borrow_in = 1;
        #10 $display("A = %d, B = %d, Borrow_in = %b, DIFF = %d, Borrow_out = %b", A, B, Borrow_in, DIFF, Borrow_out);

        #100 $finish;
    end

endmodule

