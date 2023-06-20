`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2022 08:57:29
// Design Name: 
// Module Name: pulse_tb
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


module pulse_tb(

    );
    reg clk,input_0,input_1;
    wire input_pulse;
    input_pulse tb0(.clk_1H(clk),.input_0(input_0),.input_1(input_1),.output_pulse(input_pulse));
    initial begin
    clk=0;
    input_0=0;input_1=0;
    #5 input_0=0;input_1=1;
    #7 input_0=0;input_1=0;
    end
    always #10 clk=~clk;
    
endmodule
