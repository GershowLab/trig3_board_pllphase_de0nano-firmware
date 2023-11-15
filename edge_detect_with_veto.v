//adapted from https://www.fpga4fun.com/CrossClockDomain2.html

//captures whether photon arrived during validA
//then generates pulses aligned to the rising (A) edge of phase shifted clock
//pulses in phase shifted domain are then transferred via same mechanism to clk_out 
//veto supressed output for up to 3 clock cycles after photon is detected
//an older comment says "intention is that phase shifted clock should rise with or shortly before validA goes high"
//not sure if this is still required


//pulses and vetos are coded as level shifts

module edge_detect_with_veto(
    input validA, //aligned to positive edge of phase shifted clock
	 input pulse,   // this is a pulse of indeterminate length
    input clk_out,// clock domain in which to send output pulse
	 input reg[2:0] vetoLast, //whether to suppress pulses that occur [3,2,1] clock cycles after another pulse
    output reg detA
);


//when pulse (photon) arrives, toggle veto always and toggle pulseToggleA iff validA is true at the moment of the pulse rising edge
reg pulseToggleA;
reg vetoToggle;
always @(posedge pulse) begin
	pulseToggleA <= pulseToggleA ^ validA; 
	vetoToggle <= !vetoToggle;
end
	

//using validA as a clock, shift the pulse state and the veto state through a series of synchronizing registers into the validA clock domain
//code a photon as a level shift in toggleA 
reg [2:0] sync_pulseA;
reg [5:0] sync_vetoA;
reg toggleA;
always @(posedge validA) begin
	sync_pulseA <= {sync_pulseA[1:0], pulseToggleA};  // now we cross the clock domains
	sync_vetoA <= {sync_vetoA[4:0], vetoToggle};
	 //suppress output if vetoLast is true and there was a pulse in the previous clock cycle, whether or not it was flagged as valid
	toggleA <= toggleA^((sync_pulseA[2] ^ sync_pulseA[1]) && !(vetoLast[0] && (sync_vetoA[3] ^ sync_vetoA[2])  || vetoLast[1] && (sync_vetoA[4] ^ sync_vetoA[3]) || vetoLast[2] && (sync_vetoA[5] ^ sync_vetoA[4]))); 
end



//using level shift strategy, move the output pulse to output clock domain
reg [2:0] syncA;

always @(posedge clk_out) begin
	syncA <= {syncA[1:0], toggleA};
	detA <= syncA[2]^syncA[1];
end



endmodule