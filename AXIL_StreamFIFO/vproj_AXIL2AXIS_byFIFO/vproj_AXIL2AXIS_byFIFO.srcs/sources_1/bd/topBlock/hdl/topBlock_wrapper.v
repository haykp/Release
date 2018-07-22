//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
//Date        : Sun Jul 22 12:18:44 2018
//Host        : DESKTOP-FFQDT18 running 64-bit major release  (build 9200)
//Command     : generate_target topBlock_wrapper.bd
//Design      : topBlock_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module topBlock_wrapper
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
  output [31:0]AXI_STR_TXD_tdata;
  output AXI_STR_TXD_tlast;
  input AXI_STR_TXD_tready;
  output AXI_STR_TXD_tvalid;
  input aclk;
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
  input aresetn;
  output interrupt;
  output mm2s_prmry_reset_out_n;

  wire [31:0]AXI_STR_TXD_tdata;
  wire AXI_STR_TXD_tlast;
  wire AXI_STR_TXD_tready;
  wire AXI_STR_TXD_tvalid;
  wire aclk;
  wire [31:0]app_raddr;
  wire [31:0]app_rdata;
  wire app_rdone;
  wire app_ren;
  wire app_rerror;
  wire [31:0]app_waddr;
  wire [31:0]app_wdata;
  wire app_wdone;
  wire app_wen;
  wire app_werror;
  wire aresetn;
  wire interrupt;
  wire mm2s_prmry_reset_out_n;

  topBlock topBlock_i
       (.AXI_STR_TXD_tdata(AXI_STR_TXD_tdata),
        .AXI_STR_TXD_tlast(AXI_STR_TXD_tlast),
        .AXI_STR_TXD_tready(AXI_STR_TXD_tready),
        .AXI_STR_TXD_tvalid(AXI_STR_TXD_tvalid),
        .aclk(aclk),
        .app_raddr(app_raddr),
        .app_rdata(app_rdata),
        .app_rdone(app_rdone),
        .app_ren(app_ren),
        .app_rerror(app_rerror),
        .app_waddr(app_waddr),
        .app_wdata(app_wdata),
        .app_wdone(app_wdone),
        .app_wen(app_wen),
        .app_werror(app_werror),
        .aresetn(aresetn),
        .interrupt(interrupt),
        .mm2s_prmry_reset_out_n(mm2s_prmry_reset_out_n));
endmodule
