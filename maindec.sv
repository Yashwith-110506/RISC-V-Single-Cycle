`timescale 1ns / 1ps

module maindec (
    input  logic [6:0] op,
    output logic [2:0] ImmSrc,
    output logic       Branch,
    output logic       Jump,
    output logic       ResultSrc,
    output logic       MemWrite,
    output logic       ALUSrc,
    output logic       RegWrite,
    output logic [1:0] ALUOp
);

    logic [10:0] controls;

    assign {RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp, Jump} = controls;

    always_comb begin
        casex (op)
            //                    RegWrite _ ImmSrc _ ALUSrc _ MemWrite _ ResultSrc _ Branch _ ALUOp _ Jump
            7'b0000011: controls = 11'b1_000_1_0_1_0_00_0; // Load (lw)
            7'b0100011: controls = 11'b0_001_1_1_0_0_00_0; // Store (sw)
            7'b0110011: controls = 11'b1_xxx_0_0_0_0_10_0; // R-type (add, sub, etc.)
            7'b0010011: controls = 11'b1_000_1_0_0_0_10_0; // I-type ALU (addi, etc.)
            7'b1100011: controls = 11'b0_010_0_0_0_1_01_0; // B-type (beq)
            7'b1101111: controls = 11'b1_011_0_0_0_0_00_1; // J-type (jal)
            default:    controls = 11'bx_xxx_x_x_x_x_xx_x; // Undefined
        endcase
    end

endmodule
