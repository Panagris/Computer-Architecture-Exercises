`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WashU in St. Louis
// Engineer: Chiagozie Okoye
// 
// Create Date: 09/11/2024 04:13:49 PM
// Design Name: Four-Input XOR
// Module Name: four_input_xor
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


module four_input_xor(input [3:0] a,
                      output y);
    assign y = ^a;
endmodule
