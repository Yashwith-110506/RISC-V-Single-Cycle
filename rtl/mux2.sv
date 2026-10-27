`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2026 14:12:11
// Design Name: 
// Module Name: mux2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux2 #(parameter WIDTH = 8)(
    input  logic [WIDTH-1:0] d0,  // Input 0
    input  logic [WIDTH-1:0] d1,  // Input 1
    input  logic             s,   // Select line
    output logic [WIDTH-1:0] y    // Output
);
    assign y = s ? d1 : d0;
endmodule
