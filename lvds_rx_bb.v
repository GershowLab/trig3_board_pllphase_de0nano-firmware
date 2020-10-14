// megafunction wizard: %ALTLVDS_RX%VBB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: ALTLVDS_RX 

// ============================================================
// File Name: lvds_rx.v
// Megafunction Name(s):
// 			ALTLVDS_RX
//
// Simulation Library Files(s):
// 			altera_mf
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 18.1.0 Build 625 09/12/2018 SJ Lite Edition
// ************************************************************

//Copyright (C) 2018  Intel Corporation. All rights reserved.
//Your use of Intel Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Intel Program License 
//Subscription Agreement, the Intel Quartus Prime License Agreement,
//the Intel FPGA IP License Agreement, or other applicable license
//agreement, including, without limitation, that your use is for
//the sole purpose of programming logic devices manufactured by
//Intel and sold by Intel or its authorized distributors.  Please
//refer to the applicable agreement for further details.

module lvds_rx (
	rx_data_reset,
	rx_in,
	rx_inclock,
	rx_out);

	input	  rx_data_reset;
	input	[0:0]  rx_in;
	input	  rx_inclock;
	output	[7:0]  rx_out;

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: PRIVATE: Bitslip NUMERIC "0"
// Retrieval info: PRIVATE: Clock_Choices STRING "tx_coreclock"
// Retrieval info: PRIVATE: Clock_Mode NUMERIC "0"
// Retrieval info: PRIVATE: Data_rate STRING "800.0"
// Retrieval info: PRIVATE: Deser_Factor NUMERIC "8"
// Retrieval info: PRIVATE: Dpll_Lock_Count NUMERIC "0"
// Retrieval info: PRIVATE: Dpll_Lock_Window NUMERIC "0"
// Retrieval info: PRIVATE: Enable_DPA_Mode STRING "OFF"
// Retrieval info: PRIVATE: Enable_FIFO_DPA_Channels NUMERIC "0"
// Retrieval info: PRIVATE: Ext_PLL STRING "ON"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone IV E"
// Retrieval info: PRIVATE: Le_Serdes STRING "ON"
// Retrieval info: PRIVATE: Num_Channel NUMERIC "1"
// Retrieval info: PRIVATE: Outclock_Divide_By NUMERIC "0"
// Retrieval info: PRIVATE: pCNX_OUTCLK_ALIGN NUMERIC "0"
// Retrieval info: PRIVATE: pINCLOCK_PHASE_SHIFT STRING "0.00"
// Retrieval info: PRIVATE: PLL_Enable NUMERIC "0"
// Retrieval info: PRIVATE: PLL_Freq STRING "100.00"
// Retrieval info: PRIVATE: PLL_Period NUMERIC "5"
// Retrieval info: PRIVATE: pOUTCLOCK_PHASE_SHIFT NUMERIC "0"
// Retrieval info: PRIVATE: Reg_InOut NUMERIC "0"
// Retrieval info: PRIVATE: Use_Cda_Reset NUMERIC "0"
// Retrieval info: PRIVATE: Use_Clock_Resc STRING "AUTO"
// Retrieval info: PRIVATE: Use_Common_Rx_Tx_Plls NUMERIC "0"
// Retrieval info: PRIVATE: Use_Data_Align NUMERIC "0"
// Retrieval info: PRIVATE: Use_Lock NUMERIC "0"
// Retrieval info: PRIVATE: Use_Pll_Areset NUMERIC "0"
// Retrieval info: PRIVATE: Use_Rawperror NUMERIC "0"
// Retrieval info: PRIVATE: Use_Tx_Out_Phase NUMERIC "0"
// Retrieval info: CONSTANT: BUFFER_IMPLEMENTATION STRING "RAM"
// Retrieval info: CONSTANT: CDS_MODE STRING "UNUSED"
// Retrieval info: CONSTANT: COMMON_RX_TX_PLL STRING "OFF"
// Retrieval info: CONSTANT: clk_src_is_pll STRING "off"
// Retrieval info: CONSTANT: DATA_ALIGN_ROLLOVER NUMERIC "4"
// Retrieval info: CONSTANT: DATA_RATE STRING "800.0 Mbps"
// Retrieval info: CONSTANT: DESERIALIZATION_FACTOR NUMERIC "8"
// Retrieval info: CONSTANT: DPA_INITIAL_PHASE_VALUE NUMERIC "0"
// Retrieval info: CONSTANT: DPLL_LOCK_COUNT NUMERIC "0"
// Retrieval info: CONSTANT: DPLL_LOCK_WINDOW NUMERIC "0"
// Retrieval info: CONSTANT: ENABLE_CLOCK_PIN_MODE STRING "UNUSED"
// Retrieval info: CONSTANT: ENABLE_DPA_ALIGN_TO_RISING_EDGE_ONLY STRING "OFF"
// Retrieval info: CONSTANT: ENABLE_DPA_CALIBRATION STRING "ON"
// Retrieval info: CONSTANT: ENABLE_DPA_FIFO STRING "UNUSED"
// Retrieval info: CONSTANT: ENABLE_DPA_INITIAL_PHASE_SELECTION STRING "OFF"
// Retrieval info: CONSTANT: ENABLE_DPA_MODE STRING "OFF"
// Retrieval info: CONSTANT: ENABLE_DPA_PLL_CALIBRATION STRING "OFF"
// Retrieval info: CONSTANT: ENABLE_SOFT_CDR_MODE STRING "OFF"
// Retrieval info: CONSTANT: IMPLEMENT_IN_LES STRING "ON"
// Retrieval info: CONSTANT: INCLOCK_BOOST NUMERIC "0"
// Retrieval info: CONSTANT: INCLOCK_DATA_ALIGNMENT STRING "EDGE_ALIGNED"
// Retrieval info: CONSTANT: INCLOCK_PERIOD NUMERIC "5000"
// Retrieval info: CONSTANT: INCLOCK_PHASE_SHIFT NUMERIC "0"
// Retrieval info: CONSTANT: INPUT_DATA_RATE NUMERIC "800"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone IV E"
// Retrieval info: CONSTANT: LOSE_LOCK_ON_ONE_CHANGE STRING "UNUSED"
// Retrieval info: CONSTANT: LPM_HINT STRING "UNUSED"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altlvds_rx"
// Retrieval info: CONSTANT: NUMBER_OF_CHANNELS NUMERIC "1"
// Retrieval info: CONSTANT: OUTCLOCK_RESOURCE STRING "AUTO"
// Retrieval info: CONSTANT: PLL_OPERATION_MODE STRING "UNUSED"
// Retrieval info: CONSTANT: PLL_SELF_RESET_ON_LOSS_LOCK STRING "UNUSED"
// Retrieval info: CONSTANT: PORT_RX_CHANNEL_DATA_ALIGN STRING "PORT_UNUSED"
// Retrieval info: CONSTANT: PORT_RX_DATA_ALIGN STRING "PORT_UNUSED"
// Retrieval info: CONSTANT: REFCLK_FREQUENCY STRING "UNUSED"
// Retrieval info: CONSTANT: REGISTERED_DATA_ALIGN_INPUT STRING "UNUSED"
// Retrieval info: CONSTANT: REGISTERED_OUTPUT STRING "OFF"
// Retrieval info: CONSTANT: RESET_FIFO_AT_FIRST_LOCK STRING "UNUSED"
// Retrieval info: CONSTANT: RX_ALIGN_DATA_REG STRING "UNUSED"
// Retrieval info: CONSTANT: SIM_DPA_IS_NEGATIVE_PPM_DRIFT STRING "OFF"
// Retrieval info: CONSTANT: SIM_DPA_NET_PPM_VARIATION NUMERIC "0"
// Retrieval info: CONSTANT: SIM_DPA_OUTPUT_CLOCK_PHASE_SHIFT NUMERIC "0"
// Retrieval info: CONSTANT: USE_CORECLOCK_INPUT STRING "OFF"
// Retrieval info: CONSTANT: USE_DPLL_RAWPERROR STRING "OFF"
// Retrieval info: CONSTANT: USE_EXTERNAL_PLL STRING "ON"
// Retrieval info: CONSTANT: USE_NO_PHASE_SHIFT STRING "ON"
// Retrieval info: CONSTANT: X_ON_BITSLIP STRING "ON"
// Retrieval info: USED_PORT: rx_data_reset 0 0 0 0 INPUT NODEFVAL "rx_data_reset"
// Retrieval info: CONNECT: @rx_data_reset 0 0 0 0 rx_data_reset 0 0 0 0
// Retrieval info: USED_PORT: rx_in 0 0 1 0 INPUT NODEFVAL "rx_in[0..0]"
// Retrieval info: CONNECT: @rx_in 0 0 1 0 rx_in 0 0 1 0
// Retrieval info: USED_PORT: rx_inclock 0 0 0 0 INPUT NODEFVAL "rx_inclock"
// Retrieval info: CONNECT: @rx_inclock 0 0 0 0 rx_inclock 0 0 0 0
// Retrieval info: USED_PORT: rx_out 0 0 8 0 OUTPUT NODEFVAL "rx_out[7..0]"
// Retrieval info: CONNECT: rx_out 0 0 8 0 @rx_out 0 0 8 0
// Retrieval info: GEN_FILE: TYPE_NORMAL lvds_rx.v TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL lvds_rx.qip TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL lvds_rx.bsf TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lvds_rx_inst.v TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lvds_rx_bb.v TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lvds_rx.inc TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lvds_rx.cmp TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lvds_rx.ppf TRUE FALSE
// Retrieval info: LIB_FILE: altera_mf
// Retrieval info: CBX_MODULE_PREFIX: ON
