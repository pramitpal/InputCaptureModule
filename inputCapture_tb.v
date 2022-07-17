// Code your testbench here
module inputCapture_tb;
  reg clk,reset;
  wire [3:0] count;
  reg signal;
  reg rstOutput;
  wire intFlag;
  reg rstIntFlag;

  input_capture ic1(.clk(clk),.val(count),.rst(reset),.sig(signal),.rstVal(rstOutput), .rstIntFlag(rstIntFlag), .intFlag(intFlag));
  //clock generator
  initial begin 
    clk = 1'b0; 
    repeat(50) 
    #4
    clk= ~clk;
  end
  //insert all the input signal
  //reset line
 initial begin reset=1'b1;#20 reset=1'b0;end
  //signal input line
 initial begin signal=1'b0; #30 signal=1'b1; #20 signal=1'b0; #30 signal=1'b1; #20 signal=1'b0; end
//reset output line
  initial begin rstOutput=1'b0; #120 rstOutput=1'b1; end
  //reset interrupt flag line
  initial begin rstIntFlag=1'b0; #140 rstIntFlag=1'b1; end
  initial begin
 	$dumpfile("dump.vcd"); 
    $dumpvars(0, ic1);
  end
    
endmodule