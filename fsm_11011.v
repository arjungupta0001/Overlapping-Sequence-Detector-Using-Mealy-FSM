module fsm_11011(
    input clear,
    input inp_1,
    input input_pulse,
    output reg out=0,
    output reg[2:0] present_state
    );
    
    reg[2:0] next_state;
    parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100;
    
    always@(posedge input_pulse or posedge clear)
    begin
        if(clear)
            present_state<=s0;
        else
            present_state<=next_state;
    end
    
    always@(*) begin
    next_state = present_state;
    case(present_state)
    s0: if(inp_1 == 1'b1)
            next_state = s1;
        else
            next_state = s0;       
    s1: if(inp_1 == 1'b1)
            next_state = s2;
        else
            next_state = s0;
    s2: if(inp_1 == 1'b0)
            next_state = s3;
        else
            next_state = s2;
    s3:if(inp_1 == 1'b1)
            next_state = s4;
       else
            next_state = s0;
    s4:if(inp_1 == 1'b1)
            next_state = s2;
       else
            next_state = s0;
     default: next_state=s0;
   endcase
 end
always@(posedge input_pulse)begin
        if(present_state==s4 && inp_1==1'b1)
            out<=1;
        else
            out<=0;
   end
endmodule