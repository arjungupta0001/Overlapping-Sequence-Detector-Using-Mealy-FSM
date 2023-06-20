module vio_wrapper(
    input clk
    );
    
    wire clear, inp_0, inp_1, out;
    wire[2:0] present_state;
    
    vio_0 vio_in0(
    .clk(clk),
     .probe_in0(out),   // input wire [0:0] probe_in0
     .probe_in1(present_state), // input wire [2:0] probe_in1
     .probe_out0(clear),    // output wire [0:0] probe_out0
     .probe_out1(inp_0),    // output wire [0:0] probe_out1
     .probe_out2(inp_1)    // output wire [0:0] probe_out2
     );
     
     top_seq ins1(.clk_100M(clk), .clear(clear), .input_0(inp_0), .input_1(inp_1), .out(out), .present_state(present_state));
     
endmodule