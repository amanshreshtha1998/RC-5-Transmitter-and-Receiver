module  button
    (
input   clk, button_in,
output a
  );
    
     reg DB_out;
  reg [3:0] counter  ;
      reg [3:0] counter_reg;
    
    parameter N = 11 ;      
  
    reg  [N-1 : 0]  delaycount_reg={ N{1'b0} };                     
    reg  [N-1 : 0]  delaycount_next;
      
    reg DFF1=1'b0;
    reg DFF2=1'b0;                                 
    wire q_add;                                     
    wire q_reset;
  
 
 reg  delay_reg=1'b0 ;
 wire level_out;
  
        always @ ( posedge clk )
//        begin
//            if(n_reset ==  1) 
//                begin
//                    DFF1 <= 1'b0;
//                    DFF2 <= 1'b0;
//                    delay_reg  <=  1'b0;
//                    delaycount_reg <= { N {1'b0} };
//                end
         //   else
                begin
                    DFF1 <= button_in;
                    DFF2 <= DFF1;
                    delaycount_reg <= delaycount_next;
                         
                     
                     
                    delay_reg  <=  DB_out;
               // end
        end
      
      
    assign q_reset = (DFF1  ^ DFF2); 
                                       
    assign  q_add = ~(delaycount_reg[N-1]);     
      
  
    always @ ( q_reset, q_add, delaycount_reg)
        begin
            case( {q_reset , q_add})
                2'b00 :
                        delaycount_next <= delaycount_reg;
                2'b01 :
                        delaycount_next <= delaycount_reg + 1;
                default :
               
                        delaycount_next <= { N {1'b0} };
            endcase   
        end
      
      
    always @ ( posedge clk )
        begin
            if(delaycount_reg[N-1] == 1'b1)
                    DB_out <= DFF2;
            else
                    DB_out <= DB_out;
        end
          
     
    assign  level_out = DB_out;     
    
     
 
          
endmodule
