`timescale 1ns / 1ns

`define BFM dut.cdn_axi_bfm_0.cdn_axi4_lite_master_bfm_inst

`define I2C_BASE 'h40000000
`define CR    (`I2C_BASE + 'h00)
`define PRERL (`I2C_BASE + 'h04)
`define PRERH (`I2C_BASE + 'h08)
`define CTR   (`I2C_BASE + 'h0c)
`define TXR   (`I2C_BASE + 'h10)
`define RXR   (`I2C_BASE + 'h14)
`define SR    (`I2C_BASE + 'h18)

module testbench;
	parameter DATA_BUS_WIDTH = 32;
	parameter ID_BUS_WIDTH   = 8;
	parameter DEST_BUS_WIDTH = 4;
	parameter USER_BUS_WIDTH = 8;
   
	reg tb_ACLK;
	reg tb_ARESETn;
	reg scl_pad_i;
	reg sda_pad_i;
	wire scl_pad_o;
	wire sda_pad_o;
	wire scl_padoen_o;
	wire sda_padoen_o;

	// Create an instance of the example tb
	testbed dut (.clk(tb_ACLK),
				.resetn(tb_ARESETn),
				.scl_pad_i(scl_pad_i),
				.sda_pad_i(sda_pad_i),
				.scl_pad_o(scl_pad_o),
				.sda_pad_o(sda_pad_o),
				.scl_padoen_o(scl_padoen_o),
				.sda_padoen_o(sda_padoen_o)
				);

	// Local Variables
	reg [1:0]                    response;
	reg [DATA_BUS_WIDTH-1:0]     data;
	
	wire sda;
	wire scl;
	
	assign scl = scl_padoen_o ? 1'bz : scl_pad_o;
	assign sda = sda_padoen_o ? 1'bz: sda_pad_o;

	// Simple Reset Generator and test
	initial begin
		tb_ARESETn = 1'b0;
		#1000;
		// Release the reset on the posedge of the clk.
		@(posedge tb_ACLK);
		tb_ARESETn = 1'b1;
	end

	// Simple Clock Generator
	initial tb_ACLK = 1'b0;
	always #5 tb_ACLK = !tb_ACLK;

	task automatic test;
	begin
		#1000;
		
		// set the prescaler
		`BFM.WRITE_BURST_CONCURRENT(`PRERH, 0, 'h00, 4, response);
		`BFM.WRITE_BURST_CONCURRENT(`PRERL, 0, 'h13, 4, response);  // c7 = 199
		
		// set the enable bit
		`BFM.WRITE_BURST_CONCURRENT(`CTR, 0, 'h80, 4, response);

		#1000;
		
		repeat (2) begin
            // write A2 to TXR
            `BFM.WRITE_BURST_CONCURRENT(`TXR, 0, 'ha0, 4, response);
            // set STA and WR
            `BFM.WRITE_BURST_CONCURRENT(`CR, 0, 8'b10010000, 4, response);

            // wait for the transfer to finish    
            data = 'hff;
            while (data[1] == 1) begin
                #100;
                `BFM.READ_BURST(`SR, 0, data, response);
            end
            
            $display("@%0dns transfer finished", $time); 
            
            #300;
            
            // generate a stop since there was a NACK ;)
            `BFM.WRITE_BURST_CONCURRENT(`CR, 0, 8'b01000000, 4, response);
            
            #8000;
        end        
	end
	endtask 

	// Create the test vectors
	initial begin
	    sda_pad_i = 1'b1;
	    scl_pad_i = 1'b1;
	
		// When performing debug enable all levels of INFO messages.
		wait(tb_ARESETn === 0) @(posedge tb_ACLK);
		wait(tb_ARESETn === 1) @(posedge tb_ACLK);
		wait(tb_ARESETn === 1) @(posedge tb_ACLK);     
		wait(tb_ARESETn === 1) @(posedge tb_ACLK);     
		wait(tb_ARESETn === 1) @(posedge tb_ACLK);  

		test();
	end
endmodule
