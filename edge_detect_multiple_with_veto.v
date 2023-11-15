//adapted from https://www.fpga4fun.com/CrossClockDomain2.html

//uses edge_detect_with_veto to count photons arrival into bins


module edge_detect_multiple_with_veto(
    input valid[9:0], 
	 input pulse,   // this is a pulse of indeterminate length
    input clk_out,// clock domain in which to send output pulse
	 input reg[2:0] vetoLast, //whether to suppress pulses that occur [3,2,1] clock cycles after another pulse
    output reg[9:0] det
);

edge_detect_with_veto e0(valid[0],pulse,clk_out,vetoLast,det[0]);
edge_detect_with_veto e1(valid[1],pulse,clk_out,vetoLast,det[1]);
edge_detect_with_veto e2(valid[2],pulse,clk_out,vetoLast,det[2]);
edge_detect_with_veto e3(valid[3],pulse,clk_out,vetoLast,det[3]);
edge_detect_with_veto e4(valid[4],pulse,clk_out,vetoLast,det[4]);
edge_detect_with_veto e5(valid[5],pulse,clk_out,vetoLast,det[5]);
edge_detect_with_veto e6(valid[6],pulse,clk_out,vetoLast,det[6]);
edge_detect_with_veto e7(valid[7],pulse,clk_out,vetoLast,det[7]);
edge_detect_with_veto e8(valid[8],pulse,clk_out,vetoLast,det[8]);
edge_detect_with_veto e9(valid[9],pulse,clk_out,vetoLast,det[9]);



endmodule