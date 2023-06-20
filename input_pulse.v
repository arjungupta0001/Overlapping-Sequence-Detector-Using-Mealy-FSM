module input_pulse(
    input clk_1H,
    input input_0,
    input input_1,
    output input_pulse
    );
        reg Q=0;
        reg D=0;
        
        wire inp_pulse;
        
        assign inp_pulse=input_0|input_1;
        
        always@(posedge clk_1H)begin
            Q<=D;
        end
        
        always@(*)begin
        D=inp_pulse;
        end
        
        assign input_pulse=Q;
endmodule