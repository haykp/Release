
################################################################
# This is a generated script based on design: topBlock
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source topBlock_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# axis_lite_m

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7k70tfbv676-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name topBlock

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set AXI_STR_TXD [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 AXI_STR_TXD ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {300000000} \
   ] $AXI_STR_TXD

  # Create ports
  set aclk [ create_bd_port -dir I -type clk aclk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {300000000} \
 ] $aclk
  set app_raddr [ create_bd_port -dir I -from 31 -to 0 app_raddr ]
  set app_rdata [ create_bd_port -dir O -from 31 -to 0 app_rdata ]
  set app_rdone [ create_bd_port -dir O app_rdone ]
  set app_ren [ create_bd_port -dir I app_ren ]
  set app_rerror [ create_bd_port -dir O app_rerror ]
  set app_waddr [ create_bd_port -dir I -from 31 -to 0 app_waddr ]
  set app_wdata [ create_bd_port -dir I -from 31 -to 0 app_wdata ]
  set app_wdone [ create_bd_port -dir O app_wdone ]
  set app_wen [ create_bd_port -dir I app_wen ]
  set app_werror [ create_bd_port -dir O app_werror ]
  set aresetn [ create_bd_port -dir I -type rst aresetn ]
  set interrupt [ create_bd_port -dir O -type intr interrupt ]
  set mm2s_prmry_reset_out_n [ create_bd_port -dir O -type rst mm2s_prmry_reset_out_n ]

  # Create instance: axi_fifo_mm_s_0, and set properties
  set axi_fifo_mm_s_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_fifo_mm_s:4.1 axi_fifo_mm_s_0 ]
  set_property -dict [ list \
   CONFIG.C_USE_RX_DATA {0} \
   CONFIG.C_USE_TX_CTRL {0} \
 ] $axi_fifo_mm_s_0

  # Create instance: axis_lite_m_0, and set properties
  set block_name axis_lite_m
  set block_cell_name axis_lite_m_0
  if { [catch {set axis_lite_m_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_lite_m_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.SUPPORTS_NARROW_BURST {0} \
   CONFIG.NUM_READ_OUTSTANDING {1} \
   CONFIG.NUM_WRITE_OUTSTANDING {1} \
   CONFIG.MAX_BURST_LENGTH {1} \
 ] [get_bd_intf_pins /axis_lite_m_0/m_axi]

  # Create interface connections
  connect_bd_intf_net -intf_net axi_fifo_mm_s_0_AXI_STR_TXD [get_bd_intf_ports AXI_STR_TXD] [get_bd_intf_pins axi_fifo_mm_s_0/AXI_STR_TXD]
  connect_bd_intf_net -intf_net axis_lite_m_0_m_axi [get_bd_intf_pins axi_fifo_mm_s_0/S_AXI] [get_bd_intf_pins axis_lite_m_0/m_axi]

  # Create port connections
  connect_bd_net -net app_data_1 [get_bd_ports app_wdata] [get_bd_pins axis_lite_m_0/app_wdata]
  connect_bd_net -net app_raddr_1 [get_bd_ports app_raddr] [get_bd_pins axis_lite_m_0/app_raddr]
  connect_bd_net -net app_ren_1 [get_bd_ports app_ren] [get_bd_pins axis_lite_m_0/app_ren]
  connect_bd_net -net app_waddr_1 [get_bd_ports app_waddr] [get_bd_pins axis_lite_m_0/app_waddr]
  connect_bd_net -net app_wen_1 [get_bd_ports app_wen] [get_bd_pins axis_lite_m_0/app_wen]
  connect_bd_net -net axi_fifo_mm_s_0_interrupt [get_bd_ports interrupt] [get_bd_pins axi_fifo_mm_s_0/interrupt]
  connect_bd_net -net axi_fifo_mm_s_0_mm2s_prmry_reset_out_n [get_bd_ports mm2s_prmry_reset_out_n] [get_bd_pins axi_fifo_mm_s_0/mm2s_prmry_reset_out_n]
  connect_bd_net -net axis_lite_m_0_app_rdata [get_bd_ports app_rdata] [get_bd_pins axis_lite_m_0/app_rdata]
  connect_bd_net -net axis_lite_m_0_app_rdone [get_bd_ports app_rdone] [get_bd_pins axis_lite_m_0/app_rdone]
  connect_bd_net -net axis_lite_m_0_app_rerror [get_bd_ports app_rerror] [get_bd_pins axis_lite_m_0/app_rerror]
  connect_bd_net -net axis_lite_m_0_app_wdone [get_bd_ports app_wdone] [get_bd_pins axis_lite_m_0/app_wdone]
  connect_bd_net -net axis_lite_m_0_app_werror [get_bd_ports app_werror] [get_bd_pins axis_lite_m_0/app_werror]
  connect_bd_net -net clk_wiz_clk_out1 [get_bd_ports aclk] [get_bd_pins axi_fifo_mm_s_0/s_axi_aclk] [get_bd_pins axis_lite_m_0/aclk]
  connect_bd_net -net rst_clk_wiz_100M_peripheral_aresetn [get_bd_ports aresetn] [get_bd_pins axi_fifo_mm_s_0/s_axi_aresetn] [get_bd_pins axis_lite_m_0/aresetn]

  # Create address segments
  create_bd_addr_seg -range 0x00001000 -offset 0x44A00000 [get_bd_addr_spaces axis_lite_m_0/m_axi] [get_bd_addr_segs axi_fifo_mm_s_0/S_AXI/Mem0] SEG_axi_fifo_mm_s_0_Mem0


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


