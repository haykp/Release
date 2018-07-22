//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
//Date        : Sun Jul 22 12:18:44 2018
//Host        : DESKTOP-FFQDT18 running 64-bit major release  (build 9200)
//Command     : generate_target topBlock.bd
//Design      : topBlock
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "topBlock,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=topBlock,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "topBlock.hwdef" *) 
module topBlock
   (AXI_STR_TXD_tdata,
    AXI_STR_TXD_tlast,
    AXI_STR_TXD_tready,
    AXI_STR_TXD_tvalid,
    aclk,
    app_raddr,
    app_rdata,
    app_rdone,
    app_ren,
    app_rerror,
    app_waddr,
    app_wdata,
    app_wdone,
    app_wen,
    app_werror,
    aresetn,
    interrupt,
    mm2s_prmry_reset_out_n);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXI_STR_TXD TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AXI_STR_TXD, CLK_DOMAIN topBlock_aclk, FREQ_HZ 300000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [31:0]AXI_STR_TXD_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXI_STR_TXD TLAST" *) output AXI_STR_TXD_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXI_STR_TXD TREADY" *) input AXI_STR_TXD_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXI_STR_TXD TVALID" *) output AXI_STR_TXD_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK, ASSOCIATED_BUSIF AXI_STR_TXD, ASSOCIATED_RESET aresetn, CLK_DOMAIN topBlock_aclk, FREQ_HZ 300000000, PHASE 0.000" *) input aclk;
  input [31:0]app_raddr;
  output [31:0]app_rdata;
  output app_rdone;
  input app_ren;
  output app_rerror;
  input [31:0]app_waddr;
  input [31:0]app_wdata;
  output app_wdone;
  input app_wen;
  output app_werror;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.ARESETN, POLARITY ACTIVE_LOW" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.INTERRUPT INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.INTERRUPT, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) output interrupt;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.MM2S_PRMRY_RESET_OUT_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.MM2S_PRMRY_RESET_OUT_N, POLARITY ACTIVE_LOW" *) output mm2s_prmry_reset_out_n;

  wire [31:0]app_data_1;
  wire [31:0]app_raddr_1;
  wire app_ren_1;
  wire [31:0]app_waddr_1;
  wire app_wen_1;
  wire [31:0]axi_fifo_mm_s_0_AXI_STR_TXD_TDATA;
  wire axi_fifo_mm_s_0_AXI_STR_TXD_TLAST;
  wire axi_fifo_mm_s_0_AXI_STR_TXD_TREADY;
  wire axi_fifo_mm_s_0_AXI_STR_TXD_TVALID;
  wire axi_fifo_mm_s_0_interrupt;
  wire axi_fifo_mm_s_0_mm2s_prmry_reset_out_n;
  wire [31:0]axis_lite_m_0_app_rdata;
  wire axis_lite_m_0_app_rdone;
  wire axis_lite_m_0_app_rerror;
  wire axis_lite_m_0_app_wdone;
  wire axis_lite_m_0_app_werror;
  wire [31:0]axis_lite_m_0_m_axi_ARADDR;
  wire axis_lite_m_0_m_axi_ARREADY;
  wire axis_lite_m_0_m_axi_ARVALID;
  wire [31:0]axis_lite_m_0_m_axi_AWADDR;
  wire axis_lite_m_0_m_axi_AWREADY;
  wire axis_lite_m_0_m_axi_AWVALID;
  wire axis_lite_m_0_m_axi_BREADY;
  wire [1:0]axis_lite_m_0_m_axi_BRESP;
  wire axis_lite_m_0_m_axi_BVALID;
  wire [31:0]axis_lite_m_0_m_axi_RDATA;
  wire axis_lite_m_0_m_axi_RREADY;
  wire [1:0]axis_lite_m_0_m_axi_RRESP;
  wire axis_lite_m_0_m_axi_RVALID;
  wire [31:0]axis_lite_m_0_m_axi_WDATA;
  wire axis_lite_m_0_m_axi_WREADY;
  wire [3:0]axis_lite_m_0_m_axi_WSTRB;
  wire axis_lite_m_0_m_axi_WVALID;
  wire clk_wiz_clk_out1;
  wire rst_clk_wiz_100M_peripheral_aresetn;

  assign AXI_STR_TXD_tdata[31:0] = axi_fifo_mm_s_0_AXI_STR_TXD_TDATA;
  assign AXI_STR_TXD_tlast = axi_fifo_mm_s_0_AXI_STR_TXD_TLAST;
  assign AXI_STR_TXD_tvalid = axi_fifo_mm_s_0_AXI_STR_TXD_TVALID;
  assign app_data_1 = app_wdata[31:0];
  assign app_raddr_1 = app_raddr[31:0];
  assign app_rdata[31:0] = axis_lite_m_0_app_rdata;
  assign app_rdone = axis_lite_m_0_app_rdone;
  assign app_ren_1 = app_ren;
  assign app_rerror = axis_lite_m_0_app_rerror;
  assign app_waddr_1 = app_waddr[31:0];
  assign app_wdone = axis_lite_m_0_app_wdone;
  assign app_wen_1 = app_wen;
  assign app_werror = axis_lite_m_0_app_werror;
  assign axi_fifo_mm_s_0_AXI_STR_TXD_TREADY = AXI_STR_TXD_tready;
  assign clk_wiz_clk_out1 = aclk;
  assign interrupt = axi_fifo_mm_s_0_interrupt;
  assign mm2s_prmry_reset_out_n = axi_fifo_mm_s_0_mm2s_prmry_reset_out_n;
  assign rst_clk_wiz_100M_peripheral_aresetn = aresetn;
  topBlock_axi_fifo_mm_s_0_0 axi_fifo_mm_s_0
       (.axi_str_txd_tdata(axi_fifo_mm_s_0_AXI_STR_TXD_TDATA),
        .axi_str_txd_tlast(axi_fifo_mm_s_0_AXI_STR_TXD_TLAST),
        .axi_str_txd_tready(axi_fifo_mm_s_0_AXI_STR_TXD_TREADY),
        .axi_str_txd_tvalid(axi_fifo_mm_s_0_AXI_STR_TXD_TVALID),
        .interrupt(axi_fifo_mm_s_0_interrupt),
        .mm2s_prmry_reset_out_n(axi_fifo_mm_s_0_mm2s_prmry_reset_out_n),
        .s_axi_aclk(clk_wiz_clk_out1),
        .s_axi_araddr(axis_lite_m_0_m_axi_ARADDR),
        .s_axi_aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .s_axi_arready(axis_lite_m_0_m_axi_ARREADY),
        .s_axi_arvalid(axis_lite_m_0_m_axi_ARVALID),
        .s_axi_awaddr(axis_lite_m_0_m_axi_AWADDR),
        .s_axi_awready(axis_lite_m_0_m_axi_AWREADY),
        .s_axi_awvalid(axis_lite_m_0_m_axi_AWVALID),
        .s_axi_bready(axis_lite_m_0_m_axi_BREADY),
        .s_axi_bresp(axis_lite_m_0_m_axi_BRESP),
        .s_axi_bvalid(axis_lite_m_0_m_axi_BVALID),
        .s_axi_rdata(axis_lite_m_0_m_axi_RDATA),
        .s_axi_rready(axis_lite_m_0_m_axi_RREADY),
        .s_axi_rresp(axis_lite_m_0_m_axi_RRESP),
        .s_axi_rvalid(axis_lite_m_0_m_axi_RVALID),
        .s_axi_wdata(axis_lite_m_0_m_axi_WDATA),
        .s_axi_wready(axis_lite_m_0_m_axi_WREADY),
        .s_axi_wstrb(axis_lite_m_0_m_axi_WSTRB),
        .s_axi_wvalid(axis_lite_m_0_m_axi_WVALID));
  topBlock_axis_lite_m_0_0 axis_lite_m_0
       (.aclk(clk_wiz_clk_out1),
        .app_raddr(app_raddr_1),
        .app_rdata(axis_lite_m_0_app_rdata),
        .app_rdone(axis_lite_m_0_app_rdone),
        .app_ren(app_ren_1),
        .app_rerror(axis_lite_m_0_app_rerror),
        .app_waddr(app_waddr_1),
        .app_wdata(app_data_1),
        .app_wdone(axis_lite_m_0_app_wdone),
        .app_wen(app_wen_1),
        .app_werror(axis_lite_m_0_app_werror),
        .aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .m_axi_araddr(axis_lite_m_0_m_axi_ARADDR),
        .m_axi_arready(axis_lite_m_0_m_axi_ARREADY),
        .m_axi_arvalid(axis_lite_m_0_m_axi_ARVALID),
        .m_axi_awaddr(axis_lite_m_0_m_axi_AWADDR),
        .m_axi_awready(axis_lite_m_0_m_axi_AWREADY),
        .m_axi_awvalid(axis_lite_m_0_m_axi_AWVALID),
        .m_axi_bready(axis_lite_m_0_m_axi_BREADY),
        .m_axi_bresp(axis_lite_m_0_m_axi_BRESP),
        .m_axi_bvalid(axis_lite_m_0_m_axi_BVALID),
        .m_axi_rdata(axis_lite_m_0_m_axi_RDATA),
        .m_axi_rready(axis_lite_m_0_m_axi_RREADY),
        .m_axi_rresp(axis_lite_m_0_m_axi_RRESP),
        .m_axi_rvalid(axis_lite_m_0_m_axi_RVALID),
        .m_axi_wdata(axis_lite_m_0_m_axi_WDATA),
        .m_axi_wready(axis_lite_m_0_m_axi_WREADY),
        .m_axi_wstrb(axis_lite_m_0_m_axi_WSTRB),
        .m_axi_wvalid(axis_lite_m_0_m_axi_WVALID));
endmodule
