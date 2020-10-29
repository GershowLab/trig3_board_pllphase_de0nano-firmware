//adapted from https://www.beyond-circuits.com/wordpress/2016/03/detecting-the-rising-edge-of-a-short-pulse/

`timescale 1ns/1ns
module edge_detect
  (
  	input valid,
   input pulse,
	//input notvalid,
   input clk,
   output clk_aligned_pulse
   );

  reg valid_held = 0;
 // reg notvalid_held = 0;
  always @(posedge clk or posedge pulse)
    if (pulse)
      valid_held <= valid;// && !notvalid_held;
	//	notvalid_held <= notvalid && !valid_held;
    else
      valid_held <= 0;
//		notvalid_held <= 0;

  reg [1:0] pulse_shift = 0;
  always @(posedge clk)
  pulse_shift <= {pulse_shift,valid_held};
  
  assign clk_aligned_pulse = pulse_shift == 2'b01;
endmodule