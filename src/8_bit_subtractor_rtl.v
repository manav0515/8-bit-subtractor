module subtractor_8bit (
    input [7:0] A, B,
    input wire Clock,
    input Borrow_in,  // similar to Carry_in, acts as initial borrow
    output reg [7:0] DIFF,
    output reg Borrow_out
);

    // Internal registers
    reg [7:0] regA, regB, diff_i;
    reg b_in, b_out;

    // Latch inputs on clock edge
    always @ (posedge Clock) begin
        regA <= A;
        regB <= B;
        b_in <= Borrow_in;
    end

    // Latch outputs on clock edge
    always @ (posedge Clock) begin
        DIFF <= diff_i;
        Borrow_out <= b_out;
    end

    // Combinational logic for subtraction using 2's complement
    always @ * begin
        {b_out, diff_i} = {1'b0, regA} - {1'b0, regB} - b_in;
        // b_out becomes 1 if there's a borrow (i.e., result was negative)
    end

endmodule
