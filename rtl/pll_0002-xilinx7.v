`timescale 1ns/10ps
module  pll_0002(
	input wire refclk,
	input wire rst,
	output wire outclk_0,
	output wire outclk_1,
	output wire outclk_2,
	output wire outclk_3,
	output wire locked
);

	wire feedback;
	
	PLLE2_ADV #(
		.CLKFBOUT_MULT(6'd32),
		.CLKIN1_PERIOD(20.0),
		.CLKOUT0_DIVIDE(7'd32), // 50 MHz = 50 MHz * 32 / 32
		.CLKOUT0_PHASE(1'd0),
		.CLKOUT1_DIVIDE(7'd32), // 40 MHz = 50 MHz * 32 / 40
		.CLKOUT1_PHASE(1'd0),
		.CLKOUT2_DIVIDE(7'd64), // 25 MHz = 50 MHz * 32 / 64
		.CLKOUT2_PHASE(1'd0),
		.CLKOUT3_DIVIDE(7'd16), // 100 MHz = 50 MHz * 32 / 16
		.CLKOUT3_PHASE(1'd0),
		.DIVCLK_DIVIDE(1'd1),
		.REF_JITTER1(0.01),
		.STARTUP_WAIT("FALSE")
	) PLLE2_ADV (
		.CLKFBIN(feedback),
		.CLKIN1(refclk),
		.PWRDWN(1'b0),
		.RST(rst),
		.CLKFBOUT(feedback),
		.CLKOUT0(outclk_0),
		.CLKOUT1(outclk_1),
		.CLKOUT2(outclk_2),
		.CLKOUT3(outclk_3),
		.LOCKED(locked)
);
	
endmodule
