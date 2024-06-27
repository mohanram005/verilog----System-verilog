// Code your design here


module updown(input clk,reset,updown,
              output reg [3:0] count);
  
 
  
  always@(posedge clk or posedge reset) begin
    
    if(reset)
      count <=0;
  else
    if(updown == 1)
      if(count == 15)
        count <= 0;
  	  else
        count <= count + 1;
    else
    
      if(count == 0)
        count <= 15;
      else
        count <= count - 1;
  end
endmodule
  

// Code your testbench here
// or browse Examples

module updown_tb;
  
  reg clk,reset,updown;
  wire [3:0] count;
  
  updown up(clk,reset,updown,count);
  
  initial begin
        clk = 0;
        forever #10 clk = ~clk; // Clock with a period of 10 time units
    end
  initial begin
    $monitor("time =%0t | clk=%b  |reset=%b | count=%d",$time,clk,reset,count);
    updown=1;
    #2;
    updown =0;
    #10;
    
    reset = 1; #10;
    reset = 0; 
    
    
    #200$finish;
  
  end
endmodule

    
    
