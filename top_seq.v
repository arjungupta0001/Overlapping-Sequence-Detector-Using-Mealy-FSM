module top_seq(
    input clk_100M,
    input clear,
    input input_1,
    input input_0,
    output out,
    output[2:0] present_state

    );
        wire clk_5M, clk_1H;
        wire input_pulse;
            clk_wiz_0 clk_in0
       (
       // Clock out-ports
       .clk_out1(clk_5M),
       // Clock in-ports
       .clk_in1(clk_100M)
       );
       
       clk_divider#(.div_value(2499999)) clk_div_in1(.clk_in(clk_5M), .clk_out(clk_1H));
       
       input_pulse inst2(.clk_1H(clk_1H), .input_0(input_0), .input_1(input_1), .input_pulse(input_pulse));
       
       fsm_11011 inst3(.input_pulse(input_pulse), .clear(clear), .inp_1(input_1), .out(out) , .present_state(present_state));
       
endmodule