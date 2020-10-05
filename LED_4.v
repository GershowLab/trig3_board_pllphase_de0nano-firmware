module LED_4(
	input nrst,
	input clk_lvds,
	input [15:0] coax_in,
	output [15:0] coax_out,	
	input clkin, input passthrough,
	output integer histo[8], input resethist, input vetopmtlast,	//histo must have at least NBINS
	input [NBINS-1:0] lvds_rx,
	input [NBINS-1:0] mask1,
	input [NBINS-1:0] mask2,
	input [7:0] cyclesToVeto,
	output integer ipihist[64] //70 Mhz / 64 = ~1.1 MHz
	);
	
	//TODO: rewrite using bit shift operations 
	
	parameter NBINS = 8;
	
	// for testing logic
	
	wire pmt1;
	//assign pmt1 = pmt1test; // pmt test input
	assign pmt1 = coax_in[3] ||coax_in[8]; // pmt input (LVDS) || (single-ended)
	

	reg out1;assign coax_out[2]=out1; // A6 // the out1
	reg out2;assign coax_out[3]=out2; // B6 // the out2
	
	
	assign coax_out[4]=clkin; // F9 // the input clock that can also have its phase adjusted
	assign coax_out[5]=clk_lvds; // unassigned // the clk for lvds that can also have its phase adjusted
	
		
	reg resethist1=0, resethist2=0, resetipi = 0;
	reg [NBINS-1:0] lvds_last=0;
	reg [NBINS-1:0] phot=0;
   reg [NBINS-1:0] lastphot = 0;

	reg [7:0] j = 0;
	reg [7:0] k = 0;
	
	reg [7:0] cyclecounter;
	reg wasphot;
	
	reg inveto; assign coax_out[6] = inveto; // p9; whether new photons will be vetoed
	reg collision; assign coax_out[7] = collision; // n11; two photons arrived within veto window
   reg anyphot; assign coax_out[8] = anyphot; //p15
	reg cycletoggle; assign coax_out[9] = cycletoggle; //e7
	
	always@(posedge clkin) begin
		if (passthrough) begin
			out1 <= pmt1;
			out2 <= (lvds_rx != 0);
		end
		else begin			
			if (vetopmtlast) begin
				phot = lvds_rx & ~((lvds_rx >> 1) || (lvds_last << (NBINS-1)));
			end
			else begin
				phot = lvds_rx;
			end
			if (cyclecounter < cyclesToVeto) begin
				collision = (phot != 0);
				phot = 0;
				inveto <= 1;				
			end
			
			
			//within a block
			//<= --> parallel execution (simultaneous update at the end of the clock cycle)
			// = --> serial execution
			
			anyphot <= phot != 0;
			if (anyphot) begin
				if (cyclecounter < 64) begin
					ipihist[cyclecounter] <= ipihist[cyclecounter] + 1;				
				end 
				cyclecounter = 0;								
			end 
			else begin
				if (cyclecounter < 254) begin
					cyclecounter <= cyclecounter + 1'b1;
				end
			end
				

			out1 <= (phot & mask1) != 0;
			out2 <= (phot & mask2) != 0;
			
			cycletoggle <= !cycletoggle;
			
			lvds_last <= lvds_rx;

			resethist1 <= resethist;
			resethist2 <= resethist2 || resethist1;
			resetipi <= resetipi || resethist1;
			
			lastphot <= phot;
			if (resethist2) begin
				if (j >= NBINS) begin
					j <= 0;
					resethist2 <= 0;
				end
				else begin
					histo[j] <= 0;
					j <= j+1'b1;
				end
				
			end
			else begin				
				histo[0] <= histo[0] + lastphot[0];
				histo[1] <= histo[1] + lastphot[1];
				histo[2] <= histo[2] + lastphot[2];
				histo[3] <= histo[3] + lastphot[3];
				histo[4] <= histo[4] + lastphot[4];
				histo[5] <= histo[5] + lastphot[5];
				histo[6] <= histo[6] + lastphot[6];
				histo[7] <= histo[7] + lastphot[7];
			end
			if (resetipi) begin
				if (k >= 64) begin
					k <= 0;
					resetipi <= 0;
				end
				else begin
					ipihist[k] <= 0;
					k <= k+1'b1;
				end				
			end		
		end		
	end
	
	
endmodule
