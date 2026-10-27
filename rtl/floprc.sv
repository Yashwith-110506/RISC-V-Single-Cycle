`timescale 1ns / 1ps

module floprc #(parameter WIDTH = 8) (
    input  logic             clk,
    input  logic             reset,
    input  logic             clear,
    input  logic [WIDTH-1:0] d,
    output logic [WIDTH-1:0] q
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            q <= '0;         // Asynchronous reset clears output to 0
        else if (clear)
            q <= '0;         // Synchronous clear/flush clears output to 0
        else
            q <= d;          // Normal operation: load input data into output
    end

endmodule
