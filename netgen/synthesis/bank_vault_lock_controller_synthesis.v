////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: bank_vault_lock_controller_synthesis.v
// /___/   /\     Timestamp: Fri Sep 11 17:33:10 2026
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim bank_vault_lock_controller.ngc bank_vault_lock_controller_synthesis.v 
// Device	: xc6slx9-3-tqg144
// Input file	: bank_vault_lock_controller.ngc
// Output file	: C:\Users\sgpma\Downloads\Projects\Bank_Vault_Lock_Controller\netgen\synthesis\bank_vault_lock_controller_synthesis.v
// # of Modules	: 1
// Design Name	: bank_vault_lock_controller
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module bank_vault_lock_controller (
  clk, P, Open, Unlock, VP, LED
);
  input clk;
  input P;
  input Open;
  output Unlock;
  input [1 : 0] VP;
  output [7 : 0] LED;
  wire VP_1_IBUF_0;
  wire VP_0_IBUF_1;
  wire P_IBUF_2;
  wire Open_IBUF_3;
  wire Unlock_OBUF_4;
  LUT4 #(
    .INIT ( 16'hEAA8 ))
  Unlock1 (
    .I0(P_IBUF_2),
    .I1(Open_IBUF_3),
    .I2(VP_0_IBUF_1),
    .I3(VP_1_IBUF_0),
    .O(Unlock_OBUF_4)
  );
  IBUF   VP_1_IBUF (
    .I(VP[1]),
    .O(VP_1_IBUF_0)
  );
  IBUF   VP_0_IBUF (
    .I(VP[0]),
    .O(VP_0_IBUF_1)
  );
  IBUF   P_IBUF (
    .I(P),
    .O(P_IBUF_2)
  );
  IBUF   Open_IBUF (
    .I(Open),
    .O(Open_IBUF_3)
  );
  OBUF   LED_7_OBUF (
    .I(Unlock_OBUF_4),
    .O(LED[7])
  );
  OBUF   LED_6_OBUF (
    .I(Unlock_OBUF_4),
    .O(LED[6])
  );
  OBUF   LED_5_OBUF (
    .I(Unlock_OBUF_4),
    .O(LED[5])
  );
  OBUF   LED_4_OBUF (
    .I(Unlock_OBUF_4),
    .O(LED[4])
  );
  OBUF   LED_3_OBUF (
    .I(Unlock_OBUF_4),
    .O(LED[3])
  );
  OBUF   LED_2_OBUF (
    .I(Unlock_OBUF_4),
    .O(LED[2])
  );
  OBUF   LED_1_OBUF (
    .I(Unlock_OBUF_4),
    .O(LED[1])
  );
  OBUF   LED_0_OBUF (
    .I(Unlock_OBUF_4),
    .O(LED[0])
  );
  OBUF   Unlock_OBUF (
    .I(Unlock_OBUF_4),
    .O(Unlock)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

