
//import axi_vip_pkg::*;
//import axi_vip_0_pkg::*;


module TB_AXI_Lite ();

// Clock signal
bit                   clock;
// Reset signal
bit                   reset;

// for AXIS-L slave VIP to work
//axi_vip_0_slv_t slv_agent; // define the agent, without memory
//axi_vip_0_slv_mem_t slv_agent; // define the agent

//initial
//begin
//	slv_agent = new("slv_agent",TB_AXI_Lite.inst_axil_s.inst.IF);
//	slv_agent.start_slave();
//end


axil_itf itf (.aclk(clock), .aresetn(~reset) );

topBlock Inst_topBlock (
			  /**************** System Signals *******************************/
			 .aclk 				(	itf.aclk			),
			 .aresetn			(	itf.aresetn			),
			/**************** User Signals *******************************/
			 .app_wdata			(	itf.app_wdata		),
			 .app_waddr			(	itf.app_waddr		),
			 .app_wen			(	itf.app_wen			),	
			 .app_wdone 		(	itf.app_wdone		),
			 .app_werror		(	itf.app_werror		),
			 
			 .app_raddr			(	itf.app_raddr		),
			 .app_ren			(	itf.app_ren			),	
			 .app_rdata			(	itf.app_rdata		),
			 .app_rdone 		(	itf.app_rdone		),
			 .app_rerror 		(	itf.app_rerror		),
			 /**************** Write Address Channel Signals ******************/
			.AXI_STR_TXD_tdata			( itf.AXI_STR_TXD_tdata		  ),
			.AXI_STR_TXD_tlast          ( itf.AXI_STR_TXD_tlast       ),
			.AXI_STR_TXD_tready         ( itf.AXI_STR_TXD_tready      ),
			.AXI_STR_TXD_tvalid         ( itf.AXI_STR_TXD_tvalid      ),
			.interrupt                  ( itf.interrupt               ),
			.mm2s_prmry_reset_out_n     ( itf.mm2s_prmry_reset_out_n  )
	);

assign itf.AXI_STR_TXD_tready=1'b1;
   
	
task write_data (input logic [31:0] w_addr = 32'haaaa_bbbb,
				 input logic [31:0] w_data = 32'h5aa5_a55a);
	$display ("[INFO] Calling write_data task, addr=%h, data=%h", w_addr, w_data);
	
	itf.app_waddr <= w_addr;
	itf.app_wdata <= w_data;
	@ ( posedge itf.aclk);
	itf.app_wen <= 1'b1;
	@ ( posedge itf.aclk);
	itf.app_wen <= 1'b0;
	@ ( posedge itf.app_wdone);
	@ ( posedge itf.aclk);
	
	$display ("[INFO] END Calling write_data task");
endtask


task read_data ( input logic [31:0] r_addr = 0 );
	$display ("[INFO]Calling read_data task for the address: %h", r_addr);
	
	itf.app_raddr <= r_addr;
	@ ( posedge itf.aclk);
		itf.app_ren <= 1'b1;
	@ ( posedge itf.aclk);
		itf.app_ren <= 1'b0;
	@ ( posedge itf.app_rdone);	
	@ ( posedge itf.aclk);
	
	$display ("[INFO] END Calling read_data task, read_data=%h", itf.app_rdata);
endtask	
	
	
////// MAIN	////
// C_BASEADDR => X"44A00000",
// C_HIGHADDR => X"44A00FFF",
/////// Stream FIFO Main registers, each regiser is 4byte (32bit)





parameter C_BASEADDR = 16'h44A0;
parameter ISR_addr = {C_BASEADDR,16'h0};  // // Interrupt status reg (ISR): C_BASEADDR+0x0
parameter IER_addr = {C_BASEADDR,16'h4}; // Interrupt enable reg (IER): C_BASEADDR+0x4
parameter IDFR_addr = {C_BASEADDR,16'h8}; // Transmit Data FIFO Reset (IDFR): C_BASEADDR+0x8
parameter TDFD_addr = {C_BASEADDR,16'h10}; // Transmit Data FIFO 32-bit Wide Data Write Port (IDFD): C_BASEADDR+0x10
parameter TLR_addr = {C_BASEADDR,16'h14}; // Transmit Length Register (TLR): C_BASEADDR+0x14

parameter TDFV_addr = {C_BASEADDR,16'hC}; // Transmit Length Register (TLR): C_BASEADDR+0x14
parameter RDFO_addr = {C_BASEADDR,16'h1C}; // Transmit Length Register (TLR): C_BASEADDR+0x14


  initial begin
    reset <= 1'b1;
    repeat (5) @(negedge clock);
	reset <= 1'b0;
  end

    always #10 clock <= ~clock;	
	
	
	initial
	begin
		itf.app_ren <= 1'b0;
		
		@ ( negedge reset);
		repeat (3) 
			@ ( posedge itf.aclk);
		
		
		// Power-up/Reset Read
		read_data  (.r_addr(ISR_addr) );    //44a0_0000
		
		write_data (.w_addr (ISR_addr) ,	//44a0_0000
					.w_data (32'hffff_ffff) );
		
		read_data  (.r_addr(ISR_addr) );   //44a0_0000
		read_data  (.r_addr(IER_addr) );   //44a0_0004
		read_data  (.r_addr(TDFV_addr) );  //44a0_000c
		read_data  (.r_addr(RDFO_addr) );  //44a0_001c
		
		// END Power-up/Reset Read
		
		// Transmit Packet
		 
		write_data (.w_addr (IER_addr) ,   //44a0_0004
					.w_data (32'h0c00_0000) );
		
		//1
		write_data (.w_addr (TDFD_addr),
					.w_data (32'hdead_dea0) );
		//2
		write_data (.w_addr (TDFD_addr),
					.w_data (32'hdead_dea1) );
		//3
		write_data (.w_addr (TDFD_addr),
					.w_data (32'hdead_dea2) );
		//4
		write_data (.w_addr (TDFD_addr),
					.w_data (32'hdead_dea3) );					
		//5
		write_data (.w_addr (TDFD_addr),
					.w_data (32'hdead_deb4) );					
		//6
		write_data (.w_addr (TDFD_addr),
					.w_data (32'hdead_deb5) );					
		//7
		write_data (.w_addr (TDFD_addr),
					.w_data (32'hdead_deb6) );					
		//8
		write_data (.w_addr (TDFD_addr),
					.w_data (32'hdead_deb7) );										
					
		read_data  (.r_addr(TDFV_addr) );  //44a0_000c					
		
		// Transmit lenght
		write_data (.w_addr (TLR_addr),
					.w_data (32'h0000_0020) );
		
		// interrupt status register
		read_data  (.r_addr(ISR_addr) );   //44a0_0000
		write_data (.w_addr (ISR_addr) ,	//44a0_0000
					.w_data (32'hffff_ffff) );
		read_data  (.r_addr(ISR_addr) );   //44a0_0000
		read_data  (.r_addr(TDFV_addr) );  //44a0_000c
					
		
		
		
					
			// write_data (.w_addr (32'h0101_0000) ,
						// .w_data (32'h0101_0000) );
						
			// read_data (32'h1010_1111);
			// read_data (32'h0101_0000);
			
		//	read from previously backdoor initialized address
			// read_data (32'haaaa_bbbb);
			// read_data (32'h1111_0000);
		// join
		
		repeat (3) 
			@ ( posedge itf.aclk);
		
		$finish;
		
		
	end

	
endmodule


// function void backdoor_memory_write(	
// input 	xil_axi_ulong 	addr,
// input logic 	[C_AXI_WDATA_WIDTH-1:0] 	payload,
// input logic 	[C_AXI_WDATA_WIDTH/8-1:0] 	strb 
// )

