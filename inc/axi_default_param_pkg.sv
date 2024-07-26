
`ifndef AXI_DEFAULT_PARAM_PKG_SV
`define AXI_DEFAULT_PARAM_PKG_SV

package axi_default_param_pkg;

  `include "axi4l_typedef.svh"
  parameter int AXI4L_ADDR_WIDTH = 32;
  parameter int AXI4L_DATA_WIDTH = 64;
  `AXI4L_T(axi4l, AXI4L_ADDR_WIDTH, AXI4L_DATA_WIDTH)

endpackage

`endif
