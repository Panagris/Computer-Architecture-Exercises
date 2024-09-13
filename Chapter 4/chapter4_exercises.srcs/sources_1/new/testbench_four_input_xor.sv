`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WashU in St. Louis
// Engineer: Chiagozie Okoye
// 
// Create Date: 09/11/2024 04:23:33 PM
// Design Name: 
// Module Name: testbench_four_input_xor
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


module testbench_four_input_xor();
    logic clk, reset;
    logic[3:0] a; logic y, y_expected;
    logic[31:0] vectornum, errors;
    logic[3:0] testvectors[10000:0];
    
    // Instantiate device under test (DUT)
    four_input_xor(a, y);
    
    // Generate the lcock
    always // without a sensitivity list means it will always happen
        begin
            clk = 1; #5; clk = 0; #5;
        end
            
    // Load the vectors and pulse reset
    initial
        begin
            $readmemb("xor_test.txt", testvectors);
            vectornum = 0; errors = 0; // Set them to 0 initially. 0 index of test cases, 0 errors right now
            reset = 1; #22; reset = 0;
        end        
    // Apply test vectors on rising edge of clk
    always @(posedge clk)
        begin
            #1;
            {a, y_expected} = testvectors[vectornum];
        end
    //Check resuts on falling edge
    always @(negedge clk)
        if(~reset) begin // Skip during reset
            if(y !=- y_expected) begin // Check result
                $display("Error: inputs %b", a);
                $display(" outputs = %b (%b expected)", y, y_expected);
            end
            vectornum = vectornum + 1;
            if(testvectors[vectornum] === 4'bx) begin
                $display("%d tests completed with %d errors", vectornum, errors);
                $stop;
            end        
        end
endmodule
