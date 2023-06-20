module clk_divider
 #(parameter div_value = 2499999)
 (
   input clk_in,
   output reg clk_out = 0  
    );
    
    reg[31:0] count_reg=0,count_next=0;
    always @ (posedge clk_in) begin
    if(count_next == div_value)
        count_reg <= 0;
    else
        count_reg <= count_next;
    end
    
    always @ (posedge clk_in) begin
    if(count_next == div_value)
        clk_out <= ~clk_out;
    else
        clk_out <= clk_out;
    end
    
    
endmodule